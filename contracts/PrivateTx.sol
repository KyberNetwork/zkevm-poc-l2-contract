pragma solidity 0.8.18;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";


contract PrivateTx is ReentrancyGuard, AccessControl {
    bytes32 public PrivateUTXOHash;
    bytes32 public NullifierHash;
    // List of token, and map from address to ID
    IERC20[] internal tokens;
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");

    /// @dev constructor also create the 1st account where fee will transfer to
    constructor(
        address admin,
        bytes32 genesisPrivateUTXOHash,
        bytes32 genesisNullifierHash
    ) {
        PrivateUTXOHash = genesisPrivateUTXOHash;
        NullifierHash = genesisNullifierHash;
        _grantRole(ADMIN_ROLE, admin);
    }

    // can receive native
    receive() external payable {}


    // only the server can send this TX as it is the one who hold the proof
    function credit_from_utxo(IERC20 token, bytes32 newPrivateTreeHash, bytes32 newNullifierHash, address beneficarry, uint256 amount) external onlyRole(ADMIN_ROLE) {
        PrivateUTXOHash = newPrivateTreeHash;
        NullifierHash = newNullifierHash;
        //TODO: Do erc20 transfer
        token.transfer(beneficarry, amount);
    }


}