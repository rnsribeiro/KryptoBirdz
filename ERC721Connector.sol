// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/rnsribeiro/KryptoBirdz/blob/main/ERC721Metadata.sol";
import "https://github.com/rnsribeiro/KryptoBirdz/blob/main/ERC721.sol";

contract ERC721Connector is ERC721Metadata {
    constructor(string memory name, string memory symbol) ERC721Metadata(name, symbol){
        
    }
}
