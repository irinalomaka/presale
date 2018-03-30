pragma solidity ^0.4.19;

import "./Ownable.sol";

/**
 * The CrowdsaleCoin contract does this and that...
 */
contract CrowdsaleCoin is Ownable {

	string public constant name = "Crowdsale Coin";
	string public constant symbol = "CCoin";
	uint32 public constant decimal = 18;

	uint public totalSupply;

	mapping (address => uint) public balances;
	mapping (address => mapping (address => uint)) allowed;

	event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);

	function CrowdsaleCoin (uint32 initialCoinCount) public {
		if (initialCoinCount == 0) initialCoinCount = 100000;

		totalSupply = initialCoinCount;
		balances[owner] = totalSupply;
	}	

	function balanceOf (address _owner) public constant returns(uint balance) {
		return balances[_owner];	
	}

	function mint(address mintAddress, uint mintValue) public onlyOwner {
		assert(totalSupply + mintValue >= totalSupply && balances[mintAddress] + mintValue >= mintValue);
		balances[mintAddress] += mintValue;
      	totalSupply += mintValue;
	}
	
	function transfer (address transferAddress, uint32 transferValue) public returns(bool success) {
		if(balances[msg.sender] >= transferValue && balances[transferAddress] + transferValue >= balances[transferAddress]) {
	        balances[msg.sender] -= transferValue; 
	        balances[transferAddress] += transferValue;
	        Transfer(msg.sender, transferAddress, transferValue);
	        return true;
        }

        return false;
	}

	function transferFrom(address transferAddresFrom, address transferAddressTo, uint32 transferValue) public returns (bool success) {
    	if(allowed[transferAddresFrom][msg.sender] >= transferValue && balances[msg.sender] >= transferValue && balances[transferAddressTo] + transferValue >= balances[transferAddressTo]) {
    		allowed[transferAddresFrom][msg.sender] -= transferValue;
	    	balances[transferAddresFrom] -= transferValue; 
	        balances[transferAddressTo] += transferValue;
	        Transfer(transferAddresFrom, transferAddressTo, transferValue);
	        return true; 
	    }

    	return false;
    }
    
    function approve(address approveAddress, uint32 approveValue) public returns (bool success) {
    	allowed[msg.sender][approveAddress] = approveValue;
        Approval(msg.sender, approveAddress, approveValue);
        return true;
    }
    
    function allowance(address ownerAddress, address allowanceAddress) public constant returns (uint remaining) {
        return allowed[ownerAddress][allowanceAddress];
    }
	
}


