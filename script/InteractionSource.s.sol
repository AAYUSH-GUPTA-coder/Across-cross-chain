// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "forge-std/Script.sol";
import {SourceOptimism} from "../src/SourceOptimism.sol";

contract InteractionSource is Script {
    address public sourceContract = 0x9761f7Cf9f764a3cc42875Ac1D47c275AC709386;
    address spookPool = 0x7E63A5f1a8F0B4d0934B2f2327DAED3F6bb2ee75; // SpokePoolArbitrumSepolia
    address owner = 0xB9f9Af07fAd74C23F35CAeC708515782a15911Ba;
    address depositor = 0xB9f9Af07fAd74C23F35CAeC708515782a15911Ba;
    address recipient = 0x7Fb94B8968af1cFa6E2FBE1b0cA1e1ed00CA3FC8;
    address inputAddress = 0x4200000000000000000000000000000000000006;
    address outputToken = address(0);
    uint256 inputAmount = 10000000000000000; // 0.01
    uint256 totalRelayFee = 1536948983442999;
    uint256 outputAmount = inputAmount - totalRelayFee;
    uint256 destinationChainId = 59144;
    address exclusiveRelayer = address(0);

    function run() external {
        // sourceTransferToken(sourceContract);
        vm.startBroadcast();
        SourceOptimism(sourceContract).transferToken(
            depositor,
            recipient,
            inputAddress,
            outputToken,
            inputAmount,
            outputAmount,
            destinationChainId,
            exclusiveRelayer,
            uint32(block.timestamp),
            uint32(block.timestamp) + 21600,
            0,
            ""
        );
        vm.stopBroadcast();
    }

    function sourceTransferToken(address _sourceContract) public {
        vm.startBroadcast();
        SourceOptimism(_sourceContract).transferToken(
            depositor,
            recipient,
            inputAddress,
            outputToken,
            inputAmount,
            outputAmount,
            destinationChainId,
            exclusiveRelayer,
            uint32(block.timestamp),
            uint32(block.timestamp) + 21600,
            0,
            ""
        );
        vm.stopBroadcast();
    }
}
