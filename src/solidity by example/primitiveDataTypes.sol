pragma solidity ^0.8.24
contract Primitives{
    bool public boo=true;
    uint8 public u8=1;
    uint256 public u256=456;
    uint256 public u=123;
    int8 public i8=-1;
    int256 public i256=456;
    int256 public i=-123;
    int256 public minInt=type(int256).min;
    int256 public maxInt=type(int56).max;
    address public addr=0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    bytes1 a=0xb5;
    bytes2 b=0x56;
    bool public defultBoo;
    uint256 public defultUint;
    int256 public defultInt;
    address public defultAddr;
}