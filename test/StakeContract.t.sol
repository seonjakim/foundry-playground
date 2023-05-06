// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/StakeContract.sol";
import './mocks/MockERC20.sol';
import './utils/Cheats.sol';

contract StakeContractTest is Test {
    Cheats internal constant cheats = Cheats(HEVM_ADDRESS);
    StakeContract public stakeContract;
    MockERC20 public mockToken;

    function setUp() public {
        stakeContract = new StakeContract();
        mockToken = new MockERC20();
    }

    function testExample() public {
        uint256 amount = 10e18;
        mockToken.approve(address(stakeContract), amount);
        cheats.roll(55);
        bool stakePassed = stakeContract.stake(amount, address(mockToken));
        assertTrue(stakePassed);
    }
}
