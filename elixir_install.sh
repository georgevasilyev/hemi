#!/bin/bash
apt install docker.io -y 
docker pull elixirprotocol/validator:v3 --platform linux/amd64
echo 'ENV=testnet-3

STRATEGY_EXECUTOR_IP_ADDRESS=178.176.166.191
STRATEGY_EXECUTOR_DISPLAY_NAME=3070-1-GRA
STRATEGY_EXECUTOR_BENEFICIARY=0xd3969e2ef6a886b67224e719834de61e30eef78a
SIGNER_PRIVATE_KEY=068f5c8bcc95dce9577c4cc7fe5c26936ac4a7ecda81d3fd9c72c300337ad35c' > /root/validator.env

docker run --name elixir --restart unless-stopped --env-file /root/validator.env --platform linux/amd64 -p 17690:17690 elixirprotocol/validator:v3

#обновление 
#docker kill elixir && docker rm elixir
#docker pull elixirprotocol/validator:v3 --platform linux/amd64
#docker run --name elixir --env-file /root/validator.env --platform linux/amd64 -p 17690:17690 --restart unless-stopped elixirprotocol/validator:v3
