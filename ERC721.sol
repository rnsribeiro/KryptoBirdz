// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721{

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed _from, address indexed _to, uint256 indexed _tokenId);


    mapping (uint256 => address) private _tokenOwner;
    mapping (address => uint256) private _ownedTokensCount;
    mapping (uint256 => address) private _tokenApprovals;

    function balanceOf(address _owner) public view returns(uint256){
        require(_owner != address(0), "ERROR: Owner query for non-existent token!");
        return _ownedTokensCount[_owner];

    }

    function ownerOf(uint256 _tokenId) public view returns(address){
        address owner = _tokenOwner[_tokenId];
        require(owner != address(0), "ERROR: Owner query for non-existent token!");
        return owner;
    }

    function _exists(uint256 tokenId) internal view returns(bool){
        address owner = _tokenOwner[tokenId];

        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "ERC721: Minting to the zero address!");
        require(!_exists(tokenId), "ERC721:Token already minted!");
        _tokenOwner[tokenId] = to;
        _ownedTokensCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }

    function _transferFrom(address _from, address _to, uint256 _tokenId) internal {
        require(_to != address(0), "ERC721: Transfer to the zero address!");
        require(ownerOf(_tokenId) == _from, "ERROR: Trying to transfer a token to an address does not own!");
        _ownedTokensCount[_to] += 1;
        _ownedTokensCount[_from] -= 1;
        _tokenOwner[_tokenId] = _to;

        emit Transfer(_from, _to, _tokenId);
    }

    function tranferFrom(address _from, address _to, uint256 _tokenId) public {
        _transferFrom(_from, _to, _tokenId);
    }

    function approve(address _to, uint256 tokenId) public{
        address owner = ownerOf(tokenId);
        require(_to != owner, "ERROR: Approval current owner!");
        require(owner != msg.sender, "ERROR: Current caller is not the owner!");
        _tokenApprovals[tokenId] = _to;

        emit Approval(owner, _to, tokenId);
    }
}
