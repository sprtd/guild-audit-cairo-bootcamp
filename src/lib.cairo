use core::traits::Into;
mod calculations;
fn main() {
    let x = say_name();
    println!("x value here: {x}");

    // let sum_result: u8 = sum(1, 255); // u8 - 255
    // println!("sum result___{sum_result}");

    // let type_casted_result: u32 = sum_num_type_cast(255, 255);
    // println!("type_casted_result_____{type_casted_result}");

    let is_even: bool = is_even(3);
    println!("is even result here: {}", is_even);

    let cal_result = calculations::add::add_(1, 2);
    println!("yeah___, {cal_result}");
}


fn say_name() -> felt252 {
    let result = 'SAY GM!!'; // implicit felt252
    return result;
}

fn say_name_2() -> felt252 {
    let result: felt252 = 'SAY GM!!'; // explicit felt252
    return result;
}

fn sum(num1: u8, num2: u8) -> u8 {
    num1 + num2 // implicit return 
}

fn sum_2(num1: u8, num2: u8) -> u8 {
    return num1 + num2; // explicit return 
}


// typecasting
fn sum_num(num1: u8, num2: u8) -> u32 {
    let result: u32 = num1.into() + num2.into();
    result // implicit return
}

// typecasting
fn sum_num_type_cast(num1: u8, num2: u8) -> u32 {
    let result: u32 = num1.into() + num2.into();
    return result; // explicit return
}

fn is_even(num1: u8) -> bool {
    if num1 % 2 == 0 {
        return true;
    }
    return false;
}



// scarb is a package manager

// common scarb commands
// scarb build - compile cairo program
// scarb cairo-run - run a given cairo program
// scarb fmt - format code appropriately

// convert from low to high - into():
// u8 -> u32

// convert from high to low -  try_into():
// u32 -> u8

// u8, 2 ^ 8 = 256 - 1 = 0 
// u16, 
// u32, 
// u64, 
// u128, 
// u256 

// Cairo Program - stateless logic
// Starknet Contracts - stateful logic

// Starknet Foundry:
// - snforge: to spin new project, for testing

// - sncast: to deploy:
//      - accounts - holds custody of private key, signing txns

// - declare  - generates class hash
//      - deploy   - generates contract address
//      - invoke   - performing state-changing operations
//      - call     - perform non state-changing operations (read-only)

