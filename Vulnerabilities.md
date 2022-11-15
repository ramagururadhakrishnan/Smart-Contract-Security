### Smart contract Vulnerabilities  on the Ethereum Blockchain

|  S.NO |  Security tool   |  Method   |  
|:-------:|---------|------------|
1|Reentrancy| Reentrant function calls make a contract to behave in an unexpected way.Calling external contracts gives them control over execution.|
2|Access Control| Failure to use function modifiers.|
3|Arithmetic| Integer over/underflows.|
4|Unchecked Low Level Calls| call(), callcode(), delegatecall() or send() fails and it is not checked.|
5|Denial of Service|The contract is overwhelmed with time-consuming computations.Attacker stalls contract execution by failing in strategic way.|
6|Bad Randomness|Malicious miner biases the outcome.which can be manipulated by users.|
7|Front Running|Two dependent transactions that invoke the same contract are included in one block.|
8|Time Manipulation| The timestamp of the block is manipulated by the miner.|
9|Short Addresses|EVM itself accepts incorrectly padded arguments.|
10|Mishandled Exceptions|This makes the contracts vulnerable to attacks because programmers will be unaware of any ether that is lost if these exceptions are not handled properly and the transactions are reverted.|
11|tx. origin| tx. origin is a global variable in Solidity which returns the address of the account that sent the transaction. Using the variable for authorization could make a contract vulnerable if an authorized account calls into a malicious contract.|
12|Forced Ether Reception|Contracts can be forced to receive Ether.|
13|Incorrect Interface|Implementation uses different function signatures than interface.|
14|Integer Overflow| Arithmetic in Solidity (or EVM) is not safe by default.|
15|Race Condition|Transactions can be frontrun on the blockchain.|
16|Unchecked External Call|Some Solidity operations silently fail.|
17|Unprotected Function| Failure to use function modifier allows attacker to manipulate contract.|
18|Variable Shadowing|Local variable name is identical to one in outer scope.|
19|Wrong Constructor Name|Anyone can become owner of contract due to missing constructor.|
20|Irrelevant Code|The program contains code that is not essential for execution, makes no state changes and has no side effects that alter data or control flow, such that removal of the code would have no impact to functionality or correctness.|

