# Technology
### -> Solidity
### -> Truffle
### -> Ganache

# What is it?
Writing to a blockchain storage is one of the most expensive operations. We can save some ether, otherwise spent on gas fees, by using gas optimization techniques.
In this smart contract instead of initializing a mapping ```mapping(address => Item[])``` to store all the items possesed by a person(this mapping gets extremely gas consuming as it grows)
I wrote a function 
```solidity
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
``` 
which in usage corresponds to the mapping but there is no need to change its content every time someone aquires or gets rid of an item beacuse the
returned array is dynamically created every time the function is called. If called externally the function costs 0 gas.
