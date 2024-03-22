use std::any::Any;

extern "C" {
    fn ping_provider() -> i32;
}

pub fn make_raw(_data: &dyn Any) -> &[u8] {
    return &[2 as u8];
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = make_raw(&(2));
        assert_eq!(result, &[2 as u8]);
    }

    #[test]
    fn can_connect_to_provider() {
        unsafe {
            let result = ping_provider();
            assert_eq!(result, 1);
        }
    }
}
