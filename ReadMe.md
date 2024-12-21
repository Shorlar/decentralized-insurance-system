# Decentralized Insurance Contract

This project implements a decentralized insurance system using Clarity smart contracts on the Stacks blockchain. The contract allows users to create and manage insurance policies.

## Contract Functions

### `get-policy`

**Description**: Retrieves the details of an insurance policy for a given policy holder.

**Parameters**:
- `policy-holder` (principal): The principal address of the policy holder.

**Returns**: A tuple containing the policy details if the policy exists, otherwise `none`.

### `create-policy`

**Description**: Creates a new insurance policy.

**Parameters**:
- `premium` (uint): The premium amount for the policy.
- `coverage` (uint): The coverage amount for the policy.
- `trigger-event` (uint): The event that triggers the policy.

**Returns**: The policy ID if the policy is created successfully, otherwise an error code.

**Error Codes**:
- `u1000`: Invalid input (premium, coverage, or trigger-event is zero).

## Usage

### Deploying the Contract

1. Clone the repository:
    ```sh
    git clone https://github.com/your-repo/decentralized-insurance-system.git
    cd decentralized-insurance-system
    ```

2. Deploy the contract using Clarinet:
    ```sh
    clarinet deploy
    ```

### Running Tests

1. Run the tests using Clarinet:
    ```sh
    clarinet test
    ```

## License

This project is licensed under the MIT License. See the LICENSE file for details.