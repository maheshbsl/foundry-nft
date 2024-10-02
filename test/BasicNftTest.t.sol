// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNFT} from "script/DeployBasicNFT.s.sol";
import {BasicNft} from "src/BasicNft.sol";


contract BasicNftTest is Test {
    DeployBasicNFT public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");
    string public constant PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();

        //we cannot compare stings directly in solidity
        assertEq(keccak256(abi.encodePacked(expectedName)), keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintAndHaveBalance() public  {
        // interact as USER
        vm.prank(USER);
        // mint a NFT
        basicNft.mintNft(PUG);
        // check USER has a balance of 1 , since he just minted a nft
        assertEq(basicNft.balanceOf(USER), 1);
    }

}
