-include .env

.PHONY: all test clean deploy fund help install snapshot format anvil deployMood mintMoodNft flipMoodNft mint

DEFAULT_ANVIL_KEY := 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

help:
	@echo "Usage:"
	@echo "  make deploy [ARGS=...]\n    example: make deploy ARGS=\"--network arbSepolia\""
	@echo ""
	@echo "  make fund [ARGS=...]\n    example: make deploy ARGS=\"--network arbSepolia\""

all: clean remove install update build

# Clean the repo
clean  :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

# install :; forge install Cyfrin/foundry-devops@0.0.11 --no-commit && forge install foundry-rs/forge-std@v1.5.3 --no-commit && forge install transmissions11/solmate@v6 --no-commit

# Update Dependencies
update:; forge update

build:; forge build --via-ir

test :; forge test 

snapshot :; forge snapshot

format :; forge fmt

anvil :; anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1

NETWORK_ARGS := --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast

ifeq ($(findstring --network arbSepolia,$(ARGS)),--network arbSepolia)
	NETWORK_ARGS := --rpc-url $(ARBITRUM_SEPOLIA_RPC) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(ARBISCAN_API_KEY) -vvvv
endif

ifeq ($(findstring --network optSepolia,$(ARGS)),--network optSepolia)
	NETWORK_ARGS := --rpc-url $(OPTIMISM_SEPOLIA_RPC) --private-key $(PRIVATE_KEY) --broadcast --verify --etherscan-api-key $(OPTIMISMSCAN_API_KEY) -vvvv
endif

deploySource:
	@forge script script/DeploySource.s.sol:DeploySource $(NETWORK_ARGS)

deployDestination:
	@forge script script/DeployDestination1.s.sol:DeployDestination1 $(NETWORK_ARGS)

sourceInteraction:
	@forge script script/InteractionSource.s.sol:InteractionSource $(NETWORK_ARGS)


# command to run deploy makefile
# make deployDestination ARGS="--network arbSepolia"
# make deploySource ARGS="--network optSepolia"
# make sourceInteraction ARGS="--network optSepolia"
