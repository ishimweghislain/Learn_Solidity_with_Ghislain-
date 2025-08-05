// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";


contract StorageFactory{

 SimpleStorage[] public simpleStorageArray;
  
 function createSimpleStorageContract() public {
    SimpleStorage simpleStorage = new SimpleStorage();
    simpleStorageArray.push(simpleStorage);
 }

 function sfstore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
    //For u to interact with any other contract you will need these things:
    //address of the contract
    //ABI, Application binary interface
    
    return simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
  
 }

 function sfget(uint256 _simpleStorageIndex) public view returns(uint256){
    return simpleStorageArray[_simpleStorageIndex].retrieve();
}

}