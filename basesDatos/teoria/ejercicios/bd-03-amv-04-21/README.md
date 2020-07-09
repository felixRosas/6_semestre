# Martes - Semana 5

ACID = Atomicidad , Consistencia , Aislamiento y Durabilidad 

## Transacciones

- set transactions {} sirve para definir y configurar el comportamiento de una transaccción

Consultar transacciones:

- select xid, status,to_char(start_date,'dd/mm/yyyy') from v$transaction;

Con commit o rollback se finaliza una transacción
NOOTA: Recuerda que no puedes consultar el dato actual si el dato está en una transacción

## Lecturas no repetibles











