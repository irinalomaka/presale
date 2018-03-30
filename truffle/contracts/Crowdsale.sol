pragma solidity ^0.4.19;

import "./SafeMath.sol";
import "./CrowdsaleCoin.sol";

contract Crowdsale {

    using SafeMath for uint256;

	uint private constant rate = 27000;
	uint private constant bonus1Rate = 27000;
	uint private constant bonus2Rate = 26500;
	uint private constant bonus3Rate = 26000;

	uint public start;
    uint public period;
    uint public hardcap;

	address public wallet;
    CrowdsaleCoin public token;

	function Crowdsale (address _token, address _wallet, uint _start,  uint _period, uint _hardcap) public {
		token = CrowdsaleCoin(_token);
		wallet = _wallet;
		start = _start;
		period = _period;
		hardcap = _hardcap;
	}	

	modifier saleIsOn() {
    	require(now > start && now < start + period * 1 days);
    	_;
    }

    modifier isUnderHardCap() {
        require(wallet.balance <= hardcap);
        _;
    }

    function() external payable {
        saleTokens();
    }

    function saleTokens () internal isUnderHardCap saleIsOn {
    	wallet.transfer(msg.value);
    	uint tokens = rate.mul(msg.value).div(1 ether);
    	
    	if(now < start + (period * 1 days).div(4)) {
          tokens += bonus1Rate;
        } else if(now >= start + (period * 1 days).div(4) && now < start + (period * 1 days).div(4).mul(2)) {
          tokens += bonus2Rate;
        } else if(now >= start + (period * 1 days).div(4).mul(2) && now < start + (period * 1 days).div(4).mul(3)) {
          tokens += bonus3Rate;
        }

    	token.mint(msg.sender, tokens);
    }
}

