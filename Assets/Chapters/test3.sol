//SPDX-License-Identifier: GPL-3.0
 
pragma solidity 0.8.7;   // SOLIDITY_PRAGMAS_VERSION
 contract examination {
 
    mapping(uint128=>student) internal studentmap;  // SOLIDITY_VISIBILITY
 
    event newStudent(uint128);
    event marksUpdated(uint256);
 
    struct student {
    string Name;
    string Department;
    uint256 Mark1;
    uint256 Mark2;
    uint256 Mark3;
    uint256 Mark4;
    uint256 Mark5;
    uint256 total;
    uint256 avg;
    }
    student internal stud;   //SOLIDITY_VISIBILITY
 
    address internal owner;      //SOLIDITY_VISIBILITY
    constructor() {          // SOLIDITY_VISIBILITY
        owner = msg.sender;
    }
   
 modifier isOwner() {
        require(owner == msg.sender, "Only owner can access it");
        _;
    }
 /**
     * @dev Store value in variable
     * @param _rollnumber value to store
     * @param _Name value to store
     * @param _Dept value to store
     * @param _M1 value to store
     * @param _M2 value to store
     * @param _M3 value to store
     * @param _M4 value to store
     * @param _M5 value to store
     
     */
    function store(uint8 _rollnumber, string memory _Name, string memory _Dept, uint256 _M1, uint256 _M2, uint256 _M3, uint256 _M4, uint256 _M5) public isOwner {
  
     stud.Name = _Name;
     stud.Department = _Dept;
     stud.Mark1 = _M1;
     stud.Mark2 = _M2;
     stud.Mark3 = _M3;
     stud.Mark4 = _M4;
     stud.Mark5 = _M5;
     studentmap[_rollnumber] = stud;
    emit newStudent(_rollnumber);
    }
    /**
     * @dev Calculate value 
     * @param _rollnumber value to calculate
     */
     function Calculate(uint8 _rollnumber) public isOwner  {
        student memory s1 = studentmap[_rollnumber];
        s1.total = s1.Mark1 + s1.Mark2 + s1.Mark3 + s1.Mark4 + s1.Mark5;
        s1.avg = s1.total/5;
        studentmap[_rollnumber] = s1;
        emit marksUpdated(_rollnumber);
     }
    /**
     * @dev Return value 
     * @return num value of 'Name'
     * @return num value of 'total'
     * @return num value of 'avg'
     
     
     */
    function retrieve(uint8 _rollnumber) public view returns (string memory,uint256,uint256){   // SOLIDITY_SHOULD_RETURN_STRUCT
        student memory s1 = studentmap[_rollnumber];
        return(s1.Name,s1.total,s1.avg);
    }
}