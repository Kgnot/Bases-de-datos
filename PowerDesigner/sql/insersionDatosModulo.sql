# para el pais:
INSERT INTO pais (idpais, nompais, dominio) VALUES ('063','Argentina','.ar');

INSERT INTO
    pais (idpais, nompais, dominio)
VALUES ('097', 'Bolivia', '.bo');

INSERT INTO
    pais (idpais, nompais, dominio)
VALUES ('105', 'Brasil', '.br');

INSERT INTO
    pais (idpais, nompais, dominio)
VALUES ('149', 'Canada', '.ca');

INSERT INTO
    pais (idpais, nompais, dominio)
VALUES ('169', 'Colombia', '.co');

INSERT INTO
    pais (idpais, nompais, dominio)
VALUES ('245', 'España', '.es');

INSERT INTO
    pais (idpais, nompais, dominio)
VALUES (
        '249',
        'Estados Unidos',
        '.us'
    );

INSERT INTO
    pais (idpais, nompais, dominio)
VALUES ('275', 'Francia', '.fr');

# Tipo Copia
INSERT INTO tipocopia (idtipocopia, desctipocopia) VALUES ('co', 'copia');

INSERT INTO
    tipocopia (idtipocopia, desctipocopia)
VALUES ('coo', 'copia oculta');

#Tipo carpeta

INSERT INTO tipocarpeta (idtipocarpeta, desctipocarpeta) VALUES ('rec', 'recibido');

INSERT INTO
    tipocarpeta (
        idtipocarpeta,
        desctipocarpeta
    )
VALUES ('env', 'enviado');

INSERT INTO
    tipocarpeta (
        idtipocarpeta,
        desctipocarpeta
    )
VALUES ('bor', 'borrador');

#Tipo archivo:
INSERT INTO tipoarchivo (idtipoarchivo, desctipoarchivo) VALUES ('pdf', 'documento portable');

INSERT INTO
    tipoarchivo (
        idtipoarchivo,
        desctipoarchivo
    )
VALUES ('doc', 'documento');

INSERT INTO
    tipoarchivo (
        idtipoarchivo,
        desctipoarchivo
    )
VALUES ('xls', 'hoja calculo');

INSERT INTO
    tipoarchivo (
        idtipoarchivo,
        desctipoarchivo
    )
VALUES ('gif', 'imagen');

INSERT INTO
    tipoarchivo (
        idtipoarchivo,
        desctipoarchivo
    )
VALUES ('bmp', 'imagen');

INSERT INTO
    tipoarchivo (
        idtipoarchivo,
        desctipoarchivo
    )
VALUES ('mp4', 'video');

INSERT INTO
    tipoarchivo (
        idtipoarchivo,
        desctipoarchivo
    )
VALUES ('avi', 'video');

INSERT INTO
    tipoarchivo (
        idtipoarchivo,
        desctipoarchivo
    )
VALUES ('mp3', 'musica');

INSERT INTO
    tipoarchivo (
        idtipoarchivo,
        desctipoarchivo
    )
VALUES ('exe', 'ejecutable');

#Estado
INSERT INTO estado (idestado, nombreestado) VALUES ('act', 'activo');

INSERT INTO
    estado (idestado, nombreestado)
VALUES ('in', 'inactivo');

#Categoria (añadida por mi)

INSERT INTO categoria (idcategoria,desccategoria) VALUES ('PRI','Principal');

INSERT INTO
    categoria (idcategoria, desccategoria)
VALUES ('PRO', 'Promoción');

INSERT INTO
    categoria (idcategoria, desccategoria)
VALUES ('SOC', 'Social');

INSERT INTO
    categoria (idcategoria, desccategoria)
VALUES ('NOT', 'Notificación');

INSERT INTO
    categoria (idcategoria, desccategoria)
VALUES ('FOR', 'Foro');

INSERT INTO
    categoria (idcategoria, desccategoria)
VALUES ('INP', 'Importante');

INSERT INTO
    categoria (idcategoria, desccategoria)
VALUES ('SAP', 'Spam');

INSERT INTO
    categoria (idcategoria, desccategoria)
VALUES ('PAP', 'Papelera');

#Aqui irian la parte de los usuarios y mensajes, etc

#usuarios:
INSERT INTO usuario (usuario,IDESTADO,IDPAIS,nombre,apellido,FECHANACIMIENTO,FECHACREACION,CORREOALTERNO,CELULAR)
VALUES
('Kgnot','act','169','Henry','Ricaurte Mora','02-03-2002',CURRENT_DATE,'juniorr2002m@gmail.com','3043512362');

INSERT INTO
    usuario (
        usuario,
        IDESTADO,
        IDPAIS,
        nombre,
        apellido,
        FECHANACIMIENTO,
        FECHACREACION,
        CORREOALTERNO,
        CELULAR
    )
VALUES (
        'Tommy',
        'act',
        '169',
        'Tomas',
        'Rodriguez Melo',
        '08-10-2000',
        CURRENT_DATE,
        'tomas_RM@gmail.com',
        '3152648759'
    );

INSERT INTO
    usuario (
        usuario,
        IDESTADO,
        IDPAIS,
        nombre,
        apellido,
        FECHANACIMIENTO,
        FECHACREACION,
        CORREOALTERNO,
        CELULAR
    )
VALUES (
        'Anna',
        'act',
        '169',
        'Anna',
        'López Pérez',
        '14-07-1995',
        CURRENT_DATE,
        'anna.lopez@gmail.com',
        '3209857462'
    );

INSERT INTO
    usuario (
        usuario,
        IDESTADO,
        IDPAIS,
        nombre,
        apellido,
        FECHANACIMIENTO,
        FECHACREACION,
        CORREOALTERNO,
        CELULAR
    )
VALUES (
        'JohnD',
        'act',
        '063',
        'John',
        'Doe Rivera',
        '21-11-1990',
        CURRENT_DATE,
        'john_doe@gmail.com',
        '3012548796'
    );

INSERT INTO
    usuario (
        usuario,
        IDESTADO,
        IDPAIS,
        nombre,
        apellido,
        FECHANACIMIENTO,
        FECHACREACION,
        CORREOALTERNO,
        CELULAR
    )
VALUES (
        'MariG',
        'act',
        '275',
        'Maria',
        'Gómez Sánchez',
        '09-05-1998',
        CURRENT_DATE,
        'maria_gomez@gmail.com',
        '3114759684'
    );

INSERT INTO
    usuario (
        usuario,
        IDESTADO,
        IDPAIS,
        nombre,
        apellido,
        FECHANACIMIENTO,
        FECHACREACION,
        CORREOALTERNO,
        CELULAR
    )
VALUES (
        'PaulP',
        'act',
        '097',
        'Paul',
        'Pérez Ortega',
        '03-12-1988',
        TRUNC(SYSDATE),
        'paul.perez@gmail.com',
        '3125689741'
    );
    #Cambie current_date por trunc(sysdate)

INSERT INTO
    usuario (
        usuario,
        IDESTADO,
        IDPAIS,
        nombre,
        apellido,
        FECHANACIMIENTO,
        FECHACREACION,
        CORREOALTERNO,
        CELULAR
    )
VALUES (
        'SofiH',
        'act',
        '245',
        'Sofia',
        'Hernández Torres',
        '27-01-1997',
        CURRENT_DATE,
        'sofia.hernandez@gmail.com',
        '3106589743'
    );

#Creamos el contacto:
INSERT INTO contacto (CONSECCONTACTO,usuario,USU_USUARIO,nombrecontacto,correocontacto)
VALUES
(1,'Kgnot','Kgnot',(select nombre from usuario where usuario = 'Kgnot'),'hricaurtem@bd.edu.co');

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        2,
        'Tommy',
        'Tommy',
        (
            select nombre
            from usuario
            where
                usuario = 'Tommy'
        ),
        'trodiguezm@bd.edu.co'
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        3,
        'Anna',
        'Anna',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'Anna'
        ),
        'anna.lopez_contact@bd.edu.co'
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        4,
        'JohnD',
        'JohnD',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'JohnD'
        ),
        'john_doe_contact@bd.edu.co'
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        5,
        'MariaG',
        'MariaG',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'MariG'
        ),
        'maria_gomez_contact@bd.edu.co'
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        6,
        'PaulP',
        'PaulP',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'PaulP'
        ),
        'paul.perez_contact@bd.edu.co'
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        7,
        'SofiH',
        'SofiH',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'SofiH'
        ),
        'sofia.hernandez@bd.edu.co'
    );

# Agregaremos a hora los contactos a otros usuarios: ||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 

-- Contactos para Kgnot
INSERT INTO contacto (CONSECCONTACTO, usuario, USU_USUARIO, nombrecontacto, correocontacto)
VALUES (8, 'Kgnot', 'Tommy', (SELECT nombre FROM usuario WHERE usuario = 'Tommy'), (select c.correocontacto from usuario u, contacto c where u.usuario = 'Tommy' and c.usu_usuario='Tommy'  AND ROWNUM = 1;

));

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        9,
        'Kgnot',
        'Anna',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'Anna'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'Anna'
                AND c.usu_usuario = 'Anna'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        10,
        'Kgnot',
        'JohnD',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'JohnD'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'JohnD'
                AND c.usu_usuario = 'JohnD'
                AND ROWNUM = 1
        )
    );

-- Contactos para Tommy
INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        11,
        'Tommy',
        'Kgnot',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'Kgnot'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'Kgnot'
                AND c.usu_usuario = 'Kgnot'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        12,
        'Tommy',
        'Anna',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'Anna'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'Anna'
                AND c.usu_usuario = 'Anna'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        13,
        'Tommy',
        'PaulP',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'PaulP'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'PaulP'
                AND c.usu_usuario = 'PaulP'
                AND ROWNUM = 1
        )
    );

-- Contactos para Anna
INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        14,
        'Anna',
        'JohnD',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'JohnD'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'JohnD'
                AND c.usu_usuario = 'JohnD'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        15,
        'Anna',
        'SofiH',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'SofiH'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'SofiH'
                AND c.usu_usuario = 'SofiH'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        16,
        'Anna',
        'MariG',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'MariG'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'MariG'
                AND c.usu_usuario = 'MariG'
                AND ROWNUM = 1
        )
    );

-- Contactos para JohnD
INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        17,
        'JohnD',
        'PaulP',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'PaulP'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'PaulP'
                AND c.usu_usuario = 'PaulP'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        18,
        'JohnD',
        'SofiH',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'SofiH'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'SofiH'
                AND c.usu_usuario = 'SofiH'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        19,
        'JohnD',
        'MariG',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'MariG'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'MariG'
                AND c.usu_usuario = 'MariG'
                AND ROWNUM = 1
        )
    );

-- Contactos para MariaG
INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        20,
        'MariG',
        'JohnD',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'JohnD'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'JohnD'
                AND c.usu_usuario = 'JohnD'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        21,
        'MariG',
        'PaulP',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'PaulP'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'PaulP'
                AND c.usu_usuario = 'PaulP'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        22,
        'MariG',
        'Kgnot',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'Kgnot'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'Kgnot'
                AND c.usu_usuario = 'Kgnot'
                AND ROWNUM = 1
        )
    );

-- Contactos para PaulP
INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        23,
        'PaulP',
        'Tommy',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'Tommy'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'Tommy'
                AND c.usu_usuario = 'Tommy'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        24,
        'PaulP',
        'Anna',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'Anna'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'Anna'
                AND c.usu_usuario = 'Anna'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        25,
        'PaulP',
        'SofiH',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'SofiH'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'SofiH'
                AND c.usu_usuario = 'SofiH'
                AND ROWNUM = 1
        )
    );

-- Contactos para SofiH
INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        26,
        'SofiH',
        'MariG',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'MariG'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'MariG'
                AND c.usu_usuario = 'MariG'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        27,
        'SofiH',
        'JohnD',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'JohnD'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'JohnD'
                AND c.usu_usuario = 'JohnD'
                AND ROWNUM = 1
        )
    );

INSERT INTO
    contacto (
        CONSECCONTACTO,
        usuario,
        USU_USUARIO,
        nombrecontacto,
        correocontacto
    )
VALUES (
        28,
        'SofiH',
        'Tommy',
        (
            SELECT nombre
            FROM usuario
            WHERE
                usuario = 'Tommy'
        ),
        (
            SELECT c.correocontacto
            FROM usuario u, contacto c
            WHERE
                u.usuario = 'Tommy'
                AND c.usu_usuario = 'Tommy'
                AND ROWNUM = 1
        )
    );