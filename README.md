# Terraform Console Examples for Debugging for_each Loops

This repository accompanies a [YouTube tutorial](https://youtu.be/71nsW_MRSbA) demonstrating how to use the Terraform console to debug and understand `for_each` loops and the `for` syntax in Terraform.

## What's Inside?

This repository provides a complex nested data structure written in HashiCorp Language (HCL), representing hypothetical resources and settings for various environments. These data structures are designed to mimic real-world use cases, helping you understand how you might work with similar structures in your own Terraform projects.

## Objective

The goal is to demonstrate the use of Terraform console and `for` syntax to extract and manipulate data, which is particularly useful when working with `for_each` loops. This repository does not create any real infrastructure but serves as a sandbox for learning and debugging Terraform data structures.

## Example

Consider this `for` expression:

```hcl
{ for k, v in local.global_config.environments : k => v.vpc.subnets.*.id }
```

This expression is iterating over each environment in the `global_config` map. For each environment (`k`), it accesses the list of subnet IDs within the VPC configuration (`v.vpc.subnets.*.id`) and creates a new map where each key is the name of an environment, and its value is the list of associated subnet IDs.

## Getting Started

1. Clone the repository:

    ```
    git clone https://github.com/iangrunt/terraform-console-example.git
    ```

2. Navigate to the directory:

    ```
    cd terraform-console-example
    ```

3. Create a `main.tf` file and wrap the contents of `giant-mess.hcl` in a `locals` block.

    ```
    vim main.tf
   ````

4. Start the Terraform console:

    ```
    terraform console
    ```

5. In the Terraform console, experiment with various `for` expressions and other Terraform functions on the data structures provided in the `main.tf` file.

## Further Reading

Here are some links to the official Terraform documentation that explain these concepts in more detail:

- [For expressions](https://www.terraform.io/docs/language/expressions/for.html)
- [For_each loops](https://www.terraform.io/docs/language/meta-arguments/for_each.html)
- [Splat expressions](https://www.terraform.io/docs/language/expressions/splat.html)

## Prerequisites

- Terraform v1.0 or later.

## Contribute

If you have suggestions for how this tutorial can be improved, feel free to open an issue or a pull request.
