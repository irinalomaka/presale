pragma solidity ^0.4.19;

contract Ownable {

	address owner;

	function Ownable () public {
		owner = msg.sender;
	}	

	modifier onlyOwner() { 
		require( msg.sender == owner); 
		_; 
	}

	function transferOwnership(address newOwner) public onlyOwner {
		owner = newOwner;
	}
	
}
