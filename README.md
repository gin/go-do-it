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
cast send --rpc-url $RPC_URL --private-key $PRIVATE_KEY --create $(cat output/Main/Main.bin)
```
