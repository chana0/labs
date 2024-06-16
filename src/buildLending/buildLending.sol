pragma solidity ^0.8.20;
import "@openzeppelin/ERC20.sol"
import "@openzeppelin/ERC20/IERC20.sol";
import "forge-std/console.sol"
contract BuildLending{
    address public owner;
    mapping(address=>uint)public userBorrowed;
    mapping(address=>uint) public userCollateral;
    mapping(address=>uint) public depositDAI;
    IERC20 public dai;
    //IERC20 public ETH;
    constructor(address _dai){
        DAI=IERC20(_dai);
    }
    modifier onlyOwner(){
        require(msg.sender==owner,"Only owner can do il.");
        _;
    }
    //user
    function deposint()external{}
    //user
    function receiveDAI()public{}
    //user
    function addETH()public payable{}
    //user
    function removeETH()public{}
    //user
    function borrowAssets()public{}
    //user
    function repayBorrowedAssets()public{}
    //owner
    //triger liquidation of user positions when their collateral value falls below a certain threshold.
    function liquidation()public{}
    //owner
    function harvestRewards()public{}
    //owner
    //convert protocol treasury ETH to reserve assets
    function convert()public{}

}