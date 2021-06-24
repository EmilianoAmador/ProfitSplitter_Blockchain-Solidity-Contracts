# Profit Splitter with Solidity Contracts
[![](Images/intro.jpg "Solidity Code")](https://github.com/EmilianoAmador/ProfitSplitter_Blockchain-Solidity-Contracts/tree/master/Contracts)

This repository contains three solidity contracts. Each contract splits a company's earnings differently. The first contract, Associate Profit Splitter, splits profits evenly among associate-level employees. Every employee receives the same amount.

The second contract, Tiered Profit Splitter, distributes profits among different employee tiers. For example, the CEO gets 60%, CTO 25%, and the remaining 15% goes to lower-tier employees. 

The third contract is the deferred equity plan. This contract allows for the shares of a company to be distributed evenly throughout a period. For example: if a company requires 1000 shares dispersed over a vesting period of 4 years, this contract will credit quarter amounts to an employee after each year he remains with the company. Let's take a closer look at each smart contract's functionality.

[Click here for Smart Contracts' solidity code](https://github.com/EmilianoAmador/ProfitSplitter_Blockchain-Solidity-Contracts/tree/master/Contracts)

## Preliminary Steps For Deploying The Contracts
First, open the Remix web page [![](Images/remix.png)](https://remix.ethereum.org "Remix Webpage") and link it to the Metamask chrome plugin [![](Images/metamask.png)](https://metamask.io/ "Metamask Plugin"). On the Metamask plugin window, choose the network to be used to send transactions. Considering this is a testing demonstration of the contract's functionalities, Ganache [![](Images/ganache.png)](https://www.trufflesuite.com/ganache "Ganache Trufflesuite") was used to set up a test network on a local machine; therefore, Metamask's network was set to localhost 8545 as seen on the image below.

Lastly, set the account on the Metamask where funds will be transferring from. In the example below, the account is shown as account 4. It will be different depending on the number of wallets the user has saved on their Metamask account.


![](Images/metamask-preline.png)

---

## Smart Contract 1: [Associate Profit Splitter](Contracts/AssociateProfitSplitter.sol "Click For Solidity Code")
This smart contract was created to divide funds evenly among three associate-level employees. Follow the instructions below to deploy the contract and use its feature.

Once Metamask and Solidity are connected to the local network, import the AssociateProfitSplitter.sol contract to Remix. Compile it, and then navigate to the "Deploy & Run Transactions" icon located on the left-hand side of the page. Set the dropdowns like the ones shown below. In the deploy section, fill in the three addresses of three employees that will receive an evenly distributed amount from a total amount set by the Human Resources department. Click transact, and find that the contracts will deploy successfully. Be advised that every contract deployment charges a gas fee of .002 ETH. This amount is equivalent to $3.00 (calculated using 1 ETH equal to $1,500). 
![](Images/remix-tps.png)

Once deployed, fill in the value to be distributed and click deposit. In this test run, 15 ETH were deposited; therefore, each employee should receive 5 ETH each.
![](Images/accprofitsplitter.png)

Note that the first account was deducted 15.002 ETH due to the gas spent when deploying the contract. The rest of the recipient employee accounts indeed received 5 ETH each as shown below.
![](Images/accprofitsplitter_ganache.png)

Lastly, the balance button should always equal zero. This is due to the contract's code ensuring that all the funds get sent out. This button is necessary to verify that there aren't any ETH held in the solidity contract. 

## Smart Contract 2: [Tiered Profit Splitter](Contracts/TieredProfitSplitter.sol "Click For Solidity Code")

Unlike contract 1, this contract divides funds into three different portions varying by percentage. This feature allows payout distribution among employees working within multiple departments or tiers. For example, the CEO will receive %60 of the funds, the CTO will receive %25, and a lower-tier associate will receive 15%.
![](Images/tieprofitsplitter.png)

For this test run, the contract was deployed the same way as the example above. Here, the amount distributed was set to 30 ETH; therefore, the CEO received 18 ETH, the CTO 7.50 ETH, and the lower level associate 4.50 ETH as seen in the image below.
![](Images/tieprofitsplitter_ganache.png)

## Smart Contract 3: [Deferred Equity Plan](Contracts/DeferredEquityPlan.sol "Click For Solidity Code")

This smart contract splits funds evenly and distributes them every year. In the example below, 1000 ETH was divided over a vesting period of 4 years. The employee will receive 250 ETH every year completed with the company until they reach the end of the vesting period.
![](Images/deferredeqplan.png)


