// SPDX-License-Identifier: MIT



// Version of Compiler
pragma solidity ^0.8.15;

contract sum{
   
 function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
      }
}