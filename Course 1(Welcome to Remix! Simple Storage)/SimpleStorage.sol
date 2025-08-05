// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
     //boolean = defines true or false
     //uint = unsigned integer(positive int), for ex if u say uint5 it means it can reach max of 5bytes if u dont specify it automatically goes to 256
     //int = positive or negative whole number
     //address = an address like what we see in our metamask account
     //bytes = deals with computer science 

    // bool hasFavoriteNumber = false;

    uint256 public  FavoriteNumber; // if u dont assign value it initializes it self to zero


    /* People public person = People({favoriteNumber: 2, name: "Ghislain"});
     People public person2 = People({favoriteNumber: 3, name:"Ishimwe"});
     People public person3 = People({favoriteNumber:4, name:"Ineza"}); */ //this we can use instead what we call an array

    // string favoriteNumberInText = "five";
    // int256 favoriteInt = -5;
    // address myAddress = 0x338ADA32b063aF5012Fb6D49bAa95b7806D77A46;
    // bytes32 favoriteBytes = "cat";

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People{
        uint256 favoriteNumber;
        string name;
    }
    
    // uint256[] public favoriteNumbersList;
    People[] public people;
    //0:Ghislain if its index of 1 i get Ishimwe......
    function store(uint256 _favoriteNumber) public{
        FavoriteNumber = _favoriteNumber;
       
    }  
    //this view allows or requires gas as we modify the state of the blockchain
    function retrieve() public view returns(uint256){
        return FavoriteNumber;
    }
    //But this pure method does not require any gas as we modify nothing on the blockchain
    function add() public pure returns(uint256){
        return(1+1);
    }
    /* our contract address
    0xd9145CCE52D386f254917e481eB44e9943F39138 */

    //let's talk about places of storage(calldata, memory, storage )
    function addPerson(string memory _name,uint256 _favoriteNumber) public{
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}