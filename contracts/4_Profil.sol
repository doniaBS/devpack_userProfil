// SPDX-License-Identifier: MIT

pragma solidity 0.8.30;

contract Profil {

    struct User {
        string name;
        string email;
        uint phoneNumber;
        uint age;
        uint registeredAt;
    }

    mapping(address => User) private users;
    mapping(address => bool) private isRegistered;

    function register(string memory name, string memory email, uint phoneNumber, uint age) public {
        require(!isRegistered[msg.sender], "User already registered.");

        users[msg.sender] = User(name, email, phoneNumber, age, block.timestamp);
        isRegistered[msg.sender] = true;
    }

    function updateProfile(string memory name, string memory email, uint phoneNumber, uint age) public {
        require(isRegistered[msg.sender], "User not registered.");

         User storage user = users[msg.sender];
         user.name = name;
         user.email = email;
         user.phoneNumber = phoneNumber;
         user.age = age;
    }

    function getProfile() public view returns (
        string memory name,
        string memory email,
        uint phoneNumber,
        uint age,
        uint registeredAt
     ) {
        require(isRegistered[msg.sender], "User not registered.");

        User memory user = users[msg.sender];
        return (
        user.name,
        user.email,
        user.phoneNumber,
        user.age,
        user.registeredAt
     );
    }
}