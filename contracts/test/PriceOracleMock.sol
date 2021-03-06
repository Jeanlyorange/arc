pragma solidity ^0.5.2;

import "../schemes/PriceOracleInterface.sol";


contract PriceOracleMock is PriceOracleInterface {

    struct Price {
        uint256 numerator;
        uint256 denominator;
    }

    // user => amount
    mapping (address => Price) public tokenPrices;

    function getPrice(address token) public view returns (uint, uint) {
        Price memory price = tokenPrices[token];
        return (price.numerator, price.denominator);
    }

    function setTokenPrice(address token, uint256 numerator, uint256 denominator) public {
        tokenPrices[token] = Price(numerator, denominator);
    }
}
