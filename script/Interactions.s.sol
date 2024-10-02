// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {Script} from "forge-std/Script.sol";
import {DeployBasicNFT} from "script/DeployBasicNFT.s.sol";
import {BasicNft} from "src/BasicNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintBasicNft is Script {

    string public constant PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
     uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); 

    function run() public {
        address mostRecentlyDeployedContract = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployedContract);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast(deployerPrivateKey);
        BasicNft(contractAddress).mintNft(PUG);
        vm.stopBroadcast();
    }
}