// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "forge-std/Script.sol";
import {Destination} from "../src/Destination.sol";

contract DeployDestination1 is Script {
    function run() external returns (Destination) {
        address spookPool = 0x4e8E101924eDE233C13e2D8622DC8aED2872d505; // SpokePoolOptimismSepolia

        vm.startBroadcast();
        Destination destination = new Destination(spookPool);
        vm.stopBroadcast();
        return destination;
    }
}
