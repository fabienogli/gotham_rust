extern crate skeptic;
#[test] fn readme_sect_example_line_22() {
    let s = &format!(r####"
{}"####, r####"extern crate borrow_bag;

use borrow_bag::BorrowBag;

struct X(u8);
struct Y(u8);

fn main() {
    let bag = BorrowBag::new();
    let (bag, x_handle) = bag.add(X(1));
    let (bag, y_handle) = bag.add(Y(2));

    let x: &X = bag.borrow(x_handle);
    assert_eq!(x.0, 1);

    // Type annotations aren't necessary, the `Handle` carries the necessary
    // type information.
    let y = bag.borrow(y_handle);
    assert_eq!(y.0, 2);
}
"####);
    skeptic::rt::run_test(r#"/home/fabien/.cargo/registry/src/github.com-1ecc6299db9ec823/borrow-bag-1.0.0"#, r#"/home/fabien/test/rust/gotham/server/target/debug/build/borrow-bag-cb098637a94616ed/out"#, r#"x86_64-unknown-linux-gnu"#, s);
}

