// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24
contract HelloWorld{
    string public greet="HelloWorld!";
    function getGreeting()external view returns(string memory){
        return greet;
    }
}