/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';

SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31'

SELECT name from animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth from animals WHERE name= 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

SELECT * from animals WHERE neutered = true;

SELECT * from animals WHERE name != 'Gabumon';

SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/* second pullrequest */
begin;
update animals set species = 'unspecified';
select * from animals
--
rollback;
select * from animals
--
begin;
update animals set species = 'digimon' where name like '%mon';
update animals set species = 'pokemon' where species is NULL;
commit;

select * from aniamls;
--
begin;
delete from animals;

select * from animals;
--
rollback;
select * from animals;
--
begin;
delete from animals where date_of_birth > '2022-01-01';
SAVEPOINT my_mysavepoint;
select * from animals;
--
update animals set weight_kg = weight_kg * -1;
select * from animals;
--
ROllback to SAVEPOINT my_savepoint;
select * from animals;
--
UPDATE animals set weight_kg = weight_kg * -1 where weight_kg < 0;
COMMIT;

select * from animals;
--
SELECT COUNT(*) FROM animals;
--
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
--
SELECT AVG(weight_kg) FROM animals;
--
select neutered, MAX(escape_attempts) from animals group by neutered;
--
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
--
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


-- query multiple tables pr3
SELECT * from animals JOIN owners ON animals.id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT * from animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT * from owners LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.species_id) from animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT * from animals JOIN species ON animals.species_id = species.id JOIN owners ON animals.owner_id = owners.id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT * from animals JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.owner_id) from animals
JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name
ORDER BY COUNT(animals.owner_id) DESC LIMIT 1;
