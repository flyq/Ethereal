use halo2curves::{
    bn256::{Bn256, Fr, G1Affine, G2Affine},
    group::cofactor::CofactorCurveAffine,
    pairing::Engine,
};

// f(x) = a_0 + a_1 x + a_2 x^2 + ...
// y = f(x)
// h(x) = (f(x) - y_0) / (x - x_0)
// H = h(\tau) * G
pub fn open(f: &[Fr], x: Fr, srs: &[G1Affine]) -> (Fr, G1Affine) {
    let mut y = Fr::zero();
    let mut x_pow = Fr::one();
    for a in f.iter() {
        y += x_pow * a;
        x_pow *= x;
    }
    let mut h = vec![Fr::zero(); f.len() - 1];
    let len = h.len();
    for (i, a) in f.iter().skip(1).rev().enumerate() {
        if i == 0 {
            h[len - 1 - i] = *a;
        } else {
            h[len - 1 - i] = h[len - i] * x + a;
        }
    }

    let proof = h
        .iter()
        .zip(srs.iter())
        .fold(G1Affine::identity(), |acc, (a_i, g_i)| {
            (acc + g_i * a_i).into()
        });

    (y, proof)
}

pub fn commit(f: &[Fr], srs: &[G1Affine]) -> G1Affine {
    f.iter()
        .zip(srs.iter())
        .fold(G1Affine::identity(), |acc, (a_i, g_i)| {
            (acc + g_i * a_i).into()
        })
}

// e(C- yG1, G2) = e(H, \tau G2 - xG2)
pub fn verify(commit: G1Affine, y: Fr, proof: G1Affine, x: Fr, tau_g2: G2Affine) -> bool {
    let y_g1: G1Affine = (G1Affine::generator() * y).into();
    let lhs = Bn256::pairing(&(commit - y_g1).into(), &G2Affine::generator());

    let x_g2: G2Affine = (G2Affine::generator() * x).into();
    let rhs = Bn256::pairing(&proof, &(tau_g2 - x_g2).into());
    lhs == rhs
}

#[cfg(test)]
mod tests {
    use super::*;

    fn new_srs() -> (Vec<G1Affine>, Vec<G2Affine>) {
        let x = vec![1, 3, 9, 27, 81, 243];
        let x = x.iter().map(|x| Fr::from(*x)).collect::<Vec<Fr>>();
        let g1 = x
            .iter()
            .map(|x| (G1Affine::generator() * x).into())
            .collect::<Vec<G1Affine>>();
        let g2 = vec![G2Affine::generator(), (G2Affine::generator() * x[1]).into()];
        (g1, g2)
    }

    #[test]
    fn test_commitment() {
        let srs = new_srs();
        // f(x) = 6*x^5 + 5*x^4 + 4*x^3 + 3*x^2 + 2*x + 1
        // (99,57543611797)
        let f = vec![
            Fr::from(1),
            Fr::from(2),
            Fr::from(3),
            Fr::from(4),
            Fr::from(5),
            Fr::from(6),
        ];
        let x = Fr::from(99);
        let commitment = commit(&f, &srs.0);
        let (y, proof) = open(&f, x, &srs.0);

        assert!(verify(commitment, y, proof, x, srs.1[1]));
    }

    #[test]
    fn test_commitment2() {
        let srs_g1 = crate::data::srs_g1();
        let srs_g2 = crate::data::srs_g2();

        assert_eq!(srs_g1[0], G1Affine::generator());
        assert_eq!(srs_g2[0], G2Affine::generator());

        let srs_g1 = crate::data::srs_g1();
        let srs_g2 = crate::data::srs_g2();

        let poly = crate::data::poly();
        let x = Fr::from(0);
        let commitment = commit(&poly, &srs_g1);
        let (y, proof) = open(&poly, x, &srs_g1);

        assert!(verify(commitment, y, proof, x, srs_g2[1]));
    }
}
