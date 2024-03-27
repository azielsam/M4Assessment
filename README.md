
# DegenToken

DegenToken is an ERC20 token smart contract written in Solidity. It allows for the creation of a custom ERC20 token named "Degen" with the symbol "DGN". The contract includes functionalities for minting, burning, transferring tokens, and buying items using the token.

## Features

- ERC20 Standard: Implements the ERC20 token standard, allowing for compatibility with other ERC20-based platforms and wallets.
- Minting: Allows the contract owner to mint new tokens and distribute them to specific addresses.
- Burning: Allows token holders to burn their own tokens, reducing the total supply.
- Item Purchase: Allows token holders to purchase items using their tokens, with each item having a specific price in tokens.

## Usage

1. **Minting Tokens**: The contract owner can mint new tokens using the `mint` function. This function requires the address to mint tokens to and the amount of tokens to mint.

2. **Burning Tokens**: Token holders can burn their own tokens using the `burn` function. This function requires the amount of tokens to burn.

3. **Transferring Tokens**: Token holders can transfer tokens to other addresses using the standard ERC20 `transfer` function.

4. **Buying Items**: Token holders can buy items using their tokens by calling the `buy` function with the name of the item as a parameter. Each item has a specific price in tokens, and the function deducts the required tokens from the buyer's balance and emits a `Buy` event.

