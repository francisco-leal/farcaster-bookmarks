//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity ^0.8.0;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";


// This is the main building block for smart contracts.
contract Book is ERC20 {
    // The fixed amount of tokens, stored in an unsigned integer type variable.
    address public owner;

    /**
     * Contract initialization.
     */
    constructor(uint256 initialSupply) ERC20("Bookmark", "BOOK"){
        // The totalSupply is assigned to the transaction sender, which is the
        // account that is deploying the contract.
        _mint(msg.sender, initialSupply);
        owner = msg.sender;
    }
}