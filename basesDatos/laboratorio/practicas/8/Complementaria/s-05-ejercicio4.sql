--@Autor(es):       Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación:  26/04/2020
--@Descripción: Cambios en lo creado por script 3 


update cuenta set FECHA_ESTATUS = TO_DATE('25/12/2018 23:59:59','dd/mm/yyyy hh24:mi:ss'), estatus_cuenta_id=3 where NUM_CUENTA='903911';

insert into HISTORICO_ESTATUS_CUENTA(HISTORICO_ESTATUS_CUENTA_ID,FECHA_ESTATUS,CUENTA_ID,ESTATUS_CUENTA_ID)
VALUES(HIST_ESTATUS_CTA_SEQ.NEXTVAL,TO_DATE('25/12/2018 23:59:59','dd/mm/yyyy hh24:mi:ss'),
    (
        SELECT cuenta_id from CUENTA
        where num_cuenta='903911'
    ) ,3);

prompt Termina todo lo de A


delete from PORTAFOLIO_INVERSION
where TIPO_PORTAFOLIO_ID=200 and CUENTA_ID=(
    select CUENTA_ID from CUENTA_INVERSION
    where num_contrato='124884-2'
);

update cuenta_inversion set TOTAL_PORTAFOLIOS=1 where NUM_CONTRATO='124884-2';

update PORTAFOLIO_INVERSION set PORCENTAJE=100
where TIPO_PORTAFOLIO_ID=100 and CUENTA_ID=(
    select CUENTA_ID from CUENTA_INVERSION
    where num_contrato='124884-2'
);
prompt Termina todo lo de B


update cliente set CLIENTE_AVAL_ID=null
where CLIENTE_AVAL_ID=(
    select cliente_id from cliente
    where NOMBRE='PACO' AND AP_PATERNO='LUNA' AND AP_MATERNO='PEREZ'
);

delete from CUENTA_AHORRO
where CUENTA_ID=(
    select cuenta_id from cuenta
    where CLIENTE_ID=(
        select cliente_id from cliente
        where NOMBRE='PACO' AND AP_PATERNO='LUNA' AND AP_MATERNO='PEREZ'
    )
);

delete from HISTORICO_ESTATUS_CUENTA
where cuenta_id=(
    select cuenta_id from cuenta
        where CLIENTE_ID=(
            select cliente_id from cliente
            where NOMBRE='PACO' AND AP_PATERNO='LUNA' AND AP_MATERNO='PEREZ'
    )
);

delete from cuenta
where cliente_id=(
    select cliente_id from cliente     
    where NOMBRE='PACO' AND AP_PATERNO='LUNA' AND AP_MATERNO='PEREZ'
);

delete from cliente where NOMBRE='PACO' AND AP_PATERNO='LUNA' AND AP_MATERNO='PEREZ';


prompt Ya por favor :( !

commit;