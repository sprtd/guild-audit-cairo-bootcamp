// trait - blue print 

#[starknet::interface]
trait ISimpleCounter<T> {
    fn set_count(ref self: T, amount: u32);
    fn get_count(self: @T) -> u32;
}




#[starknet::contract]
mod SimpleCounter {
    #[storage] // attribute
    struct Storage {
        count: u32
    }
    // impl
    #[abi(embed_v0)]
    impl ISimpleCounterImpl  of super::ISimpleCounter <ContractState>{

        fn set_count(ref self: ContractState, amount: u32) {
            self.count.write(amount);
        }

        fn get_count(self: @ContractState) -> u32 {
            // self.count.read() // implicit return
            let count = self.count.read();
            return count;
        }
    }

}

