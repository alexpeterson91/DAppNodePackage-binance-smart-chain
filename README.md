# DAppNode package for Binance Smart Chain

  DNP (DAppNode Package) built and uploaded 10/16/2021
  -updated geth to 1.1.2
  Release hash : /ipfs/QmUue8r5nnagTxgBXWtRXDvqPW4fcptD58AKUxHccYVHwe
  http://my.dappnode/#/installer/%2Fipfs%2FQmUue8r5nnagTxgBXWtRXDvqPW4fcptD58AKUxHccYVHwe
  
  
  
 - DNP (DAppNode Package) built and uploaded	7/31/2021
 - Release hash : /ipfs/QmNZVuzz4wsH4xxSeMWGLvkMr9XxxvvezVFVHjNYiq96qH
 - http://my.dappnode/#/installer/%2Fipfs%2FQmNZVuzz4wsH4xxSeMWGLvkMr9XxxvvezVFVHjNYiq96qH


### Prerequisites


- Install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) commandline tool.

- Install [docker](https://docs.docker.com/engine/installation). The community edition (docker-ce) will work. In Linux make sure you grant permissions to the current user to use docker by adding current user to docker group, `sudo usermod -aG docker $USER`. Once you update the users group, exit from the current terminal and open a new one to make effect.

- Install [docker-compose](https://docs.docker.com/compose/install)
   
**Note**: Make sure you can run `git`, `docker ps`, `docker-compose` without any issue and without sudo command.
   
   - Install [DAppNodeSDK](https://github.com/dappnode/DAppNodeSDK)
```
   $ npm install -g @dappnode/dappnodesdk
```

## Buidling the DAppNodePackage

```   
   $ git clone https://github.com/NotSafeMoon/DAppNodePackage-binance-smart-chain.git
   $ cd DAppNodePackage-binance-smart-chain
   $ dappnodesdk build
```

You can use this package without installing it in your DAppNode following these instructions:

`docker-compose build`

## Running

### Start

`docker-compose up -d`

### View logs

`docker-compose logs -f`

### Stop

`docker-compose down`

## Extra options

You can edit the `docker-compose.yml` and add extra options, such as:
```
 - EXTRA_OPTS=--ws.api eth,net,ssh,miner,web3,personal,admin,txpool
```

# Connect using web3js
## HTTP (uses port 8545):

   If the package is running and you're connected to your dappnode you can use:
   ```
   var Web3 = require('web3');
   var web3 = new Web3('http://binance-smart-chain.dappnode:8545')
   web3.eth.getBlockNumber().then(console.log)
   ```
   In case you are running it locally:
   ```
   var Web3 = require('web3');
   var web3 = new Web3('http://127.0.0.1:8545')
   web3.eth.getBlockNumber().then(console.log)
   ```
   
## WEBSOCKETS (uses port 8546):

   If the package is running and you're connected to your dappnode you can use:
   ```
   var Web3 = require('web3');
   var web3 = new Web3('ws://binance-smart-chain.dappnode:8546')
   web3.eth.getBlockNumber().then(console.log)
   ```
   In case you are running it locally:
   ```
   var Web3 = require('web3');
   var web3 = new Web3('ws://127.0.0.1:8546')
   web3.eth.getBlockNumber().then(console.log)
   ```

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details
