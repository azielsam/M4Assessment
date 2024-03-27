// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts@4.9/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    struct Item {
        string name;
        uint256 price;
    }

    mapping(string => Item) private _items;

    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed burner, uint256 amount);
    event Buy(address indexed buyer, string item, uint256 price);

    constructor() ERC20("Degen", "DGN") {
        _items["Dog"] = Item("Dog", 20);
        _items["Cat"] = Item("Cat", 150);
        _items["Fish"] = Item("Fish", 250);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        emit Mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
        emit Burn(msg.sender, amount);
    }

    function transfer(address to, uint256 value) public override returns (bool) {
        return super.transfer(to, value);
    }

    function buy(string memory itemName) public {
        Item memory item = _items[itemName];
        require(bytes(item.name).length > 0, "Item not found");
        require(balanceOf(msg.sender) >= item.price, "Insufficient balance"); 

        if (keccak256(abi.encodePacked(itemName)) == keccak256(abi.encodePacked("Dog"))) {
            burn(item.price);
        } else if (keccak256(abi.encodePacked(itemName)) == keccak256(abi.encodePacked("Cat"))) {
            burn(item.price);
        } else if (keccak256(abi.encodePacked(itemName)) == keccak256(abi.encodePacked("Fish"))) {
            burn(item.price);
        } else {
            revert("Invalid item");
        }

        emit Buy(msg.sender, itemName, item.price);
    }
}
