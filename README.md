# Decentralized Token Exchange Smart Contract

## Project Description

This repository houses the source code for a decentralized token exchange platform built on the Ethereum blockchain. The platform allows users to securely trade ERC20 tokens directly without relying on centralized intermediaries. Leveraging smart contracts, the exchange ensures trustless and transparent transactions, providing users with greater control over their assets.

## Features

1. Trustless Trading: Users can exchange ERC20 tokens directly on the Ethereum blockchain without the need for intermediaries, enhancing security and eliminating counterparty risk.
2. Efficient Exchange Mechanism: The smart contract-based exchange mechanism ensures efficient and transparent token swaps, facilitating seamless transactions.
3. Direct Wallet Swap: Traders can execute token swaps directly from their Ethereum wallets, simplifying the trading process and enhancing user experience.
4. Secure Transactions: All transactions on the exchange are conducted securely on the blockchain, providing users with confidence in the integrity of their trades.

## Installation

Follow these steps to set up and deploy the decentralized token exchange smart contract:

1.  Clone the Repository:

```bash
git clone https://github.com/mishraji874 Decentralized-Token-Exchange-Smart-Contract.git
```

2. Navigate to the Project Directory:

```bash
cd decentralized-exchange
```

### Foundry Commands:

Here are the Foundry commands for compiling, deploying, interacting with, and testing the smart contracts:

1. Initialize Foundry:

```bash
forge init
```

2. Install dependenices:

```bash
forge install
```

3. Compile smart contracts:

```bash
forge compile
```

4. Test Contracts:

```bash
forge test
```

5. Make the ```.env``` file and add your SEPOLIA_RPC_URL, PRIVATE_KEY and your ETHERSCAN_API_KEY for verification of the deployed contract.

6. Deploy Smart Contract:

    If deploying to the test network run the following command:
    ```bash
    forge script script/DeployScript.s.sol
    ```

    If deploying to the Sepolia test network run the following command:
    ```bash
    forge script script/DeployScript.s.sol --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY}
    ```

    And, for verification from the Etherscan about the deployed contract run the following command:
    ```bash
    forge script script/DeployScript.s.sol --rpc-url ${SEPOLIA_RPC_URL} --private-key ${PRIVATE_KEY} --verify ${ETHERSCAN_API_KEY}
    ```

## License:

This project is licensed under the MIT License.