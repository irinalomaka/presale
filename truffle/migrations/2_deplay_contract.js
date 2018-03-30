var CrowdsaleCoin = artifacts.require("./CrowdsaleCoin.sol")
var Crowdsale = artifacts.require("./Crowdsale.sol")

module.export = function(deployer, accounts, network) {
	const initialCoint = 10000000;
	const wallet = "0xa0d2e0ccfc48423e269fa62adcba67aba29efac2";
	const start = 1522414955;
	const period = 2;
	const _hardcap = 100000000000000000;
	deployer.deploy(CrowdsaleCoin, initialCoint).then(function() {
		deployer.deploy(Crowdsale, CrowdsaleCoin.address, wallet, start, period, _hardcap);
	});
}