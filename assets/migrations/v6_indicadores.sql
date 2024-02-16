CREATE TABLE IF NOT EXISTS estandares.nanda_indicadores ( 
    id SERIAL PRIMARY KEY, 
    escala_fk INTEGER, 
    noc_fk INTEGER, 
    codigo TEXT NOT NULL, 
    nombre TEXT NOT NULL, 
    version TEXT NOT NULL, 
    deleted BOOLEAN DEFAULT FALSE, 
    CONSTRAINT nanda_escala_fk FOREIGN KEY (escala_fk) REFERENCES estandares.nanda_escala(id), 
    CONSTRAINT nanda_noc_fk FOREIGN KEY (noc_fk) REFERENCES estandares.nanda_noc(id) 
);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 4, '000101', 'Realización de la rutina habitual.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 4, '000102', 'Actividad.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 4, '000104', 'Concentración.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 4, '000106', 'Resistencia muscular.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 4, '000107', 'Patrón alimentario.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 4, '000108', 'Libido.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 4, '000109', 'Recuperación de la energía con el descanso.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 3, '000110', 'Agotamiento.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 3, '000111', 'Letargo.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 4, '000112', 'Concentración sanguínea de oxígeno.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 4, '000113', 'Hemoglobina.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 4, '000114', 'Hematocrito.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 4, '000115', 'Glucemia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 4, '000116', 'Electrólitos séricos.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (458, 3, '000118', 'Fatiga.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010301', 'Desea estar de pie.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010302', 'Se apoya en el mobiliario para caminar.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010303', 'Intenta dar pasos solo.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010304', 'Se agarra con precisión.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010305', 'Señala con el dedo índice.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010306', 'Golpea un bloque contra otro.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010307', 'Bebe de una taza.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010308', 'Come con los dedos.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010309', 'Come con la cuchara.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010310', 'Utiliza un vocabulario entre una y tres palabras además de "mamá" y "papá".', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010311', 'Imita vocalizaciones.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010312', 'Busca objetos escondidos o que se caen', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010313', 'Participa en juegos sociales.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (256, 9, '010314', 'Dice adiós con la mano.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (288, 4, '020201', 'Equilibrio en bipedestación.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (288, 4, '020202', 'Equilibrio en sedestación.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (288, 4, '020203', 'Equilibrio al caminar.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (288, 3, '020205', 'Tambaleo.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (288, 3, '020206', 'Mareo.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (288, 3, '020207', 'Agitación.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (288, 3, '020208', 'Tropiezo.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (288, 4, '020209', 'Equilibro sobre un pie.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (288, 4, '020210', 'Equilibrio mientras cambia el equilibrio de un pie a otro.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (288, 4, '020211', 'Postura.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 1, '040402', 'Diuresis.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 1, '040403', 'Equilibrio electrolítico y ácido-base.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 1, '040405', 'Ruidos intestinales.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040407', 'Sed anómala.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040408', 'Dolor abdominal.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040409', 'Naúseas.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040410', 'Vómitos.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040411', 'Deficiencias de malabsorción.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040412', 'Gastritis crónica.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040413', 'Distensión abdominal.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040414', 'Ascitis.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040415', 'Varices gastrointestinales.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040416', 'Estreñimiento.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040417', 'Diarrea.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 1, '040418', 'Densidad urinaria específica.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 1, '040419', 'Nitrógeno ureico sanguíneo.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 1, '040420', 'Creatinina plasmática.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 1, '040421', 'Pruebas de función hepática.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 1, '040422', 'Enzimas pancreáticas.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 1, '040424', 'Presión sanguínea diastólica.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 1, '040425', 'Presión sanguínea sistólica.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 1, '040426', 'Presión arterial media.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040427', 'Equilibrio de líquidos alterado.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (424, 3, '040428', 'Pérdida de apetito.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 4, '091201', 'Abre los ojos a estímulos externos.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 4, '091202', 'Orientación cognitiva.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 4, '091203', 'Comunicación apropiada a la situación.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 4, '091204', 'Obedece órdenes.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 4, '091205', 'Respuestas motoras a estímulos nocivos.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 4, '091206', 'Atiende a los estímulos ambientales.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 3, '091207', 'Actividad comicial.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 3, '091209', 'Flexión anormal.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 3, '091210', 'Extensión anormal.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 3, '091211', 'Estupor.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 3, '091212', 'Estado de trance.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 3, '091213', 'Delirio.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (322, 3, '091214', 'Coma.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121401', 'Dificultad para procesar la información.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121402', 'Inquietud.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121403', 'Frustración.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121404', 'Irritabilidad.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121405', 'Camina de un lado para otro.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121406', 'Movimientos repetitivos.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121407', 'Incapacidad para estar sentado.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121408', 'Dificultad para continuar las tareas.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121409', 'Se resiste a la ayuda.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121410', 'Combatividad.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121411', 'Se revuelca en la cama.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121412', 'Se arranca los tubos o las sujeciones.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121413', 'Gestos repetitivos.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121414', 'Se agarra.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121415', 'Acapara.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121416', 'Golpea.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121417', 'Patalea.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121418', 'Lanza.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121419', 'Escupe.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121420', 'Muerde.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121421', 'Labilidad emocional.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121422', 'Arrebatos verbales.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121423', 'Verbalizaciones inadecuadas.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121424', 'Gestos inadecuados.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121425', 'Desinhibición.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121426', 'Sueño interrumpido.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121427', 'Pérdida de peso.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121428', 'Deshidratación.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121429', 'Aumento de la presión arterial.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121430', 'Aumento de la frecuencia del pulso radial.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (390, 3, '121431', 'Aumento de la frecuencia respiratoria.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130001', 'Tranquilidad.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130002', 'Renuncia al concepto previo de salud.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130003', 'Calma.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130007', 'Expresa sentimientos sobre el estado de salud.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130008', 'Reconocimiento de la realidad de la situación de salud.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130009', 'Búsqueda de información.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130010', 'Superación de la situación de salud.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130011', 'Toma de decisiones relacionadas con la salud.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130012', 'Clarificación de valores percibidos.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130013', 'Renovación de un sentimiento de ganancia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130014', 'Realización de tareas de cuidados personales.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130016', 'Mantiene las relaciones.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130017', 'Se adapta al cambio en el estado de salud.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130018', 'Muestra resistencia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130019', 'Clarificación de prioridades vitales.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (1, 9, '130020', 'Expresa consideración por sí mismo positiva.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (53, 9, '140601', 'Se contiene para acumular medios para autolesionarse.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (53, 9, '140604', 'Mantiene el compromiso de no autolesionarse.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (53, 9, '140605', 'Mantiene el control sin supervisión.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (53, 9, '140606', 'No se autolesiona.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (53, 9, '140608', 'Obtiene ayuda cuando es necesario.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (53, 9, '140609', 'Utiliza los grupos de apoyo disponibles.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (53, 9, '140610', 'Utiliza la medicación según prescripción.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (53, 9, '140611', 'Participa en actividades de fomento de la salud mental.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (53, 9, '140612', 'Sigue el régimen terapéutico.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (53, 9, '140613', 'Utiliza estrategias efectivas de afrontamiento.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150201', 'Divulgación si es apropiado/procedente.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150202', 'Receptividad si es apropiado/procedente.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150203', 'Cooperación con los demás.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150204', 'Sensibilidad con los demás.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150205', 'Uso de la asertividad si procede.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150206', 'Afrontación si precede.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150207', 'Mostrar consideración.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150208', 'Mostrar legitimidad.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150209', 'Mostrar calidez.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150210', 'Mostrar estabilidad.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150211', 'Parecer relajado.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150212', 'Relaciones con los demás.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150213', 'Mostrar la verdad.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150214', 'Comprometerse.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (356, 9, '150216', 'Utilizar estrategias de resolución de conflictos.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181701', 'Opciones de nacimiento.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181702', 'Papel de la comadrona.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181703', 'Signos y síntomas del parto.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181704', 'Estadios del parto y alumbramiento.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181705', 'Métodos de control del dolor de parto y alumbramiento.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181706', 'Técnicas de respiración efectiva.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181707', 'Técnicas de relajación efectivas.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181708', 'Postura efectiva.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181709', 'Posibles procedimientos médicos.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181710', 'Posibles complicaciones del parto.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181711', 'Técnicas de empuje efectivo.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181712', 'Alumbramiento de la placenta.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (172, 15, '181714', 'Alumbramiento del bebé.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182002', 'Papel de la nutrición en el control de la glucemia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182003', 'Plan de comidas prescrito.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182004', 'Estrategias para cumplir la dieta.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182005', 'Papel del ejercicio en el control de la glucemia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182006', 'Hiperglucemia y síntomas relacionados.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182007', 'Prevención de hiperglucemia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182008', 'Procedimientos a seguir para tratar la hiperglucemia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182009', 'Hipoglucemia y síntomas relacionados.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182010', 'Prevención de hipoglucemia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182011', 'Procedimientos a seguir para tratar la hipoglucemia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182012', 'Valores límites de glucemia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182013', 'Impacto de una enfermedad aguda sobre la glucemia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182015', 'Acciones a realizar en relación a la glucemia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182016', 'Régimen de insulina prescrito.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182018', 'Plan de rotación de las zonas de punción.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182019', 'Comienzo, pico y duración de la insulina prescrita.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182020', 'Régimen de hipoglucemiantes orales prescrito.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182023', 'Prácticas de cuidados de los pies.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182024', 'Beneficios de controlar la diabetes.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182027', 'Técnica adecuada para preparar y administrar insulina.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182028', 'Procedimiento correcto para el análisis de cetonuria.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182029', 'Importancia de la exploración ocular con la pupila dilatada y del test de agudeza visual por parte de un oftalmólogo.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182030', 'Causa y factores contribuyentes.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182031', 'Signos y síntomas de enfermedad precoz.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182032', 'Rol del sueño en el control de la glucosa en sangre.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182033', 'Cómo utilizar un dispositivo de monitorización.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182034', 'Uso correcto de la insulina.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182035', 'Eliminación adecuada de jeringas y agujas.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182036', 'Uso correcto de la medicación prescrita.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182037', 'Uso correcto de la medicación sin prescripción.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182038', 'Almacenamiento adecuado de la medicación.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182039', 'Efectos terapéuticos de la medicación.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182040', 'Efectos secundarios de la medicación.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182041', 'Efectos adversos de la medicación.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182042', 'Cuándo obtener ayuda de un profesional sanitario.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (120, 15, '182043', 'Fuentes acreditadas de información sobre la diabetes.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230203', 'Nauseas.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230204', 'Vómitos.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230205', 'Debilidad.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230206', 'Malestar general.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230207', 'Anorexia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230208', 'Insomnio.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230209', 'Edema.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230210', 'Vértigo.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230211', 'Prurito.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 1, '230212', 'Tasa de reducción de urea (TRU) >= 65%', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 1, '230214', 'Potasio en sangre ERE.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 1, '230216', 'Presión arterial.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 1, '230217', 'Suero serológico.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230218', 'Ascitis.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230219', 'Rampas musculares.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 1, '230220', 'Creatinina sérica.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 1, '230221', 'Calcio sérico.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 1, '230222', 'Bicarbonato sérico.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 1, '230223', 'Magnesio sérico.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 1, '230224', 'Fósforo sérico.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 1, '230225', 'Aclaramiento de creatinina.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 1, '230226', 'Cociente nitrógeno ureico/creatinina en sangre.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230227', 'Anemia.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230228', 'Aumento de peso.', '1', FALSE);
insert  into  estandares.nanda_indicadores(noc_fk, escala_fk, codigo, nombre, version, deleted) values (2, 3, '230229', 'Concentración alterada.', '1', FALSE);
