# BitcoinMiningAlgorithm

### Changjun Lim

### December, 2017

*This project is the final project of Computer Architecture class.*

### Abstract

This project is about implementing Bitcoin Mining Algorithm using Verilog. Bitcoin is a representative peer-to-peer cryptocurrency. The key feature of Bitcoin is that the Bitcoin network can assure the reliability of transactions without a central control system. Every record of transactions is stored in blocks and each block is validated with proof of work. It is called Bitcoin mining to ensure the validity of a block by doing a time-consuming process(which needs many calculations).
Bitcoin mining is like solving cryptographical problems within the appointed amount of time and it needs repetitive and fast calculation. So optimizing calculation is important for mining. FPGA is usually better than multi-purpose processors like CPU. In order to execute mining on FPGA, this project implements Bitcoin Algorithm in Verilog.

### Motivation

As the price of 1 Bitcoin(BTC) goes higher than $17,000, cryptocurrency becomes a major issue all over the world. And there is a statistics that the power consumption of Bitcoin mining exceeds that of many countries. So this project deals with how the Bitcoin network is working and why Bitcoin mining needs enormous power consumption. Also, since the performance versus power is a major topic in the computer industry, implementing Bitcoin mining will be an interesting engineering problem.

### Objective

- Understand the Bitcoin network and the Bitcoin mining algorithm
- Understand the principle of SHA-256 algorithm
- Implement SHA-256 algorithm in Verilog
- Implement Bitcoin mining algorithm in Verilog


### Structure
The following picture is the block diagram for SHA-256. I implemented the SHA-256 Engine part in the figure.
![figure1_c](images/sha256_block_diagram.png)

The source code consists of 3 files: sha256_hash.v, sha256_round.v, sha256_round_unit.v.
1. sha256_round_unit.v
This file is for the units used in sha256_round.vj
2. sha256_round.v
This file is the module executing SHA-256 round operations. It iterates the step 3 each cycle.
3. sha256_hash.v
This file is the whole SHA-256 calculation except for preprossing.

### Extension
This project does not fully cover all of Bitcoin mining. It is needed to add SHA-256 preprossing and networking of a miner to this project.

#### Reference
- SHA-256 Algorithm: [“Secure Hash Standard (SHS)”, Information Technology Laboratory, National Institute of Standards and Technology](https://csrc.nist.gov/csrc/media/publications/fips/180/2/archive/2002-08-01/documents/fips180-2.pdf)
- Block Diagram: [“SHA-256 Secure Hash Function”, CAST, Inc.](https://www.xilinx.com/publications/3rd_party/products/cast_sha256.pdf)
- ["FPGA Based Bitcoin Mining", Philip Dotemoto](http://digitalcommons.calpoly.edu/cgi/viewcontent.cgi?article=1285&context=eesp)