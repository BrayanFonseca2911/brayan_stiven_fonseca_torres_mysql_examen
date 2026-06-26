/* SECCIÓN 1: CONCEPTOS Y TEORÍA DE NORMALIZACIÓN (15 Minutos)
 Responda brevemente a las siguientes preguntas en su archivo de entrega.
 (0.5 puntos) Si una tabla tiene una llave primaria simple (de un solo campo) y ya cumple con la Primera Forma Normal (1NF), ¿por qué se dice que cumple automáticamente con la Segunda Forma Normal (2NF)? Justifique su respuesta.
	
	Rta: porque en la primera forma normal establece atomicidad lo que automaticamente se transforma como  segunda forma normal
	
 (0.5 puntos) Describa qué es una tabla puente o intermedia (mencionando su estructura de llaves) y en qué situaciones de modelado es obligatorio implementarla.
	
	Rta: en el ejercicio primero del taller podemos sacar como una tabla intermedia la tabla de los pedidos, ya que es un "puente por asi decirlo" a las tablas clientes y pedidos */

/*SECCION 2
  	
  	TABLA estudiante
  	ID_Inscripcion (Identificador único de la fila) PK
	studiante_Matricula (Código del alumno)
	Estudiante_Nombre
	Estudiante_Correo

	TABLA PROFESOR
	ID_Profesor  PK
	Profesor_Nombre
	
	
	TABLA CUBICULO
	id_cubiculo PK
	nombre_profesor
	id_profesor FK
	
	TABLA CURSO
	Curso_Codigo (Ejemplo: BD-101, PROG-202)
	Curso_Nombre (Ejemplo: Bases de Datos, Programación)
	Lista_Notas_Parciales (Ejemplo: "4.5, 3.8, 4.0")
	id_estudiantes  FK
	id_profesor  FK
	



*/
CREATE DATABASE escuela;
USE escuela;

CREATE TABLE IF NOT EXISTS estudiante(
id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
matricula VARCHAR (100) UNIQUE NOT NULL,
nombre VARCHAR (100) NOT NULL,
correo VARCHAR (100) NOT NULL
);

CREATE TABLE IF NOT EXISTS profesor(
id INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR (100) NOT NULL
);

CREATE TABLE IF NOT EXISTS cubiculo(
id INT PRIMARY KEY AUTO_INCREMENT,
nombre_profesor VARCHAR (100) NOT NULL,
id_profesor INT,
FOREIGN KEY (id_profesor) REFERENCES profesor(id)
);


CREATE TABLE IF NOT EXISTS notas(
id INT PRIMARY KEY AUTO_INCREMENT,
notas DECIMAL (10,2)
);

CREATE TABLE IF NOT EXISTS cursos(
id INT PRIMARY KEY AUTO_INCREMENT,
curso_codigo VARCHAR (100) UNIQUE NOT NULL,
curso_nombre VARCHAR (100) NOT NULL,
notas INT,
id_estudiantes INT,
id_profesor INT,
FOREIGN KEY (id_estudiantes) REFERENCES estudiante(id_inscripcion),
FOREIGN KEY (id_profesor) REFERENCES profesor(id),
FOREIGN KEY (notas) REFERENCES notas(id)
);





INSERT INTO estudiante(matricula, nombre , correo) VALUES
('4556813345','Brayan','nos@dnsd'),
('3456813345','Stiven','ndks@kdsksa'),
('3158813345','Fonseca','fsfsd@gf'),
('3154583345','Torres','fdfs@ddccc'),
('1156845345','Santiago','psdfspodf@kdsld'),
('2156813345','Herrera','fdsjfñ@dmmd'),
('3156813345','Ortiz','papaps@jdsja');


INSERT INTO profesor  (nombre) VALUES
('keila'),
('Andres'),
('bray'),
('Acrepusculo'),
('crepusculo'),
('carlos'),
('sergio');

INSERT INTO cubiculo (nombre_profesor) VALUES
('keila'),
('Andres'),
('bray'),
('Acrepusculo'),
('crepusculo'),
('carlos'),
('sergio');


INSERT INTO notas (notas) VALUES
('10'),
('9'),
('8'),
('7'),
('6'),
('5'),
('4');

INSERT INTO cursos  (curso_codigo, curso_nombre) VALUES
('101','nos'),
('120','nso'),
('845','odp'),
('745','das'),
('645','pdo'),
('554','dsc'),
('445','jsk');


-- SECCION 3

SELECT 
	c.curso_codigo,
	c.curso_nombre,
	n.notas
FROM cursos c
inner join notas n ON n.id = c.id
	





