CREATE TABLE IF NOT EXISTS estandares.nanda_dominio ( 
    id SERIAL PRIMARY KEY, 
    dominio TEXT NOT NULL, 
    nombre TEXT NOT NULL, 
    version TEXT NOT NULL, 
    deleted BOOLEAN DEFAULT FALSE 
);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio1', 'PROMOCIÓN DE LA SALUD', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio2', 'NUTRICIÓN ', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio3', 'ELIMINACIÓN E INTERCAMBIO', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio4', 'ACTIVIDAD/REPOSO', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio5', 'PERCEPCIÓN/COGNICIÓN', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio6', 'AUTOPERCEPCIÓN', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio7', 'ROL/RELACIONES', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio8', 'SEXUALIDAD', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio9', 'AFRONTAMIENTO/TOLERANCIA AL ESTRÉS', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio10', 'PRINCIPIOS VITALES', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio11', 'SEGURIDAD/PROTECCIÓN', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio12', 'CONFORT', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, deleted) values ('dominio13', 'CRECIMIENTO/DESARROLLO', '1', FALSE);
