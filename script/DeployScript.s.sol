// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {Token} from "../src/Token.sol";
import {Exchange} from "../src/Exchange.sol";

contract DeployExchange is Script {
    function run() external {
        vm.startBroadcast();
        Token token = new Token();
        address tokenAddress = address(token);
        Exchange exchange = new Exchange(tokenAddress);
        vm.stopBroadcast();
    }
}
