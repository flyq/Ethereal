use halo2curves::bn256::{Fq, Fq2, Fr, G1Affine, G2Affine};
use halo2curves::ff::Field;
use halo2curves::CurveAffine;
use rand_core::OsRng;

// from src/Constants.sol
pub fn srs_g1() -> Vec<G1Affine> {
    let x = vec![
        val_fq("0x0000000000000000000000000000000000000000000000000000000000000001"),
        val_fq("0x2f588cffe99db877a4434b598ab28f81e0522910ea52b45f0adaa772b2d5d352"),
        val_fq("0x0bb8ff8630fda7745aa6b57010757d357b48fbd66837605aa8a3da29633774cc"),
        val_fq("0x29607f6f455b4a423398086598f832ad03983c040e68b1b0fb4b8e0959b59bec"),
        val_fq("0x0efcb74f95d874e60607a4dcfb61c08782e4eb3dbfa845d9e2990660ac013949"),
        val_fq("0x1dae94162d6148029d704cfa97285ab362e31e818108fec2296659d0e3a55dd8"),
        val_fq("0x144e236047d637449d381cbacfc5bee0497d0bef615b5fdc4844c7f724c8a77b"),
        val_fq("0x1de1f562998d28c9d22782a2d6bad6cbc728d066032fede32bef97b2bc484e9b"),
        val_fq("0x06706750845bbdefe571c69eef645e64488a1f224b5b41c49f96978b20581041"),
        val_fq("0x2d6200419fad7815715e10f8c5a198d5032ca7bec7a4ea8f24dee5d720b2707f"),
        val_fq("0x09511ec02cda1449a763758003afce9eab83e576b2ea1e803cb2a12650bf787c"),
        val_fq("0x287a4e5b49fab4b3fdcea668678da26436ae201f21ef202e456f9d7b16a86a90"),
        val_fq("0x06d61cedd23e349f55a11ffd447701cdf1d00d3a242177acb0d9c554ee799a9d"),
        val_fq("0x097719abf0c65d4367e02741b4b989734285691ca20e7d1b1a7ef186dc0ab69c"),
        val_fq("0x2cbee87ccdf52205005e5a9a0ce862974dd00662d57fc9d0674102f982df4a45"),
        val_fq("0x0df9fdbb15f99ce4a0c9a8a5280b5878f21737ef27b5fcf3c7ad88ac715d19a0"),
        val_fq("0x1800977bc4b748112c1d924770667d916d90679cfdba41fcea37bf75b9b11ebf"),
    ];
    let y = vec![
        val_fq("0x0000000000000000000000000000000000000000000000000000000000000002"),
        val_fq("0x12f42fa8fd34fb1b33d8c6a718b6590198389b26fc9d8808d971f8b009777a97"),
        val_fq("0x1bbac0306fbe3079ca1caa6f2dafa1cbb1ad970cd019021973da1182ad544c37"),
        val_fq("0x084c6e708ce5df57c4772f98c42dbab136b4cab92b6f17850b9a8f7f0eb19e14"),
        val_fq("0x069617913a37bb74d9ef323d5ce028760c5c672e0025a0a48caf139b32dc70f1"),
        val_fq("0x1dc1975e72b50e62faa67812c42b3e4b0f32273c27b81b38097a3506d2d89b83"),
        val_fq("0x04e34c9484b9885fb074403489a7ec8ecd6d8ab6cb9a00135ce134801a29aa18"),
        val_fq("0x15fa11654eff9029eb8534944a12fef90adba876f37d25046ed23662040e2ee3"),
        val_fq("0x13aeb0921d07cc49ce2bfdf8aabf28e85a3e73bd8e92cdbd7c28c0ef2151999d"),
        val_fq("0x167f03b2bb8cc583a5b880850c0439730cb723f3c9595415f354cacb23dcb724"),
        val_fq("0x04b7796ae07a9642905bdb090e7ad61c328f6b3f5fa070f0c96eb847f47075ac"),
        val_fq("0x23de253b9bc2727af92a66746a70960e3566faf37196bbd94cc2bd1dd9959584"),
        val_fq("0x2d0725bdca137e2c0b1dfaf403beb37a0374d4ab8ce773ab962a259c9f4679e4"),
        val_fq("0x1f4d3f8d3105e06a7710366a36c0d60ae52eb2e263dff04adcb8f711ee9e1fa2"),
        val_fq("0x119c1bb670262cb76aaab5f3a996643c16efd80da02f2a35fb81747f1ebe5c97"),
        val_fq("0x05e1ab74d9103a916de3011e6f908e7bba7e63d31e73955e5cee893e345638d2"),
        val_fq("0x141b05faf7ea69cc972ea80101fb12e975d4a90679715a714171fa98393ab5ab"),
    ];

    x.into_iter()
        .zip(y.iter())
        .map(|(x, y)| G1Affine::from_xy(x, *y).unwrap())
        .collect()
}

// from src/Constants.sol
// X[0] * z + X[1], and fq2 = c0 + c1 * u
pub fn srs_g2() -> Vec<G2Affine> {
    let x_0 = [
        val_fq("0x198e9393920d483a7260bfb731fb5d25f1aa493335a9e71297e485b7aef312c2"),
        val_fq("0x18c1beedba41ddf9af588015b878aca9dc39ab7c42f25492229ae1796076ab3f"),
    ];
    let x_1 = [
        val_fq("0x1800deef121f1e76426a00665e5c4479674322d4f75edadd46debd5cd992f6ed"),
        val_fq("0x2fca16fc43f7283679e062bfc2bbf54f708772c60b0f4b45358613c3eca37113"),
    ];
    let y_0 = [
        val_fq("0x090689d0585ff075ec9e99ad690c3395bc4b313370b38ef355acdadcd122975b"),
        val_fq("0x2c64a7dba9f4202c9a4bd4089bcf281c4c7c90c80efa266bbb36256e82047ceb"),
    ];
    let y_1 = [
        val_fq("0x12c85ea5db8c6deb4aab71808dcb408fe3d1e7690c43d37b4ce6cc0166fa7daa"),
        val_fq("0x1edc0a927e4e6907abe201f714d3d89d7f0dbb7001293d37ff1233d208208404"),
    ];

    vec![
        G2Affine::from_xy(Fq2::new(x_1[0], x_0[0]), Fq2::new(y_1[0], y_0[0])).unwrap(),
        G2Affine::from_xy(Fq2::new(x_1[1], x_0[1]), Fq2::new(y_1[1], y_0[1])).unwrap(),
    ]
}

fn val_fq(val: &str) -> Fq {
    let val = val.trim_start_matches("0x");
    let val = hex::decode(val).unwrap();

    let u0 = u64::from_be_bytes(val[24..].try_into().unwrap());
    let u1 = u64::from_be_bytes(val[16..24].try_into().unwrap());
    let u2 = u64::from_be_bytes(val[8..16].try_into().unwrap());
    let u3 = u64::from_be_bytes(val[..8].try_into().unwrap());
    Fq::from_raw([u0, u1, u2, u3])
}

fn val_fr(val: &str) -> Fr {
    let val = val.trim_start_matches("0x");
    let val = hex::decode(val).unwrap();

    let u0 = u64::from_be_bytes(val[24..].try_into().unwrap());
    let u1 = u64::from_be_bytes(val[16..24].try_into().unwrap());
    let u2 = u64::from_be_bytes(val[8..16].try_into().unwrap());
    let u3 = u64::from_be_bytes(val[..8].try_into().unwrap());
    Fr::from_raw([u0, u1, u2, u3])
}

pub fn poly() -> Vec<Fr> {
    let str = vec![
        "0x0822cbb091655a82c6699a9eac8257fc4fcd87664240588273b3d14b901e2b04",
        "0x25d3c3271e54f204336f8eb7e3108fde8f743396cf0d813579ab1a328509c63d",
        "0x144c9556b81692ba78d5d9615430ddcc73a8661b0156804526c04813a6a514ab",
        "0x14e59eff06f739bbf5344fc5a3211b505f625b2754d4ae64fac5ce3c5cb108dc",
        "0x13f0bf3ee5dad2cec1ca2cd1f39ab0842ceec8171769b5d3c1b0407e2594a324",
        "0x0a11b53382652dc7463e76dbfa7d336691921bd1c69ee1d6c1487d4655482f90",
        "0x0894b33c58c1a9a0f2dc396f5ab948b2f6301f7871c10bff7c3aaeacf9d5645d",
        "0x24fcb5253bdae7ab22d6e60ea3baabdd7e0b3b1ed95989c5ab27c3cede219857",
        "0x0b379d7e533d3d6bc1e2b8c0d07833ccfcad34b39a41a45c9e23f61ff99e3798",
        "0x051bf9e2bb59cabfde5d61da8ba58daf413753d4ade2b62ebad23c275cf22db8",
        "0x2d8520a20d15e88f9212a796cc9858331302da04fbf9e992102f326122b1251e",
        "0x289f8cd120db36fcb638a6d9423110d8d5578c90155ad654f9da4d3923896d14",
        "0x0d4c42c410123c4346766ef23017fea376f54b79d408a6f60e7fb0ac9dc53d64",
        "0x2e1454dacf921727a4eb8c144b536d1038ce75d53c9c0a0647c6aaa665cd078c",
        "0x1b796c6e938038a6e69acb3807cdd89a9a03d4b357d21851a370f0c77a7471a8",
        "0x00f402be04a58733914bfc2ffaf0430d4f5c6f81688553c6c970372caa2fbe27",
        "0x083ef0ff836508f957cf01c593e4efe5ad064beb683aec4787df6e2cf5a8997a",
    ];

    let mut poly = str.into_iter().map(val_fr).collect::<Vec<Fr>>();
    if poly.is_empty() {
        let rng = OsRng;
        for _ in 0..17 {
            poly.push(Fr::random(rng));
        }
    }

    poly
}
