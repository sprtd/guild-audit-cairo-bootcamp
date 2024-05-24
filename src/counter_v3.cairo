#[starknet::interface]
trait ISimpleCounterV3<T> {
    fn set_count(ref self: T, amount: u32);
    fn increase_count(ref self: T, amount: u32);
    fn get_count(self: @T) -> u32;
}


#[starknet::contract]
mod SimpleCounterV3 {
    use starknet::{get_caller_address, ContractAddress};
    use gm_cairo::utils::addition::sum_num;


    #[storage]
    struct Storage {
        count: u32,
        owner: ContractAddress
    }


    #[constructor]
    fn constructor(ref self: ContractState, _owner: ContractAddress) {
        self.owner.write(_owner);
    }

    #[abi(embed_v0)]
    impl ISimpleCounterImpl of super::ISimpleCounterV3<ContractState> {
        // ref - modify state
        fn set_count(ref self: ContractState, amount: u32) {
            let caller: ContractAddress = get_caller_address();
            assert(caller == self.owner.read(), 'caller not owner');
            assert(amount != 0, 'invalid amount');
            self.count.write(amount);
        }

        fn increase_count(ref self: ContractState, amount: u32) {
            let caller: ContractAddress = get_caller_address();
            assert(caller == self.owner.read(), 'caller not owner');
            assert(amount != 0, 'invalid amount');
            let current_count: u32 = self.count.read();
            let sum_result = sum_num(current_count, amount);
            self.count.write(sum_result);
        }


        fn get_count(self: @ContractState) -> u32 {
            self.count.read() // implicit return
        }
    }
}

