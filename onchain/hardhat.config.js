require("@nomicfoundation/hardhat-toolbox");

const deployer = {
  mnemonic: process.env.MNEMONIC || "test test test test test test test test test test test junk"
};
// const deployer = [""];

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.23",
  networks: {
    // for testnet
    "base-goerli": {
      url: "https://goerli.base.org",
      accounts: deployer,
      chainId: 84531,
      gasMultiplier: 1.1
    },
    "base-sepolia": {
      url: "https://sepolia.base.org",
      accounts: deployer,
      chainId: 84532,
      gasMultiplier: 1.1
    },
    base: {
      url: "https://mainnet.base.org/",
      accounts: deployer,
      chainId: 8453,
      gasMultiplier: 1.1
    }
  },
  gasReporter: {
    currency: "ETH"
  },
  etherscan: {
    apiKey: {
      base: process.env.BASE_API_KEY || ""
    },
    customChains: [
      {
        network: "base",
        chainId: 8453,
        urls: {
          apiURL: "https://api.basescan.org/api",
          browserURL: "https://basescan.org"
        }
      }
    ]
  }
};
