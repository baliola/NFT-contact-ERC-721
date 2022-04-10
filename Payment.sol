pragma solidity ^0.8.0;

contract Payment{
	address payable public owner;
	uint public balance;

	struct trans{
		address guestWalet;
		uint tripId;
		uint price;
	}

	trans public TransRecord;

	event Sent(address from, address to, uint amount);

	constructor() public payable{
		owner = payable(msg.sender);
		balance = address(this).balance;	
	}
	
	function GetBalance() public view returns(uint){
		return balance;
	}

	//1000000000000000000 = 1 eth
	function SetTransaction(address payable guestWalet, uint tripId, uint price) public payable{
		TransRecord = trans(guestWalet,tripId,price);
		//balance = price;
		//require(msg.value < price,"not enough balance!");
		(bool success, ) = guestWalet.call{value: msg.value}(""); 
		balance  += price;
		require(success,"Transaction Failed!");
		
	}

	function takeBalance(uint amount) public payable{
		(bool success, ) = owner.call{value: amount}(""); 
		balance  -= amount;
		require(success,"Transaction Failed!");
	}

	event Received(address, uint);
	receive() external payable {
		emit Received(msg.sender, msg.value);
    }

}