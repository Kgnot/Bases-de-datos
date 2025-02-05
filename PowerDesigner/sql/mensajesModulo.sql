-- Mensaje 2: Kgnot -> Tommy
INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    'Kgnot', 'A0002', 'env', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Reunión de trabajo', 'Hola Tommy, ¿estás disponible para una reunión mañana?', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

INSERT INTO Destinatario (consecdestinatario, idpais, conseccontacto, idtipocopia, usuario, idmensaje)
VALUES (
    (SELECT MAX(d.consecdestinatario) + 1 FROM Destinatario d), '169', (SELECT c.conseccontacto FROM Contacto c WHERE LOWER(c.CORREOCONTACTO) LIKE 'trodiguezm@bd.edu.co' AND LOWER(c.usuario) LIKE 'kgnot'), 'co', 'Kgnot', 'A0002'
);

INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    (SELECT c.usuario FROM Contacto c WHERE 'trodiguezm@bd.edu.co' = c.correoContacto AND c.usuario = c.usu_usuario), 'A0002', 'rec', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Reunión de trabajo', 'Hola Tommy, ¿estás disponible para una reunión mañana?', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

-- Mensaje 3: Kgnot -> Tommy
INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    'Kgnot', 'A0003', 'env', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Actualización del proyecto', 'Tommy, necesito una actualización del proyecto para el viernes.', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

INSERT INTO Destinatario (consecdestinatario, idpais, conseccontacto, idtipocopia, usuario, idmensaje)
VALUES (
    (SELECT MAX(d.consecdestinatario) + 1 FROM Destinatario d), '169', (SELECT c.conseccontacto FROM Contacto c WHERE LOWER(c.CORREOCONTACTO) LIKE 'trodiguezm@bd.edu.co' AND LOWER(c.usuario) LIKE 'kgnot'), 'co', 'Kgnot', 'A0003'
);

INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    (SELECT c.usuario FROM Contacto c WHERE 'trodiguezm@bd.edu.co' = c.correoContacto AND c.usuario = c.usu_usuario), 'A0003', 'rec', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Actualización del proyecto', 'Tommy, necesito una actualización del proyecto para el viernes.', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

-- Mensaje 4: Kgnot -> Tommy
INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    'Kgnot', 'A0004', 'env', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Recordatorio de pago', 'Tommy, recuerda que el pago vence el próximo lunes.', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

INSERT INTO Destinatario (consecdestinatario, idpais, conseccontacto, idtipocopia, usuario, idmensaje)
VALUES (
    (SELECT MAX(d.consecdestinatario) + 1 FROM Destinatario d), '169', (SELECT c.conseccontacto FROM Contacto c WHERE LOWER(c.CORREOCONTACTO) LIKE 'trodiguezm@bd.edu.co' AND LOWER(c.usuario) LIKE 'kgnot'), 'co', 'Kgnot', 'A0004'
);

INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    (SELECT c.usuario FROM Contacto c WHERE 'trodiguezm@bd.edu.co' = c.correoContacto AND c.usuario = c.usu_usuario), 'A0004', 'rec', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Recordatorio de pago', 'Tommy, recuerda que el pago vence el próximo lunes.', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

-- Mensaje 5: Kgnot -> John Doe
INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    'Kgnot', 'A0005', 'env', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Nuevo proyecto', 'John, tenemos un nuevo proyecto para ti. ¿Puedes revisarlo?', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

INSERT INTO Destinatario (consecdestinatario, idpais, conseccontacto, idtipocopia, usuario, idmensaje)
VALUES (
    (SELECT MAX(d.consecdestinatario) + 1 FROM Destinatario d), '169', (SELECT c.conseccontacto FROM Contacto c WHERE LOWER(c.CORREOCONTACTO) LIKE 'john_doe_contact@bd.edu.co' AND LOWER(c.usuario) LIKE 'kgnot'), 'co', 'Kgnot', 'A0005'
);

INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    (SELECT c.usuario FROM Contacto c WHERE 'john_doe_contact@bd.edu.co' = c.correoContacto AND c.usuario = c.usu_usuario), 'A0005', 'rec', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Nuevo proyecto', 'John, tenemos un nuevo proyecto para ti. ¿Puedes revisarlo?', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

-- Mensaje 6: Kgnot -> Anna Lopez
INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    'Kgnot', 'A0006', 'env', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Revisión de diseño', 'Anna, necesito que revises el diseño del proyecto.', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

INSERT INTO Destinatario (consecdestinatario, idpais, conseccontacto, idtipocopia, usuario, idmensaje)
VALUES (
    (SELECT MAX(d.consecdestinatario) + 1 FROM Destinatario d), '169', (SELECT c.conseccontacto FROM Contacto c WHERE LOWER(c.CORREOCONTACTO) LIKE 'anna.lopez_contact@bd.edu.co' AND LOWER(c.usuario) LIKE 'kgnot'), 'co', 'Kgnot', 'A0006'
);

INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    (SELECT c.usuario FROM Contacto c WHERE 'anna.lopez_contact@bd.edu.co' = c.correoContacto AND c.usuario = c.usu_usuario), 'A0006', 'rec', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Revisión de diseño', 'Anna, necesito que revises el diseño del proyecto.', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

-- Mensaje 7: Kgnot -> John Doe
INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    'Kgnot', 'A0007', 'env', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Feedback del cliente', 'John, el cliente envió feedback. ¿Puedes revisarlo?', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

INSERT INTO Destinatario (consecdestinatario, idpais, conseccontacto, idtipocopia, usuario, idmensaje)
VALUES (
    (SELECT MAX(d.consecdestinatario) + 1 FROM Destinatario d), '169', (SELECT c.conseccontacto FROM Contacto c WHERE LOWER(c.CORREOCONTACTO) LIKE 'john_doe_contact@bd.edu.co' AND LOWER(c.usuario) LIKE 'kgnot'), 'co', 'Kgnot', 'A0007'
);

INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    (SELECT c.usuario FROM Contacto c WHERE 'john_doe_contact@bd.edu.co' = c.correoContacto AND c.usuario = c.usu_usuario), 'A0007', 'rec', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Feedback del cliente', 'John, el cliente envió feedback. ¿Puedes revisarlo?', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

-- Mensaje 8: Kgnot -> Anna Lopez
INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA, IDPAIS, MEN_USUARIO, MEN_IDMENSAJE, IDCATEGORIA, ASUNTO, CUERPOMENSAJE, FECHAACCION, HORAACCION)
VALUES (
    'Kgnot', 'A0008', 'env', (SELECT IDPAIS FROM USUARIO WHERE USUARIO = 'Kgnot'), NULL, NULL, 'PRI', 'Reunión de diseño', 'Anna, tenemos una reunión de diseño mañana a las 10 AM.', TRUNC(SYSDATE), TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')
);

INSERT INTO Destinatario (consecdestinatario, idpais, conseccontacto, idtipocopia, usuario, idmensaje)
VALUES (
    (SELECT MAX(d.consecdestinatario) + 1 FROM Destinatario d), '169', (SELECT c.conseccontacto FROM Contacto c WHERE LOWER(c.CORREOCONTACTO) LIKE 'anna.lopez_contact@bd.edu.co' AND LOWER(c.usuario) LIKE 'kgnot'), 'co', 'Kgnot', 'A0008'
);

INSERT INTO MENSAJE (USUARIO, IDMENSAJE, IDTIPOCARPETA