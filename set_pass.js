const fs = require('fs');
const bcrypt = require('bcrypt');
const mysql = require('mysql2/promise');
require('dotenv').config();

async function run() {
    try {
        const newHash = await bcrypt.hash('pss123', 10);
        const oldHash = '$2b$10$ONCFnNxhQ50BmPGih4PzVOlXAfdK8HT2k0.HMdkVaZUBN5mmCkZKe';

        // Update generate_seed.js
        if(fs.existsSync('generate_seed.js')) {
            let genSeed = fs.readFileSync('generate_seed.js', 'utf8');
            genSeed = genSeed.replace(oldHash, newHash);
            // Replace the comment line too
            genSeed = genSeed.replace("// 'password'", "// 'pss123'");
            fs.writeFileSync('generate_seed.js', genSeed);
        }

        // Update seed.sql
        if(fs.existsSync('seed.sql')) {
            let seedSql = fs.readFileSync('seed.sql', 'utf8');
            seedSql = seedSql.split(oldHash).join(newHash); // replaceAll
            fs.writeFileSync('seed.sql', seedSql);
        }

        // Update DB
        const pool = mysql.createPool({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || '',
            database: process.env.DB_NAME || 'ocbms',
        });
        await pool.query('UPDATE users SET password_hash = ?', [newHash]);
        console.log('Successfully updated everything to pss123');
        pool.end();
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
}
run();
