# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.ts
# We should flatten contract (Resolves licenses), if not, the hardhat might throw error while compiling. (see https://github.com/NomicFoundation/hardhat/issues/2499)
npx hardhat flat build/PrivateTx.sol > build/PrivateTx_flat.sol 
```
