use halo2curves::bn256::{Fr, G1Affine};

pub mod commitment;
pub mod data;

fn main() {
    let poly = data::poly();

    let srs_g1 = data::srs_g1();

    println!("//////////// register ////////////");
    let commitment = commitment::commit(&poly, &srs_g1);
    let (y, proof) = commitment::open(&poly, Fr::zero(), &srs_g1);
    let soul_box: G1Affine = (G1Affine::generator() * y).into();
    println!("commitment: {:?}", commitment);
    println!("y: {:?}", y);
    println!("SoulBox: {:?}", soul_box);
    println!("proof: {:?}", proof);

    println!("//////////// mint ////////////");
    for i in 1..21 {
        let (y, proof) = commitment::open(&poly, Fr::from(i), &srs_g1);
        println!("x: {:?}", i);
        println!("y: {:?}", y);
        println!("proof: {:?}", proof);
    }

    println!("//////////// hack data ////////////");
    let hack_proof = G1Affine::generator();
    let hack_soul_box: G1Affine = (commitment - srs_g1[1]).into();
    println!("commitment: {:?}", commitment);
    println!("hack SoulBox: {:?}", hack_soul_box);
    println!("hack proof: {:?}", hack_proof);
}
