pragma solidity ^0.5.0;

contract AssociateProfitSplitter {
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }
    
    // Returns contract's current balance
    function balance() public view returns(uint) {
        return address(this).balance;
    }
    
    // Makes deposits to employees
    function deposit() public payable{
        uint amount = msg.value / 3;              //calculates split value of the ether
        
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);
        
        msg.sender.transfer(msg.value - amount * 3);   //transfers leftover amount back to sender (Human Resources)
    }
    
    // Fallback function. Ensures deposit() function excecutes if funds are sent to contract directly
    function() external payable{
        deposit();
    }
    
}