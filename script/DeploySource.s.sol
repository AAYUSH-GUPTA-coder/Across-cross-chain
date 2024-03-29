// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "forge-std/Script.sol";
import {SourceOptimism} from "../src/SourceOptimism.sol";

contract DeploySource is Script {
    function run() external returns (SourceOptimism) {
        address spookPool = 0x4e8E101924eDE233C13e2D8622DC8aED2872d505; // SpokePoolOptimismSepolia
        // address owner = 0xB9f9Af07fAd74C23F35CAeC708515782a15911Ba;
        // address depositor = 0xB9f9Af07fAd74C23F35CAeC708515782a15911Ba;
        // address recipient = 0x61D814D1747c8Ee85C066DC60b6ad0Fa0309e6Fc;
        // address inputAddress = 0x4200000000000000000000000000000000000006;
        // address outputToken = address(0);
        // uint256 inputAmount = 10000000000000000; // 0.01
        // uint256 totalRelayFee = 1536948983442999;
        // uint256 outputAmount = inputAmount - totalRelayFee;
        // uint256 destinationChainId = 421614;
        // address exclusiveRelayer = address(0);
        // uint32 quoteTimestamp = block.timestamp;
        // uint32 fillDeadline;
        // uint32 exclusivityDeadline;

        vm.startBroadcast();
        SourceOptimism source = new SourceOptimism(spookPool);
        // source.transferToken(
        //     depositor,
        //     recipient,
        //     inputAddress,
        //     outputToken,
        //     inputAmount,
        //     outputAmount,
        //     destinationChainId,
        //     exclusiveRelayer,
        //     uint32(block.timestamp),
        //     uint32(block.timestamp) + 21600,
        //     0,
        //     ""
        // );
        vm.stopBroadcast();
        return source;
    }
}

// curl "https://across.to/api/suggested-fees?token=0x4200000000000000000000000000000000000006&destinationChainId=10&amount=100000000000000000"
