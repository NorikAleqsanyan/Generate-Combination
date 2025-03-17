# Combinations Generator API

This is a Node.js API that generates valid combinations from a list of items based on the prefix rule (items starting with the same letter cannot be combined) and stores the results in a MySQL database. The API also handles inserting the generated combinations into the database using transactions and returns the combinations to the client.


## Features

- Generate combinations from a list of items.
- Ensure combinations do not contain items starting with the same letter.
- Store combinations in a MySQL database.
- Use MySQL transactions for database integrity.
- Return the generated combinations to the client.

## Tech Stack

- **Node.js** - JavaScript runtime used for the backend.
- **Express.js** - Web framework for building the API.
- **MySQL2** - MySQL database connector for Node.js.
- **MySQL** - Relational database for storing items, combinations, and responses.

## Installation

To run this project locally, follow these steps:

1. Clone the repository:

```bash
git clone https://github.com/NorikAleqsanyan/Generate-Combination.git
