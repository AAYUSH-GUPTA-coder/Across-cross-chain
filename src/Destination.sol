// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.24;

import {InterfaceV3SpokePool} from "./InterfaceV3SpokePool.sol";
import {ISwapRouter} from "./ISwapRouter.sol";
import {IERC20} from "./IERC20.sol";

error Unauthorized();

contract Destination {
    InterfaceV3SpokePool public spokePool;
    address public immutable acrossSpokePool;

    constructor(address _acrossSpokePool) {
        acrossSpokePool = _acrossSpokePool;
    }

    function handleV3AcrossMessage(
        address /*tokenSent*/,
        uint256 /*amount8*/,
        address /*relayer*/,
        bytes memory /*message*/
    ) external {
        // Verify that this call came from the Across SpokePool.
        if (msg.sender != acrossSpokePool) revert Unauthorized();
    }
}
