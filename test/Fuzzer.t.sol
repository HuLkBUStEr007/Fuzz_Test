// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "forge-std/Test.sol";
import "../contracts/Fuzzer.sol";
contract FuzzerTest is Test {
    Fuzzer public fuzzer;

    // Setting up the initial conditions before each test
    function setUp() public {
        fuzzer = new Fuzzer(); // Deploying a new instance of the Fuzzer contract
    }
    function testFuzzIncrement() public {
        uint256 initialNumber = fuzzer.number(); // Getting the initial value of the number
        uint256 newNumber = initialNumber + 1; // Incrementing the initial number by 1
        vm.assume(newNumber > initialNumber); // Assuming the new number is greater than the initial number
        fuzzer.increment(); // Calling the increment function in the Fuzzer contract
        assertEq(fuzzer.number(), newNumber); // Asserting that the number is incremented correctly
    }
    function testFuzzSetNumber() public {
        // Generating a new number using a combination of block timestamp and previous random number
        uint256 newNumber = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao)));
        vm.assume(newNumber != 0); // Assuming the new number is not zero
        fuzzer.setNumber(newNumber); // Calling the setNumber function in the Fuzzer contract
        assertEq(fuzzer.number(), newNumber); // Asserting that the number is set correctly
    }
}
