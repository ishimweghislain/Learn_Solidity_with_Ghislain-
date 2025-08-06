//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./AggregatorV3Interface.sol";
library PriceConverter {

    function getPrice() internal view returns(uint256){
    //we gonna need the following things
    //ABI of the contract
    //address of the contract -> 0x694AA1769357215DE4FAC081bf1f309aDC325306
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    (, int256 price,,,) = priceFeed.latestRoundData();
    //price of ETH in terms of USD
    //3000.0000000000

    return uint256(price * 1e10); // 1e * 10 = 10000000000

  }

  function getVersion() internal view returns(uint256){
    AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    return priceFeed.version();
  }
  function getConversionRate(uint256 ethAmount) internal view returns(uint256){
    uint256 ethPrice = getPrice();
    uint256 ethAmountInUsd = ethPrice * ethAmount / 1e18;
    return ethAmountInUsd;
  }
}