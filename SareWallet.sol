//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ShareWallet is Ownable {
    mapping(address => uint) public allowance;
    
    modifier ownerOrAllow(uint _amount) {
        require(owner() == msg.sender || allowance[msg.sender] >= _amount);
        _;
    }
    
    function reduceAllowance (address _who, uint _amount) internal {
        allowance[_who] -= _amount;
    }
    
    function addAllowance(address _who, uint _amount) public onlyOwner {
        allowance[_who] = _amount;
    }
    function withrawMoney(address payable _to, uint256 _amount)
        public
        ownerOrAllow(_amount)
        
    {
        _to.transfer(_amount);
    }

    receive() external payable {}
}
