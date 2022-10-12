const hre = require("hardhat");


async function main() { 
  const USDT = await hre.ethers.getContractFactory("USDT");
  const usdt = await USDT.deploy();

  await usdt.deployed();

  console.log(
    `deploy usdt contract successfuly`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
