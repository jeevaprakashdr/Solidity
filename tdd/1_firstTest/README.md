# First Hardhat Project

This project demonstrates a simple TDD exercise for Solidity  smart contracts using Hardhat.

The project mainly follows the steps from the following blog
[How to apply TDD when writing an Ethereum smart contract with Solidity](https://medium.com/@fabientownsend/how-to-apply-tdd-when-writing-an-ethereum-smart-contract-with-solidity-1e4b227a84aa)


## Steps to begin 

* Open a new directory in vscode
* Initialize the npm package by running the command `npm init -y`
* Install hardhat `npm install --save-dev hardhat`
* Run `npx hardhat`. This displays the few options 
* In this instance choose `Create a TypeScript project` option.
* Run `npm install --save-dev ts-node typescript` 
* Compile the project `npx hardhat compile`
* Run unit tests `npx hardhat test`
* To debug unit test, place a breakpoint in the test and run the following command in **Javascript Debug Terminal**, `npx hardhat test [testfolder]\[testfilename].ts` 
