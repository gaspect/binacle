CREATE TABLE IF NOT EXISTS estandares.nanda_clase ( 
    id SERIAL PRIMARY KEY, 
    dominio_fk INTEGER, 
    clase TEXT NOT NULL, 
    nombre TEXT NOT NULL, 
    version TEXT NOT NULL, 
    deleted BOOLEAN DEFAULT FALSE, 
    CONSTRAINT nanda_dominio_fk FOREIGN KEY (dominio_fk) REFERENCES estandares.nanda_dominio(id) 
);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (1,'clase1', 'Toma de conciencia de la salud', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (1,'clase2', 'Gestión de la salud', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (2,'clase1', 'Ingestión', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (2,'clase2', 'Digestión', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (2,'clase3', 'Absorción', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (2,'clase4', 'Metabolismo', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (2,'clase5', 'Hidratación', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (3,'clase1', 'Función urinaria', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (3,'clase2', 'Función gastrointestinal', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (3,'clase3', 'Función tegumentaria', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (3,'clase4', 'Función respiratoria', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (4,'clase1', 'Sueño/Reposo', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (4,'clase2', 'Actividad/ejercicio', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (4,'clase3', 'Equilibrio de la energía', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (4,'clase4', 'Respuestas cardiovasculares/pulmonares', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (4,'clase5', 'Autocuidado', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (5,'clase1', 'Atención', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (5,'clase2', 'Orientación', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (5,'clase3', 'Sensación/percepción', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (5,'clase4', 'Cognición', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (5,'clase5', 'Comunicación', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (6,'clase1', 'Autoconcepto', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (6,'clase2', 'Autoestima', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (6,'clase3', 'Imagen corporal', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (7,'clase1', 'Roles de cuidador', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (7,'clase2', 'Relaciones familiares', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (7,'clase3', 'Desempeño del rol', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (8,'clase1', 'Identidad sexual', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (8,'clase2', 'Función sexual', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (8,'clase3', 'Reproducción', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (9,'clase1', 'Respuestas postraumáticas', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (9,'clase2', 'Respuestas de afrontamiento', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (9,'clase3', 'Estrés neurocomportamental', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (10,'clase1', 'Valores', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (10,'clase2', 'Creencias', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (10,'clase3', 'Congruencia entre valores/creencias/acciones', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (11,'clase1', 'Infección', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (11,'clase2', 'Lesión física', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (11,'clase3', 'Violencia', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (11,'clase4', 'Peligros del entorno', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (11,'clase5', 'Procesos defensivos', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (11,'clase6', 'Termorregulación', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (12,'clase1', 'Confort físico', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (12,'clase2', 'Confort del entorno', '1', FALSE);
insert  into  estandares.nanda_clase(dominio_fk, clase, nombre, version, deleted) values (12,'clase3', 'Confort social', '1', FALSE);
