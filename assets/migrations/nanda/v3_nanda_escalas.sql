CREATE TABLE IF NOT EXISTS estandares.nanda_escala ( 
    id SERIAL PRIMARY KEY, 
    codigo TEXT NOT NULL, 
    nombre TEXT NOT NULL, 
    version TEXT NOT NULL, 
    eliminado BOOLEAN DEFAULT FALSE 
);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('1', 'Desviación grave del rango normal hasta SIN desviación del rango normal.', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('2', 'Desde Escasa hasta Excelente.', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('3', 'Desde Grave hasta Ninguno.', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('4', 'Desde Gravemente comprometido hasta NO comprometido.', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('5', 'Desde Inadecuado hasta Completamente Adecuado.', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('6', 'Desde muy Débil hasta muy Intenso.', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('7', 'Desde Ninguno hasta Extenso.', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('8', 'Desde No del todo satisfecho hasta Completamente Satisfecho.', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('9', 'Desde NUNCA demostrado hasta SIEMPRE demostrado.', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('10', 'Desde NUNCA positivo hasta SIEMPRE positivo.', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('11', 'Mayor de 10 hasta Ninguno.', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('12', 'Desde SIEMPRE demostrado hasta NUNCA demostrado.', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('13', 'Desde Extenso hasta Ninguno', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('14', 'Desde Intenso hasta Ninguno', '1', FALSE);
insert  into  estandares.nanda_escala(codigo, nombre, version, eliminado) values ('15', 'Desde Ningún conocimiento hasta Conocimiento extenso', '1', FALSE);
