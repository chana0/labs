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
    function testDeposite(uint sum)public{
        uint initialBalance=wallet.getBalance();
        address ad=vm.addr(20);
        vm.startPrank(ad);
        vm.deal(ad,sum);
        payable(wallet).transfer(sum);
        assertEq(wallet.getBalance(),initialBalance+sum,'Balance should increase by nun after transfer');
        vm.startPrank();
    }
    function fuzzTestWhithdraw(uint sum)payable public{
        payable(wallet).transfer(sum);
        uint Balances=wallet.getBalance();
        address ad=vm.addr(12);
        wallet.addOwner(ad);
        vm.prank(ad);
        wallet.whithdraw(sum);
        assertEq(wallet.getBalance(),balances-sum);
    }
 function testAddOwner(address ad)public{
        wallet.addOwner(address(ad));
        assertEq(wallet.count(),1);
        assertEq(wallet.owners(address(ad)),true);
    }
    function testAddOwnersAlreadyExist(address z)public{
        wallet.addOwner(address(z));
        assertEq(wallet.count(),1);
        assertEq(wallet.owners(address(z)),true);
        vm.expectRevert('The owner already exist');
        wallet.addOwner(address(z));
    }
    function testHaveTreeOwners(address ad)public{
        w.addOwner(vm.addr(1));
        w.addOwner(vm.addr(2));
        w.addOwner(vm.addr(3));
        assertEq(w.count(),3);
        vm.expectRevert('Tree are already 3 owners');
        w.addOwner(address(ad));
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
