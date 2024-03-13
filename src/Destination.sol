// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.24;

import {InterfaceV3SpokePool} from "./InterfaceV3SpokePool.sol";
import {ISwapRouter} from "./ISwapRouter.sol";
import {IERC20} from "./IERC20.sol";

error Unauthorized();

contract Destination {
    InterfaceV3SpokePool public spokePool;
    address public immutable acrossSpokePool;
    // ISwapRouter public router;
    // address public immutable wethAddr;
    // address public immutable wstEthAddr;

    constructor(
        // address _router,
        address _acrossSpokePool
        // address _wethAddr,
        // address _wstEthAddr
    ) {
        // router = ISwapRouter(_router);
        acrossSpokePool = _acrossSpokePool;
        // wethAddr = _wethAddr;
        // wstEthAddr = _wstEthAddr;
    }

    function handleV3AcrossMessage(
        address /*tokenSent*/,
        uint256 /*amount8*/,
        address /*relayer*/,
        bytes memory /*message*/
    ) external {
        // Verify that this call came from the Across SpokePool.
        if (msg.sender != acrossSpokePool) revert Unauthorized();

        // Decodes the user address from the message.
        // address user = abi.decode(message, (address));

        // swapExactInputSingleHop(
        //     wethAddr,
        //     wstEthAddr,
        //     100,
        //     amount,
        //     address(this)
        // );
    }

    // function swapExactInputSingleHop(
    //     address tokenIn,
    //     address tokenOut,
    //     uint24 poolFee,
    //     uint amountIn,
    //     address receiver
    // ) public returns (uint amountOut) {
    //     IERC20(tokenIn).approve(address(router), amountIn);

    //     ISwapRouter.ExactInputSingleParams memory params = ISwapRouter
    //         .ExactInputSingleParams({
    //             tokenIn: tokenIn,
    //             tokenOut: tokenOut,
    //             fee: poolFee,
    //             // recipient: address(this),
    //             recipient: receiver,
    //             deadline: block.timestamp,
    //             amountIn: amountIn,
    //             amountOutMinimum: 0, // need to be calcuated off-chain and need to take the value in parameter
    //             sqrtPriceLimitX96: 0
    //         });

    //     amountOut = router.exactInputSingle(params);
    // }
}
