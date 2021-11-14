//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Permission {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier OnlyOwner() {
        require(msg.sender == owner, "you are not the ownder");
        _;
    }
}

contract ShareWallet is Permission {
    function withrawMoney(address payable _to, uint256 _amount)
        public
        OnlyOwner
    {
        _to.transfer(_amount);
    }

    receive() external payable {}
}
