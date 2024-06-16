// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "@hack/wallet/wallet.sol";

contract WalletTest is Test {
    Wallet public w;

    function setUp() public {
        w = new Wallet();
    }

    function testAddOwner(address owner) public {
        w.addOwner(owner);
        assertEq(w.count(), 1);
        assertEq(w.owners(owner), true);
    }

    function testAddMoreThanTreeOwners(address owner) public {
        w.addOwner(vm.addr(1));
        w.addOwner(vm.add1(2));
        w.addOwner(vm.addr(3));
        vm.expectRevert("There are already 3 owners cant add owner");
        w.addOwner(owner);
    }

    function testDeleteOwner(address owner) public {
        w.addOwner(owner);
        assertEq(w.owners(owner), true);
        assertEq(w.count(), 1);
        w.deleteOwner(owner);
        assertEq(w.owners(owner), false);
        assertEq(w.count(), 0);
    }

    function testDeleteNotExistsUser(address owner) public {
        vm.expectRevert("Owner not exists");
        w.deleteOwner(owner);
    }

    function testDeposit(uint256 sum, address owner) public {
        vm.prank(owner);
        vm.deal(owner, sum);
        payable(address(w).transfer(sum));
        assertEq(w.getBalance(), sum);
    }

    function testWithdraw(uint256 sum) public {
        address owner = vm.addr(1);
        w.addOwner(owner);
        vm.deal(address(w), sum);
        uint256 balance = w.getBalance();
        vm.startPrank(owner);
        w.withdraw(sum);
        vm.stopPrank();
        assertEq(w.getBalance(), balance - sum);
    }

    function testNotOwnerCatWithdraw(uint256 sum) public {
        vm.deal(address(w), sum);
        vm.prank(vm.addr(1));
        vm.expectRevert("Wallet not owner");
        w.withdraw(sum);
    }

    function testWithdarwithoutEnoughMoney(uint256 sum) public {
        vm.expectRevert();
        w.withdraw(sum);
    }
}
