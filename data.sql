/* Populate database with sample data. */

INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals VALUES (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals VALUES (4, 'Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO animals VALUES (5, 'CHarmander', '2020-02-8', 0, FALSE, -11),(6, 'Plantmon', '2021-11-15', 2, TRUE, -5.7),(7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13),(8, 'Angemon', '2005-06-12', 1, TRUE, -45),(9, 'Boarmon', '2005-06-7', 7, TRUE, 20.4),(10, 'Blossom', '1998-10-13', 3, TRUE, 17),(11, 'Ditto', '2022-05-14', 4, TRUE, 22);

/*owners table data*/
INSERT INTO owners VALUES (DEFAULT, 'Sam Smith', 34),(DEFAULT, 'Jennifer Orwell', 19),(DEFAULT, 'Bob', 45),(DEFAULT, 'Melody Pond', 77),(DEFAULT, 'Dean Winchester', 14),(DEFAULT, 'Jodie Whittaker', 38);

/*species table data*/
INSERT INTO species VALUES (DEFAULT, 'Pokemon'),(DEFAULT, 'Digimon');

UPDATE animals SET species_id = 1 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 2 WHERE species_id IS NULL;