// SPDX-License-Identifier: UNLICENSED

// Modified from https://github.com/weijiekoh/libkzg
pragma solidity ^0.8.15;

import "./Pairing.sol";

contract Constants {
    using Pairing for *;

    uint256 constant PRIME_Q =
        21888242871839275222246405745257275088696311157297823662689037894645226208583;
    uint256 constant PRIME_R =
        21888242871839275222246405745257275088548364400416034343698204186575808495617;
    uint256 constant bn254_b_coeff = 3;

    uint256[] public SRS_G1_X = [
        uint256(
            0x0000000000000000000000000000000000000000000000000000000000000001
        ),
        uint256(
            0x2f588cffe99db877a4434b598ab28f81e0522910ea52b45f0adaa772b2d5d352
        ),
        uint256(
            0x0bb8ff8630fda7745aa6b57010757d357b48fbd66837605aa8a3da29633774cc
        ),
        uint256(
            0x29607f6f455b4a423398086598f832ad03983c040e68b1b0fb4b8e0959b59bec
        ),
        uint256(
            0x0efcb74f95d874e60607a4dcfb61c08782e4eb3dbfa845d9e2990660ac013949
        ),
        uint256(
            0x1dae94162d6148029d704cfa97285ab362e31e818108fec2296659d0e3a55dd8
        ),
        uint256(
            0x144e236047d637449d381cbacfc5bee0497d0bef615b5fdc4844c7f724c8a77b
        ),
        uint256(
            0x1de1f562998d28c9d22782a2d6bad6cbc728d066032fede32bef97b2bc484e9b
        ),
        uint256(
            0x06706750845bbdefe571c69eef645e64488a1f224b5b41c49f96978b20581041
        ),
        uint256(
            0x2d6200419fad7815715e10f8c5a198d5032ca7bec7a4ea8f24dee5d720b2707f
        ),
        uint256(
            0x09511ec02cda1449a763758003afce9eab83e576b2ea1e803cb2a12650bf787c
        ),
        uint256(
            0x287a4e5b49fab4b3fdcea668678da26436ae201f21ef202e456f9d7b16a86a90
        ),
        uint256(
            0x06d61cedd23e349f55a11ffd447701cdf1d00d3a242177acb0d9c554ee799a9d
        ),
        uint256(
            0x097719abf0c65d4367e02741b4b989734285691ca20e7d1b1a7ef186dc0ab69c
        ),
        uint256(
            0x2cbee87ccdf52205005e5a9a0ce862974dd00662d57fc9d0674102f982df4a45
        ),
        uint256(
            0x0df9fdbb15f99ce4a0c9a8a5280b5878f21737ef27b5fcf3c7ad88ac715d19a0
        ),
        uint256(
            0x1800977bc4b748112c1d924770667d916d90679cfdba41fcea37bf75b9b11ebf
        )
    ];

    uint256[] public SRS_G1_Y = [
        uint256(
            0x0000000000000000000000000000000000000000000000000000000000000002
        ),
        uint256(
            0x12f42fa8fd34fb1b33d8c6a718b6590198389b26fc9d8808d971f8b009777a97
        ),
        uint256(
            0x1bbac0306fbe3079ca1caa6f2dafa1cbb1ad970cd019021973da1182ad544c37
        ),
        uint256(
            0x084c6e708ce5df57c4772f98c42dbab136b4cab92b6f17850b9a8f7f0eb19e14
        ),
        uint256(
            0x069617913a37bb74d9ef323d5ce028760c5c672e0025a0a48caf139b32dc70f1
        ),
        uint256(
            0x1dc1975e72b50e62faa67812c42b3e4b0f32273c27b81b38097a3506d2d89b83
        ),
        uint256(
            0x04e34c9484b9885fb074403489a7ec8ecd6d8ab6cb9a00135ce134801a29aa18
        ),
        uint256(
            0x15fa11654eff9029eb8534944a12fef90adba876f37d25046ed23662040e2ee3
        ),
        uint256(
            0x13aeb0921d07cc49ce2bfdf8aabf28e85a3e73bd8e92cdbd7c28c0ef2151999d
        ),
        uint256(
            0x167f03b2bb8cc583a5b880850c0439730cb723f3c9595415f354cacb23dcb724
        ),
        uint256(
            0x04b7796ae07a9642905bdb090e7ad61c328f6b3f5fa070f0c96eb847f47075ac
        ),
        uint256(
            0x23de253b9bc2727af92a66746a70960e3566faf37196bbd94cc2bd1dd9959584
        ),
        uint256(
            0x2d0725bdca137e2c0b1dfaf403beb37a0374d4ab8ce773ab962a259c9f4679e4
        ),
        uint256(
            0x1f4d3f8d3105e06a7710366a36c0d60ae52eb2e263dff04adcb8f711ee9e1fa2
        ),
        uint256(
            0x119c1bb670262cb76aaab5f3a996643c16efd80da02f2a35fb81747f1ebe5c97
        ),
        uint256(
            0x05e1ab74d9103a916de3011e6f908e7bba7e63d31e73955e5cee893e345638d2
        ),
        uint256(
            0x141b05faf7ea69cc972ea80101fb12e975d4a90679715a714171fa98393ab5ab
        )
    ];

    uint256[] public SRS_G2_X_0 = [
        uint256(
            0x198e9393920d483a7260bfb731fb5d25f1aa493335a9e71297e485b7aef312c2
        ),
        uint256(
            0x18c1beedba41ddf9af588015b878aca9dc39ab7c42f25492229ae1796076ab3f
        )
    ];

    uint256[] public SRS_G2_X_1 = [
        uint256(
            0x1800deef121f1e76426a00665e5c4479674322d4f75edadd46debd5cd992f6ed
        ),
        uint256(
            0x2fca16fc43f7283679e062bfc2bbf54f708772c60b0f4b45358613c3eca37113
        )
    ];

    uint256[] public SRS_G2_Y_0 = [
        uint256(
            0x090689d0585ff075ec9e99ad690c3395bc4b313370b38ef355acdadcd122975b
        ),
        uint256(
            0x2c64a7dba9f4202c9a4bd4089bcf281c4c7c90c80efa266bbb36256e82047ceb
        )
    ];

    uint256[] public SRS_G2_Y_1 = [
        uint256(
            0x12c85ea5db8c6deb4aab71808dcb408fe3d1e7690c43d37b4ce6cc0166fa7daa
        ),
        uint256(
            0x1edc0a927e4e6907abe201f714d3d89d7f0dbb7001293d37ff1233d208208404
        )
    ];
}
