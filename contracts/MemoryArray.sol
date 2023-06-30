// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;


contract MemoryArray {
    constructor() {
        owner = msg.sender;
    }
    
    address owner;
    
    struct Item {
        uint16 ID;
        string name;
        address owner;
    }

    Item[] items;
    uint16 currentID = 1;
    mapping(address => uint16) addressItemCount;

    function addItem(string memory name, address _owner) public {
        items.push(Item(currentID, name, _owner));
        addressItemCount[_owner]++;
        currentID++;
    }

    function getItemsByOwner(address _owner) public view returns(Item[] memory) {
        Item[] memory _items = new Item[](addressItemCount[_owner]);
        uint16 counter = 0;
        for(uint16 i = 0;i < items.length;i++) {
            if(items[i].owner == _owner)
            {
                _items[counter] = items[i];
                counter++;
            }
        }
        return _items;
    }

}
