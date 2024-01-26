DROP DATABASE if EXISTS TechSolutions;
CREATE DATABASE TechSolutions;
USE TechSolutions;

-- Tabla de empleados
CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empleado VARCHAR(50) NOT NULL,
    apellido_empleado VARCHAR(50) NOT NULL,
    cargo_empleado VARCHAR(50) NOT NULL,
    salario_empleado NUMERIC NOT NULL,
    fecha_inicio_empleado DATE NOT NULL
);

-- Tabla para departamentos
CREATE TABLE Departamentos (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_departamento VARCHAR(50) NOT NULL,
	descripcion_departamento VARCHAR(50) NOT NULL,
	id_empleado INT
);

ALTER TABLE Departamentos
ADD CONSTRAINT FK_EmpleadoDepartamento
FOREIGN KEY (id_empleado) 
REFERENCES Empleados(id_empleado);

-- Tabla para proyectos
CREATE TABLE Proyectos (
    id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proyecto VARCHAR(100) NOT NULL,
	descripcion_proyecto VARCHAR(50) NOT NULL
);

-- Tabla de asignaciones de empleados a proyectos
CREATE TABLE Asignaciones_Proyectos (
    id_asignacion_proyecto INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    id_proyecto INT
);

ALTER TABLE Asignaciones_Proyectos
ADD CONSTRAINT FK_EmpleadoAsignacion
FOREIGN KEY (id_empleado) 
REFERENCES Empleados(id_empleado);

ALTER TABLE Asignaciones_Proyectos
ADD CONSTRAINT FK_ProyectoAsignacion
FOREIGN KEY (id_proyecto) 
REFERENCES Proyectos(id_proyecto);