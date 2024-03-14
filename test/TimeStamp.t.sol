// SPDX-License-Identifier: GPL 3.0
pragma solidity 0.8.24;

import "forge-std/Test.sol";
import "forge-std/console.sol";

contract GetTimeStamp is Test {
    // console.log("Current timestamp" , uint32(block.timestamp));
    function setUp() public {
        console.log("Current timestamp", uint32(block.timestamp));
        console.log("Expiry timestamp", uint32(block.timestamp) + 21600);
    }

    function testTime() public {
        console.log("work");
        console.log("Current timestamp", uint32(vm.getBlockTimestamp()));
        console.log("Expiry timestamp", uint32(block.timestamp) + 21600);
    }
}
