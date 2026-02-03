// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ProfileSystem {
    enum roleEnum {
        GUEST,
        USER,
        ADMIN
    }

    struct UserProfile {
        string username;
        uint256 level;
        roleEnum role;
        uint256 lastUpdated;
    }

    mapping(address => UserProfile) public profiles;

    error UserAlreadyExists();
    error EmptyUsername();
    error UserNotRegistered();

    modifier onlyRegistered() {
        if (profiles[msg.sender].level == 0) {
            revert UserNotRegistered();
        }
        _;
    }

    function createProfile(string calldata _Ethan) external {
        if (bytes(_Ethan).length == 0) {
            revert EmptyUsername();
        }

        if (profiles[msg.sender].level != 0) {
            revert UserAlreadyExists();
        }

        profiles[msg.sender] = UserProfile(
            _Ethan,
            1,
            roleEnum.USER,
            block.timestamp
        );
    }

    function levelUp() external onlyRegistered {
        profiles[msg.sender].level += 1;
        profiles[msg.sender].lastUpdated = block.timestamp;
    }

    event ProfileCreated(address indexed user, string username);
    event LevelUp(address indexed user, uint256 newLevel);

}