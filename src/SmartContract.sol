// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SmartContract {
    
    //Public
    
    uint256 public halfAnswerOfLife = 21;
    address public myEthereumContractAddress = address(this);
    address public myEthereumAddress = msg.sender;
    string public PoCIsWhat = "PoC is good, PoC is life.";
    
    //Internal
    
    bool internal _areYouABadPerson = false;
    
    //Private 
    
    int256 private _youAreACheater = -42;

    bytes32 _whoIsTheBest = 0x626c756500000000000000000000000000000000000000000000000000000000;
    mapping(string => uint256) public myGrades;
    string[5] public myPhoneNumber;
    enum roleEnum { STUDENT, TEACHER }

    struct informations {
        string firstName;
        string lastName;
        uint8 age;
        string city;
        roleEnum role;
    }

    informations public myinformations = informations({
        firstName: "Ethan",
        lastName: "Vuillard",
        age: 19,
        city: "Clamart",
        role: roleEnum.STUDENT
    });
}