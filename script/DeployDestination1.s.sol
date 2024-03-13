// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "forge-std/Script.sol";
import {Destination} from "../src/Destination.sol";

contract DeployDestination1 is Script {
    function run() external returns (Destination) {
        address spookPool = 0x7E63A5f1a8F0B4d0934B2f2327DAED3F6bb2ee75; // SpokePoolArbitrumSepolia

        vm.startBroadcast();
        Destination destination = new Destination(spookPool);
        vm.stopBroadcast();
        return destination;
    }
}
