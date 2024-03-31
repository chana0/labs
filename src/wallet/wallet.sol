// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
contract Wallet{
    address payable public owner;
    address payable [] public owners;
    uint256 count=0;
    mapping (address => uint256) public balances;
    constructor(){
        owner=payable(msg.sender);
        count=0;
    }
    receive() external payable {}
    function receiveit() external payable {
        balances[msg.sender] += msg.value;
    }
    modifier onlyOwner(){
        require(owners[msg.sender]==true,"not owner or gabay");
    }
    function getBalance()public view returns(uint256){
        return address(this).balance;
    }
    
      function withdraw(uint sum) public onlyOwner {
        payable(msg.sender).transfer(sum);
    }
    function addOwner(address newOwner)public onlyOwner
    {
        require(owners.length<3,"There are alraedy 3 collection");
        require(!owners[newOwner],'Owner alreafy exists');
        owners.push(newOwner);
        count++;
    }
    function deleteOwner(address owner)public onlyOwner{
        require(owners[owner],"owner not exists);
        delete owners[owner];
        count--;
    }
}