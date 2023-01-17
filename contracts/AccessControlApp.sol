// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract AccessControlApp {
    // role => account => bool
    mapping(bytes32 => mapping(address => bool)) public roles;

    bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    bytes32 private constant USER = keccak256(abi.encodePacked("USER"));

    event grantRole(bytes32 indexed  role, address indexed account);
    event revokeRole(bytes32 indexed  role, address indexed account);

    constructor() {
        _GrantRole(ADMIN, msg.sender);
    }

    function _GrantRole(bytes32 _role, address _account) internal {
        roles[_role][_account] = true;
        emit grantRole(_role, _account);
    }

    modifier  onlyRole(bytes32 _role) {
        require(roles[_role][msg.sender], "not authorised");
        _;
    }

    function GrantRole(bytes32 _role, address _account) external onlyRole(ADMIN) {
        _GrantRole(_role, _account);
    }

    function RevokeRole(bytes32 _role, address _account) external onlyRole(ADMIN) {
        roles[_role][_account] = false;
        emit revokeRole(_role, _account);
    }

}