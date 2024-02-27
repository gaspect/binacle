CREATE TABLE IF NOT EXISTS estandares.nanda_dominio ( 
    id SERIAL PRIMARY KEY, 
    dominio TEXT NOT NULL, 
    nombre TEXT NOT NULL, 
    version TEXT NOT NULL, 
    eliminado BOOLEAN DEFAULT FALSE 
);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio1', 'PROMOCIÓN DE LA SALUD', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio2', 'NUTRICIÓN ', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio3', 'ELIMINACIÓN E INTERCAMBIO', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio4', 'ACTIVIDAD/REPOSO', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio5', 'PERCEPCIÓN/COGNICIÓN', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio6', 'AUTOPERCEPCIÓN', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio7', 'ROL/RELACIONES', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio8', 'SEXUALIDAD', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio9', 'AFRONTAMIENTO/TOLERANCIA AL ESTRÉS', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio10', 'PRINCIPIOS VITALES', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio11', 'SEGURIDAD/PROTECCIÓN', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio12', 'CONFORT', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio13', 'CRECIMIENTO/DESARROLLO', '1', FALSE);
