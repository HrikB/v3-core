// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.7.6;

import 'forge-std/Script.sol';

import '../contracts/UniswapV3Factory.sol';
import '../contracts/libraries/FullMath.sol';
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract CounterScript is Script {
    ERC20 token0;
    ERC20 token1;

    function setUp() public {
        ERC20 tokenA = new ERC20('Ether', 'ETH');
        ERC20 tokenB = new ERC20('United States Dollar Coin', 'USDC');

        (token0, token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
    }

    function run() public {
        UniswapV3Factory factory = new UniswapV3Factory();
        console.log(address(token0), address(token1), address(factory));
        factory.createPool(address(token0), address(token1), 500);
    }

    function mulDiv() public {
        uint256 a = uint256(keccak256(abi.encode(1)));
        uint256 b = uint256(keccak256(abi.encode(2)));
        uint256 c = uint256(keccak256(abi.encode(3)));
        console.log(mulmod(a, b, c));
        console.log(FullMath.mulDiv(a, b, c));
    }
}
