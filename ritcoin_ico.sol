// SPDX-License-Identifier: MIT

// Ritcoin ICO

// Version of Compiler
pragma solidity ^0.8.15;

contract ritcoin_ico {
    //Introducing maximum no. of Ritcoin available for sale
    uint256 public max_ritcoin = 1000000;

    //Introducing the USD to Ritcoin conversion rate
    uint256 public usd_to_ritcoin = 1000;

    //Introducing the total no. of Ritcoins that have been bought by the investor
    uint256 public total_ritcoin_bought = 0;

    //Mapping from investor adress to its equity in ritcoins and USD
    mapping(address => uint256) equity_ritcoins;
    mapping(address => uint256) equity_USD;

    //Checking if an investor can buy ritcoin
    modifier can_buy_ritcoins(uint256 usd_invested) {
        require(
            (usd_invested * usd_to_ritcoin) + total_ritcoin_bought <=
                max_ritcoin
        );
        _;
    }

    //Getting the equity in USD of an investor
    function equity_in_ritcoins(address investor)
        external
        view
        returns (uint256)
    {
        return equity_ritcoins[investor];
    }

    //Getting the equity in USD of an investor
    function equity_in_usd(address investor) external view returns (uint256) {
        return equity_USD[investor];
    }

    //Buying Ritcoins
    function buy_ritcoins(address investor, uint256 usd_invested)
        external
        can_buy_ritcoins(usd_invested)
    {
        uint256 ritcoins_bought = usd_invested * usd_to_ritcoin;
        equity_ritcoins[investor] += ritcoins_bought;
        equity_USD[investor] = equity_ritcoins[investor] / 1000;
        total_ritcoin_bought += ritcoins_bought;
    }

    //Sellin Ritcoins
    function sell_ritcoins(address investor, uint256 ritcoins_sold) external {
        equity_ritcoins[investor] -= ritcoins_sold;
        equity_USD[investor] = equity_ritcoins[investor] / 1000;
        total_ritcoin_bought -= ritcoins_sold;
    }
}
