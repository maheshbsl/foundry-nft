// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "src/BasicNft.sol";

contract DeployBasicNFT is Script {

    function run() external returns(BasicNft) {
       return DeployNft();
    }
    function DeployNft() public returns(BasicNft) {
        vm.startBroadcast();
        BasicNft Dog = new BasicNft();
        vm.stopBroadcast();
        return Dog;
    }
}