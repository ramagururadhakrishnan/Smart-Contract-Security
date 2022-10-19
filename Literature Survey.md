# Runtime Verification and Vulnerability Testing of Smart Contracts Literature Survey
### ABSTRACT
In this paper mainly two core areas where focused.One involves the runtime verification of ERC20 tokens using K framework and the other involves the comparison of 
tools available for detecting the vulnerabilities in smart contract.
The six core functions of ERC20, namely allowance(),approve(), total-supply(), balanceof(), transferfrom() and transfer() were considered for runtime verification.
Five tools were  taken for the comparison in this paper, namely Oyente, Securify, Remix, Smartcheck and Mythril were tested against 15 different vulnerabilities.
Out of the 5 tools Smartcheck was found to detect the highest number of vulnerabilities.
### INTRODUCTION
Ethereum is one among the best blockchain platform which enables decentralized applications
Smart contracts are the decentralized applications that are designed to run on Ethereum using Ethereum Virtual Machine (EVM). 
Once a smart contract is deployed in the blockchain, it cannot be modified or updated.
In this paper it focus on using runtime verification to verify smart contract functionality against ERC20 standard.
This is done by taking ERC20 standard rules written in K language and the EVM semantics (KEVM). It works by symbolically executing the bytecode ofthe contract 
in the KEVM and identifying its compliance with ERC20 standard using the K framework.
### Smart Contract
The smart contract code is arranged in a low-level stack-based bytecode.
The contract is vulnerable everyone in the network can see and understand the vulnerability and can exploit it easily.
If the tokens doesn’t match with the ERC20 standard it will not be possible to use the ERC20 compliant wallets like metamask.
### K Framework
Symbolically executed according to semantics of the language written in K framework.The execution of language in K framework will take two inputs. 
### Three main functons :
The configuration part contain the initial values of parameters to be used while writing the semantics.
In computations part, we will define the computations that are to be performed to the parameters declared in configuration part.  
The rule contains the conditions that should be satisfied while executing the program. 
### Formal verification of Smart Contract
Formal verification of smart contracts is converting the solidity code and bytecode into solidity* and bytecode* which can be used to verify thesmart contract properties.
The main focus was on the  properties of trace vulnerabilities such as finding contracts that sends ether to arbitrary users, locks funds indefinitely and the contracts 
that are vulnerable to suicidal attack. A tool is created to detect the above mentioned trace vulnerabilities and named it as MAIAN.
### Security Vulnerabilities
In security issues, they identified the bugs and vulnerabilities where as in privacy they identified the issues like data exposure to unauthorized people.
In coding issues they found out flaws in smart contract code and methods to improve them. 
In performance deals with the capacity of blockchain code
Ethereum community found Oyente as the first investigation tool in terms of security and uses symbolic execution to identify the security vulnerabilities.
### Runtime Verification of Smart Contracts:
Three main inputs to K are contract specification, ERC20 contract bytecode and a trustedinput to execute the bytecode.
Contract specification states what the contract “should do” in K language.
The contract bytecode is the low level code of the smart contract.
### Vulnerability Testing
In this paper 15 different vulnerability, namely timestamp dependence, use of untrusted input, transaction-ordering dependence, reentrancy, insecure coding patterns, 
unexpected ether flows, mishandled exceptions, tx.origin usage, blockhash usage, gas costly patterns, DoS by external contract, unchecked external call, locked
money, unprotected functions and integer overflow/underflow.
### Conclusion
This paper research showed Smart check as one of the best vulnerability testing tool which can detect seven vulnerabilities. 
