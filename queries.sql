/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth between '2016-01-01' and '2019-12-31';
SELECT name FROM animals WHERE neutered=TRUE and escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name='Agumon' or name='Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered=TRUE;
SELECT * FROM animals WHERE name!='Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;

/* Milestone 2 queries */
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN;
UPDATE animals SET species= 'Digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'Pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name) FROM animals;
SELECT COUNT(name) FROM animals where escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg),MIN(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth between '1990-01-01' and '2000-12-31';

/*animals belong to Melody Pond*/
SELECT name,owner_id,full_name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

/*all animals that are pokemon*/
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

/*whole owners list and animals who have owners*/
SELECT name,full_name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;

/*number of animals by species*/
SELECT COUNT(animals.name),species.name FROM animals INNER JOIN species ON animals.species_id = species.id GROUP BY species.name;

/* digimons owned by Jennifer Orwell*/
SELECT owners.full_name, animals.name, species.name FROM animals JOIN owners ON owners.id = animals.owner_id JOIN species ON species.id = animals.species_id WHERE owners.full_name = 'Jennifer Orwell' and species.name = 'Digimon';

/*animals owned by Dean winchester that haven' tried to escape*/
SELECT A.name, O.full_name FROM animals A JOIN owners O ON O.id = A.owner_id WHERE O.full_name = 'Dean Winchester' and A.escape_attempts = 0;

/*who owns the most animal*/
SELECT owners.full_name, COUNT(animals.name) FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY count DESC LIMIT 1;


SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id WHERE visits.vets_id =1 ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(animals.name) FROM animals JOIN visits ON animals.id = visits.animals_id WHERE visits.vets_id =3;

SELECT vets.name,species.name FROM vets LEFT JOIN specializations ON vets.id = specializations.vets_id FULL JOIN species ON species.id = specializations.species_id;

SELECT animals.name FROM animals JOIN visits ON visits.animals_id = animals.id WHERE visits.vets_id =3 AND date_of_visit BETWEEN '2020-04-01' and '2020-08-30';

SELECT animals.name, COUNT(*) as visited FROM animals FULL JOIN visits ON animals.id = visits.animals_id FULL JOIN vets ON vets.id = visits.vets_id GROUP BY animals.name ORDER BY visited DESC LIMIT 1;

SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id WHERE visits.vets_id =2 ORDER BY visits.date_of_visit LIMIT 1;

SELECT animals.name, visits.date_of_visit, vets.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT visits.date_of_visit, vets.name, animals.name as animal, animals.species_id as animals_species, specializations.species_id as vet_species FROM visits INNER JOIN vets ON visits.vets_id = vets.id INNER JOIN animals ON visits.animals_id = animals.id FULL OUTER JOIN specializations ON vets.id = specializations.vets_id WHERE animals.species_id != specializations.species_id;

SELECT species.name, COUNT(visits.animals_id) FROM visits JOIN vets ON vets.id = visits.vets_id JOIN animals ON visits.animals_id = animals.id  JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY count DESC LIMIT 1;