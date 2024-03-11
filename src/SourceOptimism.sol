// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.24;

import {InterfaceV3SpokePool} from "./InterfaceV3SpokePool.sol";

contract SourceOptimism {
    InterfaceV3SpokePool public spokePool;

    constructor(address _spokePool) {
        spokePool = InterfaceV3SpokePool(_spokePool);
    }

    //     spokePool.depositV3(
    //   userAddress, // User's address on the origin chain.
    //   userAddress, // recipient. Whatever address the user wants to recieve the funds on the destination.
    //   usdcAddress, // inputToken. This is the usdc address on the originChain
    //   "0x0000000000000000000000000000000000000000", // outputToken: 0 address means the output token and input token are the same. Today, no relayers support swapping so the relay will not be filled if this is set to anything other than 0x0.
    //   amount, // inputAmount
    //   amount.sub(BigNumber.from(totalRelayFee.total)), // outputAmount: this is the amount - relay fees. totalRelayFee.total is the value returned by the suggested-fees API.
    //   destinationChainId, // destinationChainId
    //   "0x0000000000000000000000000000000000000000", // exclusiveRelayer: set to 0x0 for typical integrations.
    //   timestamp, // quoteTimestamp: this should be set to the timestamp returned by the API.
    //   Math.round(Date.now() / 1000) + 21600, // fillDeadline: We reccomend a fill deadline of 6 hours out. The contract will reject this if it is beyond 8 hours from now.
    //   0, // exclusivityDeadline: since there's no exclusive relayer, set this to 0.
    //   "0x", // message: empty message since this is just a simple transfer.
    // )

    function transferToken(
        address _depositor, // User's address on the origin chain.
        address _recipient, // address of the receipent smart contract
        address _inputToken, // address of the input token
        address _outputToken, // address(0), // outputToken: 0 address means the output token and input token are the same. Today, no relayers support swapping so the relay will not be filled if this is set to anything other than 0x0.
        uint256 _inputAmount, // inputAmount
        uint256 _outputAmount, // amount - totalRelayFee, outputAmount: this is the amount - relay fees. totalRelayFee is the value returned by the suggested-fees API.
        uint256 _destinationChainId, // destinationChainId
        address _exclusiveRelayer, // address(0), exclusiveRelayer: set to 0x0 for typical integrations.
        uint32 _quoteTimestamp, // timestamp: this should be the timestamp returned by the API. Otherwise, set to block.timestamp.
        uint32 _fillDeadline, // block.timestamp + 21600, // fillDeadline: We reccomend a fill deadline of 6 hours out. The contract will reject this if it is beyond 8 hours from now.
        uint32 _exclusivityDeadline, // 0, // exclusivityDeadline: since there's no exclusive relayer, set this to 0.
        bytes calldata _message // "", // message: empty message since this is just a simple transfer.
    ) public payable {
        spokePool.depositV3(
            _depositor,
            _recipient,
            _inputToken,
            _outputToken,
            _inputAmount,
            _outputAmount,
            _destinationChainId,
            _exclusiveRelayer,
            _quoteTimestamp,
            _fillDeadline,
            _exclusivityDeadline,
            _message
        );
    }
}

// 1_259519
// 1000_000_000
