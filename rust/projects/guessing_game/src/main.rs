use std::io; // use io library from standard library

use rand::Rng; // Rng trait defines methods that rngs implement

fn main() {
    println!("Guess the number!");

    // run `cargo doc --open` to learn more about rand methods
    let secret_number = rand::thread_rng().gen_range(1..=100);

    println!("The secret number is: {secret_number}");

    println!("Please input your guess.");

    let mut guess = String::new(); // created a new mutable variable that is currently bound to a new, empty instance of a String.

    io::stdin() // call stdin function from io module
        .read_line(&mut guess) // pass mutable reference & guess as argument
        .expect("Failed to read line"); // error handling to prevent crash

    println!("You guessed: {guess}");
}
