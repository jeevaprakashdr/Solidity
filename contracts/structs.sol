// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Stcucts {
    
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public cardsByOwner;

    function example() external {
        Car memory toyota = Car("toyota", 1990, msg.sender);
        Car memory lambo= Car({ model: "lambo", year:1990, owner:msg.sender});

        Car memory tesla; // default value initialised;
        tesla.model = "tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car("Merc", 2010, msg.sender));

        Car memory _car = cars[1];
        _car.model;
        _car.year;
        _car.owner;

        Car storage _carToUpdate = cars[1]; 
        _carToUpdate.year = 1999; // updates the value for the car in state variable
        delete _carToUpdate.owner; // reset the value 

        delete cars[2]; 
    }
          
}