// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/Context.sol";

//, Context, AccessControl
contract ERC1155Test is ERC1155 {
    // uint256 public constant GOLD = 0;
    // uint256 public constant SILVER = 1;
    // uint256 public constant THORS_HAMMER = 2;
    // uint256 public constant SWORD = 3;
    // uint256 public constant SHIELD = 4;

    constructor(uint256[] memory ids, uint256[] memory amounts, bytes memory data) ERC1155 ("") {
        // _mint(msg.sender, GOLD, 10**18, "");
        // _mint(msg.sender, SILVER, 10**27, "");
        // _mint(msg.sender, THORS_HAMMER, 1, "");
        // _mint(msg.sender, SWORD, 10**9, "");
        // _mint(msg.sender, SHIELD, 10**9, "");
        //_setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _mintBatch(msg.sender, ids, amounts, data);
    }

    // function changeAmount(uint id, uint amount) public virtual {
    //     require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "change Amount: must have admin role to execute");
    //     require(amount != 0, "Amount cannot be 0");
    //     _balances[id][_msgSender] = amount;
    // }
    
}