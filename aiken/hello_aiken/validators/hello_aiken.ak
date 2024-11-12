// validators/hello_world.ak
use aiken/collection/list
use aiken/crypto.{VerificationKeyHash}
use aiken/primitive/string
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
    // We've added a manual message using the trace keyword.
    // The message is the one passed as redeemer.
    // With this, we can check that the value seen by the validator is the expected one.
    trace @"redeemer": string.from_bytearray(redeemer.msg)

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
    // 3. The ? is what we call the trace-if-false operator.
    // This operator will trace the expression it is attached to only if it evaluates to False.
    // This encourages an approach where validators are built as a conjunction or disjunction of requirements.
    // On unsuccessful executions, all the invalidated requirements will leave a trace!
    must_say_hello && must_be_signed?
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

test hello_world_example() {
  let datum =
    Datum { owner: #"00000000000000000000000000000000000000000000000000000000" }
  // helps pass
  let redeemer = Redeemer { msg: "Hello, World!" }
  // failing test
  // let redeemer = Redeemer { msg: "Aiken Rocks!" }
  let placeholder_utxo = OutputReference { transaction_id: "", output_index: 0 }
  hello_world.spend(
    Some(datum),
    redeemer,
    placeholder_utxo,
    // replace this
    // transaction.placeholder,
    // add this test to pass
    Transaction { ..transaction.placeholder, extra_signatories: [datum.owner] },
  )
}
