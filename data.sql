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

/*insert species_id*/
UPDATE animals SET species_id = 1 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 2 WHERE species_id IS NULL;

/*insert owner_id*/
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon','Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon','Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander','Squirtle','Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon','Boarmon');

/*insert data into vets table*/
INSERT INTO vets VALUES (DEFAULT, 'William Tatcher', 45, '2000-04-23'),(DEFAULT, 'Maisy Smith', 26, '2019-01-17'),(DEFAULT, 'Stephanie Mendez', 64, '1981-05-04'),(DEFAULT, 'Jack Harkness', 38, '2008-06-08');

/*insert data into spec. table*/
INSERT INTO specializations VALUES (1,1),(3,1),(3,2),(4,2);

/*my animals id column is a bit different from the beginning*/
select name, id from animals;
    name    | id
------------+----
 Agumon     |  1
 Gabumon    |  2
 Pikachu    |  5
 Devimon    |  3
 Plantmon   |  7
 Boarmon    |  4
 Angemon    |  8
 Blossom    |  6
 Squirtle   | 10
 Charmander |  9
(10 rows)


/*insert data into visits table*/
INSERT INTO visits VALUES (1, 1, '2020-05-24'),(3, 1, '2020-06-22'),(4, 2, '2021-02-02'),(2, 5, '2020-01-05'),(2, 5, '2020-03-08'),(2, 5, '2020-05-14'),(3, 3, '2021-05-04'),(4, 9, '2021-02-24'),(2, 7, '2019-12-21'),(1, 7, '2020-08-10'),(2, 7, '2021-04-07'),(3, 10, '2019-09-29'),(4, 8, '2020-10-03'),(4, 8, '2020-11-04'),(2, 4, '2019-01-24'),(2, 4, '2019-05-15'),(2, 4, '2020-02-27'),(2, 4, '2020-08-03'),(3, 6, '2020-05-24'),(1, 6, '2021-01-11');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';