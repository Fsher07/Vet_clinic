/* Database schema to keep the structure of entire database. */

CREATE TABLE animals ( id INT PRIMARY KEY NOT NULL, name VARCHAR, date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);

ALTER TABLE animals ADD COLUMN species VARCHAR(75);

/*Begin a transaction and rollback to remove changes*/
BEGIN;
ALTER TABLE animals RENAME COLUMN species TO unspecified;
SELECT unspecified FROM animals;
ROLLBACK;
SELECT species FROM animals;
