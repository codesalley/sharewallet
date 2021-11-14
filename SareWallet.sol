//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

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
    receive() external payable {}
}
