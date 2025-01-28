#insersion de un mensaje con un archivo adjunto desde Kgnot a Tommy 

insert into MENSAJE 
(
    USUARIO,
    IDMENSAJE,
    IDTIPOCARPETA,
    IDPAIS,
    MEN_USUARIO, 
    MEN_IDMENSAJE,
    IDCATEGORIA,
    ASUNTO,
    CUERPOMENSAJE,
    FECHAACCION,
    HORAACCION
)
VALUES
(
    'Kgnot',
    'A0001',
    'env',
    (select IDPAIS from USUARIO where USUARIO='Kgnot'),
    null,
    null,
    'PRI',
    'El asunto es: Hola Amigo',
    'Soy el cuerpo del mensaje y queria decir hola.',
    TRUNC(SYSDATE),
    TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS') -- Aqui igual :/
);

#ahora el recibido desde tommy: 
insert into MENSAJE 
(
    USUARIO,
    IDMENSAJE,
    IDTIPOCARPETA,
    IDPAIS,
    MEN_USUARIO, 
    MEN_IDMENSAJE,
    IDCATEGORIA,
    ASUNTO,
    CUERPOMENSAJE,
    FECHAACCION,
    HORAACCION
)
VALUES
(
    'Tommy',
    'A0001',
    'rec',
    (select IDPAIS from USUARIO where USUARIO='Kgnot'),
    null,
    null,
    'PRI',
    'El asunto es: Hola Amigo',
    'Soy el cuerpo del mensaje y queria decir hola.',
    TRUNC(SYSDATE),
    TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS') -- mirar si hay error aqui
);

#Mensaje 2: 

insert into MENSAJE 
(
    USUARIO,
    IDMENSAJE,
    IDTIPOCARPETA,
    IDPAIS,
    MEN_USUARIO, 
    MEN_IDMENSAJE,
    IDCATEGORIA,
    ASUNTO,
    CUERPOMENSAJE,
    FECHAACCION,
    HORAACCION
)
VALUES
(
    'Kgnot',
    'A0002',
    'env',
    (select IDPAIS from USUARIO where USUARIO='Kgnot'),
    null,
    null,
    'PRI',
    'El asunto es: Mensaje 2',
    'Soy el cuerpo del mensaje y queria decir hola.',
    TRUNC(SYSDATE),
    TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS') -- Aqui igual :/
);

#ahora el recibido desde tommy: 
insert into MENSAJE 
(
    USUARIO,
    IDMENSAJE,
    IDTIPOCARPETA,
    IDPAIS,
    MEN_USUARIO, 
    MEN_IDMENSAJE,
    IDCATEGORIA,
    ASUNTO,
    CUERPOMENSAJE,
    FECHAACCION,
    HORAACCION
)
VALUES
(
    'Tommy',
    'A0002',
    'rec',
    (select IDPAIS from USUARIO where USUARIO='Kgnot'),
    null,
    null,
    'PRI',
    'El asunto es: Mensaje 2',
    'Soy el cuerpo del mensaje y queria decir hola.',
    TRUNC(SYSDATE),
    TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS') -- mirar si hay error aqui
);