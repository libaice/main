// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor() ERC20("World Cup Token", "MTK") {
           _mint(msg.sender, 32000 * 10**18);
    }
}