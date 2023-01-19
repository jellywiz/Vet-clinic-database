/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

/* update the table animals by using alter */
Alter Table animals ADD COLUMN species VARCHAR(100);


-- query multiple tables pr3
CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  age INTEGER
)

CREATE TABLE species (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
)

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INTEGER;
ALTER TABLE animals ADD COLUMN owner_id INTEGER;


-----------------------------------
-- PR 4

CREATE Table vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  species_id INTEGER NOT NULL,
  vet_id INTEGER NOT NULL,
  FOREIGN KEY (species_id) REFERENCES species(id),
  FOREIGN KEY (vet_id) REFERENCES vet(id)
)

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  animals_id INTEGER NOT NULL,
  vet_id INTEGER NOT NULL,
  date_of_vist DATE NOT NULL,
  FOREIGN KEY (animals_id) REFERENCES animals(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
)
