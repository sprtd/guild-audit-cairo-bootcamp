// u8 - 255
// u32 - 4294967295 
pub fn sum_num(x: u32, y: u32) -> u32 {
    x + y
}

#[cfg(test)]
mod tests {
    #[test]
    #[should_panic]
    fn test_sum_num_should_panic() {
        super::sum_num(4294967295, 1);
    }

    #[test]
    fn test_sum_num() {
        let result = super::sum_num(10, 5);
        assert(result == 15, 'invalid sum_num logic');
        assert_eq!(result, 15);
    }
}
