pragma solidity >=0.4.21 <0.6.0;

contract DeferredEquityPlan {
    
    uint fakenow = now;
    
    function fastforward() public {
        fakenow += 100 days;
    }
    
    
    address human_resources;

    address payable employee;
    bool active = true;

    // Total Shares and Annual Distribution
    uint total_shares = 1000;
    uint annual_distribution = 250; // 1000 shares over 4 years
    uint start_time = fakenow; 
    
    // Unlock_time 365 days from fakenow
    uint unlock_time = now + 365 days; 

    uint public distributed_shares; // starts at 0

    constructor(address payable _employee) public {
        human_resources = msg.sender;
        employee = _employee;
    }

    function distribute() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract not active.");
        
        require(unlock_time <= now || distributed_shares < total_shares);

        unlock_time += 365 days; 
        distributed_shares = (fakenow - start_time) / 365 days * annual_distribution;

        // double check in case the employee does not cash out until after 5+ years
        if (distributed_shares > 1000) {
            distributed_shares = 1000;
        }
    }

    // human_resources and the employee can deactivate this contract at-will
    function deactivate() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to deactivate this contract.");
        active = false;
    }
    
    // Since we do not need to handle Ether in this contract, revert any Ether sent to the contract directly
    function() external payable {
        revert("Do not send Ether to this contract!");
    }
}
