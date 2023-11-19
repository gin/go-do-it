# go-do-it
Commitment device written in Fe lang

## Quick start
### Setup
```bash
# Install Fe
brew install fe-lang/tap/fe

# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
```

### Test, Build, Deploy
```bash
# Test
fe test

# Build
fe build .

# Deploy by passing the compiled binary in --create
cast send --rpc-url $RPC_URL --private-key $PRIVATE_KEY --create $(cat output/GoDoIt/GoDoIt.bin)
```

### Run on local blockchain
In another terminal
```bash
# Spin up a local blockchain with Anvil from Foundry
anvil
```

Test with commands from in Makefile
```bash
make build
make deploy
make senda1     # Add witness 1
make senda2     # Add witness 2
make checkm     # Check if majority rejects

make checkc     # Check arbiter's address
make sendc      # Change arbiter's address
make checkc     # Expect arbiter's address is different
```

### Things left to do
Commiter's withdrawal is untested.  
Witness' withdrawal is not yet written.
