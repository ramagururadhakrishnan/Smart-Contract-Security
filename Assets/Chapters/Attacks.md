#### Types of Attacks 
### Reentrancy attacks
These attacks exploit the ability of a contract to call external contracts, allowing an attacker to repeatedly call a function in the target contract and extract value.

### Denial of Service (DoS) attacks
These attacks aim to overload a contract with a large number of transactions or function calls, making it unavailable to legitimate users.

### Integer overflow/underflow
These attacks exploit the fact that integers in smart contracts can only represent a limited range of values, allowing an attacker to cause unexpected behavior by causing an integer to overflow or underflow.

### Transaction-ordering dependency
These attacks allow an attacker to change the order of transactions in a block and cause unexpected behavior.

### Front running
These attacks exploit the fact that smart contracts execute on a public blockchain, allowing an attacker to observe and act on the same information as other users, such as observing a pending transaction and executing a conflicting transaction before it can be processed.

### Phishing
These attacks attempt to trick users into sending funds to a malicious contract by disguising it as a legitimate contract.

### Inadequate access controls
These attacks exploit weak or missing access controls in contracts, allowing an attacker to execute privileged functions or steal assets.

### Insecure randomness
These attacks exploit the use of predictable or biased randomness in contracts, allowing an attacker to predict or manipulate the outcome of certain functions.

#### List of Real-Time Smart Contract Attacks
### Flash loan attacks: 
These attacks use a flash loan, a short-term, high-value loan that can be obtained quickly and without collateral, to exploit a vulnerability in a smart contract and extract value.

### Ponzi scheme attacks: 
These attacks use smart contracts to set up fraudulent investment schemes, in which early investors are paid returns with the funds of later investors.

### DeFi platform attacks: 
These attacks target decentralized finance (DeFi) platforms, which use smart contracts to facilitate lending, borrowing, and trading of digital assets. Attackers have been known to exploit vulnerabilities in these platforms to steal funds or manipulate prices.

### Oracle attacks: 
These attacks exploit the use of external data feeds, called oracles, in smart contracts to insert false information and cause the contract to execute in an unintended manner.

### Smart contract mining: 
These attacks use malicious smart contracts to overload the network, making it difficult for legitimate contracts to be processed.
### DAO (Decentralized Autonomous Organization) attack :
Is a well-known incident that occurred in 2016, where an attacker exploited a vulnerability in the smart contract of the DAO, a decentralized investment platform built on the Ethereum blockchain. The attacker was able to drain approximately 3.6 million Ether (worth millions of dollars at the time) from the DAO's funds by repeatedly calling the "split" function of the contract, which allowed him to extract more funds than he had invested.The attack highlighted the importance of proper testing and auditing of smart contract code, as the vulnerability in the DAO's contract had been identified by several researchers prior to the attack. The incident also had significant ramifications for the Ethereum community, as it led to a hard fork of the blockchain to return the stolen funds to their original owners.The DAO attack was one of the first major security incidents involving smart contracts, and it served as a wake-up call for the community about the need for robust security measures in decentralized systems. It also led to the development of security best practices and guidelines for smart contract development, such as OWASP, and the rise of smart contract audit firms.













