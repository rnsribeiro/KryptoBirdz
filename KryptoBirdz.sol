// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721Metadata.sol';
import './ERC721Connector.sol';
import './Migrations.sol';

contract KryptoBirdz is ERC721Connector{

  string[] public kryptoBird;

  mapping(string => bool) _kriptoBirdExists;

  function mint(string memory _kriptobird) public {
    
    require(!_kriptoBirdExists[_kriptobird], "ERROR: KriptBird already exists!");

    kryptoBird.push() = _kriptobird;
    uint256 _id = kryptoBird.length - 1;

    _mint(msg.sender, _id);

    _kriptoBirdExists[_kriptobird] = true;
  }

  constructor() ERC721Connector ("KryptoBirdz", "KBIRDZ"){
 
  }
}
