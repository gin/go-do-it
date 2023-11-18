RPC_URL=http://127.0.0.1:8545

PRIVATE_KEY=
ADDR=0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266

PRIVATE_KEY1=
ADDR1=0x70997970C51812dc3A010C7d01b50e0d17dc79C8

PRIVATE_KEY2=
ADDR2=0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC

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
	cast send --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY) --create $(shell cat output/GoDoIt/GoDoIt.bin) $(shell cast abi-encode "__init__(uint256,uint256)" 0xa 0xa)

t:
	date && echo $(shell cat a.txt)

send1:
	cast send --rpc-url $(RPC_URL) --private-key $(PRIVATE_KEY) $(CONTRACT_ADDR) "change_arbiter(address)" $(ADDR2)

check1:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_arbiter()"

check2:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_arbiter1()"

check3:
	cast call --rpc-url $(RPC_URL) $(CONTRACT_ADDR) "check_ended()"

.PHONY: clean
clean:
	@rm -rf ./output
