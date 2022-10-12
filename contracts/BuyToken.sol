// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function transfer(address to, uint256 amount) external returns (bool);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

contract BuyTokenContract is Ownable {
    address public usdt;
    address public worldCupToken;

    constructor(address _usdt, address _worldCupToken) {
        usdt = _usdt;
        worldCupToken = _worldCupToken;
    }

    function buyTokenWithUSDT(uint256 amount) external {
        require(
            IERC20(usdt).allowance(msg.sender, address(this)) >=
                amount * 100 * 10**6,
            "not enough allownace"
        );
        IERC20(usdt).transferFrom(
            msg.sender,
            address(this),
            amount * 100 * 10**6
        );
        IERC20(worldCupToken).transfer(msg.sender, amount * 10**18);
    }

    function withdrawUSDT() public onlyOwner {
        IERC20(usdt).transferFrom(
            address(this),
            msg.sender,
            IERC20(usdt).balanceOf(address(this))
        );
    }
}
