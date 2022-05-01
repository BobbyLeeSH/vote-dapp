// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract Voting {
    string[] public candidates;
    mapping (string => uint8) public votes;
    // TODO. change it to onlyOnwer
    function registerCandidate(string memory candidate) public {
        require(isExistingCandidate(candidate)==false);
        candidates.push(candidate);
    }

    function vote(string memory candidate) public {
        require(isExistingCandidate(candidate));
        votes[candidate] += 1;
    }

    function isExistingCandidate(string memory candidate) view private returns (bool) {
        for (uint i=0; i<candidates.length; i++) {
            if (keccak256(abi.encodePacked(candidates[i])) == keccak256(abi.encodePacked(candidate))) {
                return true;
            }
        }
        return false;
    }
}