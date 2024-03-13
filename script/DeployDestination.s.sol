// // SPDX-License-Identifier: MIT
// pragma solidity 0.8.24;

// import "forge-std/Script.sol";
// import {DestinationArb} from "../src/DestinationArb.sol";

// contract DeployDestination is Script {
//     function run() external returns (DestinationArb) {
//         address spookPool = 0x4589fbf26c6a456f075b5628178af68abe03c5ff; // SpokePoolPolygonMumbai
//         address router = 0x9c3C9283D3e44854697Cd22D3Faa240Cfb032889; // Polygon mumbai uniswap v3 contract address
//         address VMATIC = 0x4EE8a9C9b409dB09750e9F22da94402be2085Fcd;

//         vm.startBroadcast();
//         DestinationArb destination = new DestinationArb(router,spookPool,wethAddress,);
//         vm.stopBroadcast();
//         return source;
//     }
// }

// // VMATIC : 0x9c3C9283D3e44854697Cd22D3Faa240Cfb032889
// // Polygon Mumbai : 80001
