//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
//our contract will do the following
//get funds from users
//withdraw funds
//set a minimum funding value in USD
import "./AggregatorV3Interface.sol";
contract FundMe {

uint256 public minimumUds = 50 * 1e18;
uint256 public number;

function fund() public payable{
    //we want to be able to set a minimum fund amount in USD
    //1.How do we send ETH to this contract?
    number = 5;

    // require(msg.value > 1e18, "Didn't send enough"); //1e18 == 1 == 18 == 1000000000000000000
    require(msg.value >= minimumUds, "Didn't send enough"); //1e18 == 1 == 1000000000000000000
    //what is reverting ?
    //undo any action before, and send remaining gas back thats why we put require
    //18decimals
}

  function getPrice() public view returns(uint256){
    //we gonna need the following things
    //ABI of the contract
    //address of the contract -> 0x694AA1769357215DE4FAC081bf1f309aDC325306
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    (, int256 price,,,) = priceFeed.latestRoundData();
    //price of ETH in terms of USD
    //3000.0000000000

    return uint256(price * 1e10); // 1e * 10 = 10000000000

  }

  function getVersion() public view returns(uint256){
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    return priceFeed.version();
  }
  function getConversionRate(uint256 ethAmount) public view returns(uint256){
    uint256 ethPrice = getPrice();
    uint256 ethAmountInUsd = ethPrice * ethAmount / 1e18;
    return ethAmountInUsd;
  }
// function withdraw(){}

}