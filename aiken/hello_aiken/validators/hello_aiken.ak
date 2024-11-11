// validators/hello_world.ak
use aiken/collection/list
use aiken/crypto.{VerificationKeyHash}
use cardano/transaction.{OutputReference, Transaction}

// Define the Datum type, which will store the owner's verification key hash.
// In this contract, the datum represents the configuration set when locking
// funds in the contract, specifying the owner of the contract.
pub type Datum {
  owner: VerificationKeyHash,
}

// Define the Redeemer type, which includes a message as a byte array (msg).
// The redeemer is provided when spending from the contract and must contain
// the exact message "Hello, World!".
pub type Redeemer {
  msg: ByteArray,
}

// Define the hello_world validator, which checks if funds can be unlocked
// from the contract by validating certain conditions.
validator hello_world {
  // The spend function is triggered when attempting to spend funds.
  // It takes in the datum, redeemer, and transaction context.
  spend(
    datum: Option<Datum>,
    // Optional datum, should contain the owner's key hash.
    redeemer: Redeemer,
    // The redeemer with a message to validate.
    _own_ref: OutputReference,
    // Output reference, unused here.
    self: Transaction,
  ) {
    // The transaction context.
    // Expect the datum to contain an owner, extracting the verification key hash.
    expect Some(Datum { owner }) = datum

    // Validate that the redeemer message is exactly "Hello, World!".
    let must_say_hello = redeemer.msg == "Hello, World!"

    // Check if the transaction is signed by the owner specified in the datum.
    let must_be_signed = list.has(self.extra_signatories, owner)

    // Only allow spending if both conditions are met:
    // 1. The message in the redeemer is "Hello, World!".
    // 2. The transaction is signed by the owner.
    must_say_hello && must_be_signed
  }

  else(_) {
    fail
  }
}
// This validator is rudimentary but demonstrates key concepts:
// - It checks for a verification key hash (owner) in the datum and a message (msg) 
//   in the redeemer.
// - In the eUTxO model, the datum is set when locking funds in the contract,
//   and acts as a form of configuration.
// - The contract requires the owner's signature to unlock funds, similar to how
//   a typical non-script address works.
// - Additionally, the contract demands the exact message "Hello, World!" (UTF-8-encoded) 
//   to be passed in the redeemer when spending from the contract.
// 
// With these conditions, we’ve set up a basic contract requiring a specific
// signature and message to validate transactions.
