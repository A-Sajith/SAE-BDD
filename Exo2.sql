CREATE TABLE region ( 
region_code INTEGER PRIMARY KEY NOT NULL,
name VARCHAR(255)
) ; 

CREATE TABLE country (
 id_country SERIAL PRIMARY KEY NOT NULL, 
 name VARCHAR(255) NOT NULL, 
 region_code INTEGER REFERENCES region 
 ) ; 

CREATE TABLE freedom (
id_country INTEGER REFERENCES country (id_country),
year INTEGER NOT NULL, 
civil_liberties INTEGER NOT NULL, 
political_rights INTEGER NOT NULL,
status VARCHAR(255) REFERENCES status (status), 
PRIMARY KEY (id_country, year) 
) ; 


CREATE TABLE Status (
    status INTEGER PRIMARY KEY NOT NULL
);

CREATE TEMPORARY TABLE tempo_data ( 
country VARCHAR(255), 
year INTEGER, 
civil_liberties INTEGER, 
political_rights INTEGER, 
status VARCHAR(255), 
region_code INTEGER, 
region_name VARCHAR(255), 
is_1dc INTEGER
) ;

LOAD DATA INFILE 'C:/Users/sajit/OneDrive/Documents/BUT1 INFO/LES SAE/SAE R105 Base de donnée/Exo 2/Script Donné/freedom.csv' 
INTO TABLE temporaire_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
