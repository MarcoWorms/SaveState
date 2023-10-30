# SaveState Contract

Save and load string-based states in EVM blockchains 

- Fantom: [0x91AFCCEd2446B635E4988ce4E664234E0Ed9C7b0](https://ftmscan.com/address/0x91AFCCEd2446B635E4988ce4E664234E0Ed9C7b0)
- Other EVM chains soon...
- Also: add information on size limits
- Also: add complete example saving localStorage then loading from it
  
## Integration Guide

The contract ABI can be found [here](https://ftmscan.com/address/0x91afcced2446b635e4988ce4e664234e0ed9c7b0#code).

To interact with the contract you need to call the following functions (examples for Fantom):

### saveState(string memory state)

This function saves a state for a user.

```javascript
import { useAccount, useContractWrite, usePrepareContractWrite } from 'wagmi'

const { config } = usePrepareContractWrite({
    address: '0x91afcced2446b635e4988ce4e664234e0ed9c7b0',
    abi: contractABI,
    functionName: 'saveState',
})
const { write } = useContractWrite(config)

const state = {
    counter: 123456
}

write(JSON.stringify(state))
```

### loadState()

This function loads a state for a user.

Example:

```javascript
import { useAccount, useContractRead, usePrepareContractRead } from 'wagmi'

const { config } = usePrepareContractRead({
    address: '0x91AFCCEd2446B635E4988ce4E664234E0Ed9C7b0',
    abi: contractABI,
    functionName: 'loadState',
})
const { read } = useContractRead(config)

const state = JSON.parse(read()) //{ counter: 123456 }
```

## Saving Many States For A User (Keys)

### saveState(string memory key, string memory state)

This function saves a state with a provided key. Default key is "default" (used when function is called without a key).

Example:

```javascript
import { useAccount, useContractWrite, usePrepareContractWrite } from 'wagmi'

const { config } = usePrepareContractWrite({
    address: '0x91AFCCEd2446B635E4988ce4E664234E0Ed9C7b0',
    abi: contractABI,
    functionName: 'saveState',
})
const { write } = useContractWrite(config)

const state = {
    counter: 123456
}
write('key', JSON.stringify(state))
```

### loadState(string memory key)

This function loads a state with a provided key. Default key is "default" (used when function is called without a key).

Example:

```javascript
import { useAccount, useContractRead, usePrepareContractRead } from 'wagmi'

const { config } = usePrepareContractRead({
    address: '0x91AFCCEd2446B635E4988ce4E664234E0Ed9C7b0',
    abi: contractABI,
    functionName: 'loadState',
})
const { read } = useContractRead(config)

const state = JSON.parse(read('key')) //{ counter: 123456 }
```
