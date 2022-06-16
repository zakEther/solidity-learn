// SPDX-License-Identifier: MIT

// ethervm.io

pragma solidity >= 0.8.0 < 0.9.0;

contract LearnAssembly {
    function addToEVM() external {
        uint x; 
        uint y;
        // uint z = x + y;
    
    // all of this is compiled to low level instructions know as (opcode - in total there is around 100)

    // how the hack do we use assembly?
    
        assembly {

            // declares an assembly block
            // inside it we can manipulate variables declare outside 
            // no semi colon, = is actually := and we can bring in opcodes
        
            let z := add(x, y) 

            // if functions for 

            // load data for a specific slot
            // let a := mload(0x40)

            // store smth temporarily to memory
            // mstore(a, 4)

            // persistance storage
            // sstore(a, 100)
        }
        // in EVM everything is stored in slots of 256 bits (a uint occupies one slot) whereas mapping or array is several
    }

    function addToEVM2() public view returns (bool success) {
        uint size;
        address addr;

        // check whether an address contains any bytes of code or not
        assembly {
            size := extcodesize(addr)
        }

        if (size <= 0) {
            return true;
            } else {
            return false;
        }
    }

    function addToEVM3() external view {
        bytes memory data = new bytes(10);

        // we cannot convert this into a fixed size
        bytes32 dataB32 = bytes32(data);

        // but if we only care about the first 32 bytes we can use assembly 

        assembly {
            // bytes in memory is size so data actually starts at the second slot
            dataB32 := mload(add(data, 32))
            // operation add and we add 32 bytes so we fill the first slot

        }
    }
}