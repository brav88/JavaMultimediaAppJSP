/*crear base de datos*/
CREATE DATABASE MultiMedia

/*mostrar las bases de datos*/
SHOW DATABASES

/*usar la base de datos*/
USE MultiMedia

/*mostrar las tablas*/
SHOW TABLE

/*creamos la primera tabla*/
CREATE TABLE Movies (
	id INT,
    name VARCHAR(50),
    director VARCHAR(50),
    date DATE,
    genre VARCHAR(50),
    country VARCHAR(10),
    poster VARCHAR(500)
)

/*mostrar los datos de una tabla*/
SELECT * FROM Movies WHERE id = 4
UPDATE Movies SET poster = '1.jpg' WHERE id = 1;
UPDATE Movies SET poster = '2.jpg' WHERE id = 2;
UPDATE Movies SET poster = '3.jpg' WHERE id = 3;

SELECT * FROM Movies WHERE name LIKE '%ava%'

/*insertar datos a una tabla*/
INSERT INTO Movies (id, name, director, date, genre, country)
VALUES (1, 'Avatar', 'James Cameron', '2009-12-18', 'Action', 'USA')

INSERT INTO Movies (id, name, director, date, genre, country)
VALUES (2, 'I am Legend', 'Francis Lawrence', '2007-12-14', 'Drama', 'USA')

INSERT INTO Movies (id, name, director, date, genre, country)
VALUES (3, 'Shutter Island', 'John Doe', '1997-01-14', 'Thriller', 'USA')

INSERT INTO Movies (id, name, director, date, genre, country)
VALUES (4, 'Predestination', 'Etan Hawk', '1995-05-20', 'Comedy', 'USA')

UPDATE Movies SET name='IT', director='John Smith', date='1995-05-20', genre='Thriller', country='USA'
WHERE id = 8

/*borrar todos los datos de una tabla*/
DELETE FROM Movies 

/*borrar un dato de una tabla*/
DELETE FROM Movies WHERE id = 2

/*TV Shows*/
CREATE TABLE Shows (
	id INT,
    name VARCHAR(50), 
    episodes INT,
    date DATE,
    genre VARCHAR(50),
    country VARCHAR(10),
    poster VARCHAR(500)
)

INSERT INTO Shows (id, name, episodes, date, genre, country)
VALUES (1, 'Breaking Bad', 89, '2009-12-18', 'Action', 'USA')

SELECT * FROM Shows

/*Login*/
CREATE TABLE Users (
	id INT,
    email VARCHAR(50),
    pwd VARCHAR(50),
    alias VARCHAR(50),
    poster VARCHAR(100)
)

insert into Users (id, email, pwd, alias, poster)
values (2, 'user2@domain.com','Admin$123','user2', '2.jpg')

SELECT * FROM Users where email = 'user1@domain.com' and pwd = 'Admin$123'
DROP TABLE Users


