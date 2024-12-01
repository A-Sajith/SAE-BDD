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

LOAD DATA INFILE 'freedom.csv' 
INTO TABLE temporaire_data
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



INSERT INTO Region (region_code, name)
SELECT DISTINCT région_code, région_name
FROM temp_data;

INSERT INTO Country (id_country, name, is_ldc, region_code)
SELECT DISTINCT id_country, country, is_ldc, région_code
FROM temp_data;

INSERT INTO Freedom (years, civil_liberties, political_rights, status, id_country)
SELECT DISTINCT year, civil_liberties, political_rights, status, id_country
FROM temp_data;

INSERT INTO Status (status)
SELECT DISTINCT status
FROM temp_data;

DROP TABLE tempo_data;
