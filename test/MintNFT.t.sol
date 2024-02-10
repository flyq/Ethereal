// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MintGem.sol";
import "../src/KZGVerifier.sol";
import "forge-std/console.sol";

contract MintTest is Test, Verifier {
    Mint public mint;

    function setUp() public {
        mint = new Mint();
    }

    receive() external payable {}

    function testEvaluateBarycentricPolynomial() external view {
        // x = uint256[1,2,3,4,5,6,7,8,9,10]
        uint256[] memory x = new uint256[](10);
        uint256[] memory f = new uint256[](10);
        for (uint256 i = 0; i < 10; i++) {
            x[i] = i + 1;
            f[i] = uint256(keccak256(abi.encodePacked(i)));
        }

        uint256[] memory weights = getBarycentricWeights(x);
        uint256 f1 = evaluateBarycentricPolynomial(1, f, weights);

        uint256 f2 = evaluateBarycentricPolynomial(2, f, weights);

        // uint256 _f0 = evaluateBarycentricPolynomial(0, f, weights);

        console.logUint(f1);
        console.logUint(f[0]);

        console.logUint(f2);
        console.logUint(f[1]);
    }

    function getData()
        public
        pure
        returns (Pairing.G1Point[20] memory, uint256[20] memory)
    {
        Pairing.G1Point[20] memory proofs = [
            Pairing.G1Point(
                0x26ea695399481a0a166b82785afd4da72880a65773ce982ca283213bf8e9abd6,
                0x22f9f6624e578a11b5fcbe99bb6886f29b58284d26dc83cdc2012809362f8fbb
            ),
            Pairing.G1Point(
                0x2faa72689bf39794f7bdbdc4b55817f8946169e614ed7abab9eebf8172cb9824,
                0x0eeb65b7c484b3972bd00537ec4287a6cc823ed8dfb420206d3a32d9af03eb1a
            ),
            Pairing.G1Point(
                0x20e58710955b9af36f1d2a813499af15aa3a829a1dfb582d70f05e5855c95d51,
                0x0069286ffc37047bc0a4e050c629a33ae4e5c5dd2b2d3b0c058e89d7b0166583
            ),
            Pairing.G1Point(
                0x0b55f115769d2246db8f046ec1058835cd488d66e12b6eb3028a6a3040a84693,
                0x0f6fa5c37b695a86cef827be258e6830e691e5c63690bff7169d8063791edb29
            ),
            Pairing.G1Point(
                0x26bb1222e8802a6d1391826018bbe280e93724ab02a0905bd1cd54b117a6a6f3,
                0x292c8858ca237cd0eb2ee241d0e4eb89791641f2ac8ad4b309664b13101ce9e2
            ),
            Pairing.G1Point(
                0x213de899ade2923afdc01f313a2017d0eac35d9972dc407600337844c3d51270,
                0x1e543c50d107f74e2ce7d8d955f45b7f4b961e11d3b0433579b0a7ad52025c54
            ),
            Pairing.G1Point(
                0x15653a7bb33d86f8094fb94aa474d069bc638be5d9054660d7bc86a0eeda7732,
                0x1bda43f06649e68e44a6a91ad3058586cdd92253c6d6743b395dcf17936b535d
            ),
            Pairing.G1Point(
                0x2611e4de96553ea443510e84e7cf795d213528773cc3f08b038d97f4cac8306d,
                0x1b248bac91d3e027c8416d283806840f17e89c7082eff4172f51cab8402364d4
            ),
            Pairing.G1Point(
                0x1af7c3559f42dfec873cc01ded0506134e9b8b6326150594f537f26993668f90,
                0x0180d1a51657de71ebeeabdea6f77137a66fc1c64474d928da5cddb573c9dc98
            ),
            Pairing.G1Point(
                0x0ecb0712f09aa592ffdd7242d5334bc4a136fbf45e4d5f725ace44535f317b7e,
                0x034a2e72e9f01290bd00603afc558e053207cad1c831b99275bbc3e1c2741cee
            ),
            Pairing.G1Point(
                0x1699bded8a729776a698e37975e70fb8ce208226aae9df1ec6a474f7c15bbf34,
                0x02eb9c49c11550f0971a8ace1ba2aaca30c54c3744fb347cd056c92220c1b666
            ),
            Pairing.G1Point(
                0x048cedb3096ac0dd5ce9efb90da7c9dc848ddc4ad95d182da27ade2d710759bd,
                0x300d7ff5e2357739137ec05873d5e7df95c5a3e1e0e7c0d80b6e5a551a8decc9
            ),
            Pairing.G1Point(
                0x0b91b529aac0f22a13830064ea5d821d50f3c8da50d50af2acba7d9ffc821dbb,
                0x0815da5c9287ded76289b9bfb594578a0e0e649642fcb16c2f7f83e0ca419f9d
            ),
            Pairing.G1Point(
                0x232f8554ce6b33aaa16cd3c575136a83710fc22600a8bd238616d76c75af4ae3,
                0x0784c49fcf7d171fcc27a03ad7b95cb4052ff2f24c0e26261a18715ae823ecc1
            ),
            Pairing.G1Point(
                0x00ff11061ea113b23c1654c0c84e565d4bb6b14281c55c81afcd24b677533ba3,
                0x210fb0001cc229a08b129e1cb2a423513f31f0a52dd5d0f82c3cf06f8f3d4832
            ),
            Pairing.G1Point(
                0x1b15108af2a13fbbcf1aa4d71291273789d5f37bd2c89d17136586cfe3f03c6b,
                0x258e7365b7264c7b5f93cc5b2c149e35834d6207a9854c22dc815e9ff5cfc882
            ),
            Pairing.G1Point(
                0x02b8822e02ed2f2d9e2c0c1766b500b770c0ec35914499641e48893479cf7922,
                0x0aae11f63095129dea12a752358056e65dda33e1ae90794e7b8a350de8adec3f
            ),
            Pairing.G1Point(
                0x13cf8addd4aa94aac933489243e4f8ddd512fdc6a73839abbb620affd84757a7,
                0x27cee902adc054bec639a4a1c79bb6c1c0bc61d7d7da39c52dff99928e9cdeca
            ),
            Pairing.G1Point(
                0x0b7a3b86d3f8ef0163705b57c351330a819f5b8a2facc63812b4ed5e80c30edc,
                0x1771a34812deef166133ae394dfab3c185e76645b0e9d01badd57c41e122035e
            ),
            Pairing.G1Point(
                0x223fccec8820b068201f04becd698ef3b22eda8831f0ab6a1c6f8d2a32b32d8b,
                0x15bc573c5f2d9a25a807695d66fd456e828b4493a9ad6a2ea12bb95fbe8b18d1
            )
        ];

        uint256[20] memory values = [
            0x1683b77c7b008db21f105aeb65dcf0b03806a150cf3a45a78c191e5895fbe3e4,
            0x2945e6f4f6a2714e01039c3dbf07be6a671df5a27d3731b0752564b30f129745,
            0x2f3a3ad74498558fdfbfa6bff13920a88e85c81f50b2083bc6cc4068b5b9694f,
            0x20a5e896e3826136bbbe54944282228bd55d30b1d639a1e4bde0a5ec5b9b44ff,
            0x1b36c872cf2f374516308882bebfadb49b35567ccac3b383a3629a24313986e2,
            0x1715809a2ae64ddc09fdd6e5fccf53ee1ca4d4c269318be5e037367651897dbb,
            0x1b1e632171cdea62cbe90ee1edc188303d88dfe7c513232361273c3e2d7ebd97,
            0x03732994edbdb52b41f10858c5937d520c2963d76a6cdb283658bd99d9ff9c06,
            0x0a52b6cfe0e75c01a283d4e5269ca4f6ea7e390c85f3f758944547745d4998f4,
            0x2b16399336fd2c8c2b0352c355a627c47f3b2581cf949365e3a95491727b2034,
            0x156a39303db584fafbccf1a00b1b367f9bfde5d7897cbe48fa994b18872934ce,
            0x21874720ba890d9edbf76c5c16a5839b06d61d4c1c67d50a947ccc48632445b9,
            0x08709e0cdb23f453ad0e2ed98be71b8234d748061de5e38c0d18b0a2e000c2a9,
            0x22c703e548b92d58e43b4f31530acf223975800e3470dc64471aace241e49041,
            0x134ecb938a6f1e9da379de04a75535eb7c22d0090b1daa6cd363bc290a520060,
            0x03a708afd43318e9142085b1527f989a49f3d50f8bb1be7ca7cfa7d773e7be14,
            0x24de55cb42923885761504018512c5e1770ab708ec9e6f5942294afd3c98746f,
            0x2c4dbeedc680dd665fdddac70682824b582758a0a3a2f5f36775f407e5df7878,
            0x21364abd1eb5141d502dc40ef519e15e679b28dae442e44a8b8c39bd88f52a30,
            0x0c99a0684c2cc192b13c6afc24e77c8f0ea1d3d4d8d6f3ed05fe1422289bc101
        ];
        return (proofs, values);
    }

    function testNormal() external {
        mint.register(
            Pairing.G1Point(
                0x0fa67f58acfdcf1b7b8529868df096fa97ce8a4147546b6c3f15a299b7484f76,
                0x09b521d1fc0fb731d9522de51b8a1ea9aaa67ab863b6c3db9da0e2785af1d1a2
            ),
            Pairing.G1Point(
                0x2b23e467ea98dcba7e033afc15697dfa4db2328c3f9d4fc112900687e9192fba,
                0x0961852c4759acb47308d23ddd8b0f464848c54e5ab98f50f2a62cefc144c555
            ),
            Pairing.G1Point(
                0x2bc5228f3e5e11ba4536ae9315811c424d9f7e5bbc3c3ab4124c9bf8492c9c16,
                0x1fac4e67bdcfd2b11d889fda0c9a99b6ceefbbe3acdcf7a2e418a6a68b7219ba
            )
        );

        (
            Pairing.G1Point[20] memory proofs,
            uint256[20] memory values
        ) = getData();

        for (uint i = 0; i < 16; i++) {
            mint.mint(proofs[i], values[i]);
        }

        vm.expectRevert("Soul dispersed");
        mint.mint(proofs[16], values[16]);
    }

    function testHack() external {
        mint.register(
            Pairing.G1Point(
                0x0fa67f58acfdcf1b7b8529868df096fa97ce8a4147546b6c3f15a299b7484f76,
                0x09b521d1fc0fb731d9522de51b8a1ea9aaa67ab863b6c3db9da0e2785af1d1a2
            ),
            Pairing.G1Point(
                0x0000000000000000000000000000000000000000000000000000000000000001,
                0x0000000000000000000000000000000000000000000000000000000000000002
            ),
            Pairing.G1Point(
                0x1820f5d55d603c14b534fff86db54c5fecfde13464ba660be352c3b6a87451c3,
                0x04fefd0113a6a5290731bacf1d9be2463c8d9290d34973e93ea596555fce41a6
            )
        );

        (
            Pairing.G1Point[20] memory proofs,
            uint256[20] memory values
        ) = getData();

        for (uint i = 0; i < 20; i++) {
            mint.mint(proofs[i], values[i]);
        }
    }
}
