RPC_URL=http://127.0.0.1:8545

PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
ADDR=0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266

PRIVATE_KEY1=0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d
ADDR1=0x70997970C51812dc3A010C7d01b50e0d17dc79C8

PRIVATE_KEY2=0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a
ADDR2=0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC

PRIVATE_KEY3=0x7c852118294e51e653712a81e05800f419141751be58f605c371e15141b007a6
ADDR3=0x90F79bf6EB2c4f870365E785982E1f101E93b906

CONTRACT_ADDR=0x5FbDB2315678afecb367f032d93F642f64180aa3


.PHONY: debug
debug:
	fe test . --logs

.PHONY: test
test:
	fe test .

.PHONY: build
build:
	fe build . --overwrite

.PHONY: deploy
deploy:
	cast send --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY) --create $(shell cat output/GoDoIt/GoDoIt.bin) $(shell cast abi-encode "__init__(uint256)" 0xa --value 1ether)

sendc:
	cast send --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY) $(CONTRACT_ADDR) "change_arbiter(address)" $(ADDR3)

senda1:
	cast send --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY) $(CONTRACT_ADDR) "add_witness(address)" $(ADDR1)

senda2:
	cast send --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY) $(CONTRACT_ADDR) "add_witness(address)" $(ADDR2)

send1r:
	cast send --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY1) $(CONTRACT_ADDR) "vote_reject()" --value 1ether

send2r:
	cast send --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY2) $(CONTRACT_ADDR) "vote_reject()" --value 1ether


checkc:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_arbiter()"

checke:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_ended()"

checkws:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_num_witnesses()"

checkwsr:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_num_witnesses_reject()"

check1s:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_witness_stake(address)" $(ADDR1)

check2s:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_witness_stake(address)" $(ADDR2)

check1v:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_witness_vote(address)" $(ADDR1)

check1st:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_witness_status()" $(ADDR1)

checkm:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "is_majority_reject()"

checket:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_commit_end_time()"

checkt:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_commit_time()"

checkcm:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_commit_amount()"


.PHONY: clean
clean:
	@rm -rf ./output
