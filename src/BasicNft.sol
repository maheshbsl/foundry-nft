// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    
    /**
     * @dev s_tokenCounter Keeps track of the number of token minted, and it also serves as the tokenId
     */
    uint256 private s_tokenCounter;

    /**
     * @dev This mapping stores tokenURI(a string) for each tokenId
     */
    mapping(uint256 => string) private s_tokenIdToUri;

    /**
     * Call the ERC721 parent contract with two arguments Token Name and Token Symbol
     * Token Name => Dogie
     * TokenSymbol => DOG
     * Initialize the s_tokenCounter as zero , ensuring that the first NFT token will have ID 0. 
     */
    constructor() ERC721 ("Dogie", "DOG") {
        s_tokenCounter = 0;    
    }

    /**
     * Anyone can mint a new NFT token with specific tokenURI (which will have the meta data)
     * @param tokenUri Store the meta data
     * Map the newly minted token using `s_tokenCounter` which is it's Id, with the provided `tokenURI`
     * `_safeMint(msg.sender, s_tokenCounter)` => mints the NFT to the caller `msg.sender` using the current `s_tokenCounter` as the tokenId.
     * Increment the `s_tokenCounter`, ensuring next time The new NFT has a unique tokenId.
     */

    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }
    /**
     * 
     * @param tokenId Id of the specific NFT token 
     * Return the (metadata)tokenURI associated with the specific `tokenId`
     */
    function tokenURI(uint256 tokenId) public view override returns(string memory ){
        return s_tokenIdToUri[tokenId];

    }

}