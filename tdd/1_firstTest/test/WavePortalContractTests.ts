const { expect } = require("chai");
const { ethers } = require("hardhat")

describe("WavePortal", function() {
    it("gets the WavePortalContract", async function () {
        const contract = await ethers.getContractFactory("WavePortal");
    })

    it("provides default totalwaves from a new contract", async function () {
        const contract = await ethers.getContractFactory("WavePortal");
        const wavePortal = await contract.deploy();

        expect(await wavePortal.totalWaves()).to.equal(0);
    });

    it("we can increase the wave by one", async function(){
        const contract = await ethers.getContractFactory("WavePortal");
        const wavePortal = await contract.deploy();
        
        await wavePortal.wave();

        expect(await wavePortal.totalWaves()).to.equal(1);
    });
});

    