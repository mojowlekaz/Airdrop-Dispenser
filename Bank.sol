pragma solidity ^0.8.0;

contract bank {

    mapping(address => uint) public accounts;

    modifier hasFunds(uint _amount){
    require(_amount <= accounts[msg.sender], "Does not have sufficient funds");
    _;

    }



    function deposit () public payable {
        accounts[msg.sender] += msg.value;

    }

    function withdraw (uint _amount) public payable hasFunds(_amount) {
        payable(msg.sender).transfer(_amount);
    }

    function checkAssets() public view returns(uint) {
        return address(this).balance;
    }

}