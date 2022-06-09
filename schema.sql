/* Database schema to keep the structure of entire database. */

CREATE TABLE animals ( id INT PRIMARY KEY NOT NULL, name VARCHAR, date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);

ALTER TABLE animals ADD COLUMN species VARCHAR(75);

/*Begin a transaction and rollback to remove changes*/
BEGIN;
ALTER TABLE animals RENAME COLUMN species TO unspecified;
SELECT unspecified FROM animals;
ROLLBACK;
SELECT species FROM animals;

CREATE TABLE owners ( id SERIAL, full_name VARCHAR(75), age INT, PRIMARY KEY(id));
CREATE TABLE species  ( id SERIAL, name VARCHAR(75), PRIMARY KEY(id));

/*Create table named owners*/
CREATE TABLE owners ( id SERIAL, full_name VARCHAR(75), age INT, PRIMARY KEY(id));

/*Create table named species*/
CREATE TABLE species  ( id SERIAL, name VARCHAR(75), PRIMARY KEY(id));

/*In animals table, id is set autoincremented primary key*/
BEGIN;
ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
COMMIT;

/*Remove species column*/
ALTER TABLE animals DROP COLUMN species;

/*Column references species table*/
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species (id);

/*Column references owners table*/
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners (id);
