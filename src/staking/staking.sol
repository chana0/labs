pragma solidity ^0.8.24;
import "./IERC20.sol";
import "./SafeMath.sol"
contract stakeTogether{
    using SafeMath for uint256;
    address public couldTokenAddredd;
    uint256 public totalStaked;
    uint256 public expiration;
    uint256 public rewardPool;
    mapping(address =>uint256)public stakes;
    mapping(address=>uint256)public rewards;
    event Staked(address indexed user,uint256 amount);
    event withdraw(address indexed user ,uint256 amount);
    event Claimed(address indexed user ,uint256 amount);
    constructor(address _cloudTokenAddress,uint256 _expiration){
        couldTokenAddress=_couldTokenAddrees;
        expiration=block.timestamp+_expiration;
    }
    function stake(uint256 _amount)external{
        require(block.timestamp<expiration ,"Staking period has expired");
        require(_amount>0,"Cannot stake 0");
        require(
            IERC20(couldTokenAddress).transferForm(msg.sender,address(this),_amount),
            "Transfer failed"
        );
        emit Withdrawn(msg.sender,amount);
    }
    function claim()external{
        require(block.timestamp>=expiration,"Cannot claim before expiration");
        uint256 stakeAmount=stakes[msg.sender];
        require(stakeAmount>0,"No stake to claim");
        uint256 userReward=rewardPool.mul(stakeAmount).div(totalStaked);
        rewards[msg.sender]=userReward;
        rewardPool=rewardPool.sub(userReward);
        require(
            IERC20(couldTokenAddredd).transfer(msg.sender,userReward),
            "Transfer failed"
        );
        emit Claimed(msg.sender,userReward);
    }
    function mint(uint256 _amount)external{
        require(msg.sender==_cloudTokenAddress,"Only cloud token can mint");
        require(block.timestamp<expiration,"Minting not allowed after expiration");
        rewardPool=rewardPool.add(_amount);
    }
}