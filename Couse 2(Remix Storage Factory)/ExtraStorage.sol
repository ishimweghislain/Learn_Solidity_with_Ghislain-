//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
//this contract is going to inherit all the functionalities of the SimpleStorageContract file
import "./SimpleStorage.sol";
contract ExtraStorage is SimpleStorage {
// + 5 anything is given from the SimpleStorage
//we will use "override"
//2 keywords:
//virtual and // override

function store(uint256 _favoriteNumber) public override{
    FavoriteNumber = _favoriteNumber + 5;
}

}