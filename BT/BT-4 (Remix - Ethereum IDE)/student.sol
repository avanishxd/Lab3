// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    // Define a structure for student details
    struct Student {
        int ID;
        string fName;
        string lName;
        int[2] marks;
    }

    address public owner;
    uint public stdCount = 0;

    // Mapping to store student records
    mapping(uint => Student) public stdRecords;

    // Modifier to restrict access to contract owner
    modifier onlyOwner() {
        require(owner == msg.sender, "Only owner can call this function");
        _;
    }

    // Constructor to initialize contract owner
    constructor() {
        owner = msg.sender;
    }

    // Function to add new student record
    function addNewRecord(
        int _ID,
        string memory _fName,
        string memory _lName,
        int[2] memory _marks
    ) public onlyOwner {
        stdCount += 1;
        stdRecords[stdCount] = Student(_ID, _fName, _lName, _marks);
    }

    // View function to get student details by index
    function getStudent(uint index)
        public
        view
        returns (int, string memory, string memory, int[2] memory)
    {
        Student memory s = stdRecords[index];
        return (s.ID, s.fName, s.lName, s.marks);
    }

    // Fallback function (called when invalid data is sent or no function matches)
    fallback() external payable {
        // Accept Ether and emit an event for logging
        emit Received(msg.sender, msg.value, "Fallback called");
    }

    // Receive function to handle plain Ether transfers
    receive() external payable {
        emit Received(msg.sender, msg.value, "Receive called");
    }

    // Event to log Ether received
    event Received(address sender, uint amount, string message);
}
