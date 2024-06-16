pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract MyToken is ERC20, ERC20Permit {
    constructor() ERC20("MyToken", "MTK") ERC20Permit("MyToken") {}
    function mint(address add,uint amount)public
    {
        _mint(add,amount);
    }
    function burn(address myAddressb)
    myToken.transform(msg.sender,address(this));
}