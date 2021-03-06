-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname,
--        color 
--    FROM 
--        u 
--    WHERE 
--        color REGEXP '[aeiou]$';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

u = LOAD 'data.csv' USING PigStorage(',') AS (id:int, firstname:CHARARRAY, surname:CHARARRAY, birthday:CHARARRAY, color:CHARARRAY,quantity:INT);
x = FOREACH u GENERATE surname as name;
x = FOREACH u GENERATE firstname as name, color as col;
y = FILTER x BY ($1 MATCHES '.*a' 
                 OR $1 MATCHES '.*e' 
                 OR $1 MATCHES '.*i'
                 OR $1 MATCHES '.*o'
                 OR $1 MATCHES '.*u');
STORE y INTO './output' using PigStorage(',');