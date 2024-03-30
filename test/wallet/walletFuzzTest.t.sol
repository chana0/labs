// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "@hack/wallet/wallet.sol";


contract WalletTest is Test {
    Wallet public w;

    // Everything I need to start my test
    function setUp() public {
        w = new Wallet();
    }
    function testAddOwner(address owner)
    { }
    function testAddMoreThanTreeOwners(address owner)public{
    }
    function testDeleteOwner(address owner)public{}
    function testDeleteNotExistsUser(address owner)public{}
    function testDeposit(uint256 sum)public{}
    function testWhithdraw(uint256 sum)public{}
    function testNotOwnerCantWithdraw(uint sum){}
    function testWhithdrawithoutEnoughMoney(uint256 sum)public{}
}
