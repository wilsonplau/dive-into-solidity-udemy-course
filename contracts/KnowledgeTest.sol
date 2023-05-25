//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    address public owner;
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;

    constructor() {
        owner = msg.sender;
    }

    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    receive() external payable {
        // Do nothing
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function transferAll(address _addr) external {
        require(msg.sender == owner, "ONLY_OWNER");
        (bool success, ) = payable(_addr).call{value: getBalance()}("");
        require(success, "Transfer failed.");
    }

    function start() external {
        players.push(msg.sender);
    }

    function concatenate(
        string memory a,
        string memory b
    ) public pure returns (string memory) {
        return string(abi.encodePacked(a, b));
    }
}
