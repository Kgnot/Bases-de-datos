/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     19/01/2025 10:54:19 a. m.                    */
/*==============================================================*/


alter table ARCHIVOADJUNTO
   drop constraint FK_ARCHIVOA_MENSAJE_A_MENSAJE;

alter table ARCHIVOADJUNTO
   drop constraint FK_ARCHIVOA_TIPOARCHI_TIPOARCH;

alter table CONTACTO
   drop constraint FK_CONTACTO_CONTACTOS_USUARIO;

alter table CONTACTO
   drop constraint FK_CONTACTO_USUARIO_Q_USUARIO;

alter table DESTINATARIO
   drop constraint FK_DESTINAT_CONTACTOD_CONTACTO;

alter table DESTINATARIO
   drop constraint FK_DESTINAT_MENSAJE_D_MENSAJE;

alter table DESTINATARIO
   drop constraint FK_DESTINAT_PAISDESTI_PAIS;

alter table DESTINATARIO
   drop constraint FK_DESTINAT_TIPOCOPIA_TIPOCOPI;

alter table MENSAJE
   drop constraint FK_MENSAJE_CATEGORIA_CATEGORI;

alter table MENSAJE
   drop constraint FK_MENSAJE_MENSAJESU_MENSAJE;

alter table MENSAJE
   drop constraint FK_MENSAJE_PAISMENSA_PAIS;

alter table MENSAJE
   drop constraint FK_MENSAJE_TIPOCARPE_TIPOCARP;

alter table MENSAJE
   drop constraint FK_MENSAJE_USUARIOME_USUARIO;

alter table USUARIO
   drop constraint FK_USUARIO_ESTADOUSU_ESTADO;

alter table USUARIO
   drop constraint FK_USUARIO_PAISUSUAR_PAIS;

drop index TIPOARCHIVO_ARCHIVOADJUNTO_FK;

drop index MENSAJE_ARCHIVOADJUNTO_FK;

drop table ARCHIVOADJUNTO cascade constraints;

drop table CATEGORIA cascade constraints;

drop index USUARIO_QUE_TAMBIEN_ES2_FK;

drop index CONTACTOS_DEL_USUARIO_FK;

drop table CONTACTO cascade constraints;

drop index TIPOCOPIA_DESTINATARIO_FK;

drop index PAISDESTINATARIO_FK;

drop index MENSAJE_DESTINATARIO_FK;

drop index CONTACTODESTINATARIO_FK;

drop table DESTINATARIO cascade constraints;

drop table ESTADO cascade constraints;

drop index USUARIOMENSAJE_FK;

drop index TIPOCARPETA_MENSAJE_FK;

drop index PAISMENSAJE_FK;

drop index MENSAJESUP_FK;

drop index CATEGORIAMENSAJE_FK;

drop table MENSAJE cascade constraints;

drop table PAIS cascade constraints;

drop table TIPOARCHIVO cascade constraints;

drop table TIPOCARPETA cascade constraints;

drop table TIPOCOPIA cascade constraints;

drop index PAISUSUARIO_FK;

drop index ESTADOUSUARIO_FK;

drop table USUARIO cascade constraints;

/*==============================================================*/
/* Table: ARCHIVOADJUNTO                                        */
/*==============================================================*/
create table ARCHIVOADJUNTO 
(
   CONSECARCHIVO        INTEGER              not null,
   IDTIPOARCHIVO        VARCHAR2(5)          not null,
   USUARIO              VARCHAR2(5)          not null,
   IDMENSAJE            VARCHAR2(5)          not null,
   NOMARCHIVO           VARCHAR2(30)         not null,
   constraint PK_ARCHIVOADJUNTO primary key (CONSECARCHIVO)
);

/*==============================================================*/
/* Index: MENSAJE_ARCHIVOADJUNTO_FK                             */
/*==============================================================*/
create index MENSAJE_ARCHIVOADJUNTO_FK on ARCHIVOADJUNTO (
   USUARIO ASC,
   IDMENSAJE ASC
);

/*==============================================================*/
/* Index: TIPOARCHIVO_ARCHIVOADJUNTO_FK                         */
/*==============================================================*/
create index TIPOARCHIVO_ARCHIVOADJUNTO_FK on ARCHIVOADJUNTO (
   IDTIPOARCHIVO ASC
);

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA 
(
   IDCATEGORIA          VARCHAR2(3)          not null,
   DESCCATEGORIA        VARCHAR2(30)         not null,
   constraint PK_CATEGORIA primary key (IDCATEGORIA)
);

/*==============================================================*/
/* Table: CONTACTO                                              */
/*==============================================================*/
create table CONTACTO 
(
   CONSECCONTACTO       INTEGER              not null,
   USUARIO              VARCHAR2(5)          not null,
   USU_USUARIO          VARCHAR2(5)          not null,
   NOMBRECONTACTO       VARCHAR2(30)         not null,
   CORREOCONTACTO       VARCHAR2(30)         not null,
   constraint PK_CONTACTO primary key (CONSECCONTACTO)
);

comment on table CONTACTO is
'Para almacenar los contactos';

/*==============================================================*/
/* Index: CONTACTOS_DEL_USUARIO_FK                              */
/*==============================================================*/
create index CONTACTOS_DEL_USUARIO_FK on CONTACTO (
   USUARIO ASC
);

/*==============================================================*/
/* Index: USUARIO_QUE_TAMBIEN_ES2_FK                            */
/*==============================================================*/
create index USUARIO_QUE_TAMBIEN_ES2_FK on CONTACTO (
   USU_USUARIO ASC
);

/*==============================================================*/
/* Table: DESTINATARIO                                          */
/*==============================================================*/
create table DESTINATARIO 
(
   CONSECDESTINATARIO   INTEGER              not null,
   IDPAIS               VARCHAR2(5)          not null,
   CONSECCONTACTO       INTEGER              not null,
   IDTIPOCOPIA          VARCHAR2(4)          not null,
   USUARIO              VARCHAR2(5)          not null,
   IDMENSAJE            VARCHAR2(5)          not null,
   constraint PK_DESTINATARIO primary key (CONSECDESTINATARIO)
);

/*==============================================================*/
/* Index: CONTACTODESTINATARIO_FK                               */
/*==============================================================*/
create index CONTACTODESTINATARIO_FK on DESTINATARIO (
   CONSECCONTACTO ASC
);

/*==============================================================*/
/* Index: MENSAJE_DESTINATARIO_FK                               */
/*==============================================================*/
create index MENSAJE_DESTINATARIO_FK on DESTINATARIO (
   USUARIO ASC,
   IDMENSAJE ASC
);

/*==============================================================*/
/* Index: PAISDESTINATARIO_FK                                   */
/*==============================================================*/
create index PAISDESTINATARIO_FK on DESTINATARIO (
   IDPAIS ASC
);

/*==============================================================*/
/* Index: TIPOCOPIA_DESTINATARIO_FK                             */
/*==============================================================*/
create index TIPOCOPIA_DESTINATARIO_FK on DESTINATARIO (
   IDTIPOCOPIA ASC
);

/*==============================================================*/
/* Table: ESTADO                                                */
/*==============================================================*/
create table ESTADO 
(
   IDESTADO             VARCHAR2(5)          not null,
   NOMBREESTADO         VARCHAR2(30)         not null,
   constraint PK_ESTADO primary key (IDESTADO)
);

comment on table ESTADO is
'Si la persona esta activa o inactiva';

/*==============================================================*/
/* Table: MENSAJE                                               */
/*==============================================================*/
create table MENSAJE 
(
   USUARIO              VARCHAR2(5)          not null,
   IDMENSAJE            VARCHAR2(5)          not null,
   IDTIPOCARPETA        VARCHAR2(3)          not null,
   IDPAIS               VARCHAR2(5)          not null,
   MEN_USUARIO          VARCHAR2(5),
   MEN_IDMENSAJE        VARCHAR2(5),
   IDCATEGORIA          VARCHAR2(3)          not null,
   ASUNTO               VARCHAR2(255)        not null,
   CUERPOMENSAJE        VARCHAR2(255)        not null,
   FECHAACCION          DATE                 not null,
   HORAACCION           DATE                 not null,
   constraint PK_MENSAJE primary key (USUARIO, IDMENSAJE)
);

comment on table MENSAJE is
'Almancena todos los mensajes';

/*==============================================================*/
/* Index: CATEGORIAMENSAJE_FK                                   */
/*==============================================================*/
create index CATEGORIAMENSAJE_FK on MENSAJE (
   IDCATEGORIA ASC
);

/*==============================================================*/
/* Index: MENSAJESUP_FK                                         */
/*==============================================================*/
create index MENSAJESUP_FK on MENSAJE (
   MEN_USUARIO ASC,
   MEN_IDMENSAJE ASC
);

/*==============================================================*/
/* Index: PAISMENSAJE_FK                                        */
/*==============================================================*/
create index PAISMENSAJE_FK on MENSAJE (
   IDPAIS ASC
);

/*==============================================================*/
/* Index: TIPOCARPETA_MENSAJE_FK                                */
/*==============================================================*/
create index TIPOCARPETA_MENSAJE_FK on MENSAJE (
   IDTIPOCARPETA ASC
);

/*==============================================================*/
/* Index: USUARIOMENSAJE_FK                                     */
/*==============================================================*/
create index USUARIOMENSAJE_FK on MENSAJE (
   USUARIO ASC
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS 
(
   IDPAIS               VARCHAR2(5)          not null,
   NOMPAIS              VARCHAR2(30)         not null,
   DOMINIO              VARCHAR2(3)          not null,
   constraint PK_PAIS primary key (IDPAIS)
);

comment on table PAIS is
'Tabla para almacenar los paises.';

/*==============================================================*/
/* Table: TIPOARCHIVO                                           */
/*==============================================================*/
create table TIPOARCHIVO 
(
   IDTIPOARCHIVO        VARCHAR2(5)          not null,
   DESCTIPOARCHIVO      VARCHAR2(30)         not null,
   constraint PK_TIPOARCHIVO primary key (IDTIPOARCHIVO)
);

comment on table TIPOARCHIVO is
'Para señalar que tipo de archivo será';

/*==============================================================*/
/* Table: TIPOCARPETA                                           */
/*==============================================================*/
create table TIPOCARPETA 
(
   IDTIPOCARPETA        VARCHAR2(3)          not null,
   DESCTIPOCARPETA      VARCHAR2(30)         not null,
   constraint PK_TIPOCARPETA primary key (IDTIPOCARPETA)
);

/*==============================================================*/
/* Table: TIPOCOPIA                                             */
/*==============================================================*/
create table TIPOCOPIA 
(
   IDTIPOCOPIA          VARCHAR2(4)          not null,
   DESCTIPOCOPIA        VARCHAR2(15)         not null,
   constraint PK_TIPOCOPIA primary key (IDTIPOCOPIA)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO 
(
   USUARIO              VARCHAR2(5)          not null,
   IDESTADO             VARCHAR2(5)          not null,
   IDPAIS               VARCHAR2(5)          not null,
   NOMBRE               VARCHAR2(30)         not null,
   APELLIDO             VARCHAR2(30)         not null,
   FECHANACIMIENTO      DATE                 not null,
   FECHACREACION        DATE                 not null,
   CORREOALTERNO        VARCHAR2(30)         not null,
   CELULAR              VARCHAR2(12)         not null,
   constraint PK_USUARIO primary key (USUARIO)
);

comment on table USUARIO is
'Almacenaremos los usuarios';

/*==============================================================*/
/* Index: ESTADOUSUARIO_FK                                      */
/*==============================================================*/
create index ESTADOUSUARIO_FK on USUARIO (
   IDESTADO ASC
);

/*==============================================================*/
/* Index: PAISUSUARIO_FK                                        */
/*==============================================================*/
create index PAISUSUARIO_FK on USUARIO (
   IDPAIS ASC
);

alter table ARCHIVOADJUNTO
   add constraint FK_ARCHIVOA_MENSAJE_A_MENSAJE foreign key (USUARIO, IDMENSAJE)
      references MENSAJE (USUARIO, IDMENSAJE);

alter table ARCHIVOADJUNTO
   add constraint FK_ARCHIVOA_TIPOARCHI_TIPOARCH foreign key (IDTIPOARCHIVO)
      references TIPOARCHIVO (IDTIPOARCHIVO);

alter table CONTACTO
   add constraint FK_CONTACTO_CONTACTOS_USUARIO foreign key (USUARIO)
      references USUARIO (USUARIO);

alter table CONTACTO
   add constraint FK_CONTACTO_USUARIO_Q_USUARIO foreign key (USU_USUARIO)
      references USUARIO (USUARIO);

alter table DESTINATARIO
   add constraint FK_DESTINAT_CONTACTOD_CONTACTO foreign key (CONSECCONTACTO)
      references CONTACTO (CONSECCONTACTO);

alter table DESTINATARIO
   add constraint FK_DESTINAT_MENSAJE_D_MENSAJE foreign key (USUARIO, IDMENSAJE)
      references MENSAJE (USUARIO, IDMENSAJE);

alter table DESTINATARIO
   add constraint FK_DESTINAT_PAISDESTI_PAIS foreign key (IDPAIS)
      references PAIS (IDPAIS);

alter table DESTINATARIO
   add constraint FK_DESTINAT_TIPOCOPIA_TIPOCOPI foreign key (IDTIPOCOPIA)
      references TIPOCOPIA (IDTIPOCOPIA);

alter table MENSAJE
   add constraint FK_MENSAJE_CATEGORIA_CATEGORI foreign key (IDCATEGORIA)
      references CATEGORIA (IDCATEGORIA);

alter table MENSAJE
   add constraint FK_MENSAJE_MENSAJESU_MENSAJE foreign key (MEN_USUARIO, MEN_IDMENSAJE)
      references MENSAJE (USUARIO, IDMENSAJE);

alter table MENSAJE
   add constraint FK_MENSAJE_PAISMENSA_PAIS foreign key (IDPAIS)
      references PAIS (IDPAIS);

alter table MENSAJE
   add constraint FK_MENSAJE_TIPOCARPE_TIPOCARP foreign key (IDTIPOCARPETA)
      references TIPOCARPETA (IDTIPOCARPETA);

alter table MENSAJE
   add constraint FK_MENSAJE_USUARIOME_USUARIO foreign key (USUARIO)
      references USUARIO (USUARIO);

alter table USUARIO
   add constraint FK_USUARIO_ESTADOUSU_ESTADO foreign key (IDESTADO)
      references ESTADO (IDESTADO);

alter table USUARIO
   add constraint FK_USUARIO_PAISUSUAR_PAIS foreign key (IDPAIS)
      references PAIS (IDPAIS);

