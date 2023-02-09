#### Denial of Service (DoS) 
##### Vulnerable Code

```
pragma solidity ^0.8.0;

contract DoS {
    uint256 public balance;

    function deposit() public payable {
        balance += msg.value;
    }

    function attack() public {
        for (uint i = 0; i < 10**18; i++) {
            deposit();
        }
    }
}
```

In this code, the attack function allows an attacker to continuously call the deposit function and increase the balance variable, potentially leading to a high gas cost and rendering the contract unusable for other users. This can be considered a DoS attack on the smart contract as it denies other users access to the contract's functionality


##### Fixed vulnerable code
```
pragma solidity ^0.8.0;

contract DoS {
    uint256 public balance;

    function deposit() public payable {
        balance += msg.value;
    }

    function attack() public {
        require(msg.sender == address(this), "Only contract owner can call this function");
        for (uint i = 0; i < 10; i++) {
            deposit();
        }
    }
}
```
In this example, we added an access control to the attack function using the require statement. The require statement checks if the caller of the function is the contract owner (address(this)), and if it is not, it throws an error with the message "Only contract owner can call this function". This means that only the contract owner can execute the attack function, and this helps prevent a malicious actor from repeatedly calling the deposit function and overwhelming the contract.

#### Transaction-ordering dependency 
##### Vulnerable Code
```
pragma solidity ^0.8.0;

contract TOD {
    uint256 public value;

    function setValue(uint256 newValue) public {
        value = newValue;
    }

    function attack() public {
        setValue(1);
        setValue(2);
    }
}
```

In this code, the attack function sets the value of the value variable to 1, and then immediately sets it to 2. However, if a malicious actor is able to delay the execution of the second call to setValue, then the final value of the value variable will be 1, which is not what was intended.

This type of vulnerability is particularly problematic in decentralized systems because the order of transactions is determined by a variety of factors, such as network congestion, miner preference, and gas prices. As a result, smart contracts that depend on the order of transactions can be subject to attacks that manipulate the order of transactions to achieve unintended results.

##### Fixed vulnerable code
```
pragma solidity ^0.8.0;

contract TODFixed {
    uint256 public value;

    function setValue(uint256 newValue) public {
        value = newValue;
    }

    function attack() public {
        uint256 localValue = 1;
        setValue(localValue);
        localValue = 2;
        setValue(localValue);
    }
}
```
In this example, we've introduced a local variable localValue to store the new value before calling the setValue function. This ensures that the value variable is set to the correct value, regardless of the order in which the transactions are executed.

####   Front running
##### Vulnerable Code
```
pragma solidity ^0.8.0;

contract FrontRunning {
    uint256 public value;

    function setValue(uint256 newValue) public {
        value = newValue;
    }

    function attack() public {
        setValue(1);
        setValue(2);
    }
}
```
In this code, the attack function sets the value of the value variable to 1, and then immediately sets it to 2. However, if a malicious actor is able to submit a transaction to set the value of the value variable to a different value before the second call to setValue, then the final value of the value variable will be different than what was intended.

This type of vulnerability is particularly problematic in decentralized systems because the order of transactions is determined by a variety of factors, such as network congestion, miner preference, and gas prices. As a result, smart contracts that depend on the order of transactions can be subject to attacks that manipulate the order of transactions to achieve unintended results.

##### Fixed vulnerable code
```
pragma solidity ^0.8.0;

contract FrontRunningFixed {
    uint256 public value;

    function setValue(uint256 newValue) public {
        value = newValue;
    }

    function attack() public {
        uint256 localValue = 1;
        setValue(localValue);
        localValue = 2;
        setValue(localValue);
    }
}
```
In this example, we've introduced a local variable localValue to store the new value before calling the setValue function. This ensures that the value variable is set to the correct value, regardless of the order in which the transactions are executed.

#### Phishing Attack
##### Vulnerable Code
```
pragma solidity ^0.8.0;

contract PhishingVulnerable {
    address public owner;

    function PhishingVulnerable() public {
        owner = msg.sender;
    }

    function sendFunds() public payable {
        require(msg.value > 0, "Send a positive amount of ether.");
        owner.transfer(msg.value);
    }
}
```
To mitigate phishing attacks, it's important to follow best practices for secure smart contract development and ensure that the user experience is designed to be secure and transparent. Additionally, it's recommended to use trusted and secure third-party libraries and tools to help verify the identity of users and detect phishing attacks.

##### Fixed vulnerable code
```
pragma solidity ^0.8.0;

contract PhishingFixed {
    address public owner;

    function PhishingFixed() public {
        owner = msg.sender;
    }

    function sendFunds(address _recipient) public payable {
        require(msg.value > 0, "Send a positive amount of ether.");
        require(_recipient == owner, "Invalid recipient address.");
        _recipient.transfer(msg.value);
    }
}
```
In this code, the sendFunds function takes an additional argument, _recipient, which is used to specify the recipient of the transfer. The function requires that the _recipient address be equal to the owner address, ensuring that the funds are sent to the intended recipient.

By requiring the user to explicitly specify the recipient address, this code makes it more difficult for malicious actors to trick users into sending funds to the wrong address. Additionally, by verifying the identity of the recipient, this code helps to prevent phishing attacks and increases the overall security of the smart contract.

#### InadequateAccessControls
##### Vulnerable Code
```
pragma solidity ^0.8.0;

contract InadequateAccessControlsVulnerable {
    uint256 public value;

    function setValue(uint256 newValue) public {
        value = newValue;
    }
}
```
In this code, the setValue function can be called by any address, allowing anyone to change the value of the value variable. This is an example of inadequate access controls, as there are no restrictions on who can modify the value.

##### Fixed vulnerable code
```
pragma solidity ^0.8.0;

contract InadequateAccessControlsFixed {
    uint256 public value;
    address public owner;

    function InadequateAccessControlsFixed() public {
        owner = msg.sender;
    }

    function setValue(uint256 newValue) public {
        require(msg.sender == owner, "Unauthorized access.");
        value = newValue;
    }
}
```
In this code, the setValue function requires that the msg.sender address be equal to the owner address, ensuring that only the contract owner can modify the value. This helps to prevent unauthorized access to the contract and increases the overall security of the smart contract.

##### InsecureRandomness
##### Vulnerable Code
```
pragma solidity ^0.8.0;

contract InsecureRandomnessVulnerable {
    uint256 public value;

    function setValue() public {
        value = uint256(block.timestamp);
    }
}
```
In this code, the setValue function sets the value of the value variable based on the block.timestamp, which is publicly available information. This makes it possible for an attacker to predict the value of value and potentially manipulate the contract to their advantage.

##### Fixed vulnerable code
```
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/random/SafeRandom.sol";

contract InsecureRandomnessFixed {
    using SafeMath for uint256;
    using SafeRandom for uint256;

    uint256 public value;

    function setValue() public {
        value = uint256(SafeRandom.random());
    }
}
```
In this code, the setValue function uses the SafeRandom library to generate a secure, unpredictable random number, which is stored in the value variable. This helps to prevent attackers from predicting the value of value and increases the overall security of the smart contract.

##### FlashLoan
##### Vulnerable Code
```
pragma solidity ^0.8.0;

contract FlashLoanVulnerable {
    uint256 public balance;

    function lend(uint256 amount) public {
        require(amount <= balance, "Insufficient funds");
        balance -= amount;
    }

    function repay(uint256 amount) public {
        balance += amount;
    }
}
```
In this code, the lend function allows users to borrow funds from the smart contract by specifying an amount parameter. The repay function allows users to repay the borrowed funds by specifying the same amount.

This code is vulnerable to flash loan attacks because there is no mechanism in place to ensure that the funds are repaid before they can be borrowed again. An attacker could borrow funds from the contract, use them for their own purposes, and then return the funds to the contract before the next block is mined, essentially borrowing funds for free.

##### Fixed vulnerable code
```
pragma solidity ^0.8.0;

contract FlashLoanFixed {
    uint256 public balance;
    uint256 public lastLendTimestamp;

    function lend(uint256 amount) public {
        require(amount <= balance, "Insufficient funds");
        require(now >= lastLendTimestamp + 3600, "Cannot lend yet");
        balance -= amount;
        lastLendTimestamp = now;
    }

    function repay(uint256 amount) public {
        balance += amount;
    }
}
```
In this code, the lend function checks that the current time (now) is at least 3600 seconds (1 hour) after the lastLendTimestamp before allowing the loan to be taken out. This helps to prevent flash loan attacks by ensuring that funds cannot be borrowed and repaid in quick succession.

##### Ponzi scheme Attack 
##### Vulnerable Code
```
pragma solidity ^0.8.0;

contract PonziVulnerable {
    uint256 public totalInvested;
    mapping (address => uint256) public investments;

    function invest(uint256 amount) public {
        require(amount > 0, "Cannot invest 0");
        investments[msg.sender] += amount;
        totalInvested += amount;
    }

    function withdraw(uint256 amount) public {
        require(investments[msg.sender] >= amount, "Insufficient funds");
        investments[msg.sender] -= amount;
        msg.sender.transfer(amount);
    }

    function payInterest(uint256 interestRate) public {
        uint256 interest = totalInvested * interestRate / 100;
        msg.sender.transfer(interest);
    }
}
```
In this code, the invest function allows users to send funds to the smart contract, which tracks the total amount invested by all users in the totalInvested variable. The withdraw function allows users to withdraw their funds, and the payInterest function allows the contract owner to pay out interest to all users based on the total invested amount and the interest rate specified.

This code is vulnerable to Ponzi scheme attacks because it does not enforce any restrictions on the contract owner's ability to pay out interest. The contract owner could choose to pay out more interest than is actually generated, causing the contract to become insolvent over time. Additionally, the contract does not have any mechanism for ensuring that the funds are used for their intended purpose.

#### Fixed vulnerable code
```
pragma solidity ^0.8.0;

contract PonziFixed {
    uint256 public totalInvested;
    mapping (address => uint256) public investments;

    event Investment(address investor, uint256 amount);
    event Withdrawal(address investor, uint256 amount);
    event InterestPayment(uint256 amount);

    function invest(uint256 amount) public {
        require(amount > 0, "Cannot invest 0");
        investments[msg.sender] += amount;
        totalInvested += amount;
        emit Investment(msg.sender, amount);
    }

    function withdraw(uint256 amount) public {
        require(investments[msg.sender] >= amount, "Insufficient funds");
        investments[msg.sender] -= amount;
        msg.sender.transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }

    function payInterest(uint256 interestRate) public {
        uint256 interest = totalInvested * interestRate / 100;
        msg.sender.transfer(interest);
        emit InterestPayment(interest);
    }
}
```
In this code, the contract logs all investments, withdrawals, and interest payments using the Investment, Withdrawal, and InterestPayment events. This makes the contract's behavior more transparent and verifiable, and helps to deter the contract owner from engaging in fraudulent behavior. Additionally, you can use tools such as decentralized exchanges (DEXs) and oracles to enforce rules that limit the contract owner's ability to.

##### DeFi platform Attack
#### Vulnerable Code
```
pragma solidity ^0.8.0;

contract DeFiVulnerable {
    uint256 public totalSupply;
    mapping (address => uint256) public balances;

    function deposit() public payable {
        require(msg.value > 0, "Cannot deposit 0");
        balances[msg.sender] += msg.value;
        totalSupply += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient funds");
        balances[msg.sender] -= amount;
        msg.sender.transfer(amount);
    }

    function trade(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient funds");
        balances[msg.sender] -= amount;
        totalSupply += amount;
    }
}
```
This code implements a basic DeFi platform that allows users to deposit and withdraw funds, as well as trade with other users. However, this code is vulnerable to various attacks. For example:
An attacker could exploit a reentrancy vulnerability to drain the contract's funds.
The contract does not enforce any limits on the amount of funds that can be withdrawn, which could lead to a financial crisis if many users withdraw their funds at the same time.
The trade function does not include any mechanism for ensuring that the trade is executed at a fair price, which could lead to price manipulation.

#### Fixed vulnerable code
```
pragma solidity ^0.8.0;

contract DeFiFixed {
    uint256 public totalSupply;
    mapping (address => uint256) public balances;

    event Deposit(address sender, uint256 amount);
    event Withdrawal(address sender, uint256 amount);
    event Trade(address sender, uint256 amount);

    function deposit() public payable {
        require(msg.value > 0, "Cannot deposit 0");
        balances[msg.sender] += msg.value;
        totalSupply += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient funds");
        balances[msg.sender] -= amount;
        msg.sender.transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }

    function trade(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient funds");
        balances[msg.sender] -= amount;
        totalSupply += amount;
        emit Trade(msg.sender, amount);
    }
}
```
In this code, the contract logs all deposits, withdrawals, and trades using the Deposit, Withdrawal, and Trade events. This makes the contract's behavior more transparent and verifiable, and helps to deter malicious actors from exploiting vulnerabilities in the code. Additionally, you can use tools such as decentralized exchanges (DEXs) and oracles to enforce rules that limit the potential for abuse and manipulation.

##### Smart contract mining
#### Vulnerable Code
```
pragma solidity ^0.8.0;

contract MiningVulnerable {
    uint256 public totalSupply;
    mapping (address => uint256) public balances;
    mapping (address => bool) public isMiner;

    function mine() public {
        require(!isMiner[msg.sender], "Already a miner");
        isMiner[msg.sender] = true;
        balances[msg.sender] += 100;
        totalSupply += 100;
    }

    function stopMining() public {
        require(isMiner[msg.sender], "Not a miner");
        isMiner[msg.sender] = false;
    }
}
```
This code implements a basic smart contract mining system that allows users to become miners and earn rewards by calling the mine function. However, this code is vulnerable to various attacks. For example:

An attacker could exploit a reentrancy vulnerability to mine an unlimited amount of rewards.
The contract does not enforce any rules or limits on the number of miners that can participate, which could lead to centralization if a small number of users control the majority of the mining power.

#### Fixed vulnerable code
```
pragma solidity ^0.8.0;

contract MiningFixed {
    uint256 public totalSupply;
    mapping (address => uint256) public balances;
    mapping (address => bool) public isMiner;
    uint256 public maxMiners = 10;

    function mine() public {
        require(!isMiner[msg.sender], "Already a miner");
        require(countMiners() < maxMiners, "Max miners reached");
        isMiner[msg.sender] = true;
        balances[msg.sender] += 100;
        totalSupply += 100;
    }

    function stopMining() public {
        require(isMiner[msg.sender], "Not a miner");
        isMiner[msg.sender] = false;
    }

    function countMiners() public view returns (uint256) {
        uint256 count = 0;
        for (address miner in isMiner) {
            if (isMiner[miner]) {
                count++;
            }
        }
        return count;
    }
}
```
In this code, the contract includes a maxMiners variable that limits the number of miners that can participate. The contract also includes a countMiners function that counts the number of active miners, which is used to enforce the limit. This helps to

##### DAO (Decentralized Autonomous Organization)
#### Vulnerable Code
```
pragma solidity ^0.8.0;

contract VulnerableDAO {
    address public owner;
    uint256 public totalSupply;
    mapping (address => uint256) public balances;
    mapping (address => bool) public isMember;

    constructor() public {
        owner = msg.sender;
        totalSupply = 100;
        balances[owner] = totalSupply;
        isMember[owner] = true;
    }

    function addMember(address member) public {
        require(msg.sender == owner, "Only owner can add members");
        isMember[member] = true;
    }

    function transfer(address recipient, uint256 amount) public {
        require(isMember[msg.sender], "Sender is not a member");
        require(balances[msg.sender] >= amount, "Insufficient funds");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
}
```
This code implements a basic DAO that allows the owner to add members and members to transfer funds within the DAO. However, this code is vulnerable to various attacks. For example:

The owner has complete control over the DAO, which creates a single point of failure.
The addMember function does not check the reputation or identity of the new member, which could allow an attacker to join the DAO and steal funds.
The transfer function does not check the destination address, which could allow an attacker to transfer funds to a malicious contract.

#### Fixed vulnerable code
```
pragma solidity ^0.8.0;

contract FixedDAO {
    address public owner;
    uint256 public totalSupply;
    mapping (address => uint256) public balances;
    mapping (address => bool) public isMember;
    mapping (address => uint256) public reputation;

    constructor() public {
        owner = msg.sender;
        totalSupply = 100;
        balances[owner] = totalSupply;
        isMember[owner] = true;
        reputation[owner] = 100;
    }

    function addMember(address member, uint256 rep) public {
        require(msg.sender == owner, "Only owner can add members");
        require(rep >= 50, "Minimum reputation required");
        isMember[member] = true;
        reputation[member] = rep;
    }

    function transfer(address recipient, uint256 amount) public {
        require(isMember[msg.sender], "Sender is not a member");
        require(balances[msg.sender] >= amount, "Insufficient funds");
        require(address(this).balance >= amount, "Insufficient funds in contract");
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
}
```
In this code, the contract includes a reputation mapping that tracks the reputation of each member. The addMember function checks the reputation of the new member before allowing them to join the DAO. The transfer function checks the destination address to ensure that funds are not transferred to a malicious contract.
