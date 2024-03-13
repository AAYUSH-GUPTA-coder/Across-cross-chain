// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Helper {
    // Supported Networks
    enum SupportedNetworks {
        ETHEREUM_SEPOLIA,
        OPTIMISM_GOERLI,
        AVALANCHE_FUJI,
        ARBITRUM_SEPOLIA,
        POLYGON_MUMBAI,
        BNB_CHAIN_TESTNET,
        BASE_GOERLI
    }

    // Chain IDs
    uint64 constant chainIdEthereumSepolia = 16015286601757825753;
    uint64 constant chainIdOptimismGoerli = 2664363617261496610;
    uint64 constant chainIdAvalancheFuji = 14767482510784806043;
    uint64 constant chainIdArbitrumSepolia = 3478487238524512106;
    uint64 constant chainIdPolygonMumbai = 12532609583862916517;
    uint64 constant chainIdBnbChainTestnet = 13264668187771770619;
    uint64 constant chainIdBaseGoerli = 5790810961207155433;

    // Spoke address
    address constant SpokePoolEthereumSepolia =
        0x5ef6C01E11889d86803e0B23e3cB3F9E9d97B662;
    address constant SpokePoolArbitrumSepolia =
        0x7E63A5f1a8F0B4d0934B2f2327DAED3F6bb2ee75;
    address constant SpokePoolAvalancheFuji =
        0xd08baaE74D6d2eAb1F3320B2E1a53eeb391ce8e5;
    address constant SpokePoolBaseSepolia =
        0x82B564983aE7274c86695917BBf8C99ECb6F0F8F;
    address constant SpokePoolOptimismSepolia =
        0x4e8E101924eDE233C13e2D8622DC8aED2872d505;
}
