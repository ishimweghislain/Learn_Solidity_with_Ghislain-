//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
//our contract will do the following
//get funds from users
//withdraw funds
//set a minimum funding value in USD
import "./PriceConverter.sol";

contract FundMe {
using PriceConverter for uint256;

uint256 public minimumUsd = 50 * 1e18;

address[] public funders; 
mapping(address => uint256) public addressToAmountFunded;

address public owner; 
constructor(){
    owner = msg.sender;
}

function fund() public payable{

    require(msg.value.getConversionRate() >=  minimumUsd, "Didn't send enough funds");  
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = msg.value;
}

  
function withdraw() public onlyOwner{
   
    for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
        address funder = funders[funderIndex];
        addressToAmountFunded[funder] = 0;
    }

    //reset the array
    funders = new address[](0);
    // //withdraw the funds
    // //there are 3 ways to withdraw the funds

    // //transfer : its the simplest and make sense
    // payable(msg.sender).transfer(address(this).balance);

    // //send(it won't revert the transacation when it fails un;ess u add that 2nd line t return a bool)
    // bool sendSuccess = payable(msg.sender).send(address(this).balance);
    // require(sendSuccess, "Send Failed");

    //call
    (bool callSuccess, ) =payable(msg.sender).call{value: address(this).balance}("");
    require(callSuccess, "Call failed");

}

modifier onlyOwner{
     require(msg.sender == owner, "Sender is not owner");
     _;
}
}