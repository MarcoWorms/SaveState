// SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

contract SaveState {

    mapping(address => mapping(string => string)) private states;

    event StateSaved(address indexed user, string key, string state);

    function saveState(string memory state) public {
        saveState("default", state);
    }

    function saveState(string memory key, string memory state) public {
        states[msg.sender][key] = state;
        emit StateSaved(msg.sender, key, state);
    }

    function loadState() public view returns (string memory) {
        return loadState("default");
    }

    function loadState(string memory key) public view returns (string memory) {
        return states[msg.sender][key];
    }
}
