// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
contract Wallet{
    address payable public owner;
    address payable [] public owners;
    mapping (address => uint256) public balances;
    constructor(){
        owner=payable(msg.sender);
    }
    receive() external payable {}
       function receiveit() external payable {
        balances[msg.sender] += msg.value;
    }
    modifier onlyOwner()
    {
        bool flag=false;
        for(uint i=0;i<owners.length;i++)
        {
            if(owners[i]==msg.sender)
            {
                flag=true;
                break;
            }
        }
        require(flag,"you not woners");
        _;
    }
   /* function whithOrow(uint wad)external   {
        require(msg.sender==owner,"onli owner can whithdraw");
        payable (msg.sender).transfer(wad);
    }*/
      function withdraw(uint wad) external {
        require(msg.sender == owner, "WALLET-not-owner");
        balances[msg.sender] -= wad;
        payable(msg.sender).transfer(wad);
    }
    function getBalance() external view returns (uint){
        return address(this).balance;
    }
    function addOwner(address newOwner)public 
    {
        require(owner==msg.sender,"");
        require(owners.length;<3,"There are alraedy 3 collection");
        owners.push(newOwner);
    }
}