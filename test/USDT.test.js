const { expect } = require("chai");
const { ethers, artifacts } = require("hardhat");
const hre = require("hardhat");

describe("Test USDT Token", function () {
  let usdtContractAddress;

  const usdtABI = artifacts.contracts.USDT.sol.USDT.abi;

  beforeEach(async function () {
    const USDT = await hre.ethers.getContractFactory("USDT");
    const usdt = await USDT.deploy();
    console.log(usdt.address);
    usdtContractAddress = usdt.address;
  });

  it("should deploy USDT contract successfuly", async function () {
    const [user1, user2] = await ethers.getSigners();
    console.log(user1.address);
    console.log(user2.address);

    const usdt = new ethers.Contract(usdtContractAddress, usdtABI);

    const ownerBalance = await usdt.balanceOf(user1.address);
    console.log(ownerBalance);

    const owner2Balance = await usdt.balanceOf(user2.address);
    console.log(owner2Balance);

    console.log(usdtContractAddress);
  });
});
