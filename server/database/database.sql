CREATE DATABASE db_prestamos
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

CREATE TABLE public.lotes(
    id_lote SERIAL PRIMARY KEY,
    marca VARCHAR(20),
    modelo VARCHAR(50),
    cpu VARCHAR(40),
    ram VARCHAR(20),
    hdd VARCHAR(30)
);

CREATE TABLE public.sedes(
    id_sede SERIAL PRIMARY KEY,
    sede VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE public.procesos(
	id_proceso SERIAL PRIMARY KEY,
    proceso VARCHAR(20) NOT NULL UNIQUE,
	descripcion VARCHAR(500)
);

CREATE TABLE public.carreras(
    cod_carrera NUMERIC(10) PRIMARY KEY,
	nombre VARCHAR(100),
    id_sede SERIAL REFERENCES public.sedes(id_sede)
);

CREATE TABLE public.funcionarios(
    cedula NUMERIC(11) PRIMARY KEY,
	nombre VARCHAR(50)
);

CREATE TABLE public.comodatarios(
    cedula NUMERIC(11) PRIMARY KEY,
    codigo NUMERIC(15) UNIQUE,
	nombre VARCHAR(50),
    cod_carrera NUMERIC(10) REFERENCES public.carreras(cod_carrera)
);

CREATE TABLE public.equipos(
    qr NUMERIC(10) PRIMARY KEY,
    garantia DATE,
    sn VARCHAR(30) UNIQUE,
    sn_disco1 VARCHAR(30),
    sn_disco2 VARCHAR(30),
	id_lote SERIAL REFERENCES public.lotes(id_lote),
	sede_responsable SERIAL REFERENCES public.sedes(id_sede)
);

CREATE TABLE public.prestamos(
	id_prestamo SERIAL PRIMARY KEY,
	qr SERIAL REFERENCES public.equipos(qr),
	dni_comodatario SERIAL REFERENCES public.comodatarios(cedula),
	dni_funcionario SERIAL REFERENCES public.funcionarios(cedula),
	fecha_inicio DATE,
    fecha_fin DATE,
	lugar_prestamo SERIAL REFERENCES public.sedes(id_sede),
    comodato VARCHAR(150)
);

CREATE TABLE public.registros(
	id_registro SERIAL PRIMARY KEY,
	id_prestamo SERIAL REFERENCES public.prestamos(id_prestamo),
	qr SERIAL REFERENCES public.equipos(qr),
	fecha_inicio DATE,
    fecha_fin DATE,
	id_proceso SERIAL REFERENCES public.procesos(id_proceso),
    pdf_soporte VARCHAR(150)
);

-- QUERY PARA REINICAR LAS SECUENCIAS DE LAS TABLAS
/*
    ALTER SEQUENCE prestamos_id_prestamo_seq RESTART WITH 1;
    ALTER SEQUENCE procesos_id_proceso_seq RESTART WITH 1;
    ALTER SEQUENCE registros_id_registro_seq RESTART WITH 1;
*/



-- QUERY PARA OBTENER LA INFO DEL EQUIPO
/*
    SELECT 
    E.qr, E.garantia, E.sn, E.sn_disco1, E.sn_disco2, 
    S.sede as sede_responsable,  
    L.id_lote, L.marca, L.modelo, L.cpu, L.ram, L.hdd 
    FROM equipos E INNER JOIN sedes S ON E.sede_responsable = S.id_sede 
    INNER JOIN lotes L ON E.id_lote = L.id_lote 
    WHERE E.qr = ??? OR E.sn = ??? LIMIT 1
*/

-- QUERY PARA OBTENER LA INFORMACIÓN DE UN PRESTAMO
/*
    SELECT 
    E.qr, CE.cedula as cedula_estudiante, CE.nombre as estudiante, CE.codigo, C.nombre, 
    F.cedula as cedula_funcionario, F.nombre as funcionario,
    P.id_prestamo, P.comodato, P.fecha_inicio, P.fecha_fin, 
    S.sede as lugar_prestamo
    FROM equipos E INNER JOIN prestamos P ON E.qr = P.qr 
    INNER JOIN comodatarios CE ON P.dni_comodatario = CE.cedula 
    INNER JOIN carreras C ON C.cod_carrera = CE.cod_carrera 
    INNER JOIN funcionarios F ON P.dni_funcionario = F.cedula
    INNER JOIN sedes S ON P.lugar_prestamo = S.id_sede
    WHERE P.qr = ??? OR CE.cedula = ??? OR CE.codigo = $1
*/

-- QUERY PARA OBTENER LOS REGISTROS DE UN PRESTAMO
/*
    SELECT 
    P.id_prestamo, P.qr, R.id_registro, R.fecha_inicio, R.fecha_fin, PR.id_proceso, PR.proceso, PR.descripcion, R.pdf_soporte
    FROM prestamos P INNER JOIN registros R ON P.id_prestamo = R.id_prestamo
    INNER JOIN procesos PR ON R.id_proceso = PR.id_proceso 
    WHERE R.id_prestamo = ??? OR P.qr = ???
*/

-- OBTENER LOS QR QUE ESTAN DISPONIBLES 
/*
    SELECT count(qr) AS disponibles FROM equipos WHERE NOT qr IN (SELECT QR FROM prestamos WHERE fecha_fin IS NULL);
*/