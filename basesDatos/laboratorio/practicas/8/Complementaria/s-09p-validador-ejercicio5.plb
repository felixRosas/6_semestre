
whenever sqlerror exit rollback

@s-04-variables-validador.sql

connect &&p_usuario/&&p_usuario_pass

set serveroutput on
prompt Creando procedimientos para Validar

@s-00-funciones-validacion.plb

create or replace procedure p_valida_ejercicio5 wrapped 
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
49b 2f6
C5sQlc00evgNCxUKds45rNWq5+gwg/DDVUrsZ465DfS7uLlgE1XwU+zNJ1p7FVMll2dgSymU
a3yrq0bNFi5FMR/8Miw4D9iCDs5eWXsfuIvaJGrPmq1TR3/jKYLhcq9yfC4GfI+avuPxFvoH
cGKDYqkBcFcigamSM0ZLUpgqqK5vecSJIO7RHZyTd5lucqSRAWWWRwZ25aNS0anPZkdLdNk3
qPxKClaNWovbpQ7YaEKaRJMVrW4a5uhHLa91ukYjkdipat4wLcpHHhHthw+axppN19c4jOH7
L2LfcV3IkczRNtCfrdt2XyHuMUogY+0Q0Rk/1R2RaOyajSy/eoswJk5um7Jh8jqaHt1DEPKP
2V9aPLJPvnslHHNkMFAsdCHYAGgo+ITDQHAn4TKKve977JsPgC+YN20AFU2M7+xtLnUIIQDH
BVvEHxhXkztQr4B+ftcyoINcUy8shi75wJxtKicaiPVNk7watDQU82F2FNTpzmJGLERbWscp
sr/8+l7jxcX7XESmhw+ztjh1WMtHf2qPAwIk6lwVEeqFbyO96XU1iRcBa3nC0cViYLBsX4i3
zVA78Dko5RF6qLlGGgk2V7pe4Ee4Zy04MfJ/gDhsx8E48A830sA3h2TJTsXARPZ6DGECrPwb
prSZ4lCqg/JmLKAFGYY7M6btr02qJPz+a2uUj/x8dQ2n+C2pgnMnMeCIY5Hay5cBYwE6B+Px
xCRj3cyjhc0/Gucqxrv54f/3AEU=

/
show errors

exec spv_print_header

Prompt Iniciando validación.

exec p_valida_ejercicio5

Prompt Validación concluida!
exit