const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("WavePortal", function() {
    it("gets the WavePortalContract", async function () {
        await ethers.getContractFactory("WavePortal");
    })

    it("provides default totalwaves from a new contract", async function () {
        // Arrange
        const contract = await ethers.getContractFactory("WavePortal");
        const wavePortal = await contract.deploy();

        // Assert
        expect(await wavePortal.totalWaves()).to.equal(0);
    });

    it("we can increase the wave by one", async function(){
        // Arrange
        const contract = await ethers.getContractFactory("WavePortal");
        const wavePortal = await contract.deploy();
        
        // Act
        await wavePortal.wave("Hello");

        // Assert
        expect(await wavePortal.totalWaves()).to.equal(1);
    });

    it("stores list of waves with message", async function() {
        // Arrange
        const contract = await ethers.getContractFactory("WavePortal");
        const wavePortal = await contract.deploy();
        const message = "first attempt for hardhat smart contract tests";

        // Act
        await wavePortal.wave(message);
        let [firstWave] = await wavePortal.allWaves();

        // Assert
        expect(await wavePortal.totalWaves()).to.equal(1);
        expect(firstWave.message).to.equal(message);
    });

    it("each wave has address of the author", async function(){
        // Arrange
        const [owner, randomPerson] = await ethers.getSigners();
        const contract = await ethers.getContractFactory("WavePortal");
        const wavePortal = await contract.deploy();
        const ownerMessage = "owner wave hello";
        const randomPersonMessage = "randome person wave hello";

        // Act
        await wavePortal.wave(ownerMessage);
        await wavePortal.connect(randomPerson).wave(randomPersonMessage);
        let [firstWave, secondWave] = await wavePortal.allWaves();

        // Assert
        expect(firstWave.owner).to.equal(owner.address);
        expect(secondWave.owner).to.equal(randomPerson.address);
    });
});

    