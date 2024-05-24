use starknet::{ContractAddress};
use snforge_std::{declare, ContractClassTrait};
use gm_cairo::counter_v1::{ ISimpleCounterDispatcher, ISimpleCounterDispatcherTrait };



// util deployment function
fn deploy_contract() -> ContractAddress { 
    // 2 step process for deployment
    // declare 
    let contract = declare("SimpleCounter").unwrap();

    // deploy
    let (contract_address, _) = contract.deploy(@ArrayTrait::new()).unwrap();
    contract_address
}


#[test]
fn test_set_count() {
    let contract_address = deploy_contract();

    let dispatcher = ISimpleCounterDispatcher { contract_address };
    let count_1 = dispatcher.get_count();
    assert(count_1 == 0, 'invalid count');

    let amount: u32 = 10;

    dispatcher.set_count(amount);
    let count_2 = dispatcher.get_count();
    assert(count_2 == 10, 'invalid count');
    assert_ne!(count_2, 15);
}

#[test]
#[should_panic(expected: 'zero not allowed')]
fn test_cannot_set_count_with_zero_amount() {
    // get contract address of contract
    let contract_address = deploy_contract();

    // initialize contract instance
    let dispatcher = ISimpleCounterDispatcher { contract_address };

    // call count
    let count_1 = dispatcher.get_count();

    // assertion
    assert(count_1 == 0, 'invalid count');

    // attempt to set count with 0 amount
    dispatcher.set_count(0);
}



