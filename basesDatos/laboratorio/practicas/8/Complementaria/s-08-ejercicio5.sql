--@Autor(es):       Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación:  26/04/2020
--@Descripción: Uso de Merge para dos tablas 

select count(*) from CLIENTE_IMPORT;
select count(*) from CLIENTE;

merge into cliente CL using cliente_import cl_im on 
(CL.cliente_id=cl_im.cliente_id)
when matched then update
set 
    CL.nombre=cl_im.nombre,
    CL.ap_paterno=cl_im.ap_paterno,
    CL.ap_materno=cl_im.ap_materno,
    CL.fecha_nacimiento=cl_im.fecha_nacimiento,
    CL.email=cl_im.email,
    CL.cliente_aval_id=cl_im.CLiente_aval_id,
    CL.CURP=cl_im.CURP

when not matched then insert
    (CL.cliente_id,
    CL.nombre,
    CL.ap_paterno,
    CL.ap_materno,
    CL.CURP,
    CL.fecha_nacimiento,
    CL.email,
    CL.cliente_aval_id)

values( 
    CLIENTE_SEQ.NEXTVAL,
    cl_im.nombre,
    cl_im.ap_paterno,
    cl_im.ap_materno,
    cl_im.CURP,
    cl_im.fecha_nacimiento,
    cl_im.email,
    cl_im.cliente_aval_id
);




