const express = require('express');
const mysql = require('mysql2');
const app = express();
const port = 3000;

app.use(express.json());

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'combinationgenerator.db'
});

connection.connect(err => {
    if (err) {
        console.error('Error connecting to MySQL:', err.stack);
        return;
    }
    console.log('Connected to MySQL');
});


function generateCombinations(arr, length) {
    if (arr.length < length) {
        return { message: "error" };
    }
    const items = [];
    for (let i = 0; i < arr.length; i++) {
        for (let j = 1; j <= arr[i]; j++) {
            items.push(String.fromCharCode(65 + i) + j);
        }
    }
    const result = [];

    function recurs(index, temp) {
        if (temp.length == length) {
            result.push([...temp]);
            return;
        }
        for (let j = index; j < items.length; j++) {
            if (temp.some((elm) => elm[0] === items[j][0])) continue;
            temp.push(items[j]);
            recurs(j + 1, temp);
            temp.pop();
        }
    }

    recurs(0, []);
    return result;
}

app.post('/generate', (req, res) => {
    const { items, length } = req.body;

    const valid = generateCombinations(items, length);

    connection.beginTransaction(err => {
        if (err) {
            return res.status(500).json({ error: 'Transaction start failed' });
        }

        connection.query('INSERT INTO combinations (combination) VALUES (?)', [JSON.stringify(valid)], (err, result) => {
            if (err) {
                return connection.rollback(() => {
                    res.status(500).json({ error: 'Insertion into combinations failed' });
                });
            }

            const combinationId = result.insertId;

            connection.query('INSERT INTO responses (combinations_id, response) VALUES (?, ?)', [combinationId, JSON.stringify(valid)], (err, result) => {
                if (err) {
                    return connection.rollback(() => {
                        res.status(500).json({ error: 'Insertion into responses failed' });
                    });
                }

                connection.commit(err => {
                    if (err) {
                        return connection.rollback(() => {
                            res.status(500).json({ error: 'Commit failed' });
                        });
                    }

                    res.status(200).json({
                        id: combinationId,
                        combination: valid
                    });
                });
            });
        });
    });
});


app.listen(port, () => {
    console.log(`API server running at http://localhost:${port}`);
});