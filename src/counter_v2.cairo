// trait - blue print 

#[starknet::interface]
trait ISimpleCounterV2<T> {
    fn set_count(ref self: T, amount: u32);
    fn get_count(self: @T) -> u32;
}


#[starknet::contract]
mod SimpleCounterV2 {
    use starknet::{get_caller_address, ContractAddress};
    #[storage] // attribute
    struct Storage {
        count: u32,
        owner: ContractAddress
    }

    // UDC 
    #[constructor]
    fn constructor(ref self: ContractState, _owner: ContractAddress) {
        self.owner.write(_owner);
    // vulnerable
    // let caller = get_caller_address(); // UDC
    // self.owner.write(caller);
    }


    // impl block
    #[abi(embed_v0)]
    impl ISimpleCounterImpl of super::ISimpleCounterV2<ContractState> {
        // ref - modify state
        fn set_count(ref self: ContractState, amount: u32) {
            let caller: ContractAddress = get_caller_address();
            assert(caller == self.owner.read(), 'caller not owner');
            assert(amount != 0, 'invalid amount');
            self.count.write(amount);
        }

        // snapshot - read-only
        fn get_count(self: @ContractState) -> u32 {
            self.count.read() // implicit return
        }
    }
}

