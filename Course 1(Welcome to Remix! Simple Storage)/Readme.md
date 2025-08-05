# SimpleStorage Smart Contract

This is a basic smart contract written in Solidity to demonstrate how to store and retrieve data on the Ethereum blockchain using variables, structs, arrays, mappings, and functions.

## 📚 What I Learned

### 🔧 Solidity Basics
- **Data Types Used:**
  - `bool`: Boolean (true or false).
  - `uint256`: Unsigned integer (non-negative). Defaults to 0 if not initialized.
  - `int256`: Signed integer (can be positive or negative).
  - `string`: Used to store text.
  - `address`: Ethereum wallet address (e.g., MetaMask address).
  - `bytes`: For low-level data handling (e.g., `bytes32`).

- **Structs:**
  - Created a custom structure `People` to store a person's name and their favorite number.

- **Arrays:**
  - Used a dynamic array `people[]` to store a list of `People`.

- **Mappings:**
  - Used a mapping `nameToFavoriteNumber` to quickly look up someone’s favorite number by name.

### 🧠 Storage Locations
- `calldata`: Temporary, non-modifiable data passed to functions (mostly used for function inputs).
- `memory`: Temporary, modifiable data.
- `storage`: Permanent data stored on the blockchain.

### ⚙️ Functions
- `store(uint256)`: Stores a new favorite number. Costs gas as it modifies blockchain state.
- `retrieve()`: View function to get the current favorite number. Does not modify state.
- `add()`: Pure function that simply returns 1+1. Doesn’t read or modify any blockchain state.
- `addPerson(string, uint256)`: Adds a person to the array and updates the mapping.

### 🏗️ Deployment
- Learned how to deploy the smart contract to the blockchain using tools like Remix IDE.
- After deployment, you can interact with it:
  - Set or update the favorite number.
  - Add a person and link their name with a favorite number.
  - Retrieve data from storage using public getter functions.

### 🧪 Sample Contract Address
```solidity
0xd9145CCE52D386f254917e481eB44e9943F39138

store(10);
retrieve(); // returns 10
add(); // returns 2
addPerson("Ghislain", 7);
nameToFavoriteNumber["Ghislain"]; // returns 7




