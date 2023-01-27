### Smart contract Vulnerabilities  on the Ethereum Blockchain

|  S.NO | Vulnerabilities  |  Discrption   |  Effected Attack|
|:-------:|---------|------------|------------|
1|Reentrancy| Reentrant function calls make a contract to behave in an unexpected way.Calling external contracts gives them control over execution.|DAO|
2|Access Control| Failure to use function modifiers.|BatchOverflow|
3|Arithmetic| Integer over/underflows.|Bignumber Attack|
4|Unchecked Low Level Calls| call(), callcode(), delegatecall() or send() fails and it is not checked.|Reentrancy Attack|
5|Denial of Service|The contract is overwhelmed with time-consuming computations.Attacker stalls contract execution by failing in strategic way.|Parity Wallet Library Self-destruct|
6|Bad Randomness|Malicious miner biases the outcome.which can be manipulated by users.|Ethereum Lottery Hack|
7|Front Running|Two dependent transactions that invoke the same contract are included in one block.|Bancor Hack.|
8|Time Manipulation| The timestamp of the block is manipulated by the miner.|Veritaseum Hack|
9|Short Addresses|EVM itself accepts incorrectly padded arguments.|Spoofed Contract Attack.|
10|Mishandled Exceptions|This makes the contracts vulnerable to attacks because programmers will be unaware of any ether that is lost if these exceptions are not handled properly and the transactions are reverted.|DAO Hack|
11|tx. origin| tx. origin is a global variable in Solidity which returns the address of the account that sent the transaction. Using the variable for authorization could make a contract vulnerable if an authorized account calls into a malicious contract.|Fake ERC20 Token Attack.|
12|Forced Ether Reception|Contracts can be forced to receive Ether.|Forced Send Attack|
13|Incorrect Interface|Implementation uses different function signatures than interface.|Parity Wallet Hack|
14|Integer Overflow| Arithmetic in Solidity (or EVM) is not safe by default.|DAO Attack|
15|Race Condition|Transactions can be frontrun on the blockchain.|BatchOverflow Attack|
16|Unchecked External Call|Some Solidity operations silently fail.|Parity Wallet Attack|
17|Unprotected Function| Failure to use function modifier allows attacker to manipulate contract.|DAO Attack|
18|Variable Shadowing|Local variable name is identical to one in outer scope.|King of the Ether Throne|
19|Wrong Constructor Name|Anyone can become owner of contract due to missing constructor.|Parity Wallet Hack|
20|Irrelevant Code|The program contains code that is not essential for execution, makes no state changes and has no side effects that alter data or control flow, such that removal of the code would have no impact to functionality or correctness.|PonyDirect Hack|

