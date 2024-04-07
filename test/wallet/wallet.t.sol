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
    function testAddOwner()public
    {
        w.addOwner(address(1));
        assertEq(w.count(),1);
        assertEq(w.owners(address(1)),true);
    }
    function testAddMoreThanTreeOwners()public{
        w.addOwner(address(1));
        w.addOwner(address(2));
        w.addOwner(address(3));
        vm.expectRevert('There are already 3 owners cant add owner');
        w.addOwner(address(4));
    }
    function testDeleteNotExsistUser()public{
        address owner=vm.addr(1);
        w.addOwner(owner);
        assertEq(w.owners(owner),true);
        assertEq(w.count(),1);
        w.deleteOwner(owner);
        assertEq(w.owners(owner),false);
        assertEq(w.count(),0);
    }
    function testDeleteNotExsistUser()public{
        vm.expectRevert('Owner not exsits');
        w.deleteOwner(vm.addr(1));
    }
    function testDeposit() public {
        uint balance=w.getBalance();
        uint sum=10000000;
        payable(address(w)).transfer(sum);
        assertEq(w.getBalance(),sum+balance);
    }

    function testWithdraw() public {
        uint sum=100;
        uint balance=150;
        payable(address(w)).transfer(balance);
        w.addOwner(vm.addr(1));
        vm.prank(vm.addr(1));
        w.withdraw(sum);
        assertEq(w.getBalance(),balance-sum);
    }
    function testWithdrawithoutEnoughMoney()public{
        uint sum=50;
        uint balance=10;
        payable(w).transfer(balance);
        vm.expectRevert();
        w.withdraw(sum);
    }

    function testDeposit() public {}

    function testWithdraw() public {}
}
