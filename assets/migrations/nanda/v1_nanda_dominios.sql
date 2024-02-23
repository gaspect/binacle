CREATE TABLE IF NOT EXISTS estandares.nanda_dominio ( 
    id SERIAL PRIMARY KEY, 
    dominio TEXT NOT NULL, 
    nombre TEXT NOT NULL, 
    version TEXT NOT NULL, 
    eliminado BOOLEAN DEFAULT FALSE 
);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio1', 'Promoción de la salud', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio2', 'Nutrición ', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio3', 'Eliminación e Intercambio', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio4', 'Actividad/Reposo', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio5', 'Percepción/Cognición', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio6', 'Autopercepción', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio7', 'Rol/Relaciones', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio8', 'Sexualidad', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio9', 'Afrontamineto/Tolerancia al Estrés', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio10', 'Principios Vitales', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio11', 'Seguridad/Protección', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio12', 'Confort', '1', FALSE);
insert  into  estandares.nanda_dominio(dominio, nombre, version, eliminado) values ('dominio13', 'Crecimiento/Desarrollo', '1', FALSE);
