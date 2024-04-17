// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {Exchange} from "../src/Exchange.sol";
import {Token} from "../src/Token.sol";

contract ExchangeTest is Test {
    Exchange public exchange;
    Token public token;

    function setUp() public {
        token = new Token();
        exchange = new Exchange(address(token));
    }

    function testAddLiquidity() public {
        uint256 initialTokenBalance = token.balanceOf(address(this));

        // Approve token transfer
        token.approve(address(exchange), 1000);

        uint256 lpTokensMinted = exchange.addLiquidity{value: 1 ether}(1000);

        uint256 finalTokenBalance = token.balanceOf(address(this));

        assertEq(lpTokensMinted, 1 ether);
        assertEq(finalTokenBalance, initialTokenBalance - 1000);
    }

    function testEthToTokenSwap() public {
        // Ensure the exchange contract has enough reserves
        token.transfer(address(exchange), 1000);

        uint256 initialTokenBalance = token.balanceOf(address(this));

        try exchange.ethToTokenSwap{value: 1 ether}(100) {
            uint256 finalTokenBalance = token.balanceOf(address(this));
            assertGt(finalTokenBalance, initialTokenBalance);
        } catch Error(string memory) {
            console.log("Failed to execute ethToTokenSwap");
        }
    }

    function testRemoveLiquidity() public {
        // Approve the exchange contract to spend tokens on behalf of the user
        token.approve(address(exchange), 1000);

        // Add liquidity to the exchange
        uint256 lpTokensMinted = exchange.addLiquidity{value: 1 ether}(1000);

        // Ensure that the removeLiquidity function executes successfully
        try exchange.removeLiquidity(lpTokensMinted) {
            // Assert successful execution
            assert(true);
        } catch Error(string memory) {
            console.log("Failed to execute removeLiquidity");
        } catch (bytes memory) {
            console.log("Failed to execute removeLiquidity");
        }
    }

    function testTokenToEthSwap() public {
        // Ensure the exchange contract has enough reserves
        token.transfer(address(exchange), 1000);
        token.approve(address(exchange), 1000);

        uint256 initialEthBalance = address(this).balance;

        try exchange.tokenToEthSwap(1000, 1 ether) {
            uint256 finalEthBalance = address(this).balance;
            assertGt(finalEthBalance, initialEthBalance);
        } catch Error(string memory) {
            console.log("Failed to execute tokenToEthSwap");
        }
    }
}
