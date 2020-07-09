--@Autor(es):       Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación:  26/04/2020
--@Descripción:  Insert en tablas del ejercicio 2 




prompt Ejercicio A
insert into estatus_cuenta (estatus_cuenta_id,clave,descripcion,activo) 
values (1, 'ABIERTA','Cuenta válida y vigente.',1);
insert into estatus_cuenta (estatus_cuenta_id,clave,descripcion,activo) 
values (2, 'SUSPENDIDA','Cuenta que no permite movimientos por un periodo de tiempo determinado.',1);
insert into estatus_cuenta (estatus_cuenta_id,clave,descripcion,activo) 
values (3, 'CONGELADA','Cuenta que no permite movimientos por tiempo indefinido.',1);


prompt Ejercicio B
insert into banco (banco_id, nombre) 
values (60, 'BMEX');
insert into banco (banco_id, nombre)
values (61, 'BANCA PLUS');
insert into banco (banco_id, nombre)
values (62, 'BANEXITO');



prompt Ejercicio C
insert into tipo_portafolio(tipo_portafolio_id, clave, nombre, activo)
values (100,'IEFA','Renta variable Internacional',1);
insert into tipo_portafolio(tipo_portafolio_id, clave, nombre, activo)
values (200,'IVV','Renta variable de los EU',1);
insert into tipo_portafolio(tipo_portafolio_id, clave, nombre, activo)
values (300,'IEMG','Renta variable Internacional Global',1);

prompt Ejercicio D
insert into cliente (cliente_id, NOMBRE,ap_paterno, ap_materno, CURP, Fecha_nacimiento, email)
values (CLIENTE_SEQ.NEXTVAL,'GERARDO','LARA','URSUL','LAURGE891101HDF003',TO_DATE('01/11/1989','dd/mm/yyyy'),'gerardo@mail.com');


prompt Ejercicio E
insert into cliente (cliente_id, NOMBRE,ap_paterno, ap_materno, CURP, Fecha_nacimiento, email)
values (CLIENTE_SEQ.NEXTVAL,'PACO','LUNA','PEREZ','LUPEPA900401HDF009',TO_DATE('01/04/1990','dd/mm/yyyy'),'paco@mail.com');

insert into cuenta (CUENTA_ID,NUM_CUENTA,TIPO,SALDO,FECHA_ESTATUS,ESTATUS_CUENTA_ID, BANCO_ID, CLIENTE_ID)
values (CUENTA_SEQ.NEXTVAL,'903903','A',5500.5,TO_DATE('10/10/2009 09:40:55','dd/mm/yyyy hh24:mi:ss'),1,60,CLIENTE_SEQ.CURRVAL);

insert into CUENTA_AHORRO (CUENTA_ID,NIP_CAJERO,NUM_TARJETA_DEBITO,LIMITE_RETIRO)
values (CUENTA_SEQ.CURRVAL,9990,'1657090812110000',10000.00);

insert into HISTORICO_ESTATUS_CUENTA ( HISTORICO_ESTATUS_CUENTA_ID,FECHA_ESTATUS,CUENTA_ID,ESTATUS_CUENTA_ID)
values (HIST_ESTATUS_CTA_SEQ.NEXTVAL,TO_DATE('10/10/2009 09:40:55','dd/mm/yyyy hh24:mi:ss'),CUENTA_SEQ.CURRVAL,1);


prompt Ejercicio F
insert into cliente (cliente_id, NOMBRE,ap_paterno, ap_materno, CURP, Fecha_nacimiento,CLIENTE_AVAL_ID)
values (CLIENTE_SEQ.NEXTVAL,'HUGO','MORA','PAZ','MOPAHU010922HDF005',TO_DATE('22/09/2001','dd/mm/yyyy'),
    (SELECT CLIENTE_ID FROM CLIENTE WHERE nombre='PACO' AND AP_PATERNO='LUNA' AND AP_MATERNO='PEREZ')
);

insert into cuenta (CUENTA_ID,NUM_CUENTA,TIPO,SALDO,FECHA_ESTATUS,ESTATUS_CUENTA_ID, BANCO_ID, CLIENTE_ID)
values (CUENTA_SEQ.nextval,'903904','I',1000000.00, TO_DATE('01/01/2016 17:00:00','dd/mm/yyyy hh24:mi:ss'),1,62,CLIENTE_SEQ.CURRVAL);

insert into HISTORICO_ESTATUS_CUENTA ( HISTORICO_ESTATUS_CUENTA_ID,FECHA_ESTATUS,CUENTA_ID,ESTATUS_CUENTA_ID)
values (HIST_ESTATUS_CTA_SEQ.NEXTVAL,TO_DATE('01/01/2016 17:00:00','dd/mm/yyyy hh24:mi:ss'),CUENTA_seq.CURRVAL,1);

update cuenta set FECHA_ESTATUS = TO_DATE('14/02/2017 17:00:00','dd/mm/yyyy hh24:mi:ss')
where NUM_CUENTA='903904';
update cuenta set ESTATUS_CUENTA_ID = 3
where NUM_CUENTA='903904';

insert into HISTORICO_ESTATUS_CUENTA ( HISTORICO_ESTATUS_CUENTA_ID,FECHA_ESTATUS,CUENTA_ID,ESTATUS_CUENTA_ID)
values (HIST_ESTATUS_CTA_SEQ.NEXTVAL,TO_DATE('14/02/2017 17:00:00','dd/mm/yyyy hh24:mi:ss'),CUENTA_seq.CURRVAL,3);

insert into CUENTA_INVERSION (CUENTA_ID, NUM_CONTRATO, FECHA_CONTRATO, TOTAL_PORTAFOLIOS)
values (CUENTA_SEQ.CURRVAL, '124884-2',TO_DATE('31/12/2018','dd/mm/yyyy'),2);

insert into PORTAFOLIO_INVERSION (TIPO_PORTAFOLIO_ID,CUENTA_ID,PORCENTAJE,PLAZO)
values (100, CUENTA_SEQ.CURRVAL,50,6);

insert into PORTAFOLIO_INVERSION (TIPO_PORTAFOLIO_ID,CUENTA_ID,PORCENTAJE,PLAZO)
values (200, CUENTA_SEQ.CURRVAL,50,6);


prompt Ejercicio G

insert into cliente (cliente_id, NOMBRE,ap_paterno, ap_materno, CURP, Fecha_nacimiento, email,CLIENTE_AVAL_ID)
values (CLIENTE_SEQ.NEXTVAL,'SARA','OLMOS','GUTIERREZ','GUOLSA790203HDFG00',TO_DATE('03/02/1979','dd/mm/yyyy'),'sara@gmail.com',
    (SELECT CLIENTE_ID FROM CLIENTE
    WHERE nombre='PACO' AND AP_PATERNO='LUNA')
);

--Cuenta ahorro
insert into cuenta (CUENTA_ID,NUM_CUENTA,TIPO,SALDO,FECHA_ESTATUS,ESTATUS_CUENTA_ID, BANCO_ID, CLIENTE_ID)
values (CUENTA_SEQ.nextval, '903911','A',5000.00,TO_DATE('18/09/2017 11:51:05','dd/mm/yyyy hh24:mi:ss'),1,62,cliente_seq.currval);

insert into CUENTA_AHORRO (CUENTA_ID,NIP_CAJERO, NUM_TARJETA_DEBITO,LIMITE_RETIRO)
values (CUENTA_SEQ.CURRVAL, 8888,'1450678300097777',25000.00);

insert into HISTORICO_ESTATUS_CUENTA ( HISTORICO_ESTATUS_CUENTA_ID,FECHA_ESTATUS,CUENTA_ID,ESTATUS_CUENTA_ID)
values (HIST_ESTATUS_CTA_SEQ.NEXTVAL, TO_DATE('18/09/2017 11:51:05','dd/mm/yyyy hh24:mi:ss'),CUENTA_seq.CURRVAL,1);

--Cuenta Inversion 
insert into cuenta (CUENTA_ID,NUM_CUENTA,TIPO,SALDO,FECHA_ESTATUS,ESTATUS_CUENTA_ID, BANCO_ID, CLIENTE_ID)
values (CUENTA_seq.nextval, '903912','I',5000.00,TO_DATE('18/09/2017 11:51:05','dd/mm/yyyy hh24:mi:ss'),1,62,cliente_seq.currval);

insert into CUENTA_INVERSION (CUENTA_ID, NUM_CONTRATO, FECHA_CONTRATO, TOTAL_PORTAFOLIOS)
values (cuenta_seq.currval,'133478-3',TO_DATE('19/09/2017','dd/mm/yyyy'),1);

insert into HISTORICO_ESTATUS_CUENTA ( HISTORICO_ESTATUS_CUENTA_ID,FECHA_ESTATUS,CUENTA_ID,ESTATUS_CUENTA_ID)
values (HIST_ESTATUS_CTA_SEQ.NEXTVAL,TO_DATE('18/09/2017 11:51:05','dd/mm/yyyy hh24:mi:ss'),CUENTA_seq.CURRVAL,1);

update cuenta set FECHA_ESTATUS = TO_DATE('18/10/2017 11:51:05','dd/mm/yyyy hh24:mi:ss')
where NUM_CUENTA='903912';
update cuenta set ESTATUS_CUENTA_ID = 3
where NUM_CUENTA='903912';

insert into HISTORICO_ESTATUS_CUENTA ( HISTORICO_ESTATUS_CUENTA_ID,FECHA_ESTATUS,CUENTA_ID,ESTATUS_CUENTA_ID)
values (HIST_ESTATUS_CTA_SEQ.NEXTVAL,TO_DATE('18/10/2017 11:51:05','dd/mm/yyyy hh24:mi:ss'),CUENTA_seq.CURRVAL,3);

insert into PORTAFOLIO_INVERSION (TIPO_PORTAFOLIO_ID,CUENTA_ID,PORCENTAJE,PLAZO)
values (300, CUENTA_SEQ.CURRVAL,00,2);


commit;








