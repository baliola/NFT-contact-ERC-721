pragma solidity ^0.8.0;

contract Receiver {
    event Received(uint value);
  
    function deposit() public payable {
        emit Received(msg.value);
    }
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    fallback() external payable {
        emit Received(msg.value);
    }
    
    receive() external payable {
        emit Received(msg.value);
    }
}

contract Sender {
    constructor() payable {}
    
    //1000000000000000000 = 1 eth
    function sendEther(address payable receiver, uint amount) public {
        //require(amount <= address(this).balance,"Transaction Failed!");
        receiver.transfer(amount);
    }
    
    function getBalance() public view returns (uint256) {
      return address(this).balance;
    }
}