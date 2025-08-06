# 🧠 Understanding ETH Transactions, Chainlink, and Common Solidity Errors

This article dives into key concepts when working with ETH in Solidity, Chainlink oracles, price feeds, and common development issues like gas estimation failures and USD to ETH conversions.

---

## 💸 Sending ETH Through Functions

To send ETH with a transaction, your function must be marked `payable`. This allows the function to receive `msg.value`, the amount of ETH (in wei) sent with the transaction.

### ✅ Example:
```solidity
function fund() public payable {
    require(msg.value > 0, "You need to send ETH");
}
