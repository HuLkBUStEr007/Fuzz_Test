// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Fuzzer {
  // This variable stores a number
  uint256 public number;

  // This function lets you change the stored number
  function setNumber(uint256 newNumber) public {
    number = newNumber;
  }

  // This function increases the stored number by 1
  function increment() public {
    number = number + 1; // Add 1 to the number
  }
}