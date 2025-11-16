use std::io; // use io library from standard library

fn main() {
    println!("Guess the number!");

    println!("Please input your guess.");

    let mut guess = String::new(); // created a new mutable variable that is currently bound to a new, empty instance of a String.

    io::stdin() // call stdin function from io module
        .read_line(&mut guess) // pass mutable reference & guess as argument
        .expect("Failed to read line"); // error handling to prevent crash

    println!("You guessed: {guess}");
}
