--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acta_compania_aseguradora; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE acta_compania_aseguradora (
    id integer NOT NULL,
    id_acta_servicio integer,
    id_compania_aseguradora integer,
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.acta_compania_aseguradora OWNER TO carlos;

--
-- Name: acta_compania_aseguradora_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE acta_compania_aseguradora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acta_compania_aseguradora_id_seq OWNER TO carlos;

--
-- Name: acta_compania_aseguradora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE acta_compania_aseguradora_id_seq OWNED BY acta_compania_aseguradora.id;


--
-- Name: acta_compania_aseguradora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('acta_compania_aseguradora_id_seq', 9, true);


--
-- Name: acta_contenedor_gas; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE acta_contenedor_gas (
    id integer NOT NULL,
    id_acta_servicio integer,
    id_contenedor_gas integer,
    id_tipo_gas integer,
    capacidad_contenedor character varying(100),
    id_empresa_dist integer,
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.acta_contenedor_gas OWNER TO carlos;

--
-- Name: acta_contenedor_gas_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE acta_contenedor_gas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acta_contenedor_gas_id_seq OWNER TO carlos;

--
-- Name: acta_contenedor_gas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE acta_contenedor_gas_id_seq OWNED BY acta_contenedor_gas.id;


--
-- Name: acta_contenedor_gas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('acta_contenedor_gas_id_seq', 5, true);


--
-- Name: acta_empresa_dist; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE acta_empresa_dist (
    id integer NOT NULL,
    id_acta_servicio integer,
    id_empresa_dist integer,
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.acta_empresa_dist OWNER TO carlos;

--
-- Name: acta_empresa_dist_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE acta_empresa_dist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acta_empresa_dist_id_seq OWNER TO carlos;

--
-- Name: acta_empresa_dist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE acta_empresa_dist_id_seq OWNED BY acta_empresa_dist.id;


--
-- Name: acta_empresa_dist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('acta_empresa_dist_id_seq', 5, true);


--
-- Name: acta_servicio; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE acta_servicio (
    id integer NOT NULL,
    correlativo integer NOT NULL,
    id_tipo_servicio integer,
    sector character varying(255),
    fecha date,
    hora time without time zone,
    id_cuerpo integer,
    id_compania integer,
    direccion character varying(255),
    numero character varying(45),
    calle character varying(255),
    comuna character varying(100),
    poblacion character varying(255),
    nro_block character varying(45),
    nro_depto character varying(45),
    latitud double precision,
    longitud double precision,
    rut character varying(45),
    nombre character varying(255),
    telefono character varying(45),
    id_tipo_ocupante integer,
    nro_adultos integer,
    nro_ninos integer,
    mails character varying(255),
    id_tipo_lugar integer,
    id_tipo_vehiculo integer,
    id_marca_vehiculo integer,
    id_modelo_vehiculo integer,
    patente character varying(45),
    id_lugar_inicio_fuego integer,
    id_origen integer,
    id_causa integer,
    observacion_causa character varying(255),
    id_fuente_calor integer,
    oservacion_fuente_calor character varying(255),
    dano_vivienda integer,
    dano_vehiculo integer,
    dano_enseres integer,
    otro_dano character varying(255),
    id_unidad_explosivos integer,
    cantidad_explosivos integer,
    id_unidad_venenos integer,
    cantidad_venenos integer,
    id_unidad_gases integer,
    cantidad_gases integer,
    id_unidad_solidos integer,
    cantidad_solidos integer,
    id_unidad_radioactivos integer,
    cantidad_radioactivos integer,
    id_unidad_oxidantes integer,
    cantidad_oxidantes integer,
    id_unidad_otros integer,
    cantidad_otros integer,
    detalle_productos character varying(255),
    nro_poliza integer,
    especies_aseguradas character varying(255),
    id_proc_ambulancia integer,
    id_municipalidad integer,
    id_movil_oe character varying(255),
    carabinero character varying(255),
    id_otros_apoyos integer,
    id_investigado_por integer,
    det_fecha_inicio timestamp without time zone,
    det_fecha_termino timestamp without time zone,
    existen_fotos integer,
    existen_muestras integer,
    existen_otros integer,
    dat_otros text,
    notas_depto_tecnico text,
    id_cuerpo_ba integer,
    id_bombero_ba integer,
    id_dejada_por integer,
    id_comiseria integer,
    fecha_denuncia timestamp without time zone,
    nro_libro_denuncia character varying(255),
    nro_hoja_denuncia character varying(255),
    nro_parrafo_denuncia character varying(255),
    desc_bombero_accidentado character varying(255),
    id_bombero_acargo integer,
    id_cargo_bombero_acargo integer,
    id_bombero_tomo_datos integer,
    cargo_bombero_acargo character varying(255),
    id_unidad_liquidos integer,
    cantidad_liquidos integer,
    cuerpo character varying(255),
    creado timestamp without time zone,
    modificado timestamp without time zone,
    id_tipo_via integer,
    patente_carabinero character varying(255),
    id_investigado_por_otro character varying(255),
    correlativo_tipo integer
);


ALTER TABLE public.acta_servicio OWNER TO carlos;

--
-- Name: acta_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE acta_servicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acta_servicio_id_seq OWNER TO carlos;

--
-- Name: acta_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE acta_servicio_id_seq OWNED BY acta_servicio.id;


--
-- Name: acta_servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('acta_servicio_id_seq', 94, true);


--
-- Name: acta_tipo_lugar; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE acta_tipo_lugar (
    id integer NOT NULL,
    id_acta_servicio integer,
    id_tipo_lugar integer,
    id_tipo_construccion integer,
    pisos integer,
    dano_enseres integer,
    otros_danos text,
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.acta_tipo_lugar OWNER TO carlos;

--
-- Name: acta_tipo_lugar_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE acta_tipo_lugar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acta_tipo_lugar_id_seq OWNER TO carlos;

--
-- Name: acta_tipo_lugar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE acta_tipo_lugar_id_seq OWNED BY acta_tipo_lugar.id;


--
-- Name: acta_tipo_lugar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('acta_tipo_lugar_id_seq', 21, true);


--
-- Name: ambulancia; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE ambulancia (
    id integer NOT NULL,
    id_proc_ambulancia integer,
    creado timestamp without time zone,
    modificado timestamp without time zone,
    id_acta_servicio integer,
    id_ident_movil character varying(255)
);


ALTER TABLE public.ambulancia OWNER TO carlos;

--
-- Name: ambulancia_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE ambulancia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ambulancia_id_seq OWNER TO carlos;

--
-- Name: ambulancia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE ambulancia_id_seq OWNED BY ambulancia.id;


--
-- Name: ambulancia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('ambulancia_id_seq', 4, true);


--
-- Name: apoyo_bomberil; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE apoyo_bomberil (
    id integer NOT NULL,
    id_acta_servicio integer,
    id_cuerpo integer,
    id_compania integer,
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.apoyo_bomberil OWNER TO carlos;

--
-- Name: apoyo_bomberil_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE apoyo_bomberil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apoyo_bomberil_id_seq OWNER TO carlos;

--
-- Name: apoyo_bomberil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE apoyo_bomberil_id_seq OWNED BY apoyo_bomberil.id;


--
-- Name: apoyo_bomberil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('apoyo_bomberil_id_seq', 69, true);


--
-- Name: causa; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE causa (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.causa OWNER TO carlos;

--
-- Name: causa_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE causa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.causa_id_seq OWNER TO carlos;

--
-- Name: causa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE causa_id_seq OWNED BY causa.id;


--
-- Name: causa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('causa_id_seq', 1, false);


--
-- Name: compania_aseguradora; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE compania_aseguradora (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.compania_aseguradora OWNER TO carlos;

--
-- Name: compania_aseguradora_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE compania_aseguradora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compania_aseguradora_id_seq OWNER TO carlos;

--
-- Name: compania_aseguradora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE compania_aseguradora_id_seq OWNED BY compania_aseguradora.id;


--
-- Name: compania_aseguradora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('compania_aseguradora_id_seq', 1, true);


--
-- Name: contenedor_gas; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE contenedor_gas (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.contenedor_gas OWNER TO carlos;

--
-- Name: contenedor_gas_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE contenedor_gas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contenedor_gas_id_seq OWNER TO carlos;

--
-- Name: contenedor_gas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE contenedor_gas_id_seq OWNED BY contenedor_gas.id;


--
-- Name: contenedor_gas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('contenedor_gas_id_seq', 1, false);


--
-- Name: empresa_dist_gas; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE empresa_dist_gas (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.empresa_dist_gas OWNER TO carlos;

--
-- Name: empresa_dist_gas_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE empresa_dist_gas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresa_dist_gas_id_seq OWNER TO carlos;

--
-- Name: empresa_dist_gas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE empresa_dist_gas_id_seq OWNED BY empresa_dist_gas.id;


--
-- Name: empresa_dist_gas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('empresa_dist_gas_id_seq', 1, true);


--
-- Name: fuente_calor; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE fuente_calor (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.fuente_calor OWNER TO carlos;

--
-- Name: fuente_calor_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE fuente_calor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fuente_calor_id_seq OWNER TO carlos;

--
-- Name: fuente_calor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE fuente_calor_id_seq OWNED BY fuente_calor.id;


--
-- Name: fuente_calor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('fuente_calor_id_seq', 1, false);


--
-- Name: lugar_inicio_fuego; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE lugar_inicio_fuego (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.lugar_inicio_fuego OWNER TO carlos;

--
-- Name: lugar_inicio_fuego_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE lugar_inicio_fuego_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lugar_inicio_fuego_id_seq OWNER TO carlos;

--
-- Name: lugar_inicio_fuego_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE lugar_inicio_fuego_id_seq OWNED BY lugar_inicio_fuego.id;


--
-- Name: lugar_inicio_fuego_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('lugar_inicio_fuego_id_seq', 2, true);


--
-- Name: marca_vehiculo; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE marca_vehiculo (
    id integer NOT NULL,
    nombre character varying(255),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.marca_vehiculo OWNER TO carlos;

--
-- Name: marca_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE marca_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marca_vehiculo_id_seq OWNER TO carlos;

--
-- Name: marca_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE marca_vehiculo_id_seq OWNED BY marca_vehiculo.id;


--
-- Name: marca_vehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('marca_vehiculo_id_seq', 2, true);


--
-- Name: modelo_vehiculo; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE modelo_vehiculo (
    id integer NOT NULL,
    id_marca_vehiculo integer,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.modelo_vehiculo OWNER TO carlos;

--
-- Name: modelo_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE modelo_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modelo_vehiculo_id_seq OWNER TO carlos;

--
-- Name: modelo_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE modelo_vehiculo_id_seq OWNED BY modelo_vehiculo.id;


--
-- Name: modelo_vehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('modelo_vehiculo_id_seq', 10, true);


--
-- Name: modulos; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE modulos (
    id integer NOT NULL,
    modulo character varying(255),
    descripcion character varying(255),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.modulos OWNER TO carlos;

--
-- Name: modulos_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE modulos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modulos_id_seq OWNER TO carlos;

--
-- Name: modulos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE modulos_id_seq OWNED BY modulos.id;


--
-- Name: modulos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('modulos_id_seq', 1, false);


--
-- Name: municipalidad; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE municipalidad (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone,
    cuerpo_id integer
);


ALTER TABLE public.municipalidad OWNER TO carlos;

--
-- Name: municipalidad_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE municipalidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipalidad_id_seq OWNER TO carlos;

--
-- Name: municipalidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE municipalidad_id_seq OWNED BY municipalidad.id;


--
-- Name: municipalidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('municipalidad_id_seq', 2, true);


--
-- Name: origen; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE origen (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.origen OWNER TO carlos;

--
-- Name: origen_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE origen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origen_id_seq OWNER TO carlos;

--
-- Name: origen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE origen_id_seq OWNED BY origen.id;


--
-- Name: origen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('origen_id_seq', 1, false);


--
-- Name: otros_afectados; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE otros_afectados (
    id integer NOT NULL,
    rut character varying(100),
    nombre character varying(255),
    direccion character varying(255),
    id_tipo_ocupante integer,
    nro_adultos integer,
    nro_ninos integer,
    dano_vivienda integer,
    dano_vehiculo integer,
    otros_danos text,
    creado timestamp without time zone,
    modificado timestamp without time zone,
    id_acta_servicio integer
);


ALTER TABLE public.otros_afectados OWNER TO carlos;

--
-- Name: otros_afectados_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE otros_afectados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.otros_afectados_id_seq OWNER TO carlos;

--
-- Name: otros_afectados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE otros_afectados_id_seq OWNED BY otros_afectados.id;


--
-- Name: otros_afectados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('otros_afectados_id_seq', 4, true);


--
-- Name: otros_apoyos; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE otros_apoyos (
    id integer NOT NULL,
    id_acta_servicio integer,
    texto character varying(255),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.otros_apoyos OWNER TO carlos;

--
-- Name: otros_apoyos_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE otros_apoyos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.otros_apoyos_id_seq OWNER TO carlos;

--
-- Name: otros_apoyos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE otros_apoyos_id_seq OWNED BY otros_apoyos.id;


--
-- Name: otros_apoyos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('otros_apoyos_id_seq', 71, true);


--
-- Name: otros_bomberos; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE otros_bomberos (
    id integer NOT NULL,
    id_acta_servicio integer,
    id_cuerpo_ba integer,
    id_bombero_ba integer,
    id_dejada_por integer,
    id_comiseria integer,
    fecha_denuncia timestamp without time zone,
    nro_libro_denuncia character varying(255),
    nro_hoja_denuncia character varying(255),
    nro_parrafo_denuncia character varying(255),
    desc_bombero_accidentado character varying(255),
    id_investigado_por_otro character varying(255),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.otros_bomberos OWNER TO carlos;

--
-- Name: otros_bomberos_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE otros_bomberos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.otros_bomberos_id_seq OWNER TO carlos;

--
-- Name: otros_bomberos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE otros_bomberos_id_seq OWNED BY otros_bomberos.id;


--
-- Name: otros_bomberos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('otros_bomberos_id_seq', 9, true);


--
-- Name: otros_lesionados; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE otros_lesionados (
    id integer NOT NULL,
    id_acta_servicio integer,
    rut character varying(100),
    nombre character varying(255),
    fallecido integer,
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.otros_lesionados OWNER TO carlos;

--
-- Name: otros_lesionados_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE otros_lesionados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.otros_lesionados_id_seq OWNER TO carlos;

--
-- Name: otros_lesionados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE otros_lesionados_id_seq OWNED BY otros_lesionados.id;


--
-- Name: otros_lesionados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('otros_lesionados_id_seq', 17, true);


--
-- Name: otros_vehiculos; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE otros_vehiculos (
    id integer NOT NULL,
    id_tipo_vehiculo integer,
    id_marca_vehiculo integer,
    id_modelo_vehiculo integer,
    patente character varying(255),
    creado timestamp without time zone,
    modificado timestamp without time zone,
    id_acta_servicio integer
);


ALTER TABLE public.otros_vehiculos OWNER TO carlos;

--
-- Name: otros_vehiculos_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE otros_vehiculos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.otros_vehiculos_id_seq OWNER TO carlos;

--
-- Name: otros_vehiculos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE otros_vehiculos_id_seq OWNED BY otros_vehiculos.id;


--
-- Name: otros_vehiculos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('otros_vehiculos_id_seq', 3, true);


--
-- Name: permisos; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE permisos (
    id integer NOT NULL,
    descripcion character varying(255),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.permisos OWNER TO carlos;

--
-- Name: permisos_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE permisos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permisos_id_seq OWNER TO carlos;

--
-- Name: permisos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE permisos_id_seq OWNED BY permisos.id;


--
-- Name: permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('permisos_id_seq', 4, true);


--
-- Name: proc_ambulancia; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE proc_ambulancia (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.proc_ambulancia OWNER TO carlos;

--
-- Name: proc_ambulancia_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE proc_ambulancia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proc_ambulancia_id_seq OWNER TO carlos;

--
-- Name: proc_ambulancia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE proc_ambulancia_id_seq OWNED BY proc_ambulancia.id;


--
-- Name: proc_ambulancia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('proc_ambulancia_id_seq', 2, true);


--
-- Name: tipo_construccion; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE tipo_construccion (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.tipo_construccion OWNER TO carlos;

--
-- Name: tipo_construccion_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE tipo_construccion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_construccion_id_seq OWNER TO carlos;

--
-- Name: tipo_construccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE tipo_construccion_id_seq OWNED BY tipo_construccion.id;


--
-- Name: tipo_construccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('tipo_construccion_id_seq', 9, true);


--
-- Name: tipo_gas; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE tipo_gas (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.tipo_gas OWNER TO carlos;

--
-- Name: tipo_gas_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE tipo_gas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_gas_id_seq OWNER TO carlos;

--
-- Name: tipo_gas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE tipo_gas_id_seq OWNED BY tipo_gas.id;


--
-- Name: tipo_gas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('tipo_gas_id_seq', 1, true);


--
-- Name: tipo_lugar; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE tipo_lugar (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.tipo_lugar OWNER TO carlos;

--
-- Name: tipo_lugar_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE tipo_lugar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_lugar_id_seq OWNER TO carlos;

--
-- Name: tipo_lugar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE tipo_lugar_id_seq OWNED BY tipo_lugar.id;


--
-- Name: tipo_lugar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('tipo_lugar_id_seq', 9, true);


--
-- Name: tipo_ocupante; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE tipo_ocupante (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.tipo_ocupante OWNER TO carlos;

--
-- Name: tipo_ocupante_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE tipo_ocupante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_ocupante_id_seq OWNER TO carlos;

--
-- Name: tipo_ocupante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE tipo_ocupante_id_seq OWNED BY tipo_ocupante.id;


--
-- Name: tipo_ocupante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('tipo_ocupante_id_seq', 1, false);


--
-- Name: tipo_servicio; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE tipo_servicio (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.tipo_servicio OWNER TO carlos;

--
-- Name: tipo_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE tipo_servicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_servicio_id_seq OWNER TO carlos;

--
-- Name: tipo_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE tipo_servicio_id_seq OWNED BY tipo_servicio.id;


--
-- Name: tipo_servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('tipo_servicio_id_seq', 2, true);


--
-- Name: tipo_vehiculo; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE tipo_vehiculo (
    id integer NOT NULL,
    nombre character varying(255),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.tipo_vehiculo OWNER TO carlos;

--
-- Name: tipo_vehiculo_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE tipo_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_vehiculo_id_seq OWNER TO carlos;

--
-- Name: tipo_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE tipo_vehiculo_id_seq OWNED BY tipo_vehiculo.id;


--
-- Name: tipo_vehiculo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('tipo_vehiculo_id_seq', 1, false);


--
-- Name: tipo_via; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE tipo_via (
    id integer NOT NULL,
    nombre character varying(255),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.tipo_via OWNER TO carlos;

--
-- Name: tipo_via_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE tipo_via_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_via_id_seq OWNER TO carlos;

--
-- Name: tipo_via_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE tipo_via_id_seq OWNED BY tipo_via.id;


--
-- Name: tipo_via_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('tipo_via_id_seq', 1, false);


--
-- Name: unidad_explosivos; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE unidad_explosivos (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.unidad_explosivos OWNER TO carlos;

--
-- Name: unidad_explosivos_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE unidad_explosivos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_explosivos_id_seq OWNER TO carlos;

--
-- Name: unidad_explosivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE unidad_explosivos_id_seq OWNED BY unidad_explosivos.id;


--
-- Name: unidad_explosivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('unidad_explosivos_id_seq', 5, true);


--
-- Name: unidad_gases; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE unidad_gases (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.unidad_gases OWNER TO carlos;

--
-- Name: unidad_gases_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE unidad_gases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_gases_id_seq OWNER TO carlos;

--
-- Name: unidad_gases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE unidad_gases_id_seq OWNED BY unidad_gases.id;


--
-- Name: unidad_gases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('unidad_gases_id_seq', 1, false);


--
-- Name: unidad_liquidos; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE unidad_liquidos (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.unidad_liquidos OWNER TO carlos;

--
-- Name: unidad_liquidos_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE unidad_liquidos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_liquidos_id_seq OWNER TO carlos;

--
-- Name: unidad_liquidos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE unidad_liquidos_id_seq OWNED BY unidad_liquidos.id;


--
-- Name: unidad_liquidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('unidad_liquidos_id_seq', 1, false);


--
-- Name: unidad_otros; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE unidad_otros (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.unidad_otros OWNER TO carlos;

--
-- Name: unidad_otros_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE unidad_otros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_otros_id_seq OWNER TO carlos;

--
-- Name: unidad_otros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE unidad_otros_id_seq OWNED BY unidad_otros.id;


--
-- Name: unidad_otros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('unidad_otros_id_seq', 1, false);


--
-- Name: unidad_oxidantes; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE unidad_oxidantes (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.unidad_oxidantes OWNER TO carlos;

--
-- Name: unidad_oxidantes_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE unidad_oxidantes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_oxidantes_id_seq OWNER TO carlos;

--
-- Name: unidad_oxidantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE unidad_oxidantes_id_seq OWNED BY unidad_oxidantes.id;


--
-- Name: unidad_oxidantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('unidad_oxidantes_id_seq', 1, false);


--
-- Name: unidad_radioactivos; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE unidad_radioactivos (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.unidad_radioactivos OWNER TO carlos;

--
-- Name: unidad_radioactivos_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE unidad_radioactivos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_radioactivos_id_seq OWNER TO carlos;

--
-- Name: unidad_radioactivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE unidad_radioactivos_id_seq OWNED BY unidad_radioactivos.id;


--
-- Name: unidad_radioactivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('unidad_radioactivos_id_seq', 1, false);


--
-- Name: unidad_solidos; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE unidad_solidos (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.unidad_solidos OWNER TO carlos;

--
-- Name: unidad_solidos_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE unidad_solidos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_solidos_id_seq OWNER TO carlos;

--
-- Name: unidad_solidos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE unidad_solidos_id_seq OWNED BY unidad_solidos.id;


--
-- Name: unidad_solidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('unidad_solidos_id_seq', 1, false);


--
-- Name: unidad_venenos; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE unidad_venenos (
    id integer NOT NULL,
    nombre character varying(100),
    creado timestamp without time zone,
    modificado timestamp without time zone
);


ALTER TABLE public.unidad_venenos OWNER TO carlos;

--
-- Name: unidad_venenos_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE unidad_venenos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_venenos_id_seq OWNER TO carlos;

--
-- Name: unidad_venenos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE unidad_venenos_id_seq OWNED BY unidad_venenos.id;


--
-- Name: unidad_venenos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carlos
--

SELECT pg_catalog.setval('unidad_venenos_id_seq', 1, false);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY acta_compania_aseguradora ALTER COLUMN id SET DEFAULT nextval('acta_compania_aseguradora_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY acta_contenedor_gas ALTER COLUMN id SET DEFAULT nextval('acta_contenedor_gas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY acta_empresa_dist ALTER COLUMN id SET DEFAULT nextval('acta_empresa_dist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY acta_servicio ALTER COLUMN id SET DEFAULT nextval('acta_servicio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY acta_tipo_lugar ALTER COLUMN id SET DEFAULT nextval('acta_tipo_lugar_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY ambulancia ALTER COLUMN id SET DEFAULT nextval('ambulancia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY apoyo_bomberil ALTER COLUMN id SET DEFAULT nextval('apoyo_bomberil_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY causa ALTER COLUMN id SET DEFAULT nextval('causa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY compania_aseguradora ALTER COLUMN id SET DEFAULT nextval('compania_aseguradora_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY contenedor_gas ALTER COLUMN id SET DEFAULT nextval('contenedor_gas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY empresa_dist_gas ALTER COLUMN id SET DEFAULT nextval('empresa_dist_gas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY fuente_calor ALTER COLUMN id SET DEFAULT nextval('fuente_calor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY lugar_inicio_fuego ALTER COLUMN id SET DEFAULT nextval('lugar_inicio_fuego_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY marca_vehiculo ALTER COLUMN id SET DEFAULT nextval('marca_vehiculo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY modelo_vehiculo ALTER COLUMN id SET DEFAULT nextval('modelo_vehiculo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY modulos ALTER COLUMN id SET DEFAULT nextval('modulos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY municipalidad ALTER COLUMN id SET DEFAULT nextval('municipalidad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY origen ALTER COLUMN id SET DEFAULT nextval('origen_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY otros_afectados ALTER COLUMN id SET DEFAULT nextval('otros_afectados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY otros_apoyos ALTER COLUMN id SET DEFAULT nextval('otros_apoyos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY otros_bomberos ALTER COLUMN id SET DEFAULT nextval('otros_bomberos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY otros_lesionados ALTER COLUMN id SET DEFAULT nextval('otros_lesionados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY otros_vehiculos ALTER COLUMN id SET DEFAULT nextval('otros_vehiculos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY permisos ALTER COLUMN id SET DEFAULT nextval('permisos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY proc_ambulancia ALTER COLUMN id SET DEFAULT nextval('proc_ambulancia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY tipo_construccion ALTER COLUMN id SET DEFAULT nextval('tipo_construccion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY tipo_gas ALTER COLUMN id SET DEFAULT nextval('tipo_gas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY tipo_lugar ALTER COLUMN id SET DEFAULT nextval('tipo_lugar_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY tipo_ocupante ALTER COLUMN id SET DEFAULT nextval('tipo_ocupante_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY tipo_servicio ALTER COLUMN id SET DEFAULT nextval('tipo_servicio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY tipo_vehiculo ALTER COLUMN id SET DEFAULT nextval('tipo_vehiculo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY tipo_via ALTER COLUMN id SET DEFAULT nextval('tipo_via_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY unidad_explosivos ALTER COLUMN id SET DEFAULT nextval('unidad_explosivos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY unidad_gases ALTER COLUMN id SET DEFAULT nextval('unidad_gases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY unidad_liquidos ALTER COLUMN id SET DEFAULT nextval('unidad_liquidos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY unidad_otros ALTER COLUMN id SET DEFAULT nextval('unidad_otros_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY unidad_oxidantes ALTER COLUMN id SET DEFAULT nextval('unidad_oxidantes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY unidad_radioactivos ALTER COLUMN id SET DEFAULT nextval('unidad_radioactivos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY unidad_solidos ALTER COLUMN id SET DEFAULT nextval('unidad_solidos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY unidad_venenos ALTER COLUMN id SET DEFAULT nextval('unidad_venenos_id_seq'::regclass);


--
-- Name: 17142; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17142');


ALTER LARGE OBJECT 17142 OWNER TO carlos;

--
-- Name: 17145; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17145');


ALTER LARGE OBJECT 17145 OWNER TO carlos;

--
-- Name: 17154; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17154');


ALTER LARGE OBJECT 17154 OWNER TO carlos;

--
-- Name: 17155; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17155');


ALTER LARGE OBJECT 17155 OWNER TO carlos;

--
-- Name: 17160; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17160');


ALTER LARGE OBJECT 17160 OWNER TO carlos;

--
-- Name: 17161; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17161');


ALTER LARGE OBJECT 17161 OWNER TO carlos;

--
-- Name: 17162; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17162');


ALTER LARGE OBJECT 17162 OWNER TO carlos;

--
-- Name: 17163; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17163');


ALTER LARGE OBJECT 17163 OWNER TO carlos;

--
-- Name: 17164; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17164');


ALTER LARGE OBJECT 17164 OWNER TO carlos;

--
-- Name: 17165; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17165');


ALTER LARGE OBJECT 17165 OWNER TO carlos;

--
-- Name: 17168; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17168');


ALTER LARGE OBJECT 17168 OWNER TO carlos;

--
-- Name: 17169; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17169');


ALTER LARGE OBJECT 17169 OWNER TO carlos;

--
-- Name: 17170; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17170');


ALTER LARGE OBJECT 17170 OWNER TO carlos;

--
-- Name: 17171; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17171');


ALTER LARGE OBJECT 17171 OWNER TO carlos;

--
-- Name: 17187; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17187');


ALTER LARGE OBJECT 17187 OWNER TO carlos;

--
-- Name: 17188; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17188');


ALTER LARGE OBJECT 17188 OWNER TO carlos;

--
-- Name: 17189; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17189');


ALTER LARGE OBJECT 17189 OWNER TO carlos;

--
-- Name: 17190; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17190');


ALTER LARGE OBJECT 17190 OWNER TO carlos;

--
-- Name: 17191; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17191');


ALTER LARGE OBJECT 17191 OWNER TO carlos;

--
-- Name: 17192; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17192');


ALTER LARGE OBJECT 17192 OWNER TO carlos;

--
-- Name: 17193; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17193');


ALTER LARGE OBJECT 17193 OWNER TO carlos;

--
-- Name: 17194; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17194');


ALTER LARGE OBJECT 17194 OWNER TO carlos;

--
-- Name: 17195; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17195');


ALTER LARGE OBJECT 17195 OWNER TO carlos;

--
-- Name: 17196; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17196');


ALTER LARGE OBJECT 17196 OWNER TO carlos;

--
-- Name: 17217; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17217');


ALTER LARGE OBJECT 17217 OWNER TO carlos;

--
-- Name: 17218; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17218');


ALTER LARGE OBJECT 17218 OWNER TO carlos;

--
-- Name: 17219; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17219');


ALTER LARGE OBJECT 17219 OWNER TO carlos;

--
-- Name: 17220; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17220');


ALTER LARGE OBJECT 17220 OWNER TO carlos;

--
-- Name: 17221; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17221');


ALTER LARGE OBJECT 17221 OWNER TO carlos;

--
-- Name: 17222; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17222');


ALTER LARGE OBJECT 17222 OWNER TO carlos;

--
-- Name: 17223; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17223');


ALTER LARGE OBJECT 17223 OWNER TO carlos;

--
-- Name: 17224; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17224');


ALTER LARGE OBJECT 17224 OWNER TO carlos;

--
-- Name: 17225; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17225');


ALTER LARGE OBJECT 17225 OWNER TO carlos;

--
-- Name: 17226; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17226');


ALTER LARGE OBJECT 17226 OWNER TO carlos;

--
-- Name: 17227; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17227');


ALTER LARGE OBJECT 17227 OWNER TO carlos;

--
-- Name: 17228; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17228');


ALTER LARGE OBJECT 17228 OWNER TO carlos;

--
-- Name: 17243; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17243');


ALTER LARGE OBJECT 17243 OWNER TO carlos;

--
-- Name: 17244; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17244');


ALTER LARGE OBJECT 17244 OWNER TO carlos;

--
-- Name: 17257; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17257');


ALTER LARGE OBJECT 17257 OWNER TO carlos;

--
-- Name: 17277; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17277');


ALTER LARGE OBJECT 17277 OWNER TO carlos;

--
-- Name: 17278; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17278');


ALTER LARGE OBJECT 17278 OWNER TO carlos;

--
-- Name: 17720; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17720');


ALTER LARGE OBJECT 17720 OWNER TO carlos;

--
-- Name: 17721; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17721');


ALTER LARGE OBJECT 17721 OWNER TO carlos;

--
-- Name: 17722; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17722');


ALTER LARGE OBJECT 17722 OWNER TO carlos;

--
-- Name: 17723; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17723');


ALTER LARGE OBJECT 17723 OWNER TO carlos;

--
-- Name: 17724; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17724');


ALTER LARGE OBJECT 17724 OWNER TO carlos;

--
-- Name: 17725; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17725');


ALTER LARGE OBJECT 17725 OWNER TO carlos;

--
-- Name: 17726; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17726');


ALTER LARGE OBJECT 17726 OWNER TO carlos;

--
-- Name: 17727; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17727');


ALTER LARGE OBJECT 17727 OWNER TO carlos;

--
-- Name: 17728; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17728');


ALTER LARGE OBJECT 17728 OWNER TO carlos;

--
-- Name: 17729; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17729');


ALTER LARGE OBJECT 17729 OWNER TO carlos;

--
-- Name: 17730; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17730');


ALTER LARGE OBJECT 17730 OWNER TO carlos;

--
-- Name: 17731; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17731');


ALTER LARGE OBJECT 17731 OWNER TO carlos;

--
-- Name: 17732; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17732');


ALTER LARGE OBJECT 17732 OWNER TO carlos;

--
-- Name: 17733; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17733');


ALTER LARGE OBJECT 17733 OWNER TO carlos;

--
-- Name: 17768; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17768');


ALTER LARGE OBJECT 17768 OWNER TO carlos;

--
-- Name: 17769; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17769');


ALTER LARGE OBJECT 17769 OWNER TO carlos;

--
-- Name: 17770; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17770');


ALTER LARGE OBJECT 17770 OWNER TO carlos;

--
-- Name: 17771; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17771');


ALTER LARGE OBJECT 17771 OWNER TO carlos;

--
-- Name: 17772; Type: BLOB; Schema: -; Owner: carlos
--

SELECT pg_catalog.lo_create('17772');


ALTER LARGE OBJECT 17772 OWNER TO carlos;

--
-- Data for Name: acta_compania_aseguradora; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY acta_compania_aseguradora (id, id_acta_servicio, id_compania_aseguradora, creado, modificado) FROM stdin;
1	90	1	2013-06-26 21:21:15.170505	2013-06-26 21:21:15.170505
2	90	1	2013-06-26 21:21:15.170505	2013-06-26 21:21:15.170505
3	91	1	2013-06-26 21:22:31.224225	2013-06-26 21:22:31.224225
4	91	1	2013-06-26 21:22:31.224225	2013-06-26 21:22:31.224225
5	92	1	2013-06-26 21:23:12.414667	2013-06-26 21:23:12.414667
6	92	1	2013-06-26 21:23:12.414667	2013-06-26 21:23:12.414667
7	93	1	2013-06-26 21:23:16.0182	2013-06-26 21:23:16.0182
8	93	1	2013-06-26 21:23:16.0182	2013-06-26 21:23:16.0182
9	94	1	2013-06-26 21:24:36.619844	2013-06-26 21:24:36.619844
\.


--
-- Data for Name: acta_contenedor_gas; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY acta_contenedor_gas (id, id_acta_servicio, id_contenedor_gas, id_tipo_gas, capacidad_contenedor, id_empresa_dist, creado, modificado) FROM stdin;
1	90	\N	1	g	\N	2013-06-26 21:21:15.170505	2013-06-26 21:21:15.170505
2	91	\N	1	3	\N	2013-06-26 21:22:31.224225	2013-06-26 21:22:31.224225
3	92	\N	1	3	\N	2013-06-26 21:23:12.414667	2013-06-26 21:23:12.414667
4	93	\N	1	3	\N	2013-06-26 21:23:16.0182	2013-06-26 21:23:16.0182
5	94	\N	1	a	\N	2013-06-26 21:24:36.619844	2013-06-26 21:24:36.619844
\.


--
-- Data for Name: acta_empresa_dist; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY acta_empresa_dist (id, id_acta_servicio, id_empresa_dist, creado, modificado) FROM stdin;
1	90	1	2013-06-26 21:21:15.170505	2013-06-26 21:21:15.170505
2	91	1	2013-06-26 21:22:31.224225	2013-06-26 21:22:31.224225
3	92	1	2013-06-26 21:23:12.414667	2013-06-26 21:23:12.414667
4	93	1	2013-06-26 21:23:16.0182	2013-06-26 21:23:16.0182
5	94	1	2013-06-26 21:24:36.619844	2013-06-26 21:24:36.619844
\.


--
-- Data for Name: acta_servicio; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY acta_servicio (id, correlativo, id_tipo_servicio, sector, fecha, hora, id_cuerpo, id_compania, direccion, numero, calle, comuna, poblacion, nro_block, nro_depto, latitud, longitud, rut, nombre, telefono, id_tipo_ocupante, nro_adultos, nro_ninos, mails, id_tipo_lugar, id_tipo_vehiculo, id_marca_vehiculo, id_modelo_vehiculo, patente, id_lugar_inicio_fuego, id_origen, id_causa, observacion_causa, id_fuente_calor, oservacion_fuente_calor, dano_vivienda, dano_vehiculo, dano_enseres, otro_dano, id_unidad_explosivos, cantidad_explosivos, id_unidad_venenos, cantidad_venenos, id_unidad_gases, cantidad_gases, id_unidad_solidos, cantidad_solidos, id_unidad_radioactivos, cantidad_radioactivos, id_unidad_oxidantes, cantidad_oxidantes, id_unidad_otros, cantidad_otros, detalle_productos, nro_poliza, especies_aseguradas, id_proc_ambulancia, id_municipalidad, id_movil_oe, carabinero, id_otros_apoyos, id_investigado_por, det_fecha_inicio, det_fecha_termino, existen_fotos, existen_muestras, existen_otros, dat_otros, notas_depto_tecnico, id_cuerpo_ba, id_bombero_ba, id_dejada_por, id_comiseria, fecha_denuncia, nro_libro_denuncia, nro_hoja_denuncia, nro_parrafo_denuncia, desc_bombero_accidentado, id_bombero_acargo, id_cargo_bombero_acargo, id_bombero_tomo_datos, cargo_bombero_acargo, id_unidad_liquidos, cantidad_liquidos, cuerpo, creado, modificado, id_tipo_via, patente_carabinero, id_investigado_por_otro, correlativo_tipo) FROM stdin;
1	1	\N		1900-01-01	\N	\N	527	manuel montt	111	gdf	350	hgfhgf	23	3435435	-37.0842727620033301	-73.1555232499999875	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	\N	\N	\N	\N	\N	\N
4	1	\N		1900-01-01	\N	\N	527	manuel montt	111	gdf	350	hgfhgf	23	3435435	-37.0842727620033301	-73.1555232499999875	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	\N	\N	\N	\N	\N	\N
11	1	\N		1900-01-01	\N	\N	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	2013-05-31 08:19:51.196711	2013-05-31 08:19:51.196711	\N	\N	\N	\N
12	1	\N		1900-01-01	\N	\N	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	2013-05-31 08:23:56.827636	2013-05-31 08:23:56.827636	\N	\N	\N	\N
17	1	\N		1900-01-01	\N	\N	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					17977	\N	17977		\N	\N	Achao	2013-05-31 08:49:22.7212	2013-05-31 08:49:22.7212	\N	\N	\N	\N
18	1	\N		1900-01-01	\N	\N	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	2013-05-31 08:54:06.897836	2013-05-31 08:54:06.897836	\N	\N	\N	\N
19	1	\N		1900-01-01	\N	\N	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	2013-05-31 08:55:23.686075	2013-05-31 08:55:23.686075	\N	\N	\N	\N
20	1	\N		1900-01-01	\N	\N	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	2013-05-31 08:57:25.570049	2013-05-31 08:57:25.570049	\N	\N	\N	\N
21	1	\N		1900-01-01	\N	\N	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	2013-05-31 09:01:04.001768	2013-05-31 09:01:04.001768	\N	\N	\N	\N
22	1	\N		1900-01-01	\N	\N	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	2013-05-31 09:02:26.150545	2013-05-31 09:02:26.150545	\N	\N	\N	\N
23	1	\N		2013-09-05	\N	\N	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	2013-05-31 09:07:31.866913	2013-05-31 09:07:31.866913	\N	\N	\N	\N
24	1	\N		2013-09-05	\N	\N	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	2013-05-31 09:09:13.934996	2013-05-31 09:09:13.934996	\N	\N	\N	\N
25	1	\N		1900-01-01	\N	\N	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	2013-05-31 10:25:59.603505	2013-05-31 10:25:59.603505	\N	\N	\N	\N
26	1	\N		1900-01-01	\N	\N	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	1900-01-01 00:00:00					\N	\N	\N		\N	\N	Achao	2013-05-31 10:26:38.760155	2013-05-31 10:26:38.760155	\N	\N	\N	\N
27	27	\N	zxc	1900-01-01	\N	\N	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	2013-03-06 03:08:01					\N	\N	\N		\N	\N	Achao	2013-06-03 03:08:09.013007	2013-06-03 03:08:09.013007	\N			\N
28	28	1	asd	1900-01-01	\N	\N	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	2013-04-06 00:00:00					\N	\N	\N	\N	\N	\N		2013-06-04 19:41:47.758047	2013-06-04 19:41:47.758047	\N			\N
29	29	\N	asd	1900-01-01	\N	\N	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	2013-04-06 00:00:00					\N	\N	\N	\N	\N	\N		2013-06-04 19:42:50.066461	2013-06-04 19:42:50.066461	\N			\N
30	30	\N	asd	1900-01-01	\N	\N	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	2013-04-06 00:00:00					\N	\N	\N	\N	\N	\N		2013-06-04 19:44:33.219759	2013-06-04 19:44:33.219759	\N			\N
31	30	\N	asd	1900-01-01	\N	\N	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	2013-04-06 00:00:00					\N	\N	\N	\N	\N	\N		2013-06-04 19:45:12.925709	2013-06-04 19:45:12.925709	\N			\N
32	32	1	asd	1900-01-01	\N	\N	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1900-01-01 00:00:00	1900-01-01 00:00:00	0	0	0			\N	\N	\N	\N	2013-04-06 00:00:00					\N	\N	\N	\N	\N	\N		2013-06-04 19:46:13.542777	2013-06-04 19:46:13.542777	\N			\N
33	3	1	asdasd	2013-04-06	\N	\N	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1969-12-31 21:00:00	1969-12-31 21:00:00	0	0	0			\N	\N	\N	\N	2013-04-06 00:00:00					\N	\N	\N	\N	\N	\N	277	2013-06-04 20:33:13.329473	2013-06-04 20:33:13.329473	\N			\N
34	4	1	asd	2013-04-06	\N	\N	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1969-12-31 21:00:00	1969-12-31 21:00:00	0	0	0			\N	\N	\N	\N	2013-04-06 00:00:00					\N	\N	\N	\N	\N	\N	275	2013-06-04 20:36:27.941422	2013-06-04 20:36:27.941422	\N			\N
35	5	1	asdasd	2013-04-06	\N	\N	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	1969-12-31 21:00:00	1969-12-31 21:00:00	0	0	0			\N	\N	\N	\N	2013-04-06 00:00:00					\N	\N	\N	\N	\N	\N	275	2013-06-04 20:37:15.739812	2013-06-04 20:37:15.739812	\N			\N
36	1	2	123	2013-04-06	\N	\N	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-04-06 20:38:00	2013-04-06 20:38:00	0	0	0			\N	\N	\N	\N	2013-04-06 00:00:00					\N	\N	\N	\N	\N	\N	275	2013-06-04 20:38:44.591734	2013-06-04 20:38:44.591734	\N			\N
37	6	1	ghf	2013-05-06	\N	\N	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-05-06 09:36:00	2013-05-06 09:36:00	0	0	0			\N	\N	\N	\N	2013-05-06 00:00:00					\N	\N	\N	\N	\N	\N	275	2013-06-05 09:37:18.875661	2013-06-05 09:37:18.875661	\N			\N
38	11	1	asd	2013-05-06	\N	\N	693								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-05-06 16:40:00	1969-12-31 21:00:00	0	0	0			\N	\N	\N	\N	2013-05-06 00:00:00					\N	\N	\N	\N	\N	\N	275	2013-06-05 16:40:49.439176	2013-06-05 16:40:49.439176	\N			7
39	11	1	asd	2013-05-06	\N	\N	693								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-05-06 16:40:00	2013-05-06 16:40:00	0	0	0			\N	\N	\N	\N	2013-05-06 00:00:00					\N	\N	\N	\N	\N	\N	275	2013-06-05 16:41:48.85197	2013-06-05 16:41:48.85197	\N			7
40	11	1	qwe	2013-05-06	\N	\N	693								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-05-06 16:41:00	2013-05-06 16:41:00	0	0	0			\N	\N	\N	\N	2013-05-06 00:00:00					\N	\N	\N	\N	\N	\N	275	2013-06-05 16:42:14.054456	2013-06-05 16:42:14.054456	\N			9
41	11	1	asd	2013-05-06	\N	\N	693								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-05-06 16:42:00	2013-05-06 16:42:00	0	0	0			\N	\N	\N	\N	2013-05-06 00:00:00					\N	\N	\N	\N	\N	\N	275	2013-06-05 16:42:47.994142	2013-06-05 16:42:47.994142	\N			10
42	11	1	asd	2013-05-06	\N	275	693								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-05-06 16:42:00	2013-05-06 16:42:00	0	0	0			\N	\N	\N	\N	2013-05-06 00:00:00					\N	\N	\N	\N	\N	\N	\N	2013-06-05 16:46:43.91767	2013-06-05 16:46:43.91767	\N			10
43	1	1	asdasd	2013-05-06	\N	38	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-05-06 16:46:00	2013-05-06 16:46:00	0	0	0			\N	\N	\N	\N	2013-05-06 00:00:00					\N	\N	\N	\N	\N	\N	\N	2013-06-05 16:49:34.028041	2013-06-05 16:49:34.028041	\N			12
44	2	1	asd	2013-06-06	\N	275	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-06-06 16:10:00	2013-06-06 16:10:00	0	0	0			\N	\N	\N	\N	2013-06-06 00:00:00					\N	\N	\N	\N	\N	\N	\N	2013-06-06 16:11:31.319624	2013-06-06 16:11:31.319624	\N			13
45	3	1	1	2013-06-06	\N	275	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-06-06 16:13:00	2013-06-06 16:13:00	0	0	0			\N	\N	\N	\N	2013-06-06 00:00:00					\N	\N	\N	\N	\N	\N	\N	2013-06-06 16:14:09.436422	2013-06-06 16:14:09.436422	\N			14
46	4	1	asd	2013-06-06	\N	275	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-06-06 16:14:00	2013-06-06 16:14:00	0	0	0			\N	\N	\N	\N	2013-06-06 00:00:00					\N	\N	\N	\N	\N	\N	\N	2013-06-06 16:19:55.690935	2013-06-06 16:19:55.690935	\N			15
47	4	1	asd	2013-06-06	\N	275	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-06-06 16:14:00	2013-06-06 16:14:00	0	0	0			\N	\N	\N	\N	2013-06-06 00:00:00					\N	\N	\N	\N	\N	\N	\N	2013-06-06 16:23:33.611451	2013-06-06 16:23:33.611451	\N			15
48	4	1	asd	2013-06-06	\N	275	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-06-06 16:14:00	2013-06-06 16:14:00	0	0	0			\N	\N	\N	\N	2013-06-06 00:00:00					\N	\N	\N	\N	\N	\N	\N	2013-06-06 16:23:38.320763	2013-06-06 16:23:38.320763	\N			15
63	7	2	asd	2013-06-06	\N	275	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-06-06 16:53:00	2013-06-06 16:53:00	0	0	0			\N	\N	\N	\N	2013-06-06 00:00:00					\N	\N	\N	\N	\N	\N	\N	2013-06-06 16:55:04.05763	2013-06-06 16:55:04.05763	\N			2
64	7	2	asd	2013-06-06	\N	275	\N								\N	\N	1-9			\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-06-06 16:53:00	2013-06-06 16:53:00	0	0	0			\N	\N	\N	\N	2013-06-06 00:00:00					\N	\N	\N	\N	\N	\N	\N	2013-06-06 16:56:30.050334	2013-06-06 16:56:30.050334	\N			2
65	1	1	asd	2013-07-06	\N	6	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-07-06 10:51:00	2013-07-06 10:51:00	0	0	0			38	\N	\N	\N	2013-07-06 00:00:00					\N	\N	\N	\N	\N	\N	\N	2013-06-07 10:55:44.647945	2013-06-07 10:55:44.647945	\N			18
74	9	1	asdasd	2013-10-06	\N	275	693								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-10-06 22:14:00	2013-10-06 22:14:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-10 22:20:43.198767	2013-06-10 22:20:43.198767	\N			19
75	9	1	asdasd	2013-10-06	\N	275	693								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-10-06 22:14:00	2013-10-06 22:14:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-10 22:22:33.122267	2013-06-10 22:22:33.122267	\N			19
76	2	1	asd	2013-11-06	\N	38	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-11-06 02:28:00	2013-11-06 02:28:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-11 02:29:04.007414	2013-06-11 02:29:04.007414	\N			21
77	1	1	asd	2013-11-06	\N	240	695								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-11-06 02:29:00	2013-11-06 02:29:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-11 02:29:21.446981	2013-06-11 02:29:21.446981	\N			22
78	112	2	asd	2013-12-06	\N	275	856								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-12-06 17:38:00	2013-12-06 17:38:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-12 17:38:52.333813	2013-06-12 17:38:52.333813	\N			4
79	112	2	asd	2013-12-06	\N	275	856								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-12-06 17:38:00	2013-12-06 17:38:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-12 17:39:59.095325	2013-06-12 17:39:59.095325	\N			4
80	112	2	asd	2013-12-06	\N	275	856								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-12-06 17:38:00	2013-12-06 17:38:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-12 17:41:08.272234	2013-06-12 17:41:08.272234	\N			4
81	112	2	asd	2013-12-06	\N	275	856								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-12-06 17:38:00	2013-12-06 17:38:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-12 17:41:58.574346	2013-06-12 17:41:58.574346	\N			4
82	15	2	asd	2013-12-06	\N	275	693								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-12-06 17:42:00	2013-12-06 17:42:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-12 17:42:21.609814	2013-06-12 17:42:21.609814	\N			8
83	15	2	asd	2013-12-06	\N	275	693								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-12-06 17:42:00	2013-12-06 17:42:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-12 17:46:22.473731	2013-06-12 17:46:22.473731	\N			8
84	15	2	asd	2013-12-06	\N	275	693								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-12-06 17:42:00	2013-12-06 17:42:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-12 17:47:45.3933	2013-06-12 17:47:45.3933	\N			8
85	15	2	asd	2013-12-06	\N	275	693								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-12-06 17:42:00	2013-12-06 17:42:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-12 17:48:04.448122	2013-06-12 17:48:04.448122	\N			8
86	1	1	asd	2013-12-06	\N	298	692	manuel montt	111		272				-33.4297308104829725	-70.6197091000000228				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-12-06 18:07:00	2013-12-06 18:07:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-12 18:08:11.0799	2013-06-12 18:08:11.0799	\N			23
87	19	2	asd	2013-12-06	\N	275	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-12-06 19:23:00	2013-12-06 19:23:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-12 19:24:31.944483	2013-06-12 19:24:31.944483	\N			122
88	1	1	asd	2013-12-06	\N	298	692	manuel montt	111		272				-33.4297308104829725	-70.6197091000000228				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N			\N	\N	2013-12-06 18:07:00	2013-12-06 18:07:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-12 19:28:40.192113	2013-06-12 19:28:40.192113	\N			23
89	113	1	asd	1969-12-31	\N	275	\N								\N	\N		asd		\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N		asd	\N	\N	1969-12-31 21:00:00	1969-12-31 21:00:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-14 09:32:01.443208	2013-06-14 09:32:01.443208	\N			24
90	114	1	asd	1969-12-31	\N	275	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N		asd	\N	\N	1969-12-31 21:00:00	1969-12-31 21:00:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-26 21:21:15.170505	2013-06-26 21:21:15.170505	\N			25
91	115	1	asd	1969-12-31	\N	275	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N		asd	\N	\N	1969-12-31 21:00:00	1969-12-31 21:00:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-26 21:22:31.224225	2013-06-26 21:22:31.224225	\N			26
92	115	1	asd	1969-12-31	\N	275	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N		asd	\N	\N	1969-12-31 21:00:00	1969-12-31 21:00:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-26 21:23:12.414667	2013-06-26 21:23:12.414667	\N			26
93	115	1	asd	1969-12-31	\N	275	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N		asd	\N	\N	1969-12-31 21:00:00	1969-12-31 21:00:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-26 21:23:16.0182	2013-06-26 21:23:16.0182	\N			26
94	116	1	asd	1969-12-31	\N	275	\N								\N	\N				\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N		\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N		\N	\N		asdasdasd	\N	\N	1969-12-31 21:00:00	1969-12-31 21:00:00	0	0	0			\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2013-06-26 21:24:36.619844	2013-06-26 21:24:36.619844	\N	asdasd		27
\.


--
-- Data for Name: acta_tipo_lugar; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY acta_tipo_lugar (id, id_acta_servicio, id_tipo_lugar, id_tipo_construccion, pisos, dano_enseres, otros_danos, creado, modificado) FROM stdin;
12	17	6	2	4	19	234	2013-05-31 08:49:22.7212	2013-05-31 08:49:22.7212
13	17	7	1	234	5	234	2013-05-31 08:49:22.7212	2013-05-31 08:49:22.7212
14	63	3	1	1	0	ind1	2013-06-06 16:55:04.05763	2013-06-06 16:55:04.05763
15	63	3	6	4	3	ind2	2013-06-06 16:55:04.05763	2013-06-06 16:55:04.05763
16	63	3	1	12	1	ind3	2013-06-06 16:55:04.05763	2013-06-06 16:55:04.05763
17	63	6	2	\N	0		2013-06-06 16:55:04.05763	2013-06-06 16:55:04.05763
18	64	3	1	1	0	ind1	2013-06-06 16:56:30.050334	2013-06-06 16:56:30.050334
19	64	3	6	4	3	ind2	2013-06-06 16:56:30.050334	2013-06-06 16:56:30.050334
20	64	3	1	12	1	ind3	2013-06-06 16:56:30.050334	2013-06-06 16:56:30.050334
21	64	6	2	\N	0		2013-06-06 16:56:30.050334	2013-06-06 16:56:30.050334
\.


--
-- Data for Name: ambulancia; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY ambulancia (id, id_proc_ambulancia, creado, modificado, id_acta_servicio, id_ident_movil) FROM stdin;
1	1	2013-05-31 08:23:56.827636	2013-05-31 08:23:56.827636	12	\N
2	2	2013-05-31 08:23:56.827636	2013-05-31 08:23:56.827636	12	\N
3	1	2013-05-31 08:23:56.827636	2013-05-31 08:23:56.827636	12	\N
4	1	2013-05-31 08:23:56.827636	2013-05-31 08:23:56.827636	12	\N
\.


--
-- Data for Name: apoyo_bomberil; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY apoyo_bomberil (id, id_acta_servicio, id_cuerpo, id_compania, creado, modificado) FROM stdin;
5	17	275	693	2013-05-31 08:49:22.7212	2013-05-31 08:49:22.7212
6	17	276	856	2013-05-31 08:49:22.7212	2013-05-31 08:49:22.7212
7	18	\N	\N	2013-05-31 08:54:06.897836	2013-05-31 08:54:06.897836
8	19	\N	\N	2013-05-31 08:55:23.686075	2013-05-31 08:55:23.686075
9	20	\N	\N	2013-05-31 08:57:25.570049	2013-05-31 08:57:25.570049
10	21	\N	\N	2013-05-31 09:01:04.001768	2013-05-31 09:01:04.001768
11	22	\N	\N	2013-05-31 09:02:26.150545	2013-05-31 09:02:26.150545
12	23	\N	\N	2013-05-31 09:07:31.866913	2013-05-31 09:07:31.866913
13	24	\N	\N	2013-05-31 09:09:13.934996	2013-05-31 09:09:13.934996
14	25	\N	\N	2013-05-31 10:25:59.603505	2013-05-31 10:25:59.603505
15	26	\N	\N	2013-05-31 10:26:38.760155	2013-05-31 10:26:38.760155
16	27	\N	\N	2013-06-03 03:08:09.013007	2013-06-03 03:08:09.013007
17	28	\N	\N	2013-06-04 19:41:47.758047	2013-06-04 19:41:47.758047
18	29	\N	\N	2013-06-04 19:42:50.066461	2013-06-04 19:42:50.066461
19	30	\N	\N	2013-06-04 19:44:33.219759	2013-06-04 19:44:33.219759
20	31	\N	\N	2013-06-04 19:45:12.925709	2013-06-04 19:45:12.925709
21	32	\N	\N	2013-06-04 19:46:13.542777	2013-06-04 19:46:13.542777
22	33	\N	\N	2013-06-04 20:33:13.329473	2013-06-04 20:33:13.329473
23	34	\N	\N	2013-06-04 20:36:27.941422	2013-06-04 20:36:27.941422
24	35	\N	\N	2013-06-04 20:37:15.739812	2013-06-04 20:37:15.739812
25	36	\N	\N	2013-06-04 20:38:44.591734	2013-06-04 20:38:44.591734
26	37	\N	\N	2013-06-05 09:37:18.875661	2013-06-05 09:37:18.875661
27	38	\N	\N	2013-06-05 16:40:49.439176	2013-06-05 16:40:49.439176
28	39	\N	\N	2013-06-05 16:41:48.85197	2013-06-05 16:41:48.85197
29	40	\N	\N	2013-06-05 16:42:14.054456	2013-06-05 16:42:14.054456
30	41	\N	\N	2013-06-05 16:42:47.994142	2013-06-05 16:42:47.994142
31	42	\N	\N	2013-06-05 16:46:43.91767	2013-06-05 16:46:43.91767
32	43	\N	\N	2013-06-05 16:49:34.028041	2013-06-05 16:49:34.028041
33	44	\N	\N	2013-06-06 16:11:31.319624	2013-06-06 16:11:31.319624
34	45	\N	\N	2013-06-06 16:14:09.436422	2013-06-06 16:14:09.436422
35	46	\N	\N	2013-06-06 16:19:55.690935	2013-06-06 16:19:55.690935
36	47	\N	\N	2013-06-06 16:23:33.611451	2013-06-06 16:23:33.611451
37	48	\N	\N	2013-06-06 16:23:38.320763	2013-06-06 16:23:38.320763
38	63	\N	\N	2013-06-06 16:55:04.05763	2013-06-06 16:55:04.05763
39	64	\N	\N	2013-06-06 16:56:30.050334	2013-06-06 16:56:30.050334
40	65	\N	\N	2013-06-07 10:55:44.647945	2013-06-07 10:55:44.647945
49	74	\N	\N	2013-06-10 22:20:43.198767	2013-06-10 22:20:43.198767
50	75	\N	\N	2013-06-10 22:22:33.122267	2013-06-10 22:22:33.122267
51	76	\N	\N	2013-06-11 02:29:04.007414	2013-06-11 02:29:04.007414
52	77	\N	\N	2013-06-11 02:29:21.446981	2013-06-11 02:29:21.446981
53	78	\N	\N	2013-06-12 17:38:52.333813	2013-06-12 17:38:52.333813
54	79	\N	\N	2013-06-12 17:39:59.095325	2013-06-12 17:39:59.095325
55	80	\N	\N	2013-06-12 17:41:08.272234	2013-06-12 17:41:08.272234
56	81	\N	\N	2013-06-12 17:41:58.574346	2013-06-12 17:41:58.574346
57	82	\N	\N	2013-06-12 17:42:21.609814	2013-06-12 17:42:21.609814
58	83	\N	\N	2013-06-12 17:46:22.473731	2013-06-12 17:46:22.473731
59	84	\N	\N	2013-06-12 17:47:45.3933	2013-06-12 17:47:45.3933
60	85	\N	\N	2013-06-12 17:48:04.448122	2013-06-12 17:48:04.448122
61	86	\N	\N	2013-06-12 18:08:11.0799	2013-06-12 18:08:11.0799
62	87	\N	\N	2013-06-12 19:24:31.944483	2013-06-12 19:24:31.944483
63	88	\N	\N	2013-06-12 19:28:40.192113	2013-06-12 19:28:40.192113
64	89	\N	\N	2013-06-14 09:32:01.443208	2013-06-14 09:32:01.443208
65	90	\N	\N	2013-06-26 21:21:15.170505	2013-06-26 21:21:15.170505
66	91	\N	\N	2013-06-26 21:22:31.224225	2013-06-26 21:22:31.224225
67	92	\N	\N	2013-06-26 21:23:12.414667	2013-06-26 21:23:12.414667
68	93	\N	\N	2013-06-26 21:23:16.0182	2013-06-26 21:23:16.0182
69	94	\N	\N	2013-06-26 21:24:36.619844	2013-06-26 21:24:36.619844
\.


--
-- Data for Name: causa; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY causa (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: compania_aseguradora; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY compania_aseguradora (id, nombre, creado, modificado) FROM stdin;
1	sdgffgfd	2013-06-26 20:58:05.967803	2013-06-26 20:58:05.967803
\.


--
-- Data for Name: contenedor_gas; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY contenedor_gas (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: empresa_dist_gas; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY empresa_dist_gas (id, nombre, creado, modificado) FROM stdin;
1	asd	2013-06-26 20:58:00.464619	2013-06-26 20:58:00.464619
\.


--
-- Data for Name: fuente_calor; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY fuente_calor (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: lugar_inicio_fuego; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY lugar_inicio_fuego (id, nombre, creado, modificado) FROM stdin;
1	omg	2013-05-31 02:17:37.839524	2013-05-31 02:17:45.102627
2	sdfdfd	2013-06-06 20:38:55.769993	2013-06-06 20:38:55.769993
\.


--
-- Data for Name: marca_vehiculo; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY marca_vehiculo (id, nombre, creado, modificado) FROM stdin;
1	marca1	2013-06-05 10:27:11.210442	2013-06-05 10:27:11.210442
2	marca2	2013-06-05 10:27:14.976229	2013-06-05 10:27:14.976229
\.


--
-- Data for Name: modelo_vehiculo; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY modelo_vehiculo (id, id_marca_vehiculo, nombre, creado, modificado) FROM stdin;
3	2	test2	2013-06-06 19:34:02.188203	2013-06-06 19:34:02.188203
4	2	test	2013-06-06 20:20:48.115374	2013-06-06 20:20:48.115374
6	2	test	2013-06-06 20:25:55.488546	2013-06-06 20:25:55.488546
7	2	test	2013-06-06 20:26:17.808185	2013-06-06 20:26:17.808185
8	2	test	2013-06-06 20:28:09.02017	2013-06-06 20:28:09.02017
9	1	etesdf	2013-06-06 20:38:40.515784	2013-06-06 20:38:40.515784
10	1		2013-06-06 20:41:59.147491	2013-06-06 20:43:22.643748
5	1	test666	2013-06-06 20:23:26.535093	2013-06-06 20:51:32.84871
\.


--
-- Data for Name: modulos; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY modulos (id, modulo, descripcion, creado, modificado) FROM stdin;
\.


--
-- Data for Name: municipalidad; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY municipalidad (id, nombre, creado, modificado, cuerpo_id) FROM stdin;
1	Municipalidad 1	2013-05-31 02:33:41.172627	2013-06-11 01:50:45.797862	240
2	municipalidad 2	2013-05-31 02:33:46.714954	2013-06-11 02:15:47.725971	240
\.


--
-- Data for Name: origen; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY origen (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: otros_afectados; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY otros_afectados (id, rut, nombre, direccion, id_tipo_ocupante, nro_adultos, nro_ninos, dano_vivienda, dano_vehiculo, otros_danos, creado, modificado, id_acta_servicio) FROM stdin;
3	234	asfdsf	saf	\N	234	234	3	2	asfsdf	2013-05-31 08:49:22.7212	2013-05-31 08:49:22.7212	17
4				\N	\N	\N	0	0		2013-06-06 16:14:09.436422	2013-06-06 16:14:09.436422	45
\.


--
-- Data for Name: otros_apoyos; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY otros_apoyos (id, id_acta_servicio, texto, creado, modificado) FROM stdin;
7	17	324234	2013-05-31 08:49:22.7212	2013-05-31 08:49:22.7212
8	17	234234234	2013-05-31 08:49:22.7212	2013-05-31 08:49:22.7212
9	18		2013-05-31 08:54:06.897836	2013-05-31 08:54:06.897836
10	19		2013-05-31 08:55:23.686075	2013-05-31 08:55:23.686075
11	20		2013-05-31 08:57:25.570049	2013-05-31 08:57:25.570049
12	21		2013-05-31 09:01:04.001768	2013-05-31 09:01:04.001768
13	22		2013-05-31 09:02:26.150545	2013-05-31 09:02:26.150545
14	23		2013-05-31 09:07:31.866913	2013-05-31 09:07:31.866913
15	24		2013-05-31 09:09:13.934996	2013-05-31 09:09:13.934996
16	25		2013-05-31 10:25:59.603505	2013-05-31 10:25:59.603505
17	26		2013-05-31 10:26:38.760155	2013-05-31 10:26:38.760155
18	27		2013-06-03 03:08:09.013007	2013-06-03 03:08:09.013007
19	28		2013-06-04 19:41:47.758047	2013-06-04 19:41:47.758047
20	29		2013-06-04 19:42:50.066461	2013-06-04 19:42:50.066461
21	30		2013-06-04 19:44:33.219759	2013-06-04 19:44:33.219759
22	31		2013-06-04 19:45:12.925709	2013-06-04 19:45:12.925709
23	32		2013-06-04 19:46:13.542777	2013-06-04 19:46:13.542777
24	33		2013-06-04 20:33:13.329473	2013-06-04 20:33:13.329473
25	34		2013-06-04 20:36:27.941422	2013-06-04 20:36:27.941422
26	35		2013-06-04 20:37:15.739812	2013-06-04 20:37:15.739812
27	36		2013-06-04 20:38:44.591734	2013-06-04 20:38:44.591734
28	37		2013-06-05 09:37:18.875661	2013-06-05 09:37:18.875661
29	38		2013-06-05 16:40:49.439176	2013-06-05 16:40:49.439176
30	39		2013-06-05 16:41:48.85197	2013-06-05 16:41:48.85197
31	40		2013-06-05 16:42:14.054456	2013-06-05 16:42:14.054456
32	41		2013-06-05 16:42:47.994142	2013-06-05 16:42:47.994142
33	42		2013-06-05 16:46:43.91767	2013-06-05 16:46:43.91767
34	43		2013-06-05 16:49:34.028041	2013-06-05 16:49:34.028041
35	44		2013-06-06 16:11:31.319624	2013-06-06 16:11:31.319624
36	45		2013-06-06 16:14:09.436422	2013-06-06 16:14:09.436422
37	46		2013-06-06 16:19:55.690935	2013-06-06 16:19:55.690935
38	47		2013-06-06 16:23:33.611451	2013-06-06 16:23:33.611451
39	48		2013-06-06 16:23:38.320763	2013-06-06 16:23:38.320763
40	63		2013-06-06 16:55:04.05763	2013-06-06 16:55:04.05763
41	64		2013-06-06 16:56:30.050334	2013-06-06 16:56:30.050334
42	65		2013-06-07 10:55:44.647945	2013-06-07 10:55:44.647945
51	74		2013-06-10 22:20:43.198767	2013-06-10 22:20:43.198767
52	75		2013-06-10 22:22:33.122267	2013-06-10 22:22:33.122267
53	76		2013-06-11 02:29:04.007414	2013-06-11 02:29:04.007414
54	77		2013-06-11 02:29:21.446981	2013-06-11 02:29:21.446981
55	78		2013-06-12 17:38:52.333813	2013-06-12 17:38:52.333813
56	79		2013-06-12 17:39:59.095325	2013-06-12 17:39:59.095325
57	80		2013-06-12 17:41:08.272234	2013-06-12 17:41:08.272234
58	81		2013-06-12 17:41:58.574346	2013-06-12 17:41:58.574346
59	82		2013-06-12 17:42:21.609814	2013-06-12 17:42:21.609814
60	83		2013-06-12 17:46:22.473731	2013-06-12 17:46:22.473731
61	84		2013-06-12 17:47:45.3933	2013-06-12 17:47:45.3933
62	85		2013-06-12 17:48:04.448122	2013-06-12 17:48:04.448122
63	86		2013-06-12 18:08:11.0799	2013-06-12 18:08:11.0799
64	87		2013-06-12 19:24:31.944483	2013-06-12 19:24:31.944483
65	88		2013-06-12 19:28:40.192113	2013-06-12 19:28:40.192113
66	89		2013-06-14 09:32:01.443208	2013-06-14 09:32:01.443208
67	90		2013-06-26 21:21:15.170505	2013-06-26 21:21:15.170505
68	91		2013-06-26 21:22:31.224225	2013-06-26 21:22:31.224225
69	92		2013-06-26 21:23:12.414667	2013-06-26 21:23:12.414667
70	93		2013-06-26 21:23:16.0182	2013-06-26 21:23:16.0182
71	94		2013-06-26 21:24:36.619844	2013-06-26 21:24:36.619844
\.


--
-- Data for Name: otros_bomberos; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY otros_bomberos (id, id_acta_servicio, id_cuerpo_ba, id_bombero_ba, id_dejada_por, id_comiseria, fecha_denuncia, nro_libro_denuncia, nro_hoja_denuncia, nro_parrafo_denuncia, desc_bombero_accidentado, id_investigado_por_otro, creado, modificado) FROM stdin;
5	73	\N	49912	38454	\N	2013-10-06 22:14:00	1	2	3	asd	\N	2013-06-10 22:20:03.798133	2013-06-10 22:20:03.798133
6	74	\N	49912	38454	\N	2013-10-06 22:14:00	1	2	3	asd	\N	2013-06-10 22:20:43.198767	2013-06-10 22:20:43.198767
7	74	\N	27635	27635	\N	2013-10-06 22:14:00	1	2	3	sdasd	\N	2013-06-10 22:20:43.198767	2013-06-10 22:20:43.198767
8	75	275	49912	38454	\N	2013-10-06 22:14:00	1	2	3	asd	\N	2013-06-10 22:22:33.122267	2013-06-10 22:22:33.122267
9	75	18	27635	27635	\N	2013-10-06 22:14:00	1	2	3	sdasd	\N	2013-06-10 22:22:33.122267	2013-06-10 22:22:33.122267
\.


--
-- Data for Name: otros_lesionados; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY otros_lesionados (id, id_acta_servicio, rut, nombre, fallecido, creado, modificado) FROM stdin;
1	17			0	2013-05-31 08:49:22.7212	2013-05-31 08:49:22.7212
2	17	123	asdad	\N	2013-05-31 08:49:22.7212	2013-05-31 08:49:22.7212
3	18			0	2013-05-31 08:54:06.897836	2013-05-31 08:54:06.897836
4	18			0	2013-05-31 08:54:06.897836	2013-05-31 08:54:06.897836
5	18			\N	2013-05-31 08:54:06.897836	2013-05-31 08:54:06.897836
6	19			1	2013-05-31 08:55:23.686075	2013-05-31 08:55:23.686075
7	19			1	2013-05-31 08:55:23.686075	2013-05-31 08:55:23.686075
8	19			\N	2013-05-31 08:55:23.686075	2013-05-31 08:55:23.686075
9	20			0	2013-05-31 08:57:25.570049	2013-05-31 08:57:25.570049
10	20			1	2013-05-31 08:57:25.570049	2013-05-31 08:57:25.570049
11	20			0	2013-05-31 08:57:25.570049	2013-05-31 08:57:25.570049
12	21			1	2013-05-31 09:01:04.001768	2013-05-31 09:01:04.001768
13	21			1	2013-05-31 09:01:04.001768	2013-05-31 09:01:04.001768
14	21			0	2013-05-31 09:01:04.001768	2013-05-31 09:01:04.001768
15	22			1	2013-05-31 09:02:26.150545	2013-05-31 09:02:26.150545
16	22			1	2013-05-31 09:02:26.150545	2013-05-31 09:02:26.150545
17	22			0	2013-05-31 09:02:26.150545	2013-05-31 09:02:26.150545
\.


--
-- Data for Name: otros_vehiculos; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY otros_vehiculos (id, id_tipo_vehiculo, id_marca_vehiculo, id_modelo_vehiculo, patente, creado, modificado, id_acta_servicio) FROM stdin;
2	\N	\N	\N		2013-05-31 08:49:22.7212	2013-05-31 08:49:22.7212	17
3	1	3	2	23r23r	2013-05-31 08:49:22.7212	2013-05-31 08:49:22.7212	17
\.


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY permisos (id, descripcion, creado, modificado) FROM stdin;
1	ver	\N	\N
2	crear	\N	\N
3	editar	\N	\N
4	eliminar	\N	\N
\.


--
-- Data for Name: proc_ambulancia; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY proc_ambulancia (id, nombre, creado, modificado) FROM stdin;
1	asd	2013-05-31 08:18:52.931238	2013-05-31 08:18:52.931238
2	asd2	2013-05-31 08:18:56.538564	2013-05-31 08:18:56.538564
\.


--
-- Data for Name: tipo_construccion; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY tipo_construccion (id, nombre, creado, modificado) FROM stdin;
1	Hormigón	\N	\N
2	Acero	\N	\N
3	Albaliñería (Ladrillo)	\N	\N
4	Madera	\N	\N
5	Adobe	\N	\N
6	Pre-Fabricada	\N	\N
7	Mixta	\N	\N
8	No aplica	\N	\N
9	test12	2013-06-06 20:52:56.281065	2013-06-06 20:53:02.03412
\.


--
-- Data for Name: tipo_gas; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY tipo_gas (id, nombre, creado, modificado) FROM stdin;
1	test	2013-06-26 20:57:49.285896	2013-06-26 20:57:49.285896
\.


--
-- Data for Name: tipo_lugar; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY tipo_lugar (id, nombre, creado, modificado) FROM stdin;
3	Industria	\N	\N
5	Vehículo	\N	\N
6	Departamento	\N	\N
7	Edificio público	\N	\N
8	Sitio eriazo	\N	\N
9	Vía pública	\N	\N
4	Vehículoxs	\N	\N
1	Negocio	\N	2013-06-06 19:33:45.901305
2	Industriasx	\N	2013-06-06 19:33:50.347229
\.


--
-- Data for Name: tipo_ocupante; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY tipo_ocupante (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: tipo_servicio; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY tipo_servicio (id, nombre, creado, modificado) FROM stdin;
1	test1	2013-06-04 19:41:05.498858	2013-06-04 19:41:05.498858
2	test2	2013-06-04 19:41:08.812631	2013-06-04 19:41:08.812631
\.


--
-- Data for Name: tipo_vehiculo; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY tipo_vehiculo (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: tipo_via; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY tipo_via (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: unidad_explosivos; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY unidad_explosivos (id, nombre, creado, modificado) FROM stdin;
1	kilos	\N	\N
2	gramos	\N	\N
3	test	\N	\N
5	test	\N	\N
4	omg	\N	\N
\.


--
-- Data for Name: unidad_gases; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY unidad_gases (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: unidad_liquidos; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY unidad_liquidos (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: unidad_otros; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY unidad_otros (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: unidad_oxidantes; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY unidad_oxidantes (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: unidad_radioactivos; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY unidad_radioactivos (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: unidad_solidos; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY unidad_solidos (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: unidad_venenos; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY unidad_venenos (id, nombre, creado, modificado) FROM stdin;
\.


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

SET search_path = pg_catalog;

BEGIN;

SELECT pg_catalog.lo_open('17243', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17244', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17257', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17277', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17278', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17720', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17721', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17722', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17723', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17724', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17725', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17726', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17142', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17727', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17728', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17145', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17729', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17730', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17731', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17732', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17733', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17768', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17769', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17154', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17155', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17770', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17771', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17772', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17160', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17161', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17162', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17163', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17164', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17165', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17168', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17169', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17170', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17171', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17187', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17188', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17189', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17190', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17191', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17192', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17193', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17194', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17195', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17196', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17217', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17218', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17219', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17220', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17221', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17222', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17223', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17224', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17225', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17226', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17227', 131072);
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('17228', 131072);
SELECT pg_catalog.lo_close(0);

COMMIT;

SET search_path = public, pg_catalog;

--
-- Name: acta_compania_aseguradora_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY acta_compania_aseguradora
    ADD CONSTRAINT acta_compania_aseguradora_pkey PRIMARY KEY (id);


--
-- Name: acta_contenedor_gas_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY acta_contenedor_gas
    ADD CONSTRAINT acta_contenedor_gas_pkey PRIMARY KEY (id);


--
-- Name: acta_empresa_dist_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY acta_empresa_dist
    ADD CONSTRAINT acta_empresa_dist_pkey PRIMARY KEY (id);


--
-- Name: acta_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY acta_servicio
    ADD CONSTRAINT acta_servicio_pkey PRIMARY KEY (id);


--
-- Name: acta_tipo_lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY acta_tipo_lugar
    ADD CONSTRAINT acta_tipo_lugar_pkey PRIMARY KEY (id);


--
-- Name: ambulancia_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY ambulancia
    ADD CONSTRAINT ambulancia_pkey PRIMARY KEY (id);


--
-- Name: apoyo_bomberil_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY apoyo_bomberil
    ADD CONSTRAINT apoyo_bomberil_pkey PRIMARY KEY (id);


--
-- Name: causa_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY causa
    ADD CONSTRAINT causa_pkey PRIMARY KEY (id);


--
-- Name: compania_aseguradora_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY compania_aseguradora
    ADD CONSTRAINT compania_aseguradora_pkey PRIMARY KEY (id);


--
-- Name: contenedor_gas_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY contenedor_gas
    ADD CONSTRAINT contenedor_gas_pkey PRIMARY KEY (id);


--
-- Name: empresa_dist_gas_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY empresa_dist_gas
    ADD CONSTRAINT empresa_dist_gas_pkey PRIMARY KEY (id);


--
-- Name: fuente_calor_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY fuente_calor
    ADD CONSTRAINT fuente_calor_pkey PRIMARY KEY (id);


--
-- Name: lugar_inicio_fuego_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY lugar_inicio_fuego
    ADD CONSTRAINT lugar_inicio_fuego_pkey PRIMARY KEY (id);


--
-- Name: marca_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY marca_vehiculo
    ADD CONSTRAINT marca_vehiculo_pkey PRIMARY KEY (id);


--
-- Name: modelo_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY modelo_vehiculo
    ADD CONSTRAINT modelo_vehiculo_pkey PRIMARY KEY (id);


--
-- Name: modulos_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY modulos
    ADD CONSTRAINT modulos_pkey PRIMARY KEY (id);


--
-- Name: municipalidad_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY municipalidad
    ADD CONSTRAINT municipalidad_pkey PRIMARY KEY (id);


--
-- Name: origen_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY origen
    ADD CONSTRAINT origen_pkey PRIMARY KEY (id);


--
-- Name: otros_afectados_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY otros_afectados
    ADD CONSTRAINT otros_afectados_pkey PRIMARY KEY (id);


--
-- Name: otros_apoyos_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY otros_apoyos
    ADD CONSTRAINT otros_apoyos_pkey PRIMARY KEY (id);


--
-- Name: otros_bomberos_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY otros_bomberos
    ADD CONSTRAINT otros_bomberos_pkey PRIMARY KEY (id);


--
-- Name: otros_lesionados_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY otros_lesionados
    ADD CONSTRAINT otros_lesionados_pkey PRIMARY KEY (id);


--
-- Name: otros_vehiculos_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY otros_vehiculos
    ADD CONSTRAINT otros_vehiculos_pkey PRIMARY KEY (id);


--
-- Name: permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_pkey PRIMARY KEY (id);


--
-- Name: proc_ambulancia_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY proc_ambulancia
    ADD CONSTRAINT proc_ambulancia_pkey PRIMARY KEY (id);


--
-- Name: tipo_construccion_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY tipo_construccion
    ADD CONSTRAINT tipo_construccion_pkey PRIMARY KEY (id);


--
-- Name: tipo_gas_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY tipo_gas
    ADD CONSTRAINT tipo_gas_pkey PRIMARY KEY (id);


--
-- Name: tipo_lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY tipo_lugar
    ADD CONSTRAINT tipo_lugar_pkey PRIMARY KEY (id);


--
-- Name: tipo_ocupante_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY tipo_ocupante
    ADD CONSTRAINT tipo_ocupante_pkey PRIMARY KEY (id);


--
-- Name: tipo_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY tipo_servicio
    ADD CONSTRAINT tipo_servicio_pkey PRIMARY KEY (id);


--
-- Name: tipo_vehiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY tipo_vehiculo
    ADD CONSTRAINT tipo_vehiculo_pkey PRIMARY KEY (id);


--
-- Name: tipo_via_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY tipo_via
    ADD CONSTRAINT tipo_via_pkey PRIMARY KEY (id);


--
-- Name: unidad_explosivos_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY unidad_explosivos
    ADD CONSTRAINT unidad_explosivos_pkey PRIMARY KEY (id);


--
-- Name: unidad_gases_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY unidad_gases
    ADD CONSTRAINT unidad_gases_pkey PRIMARY KEY (id);


--
-- Name: unidad_liquidos_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY unidad_liquidos
    ADD CONSTRAINT unidad_liquidos_pkey PRIMARY KEY (id);


--
-- Name: unidad_otros_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY unidad_otros
    ADD CONSTRAINT unidad_otros_pkey PRIMARY KEY (id);


--
-- Name: unidad_oxidantes_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY unidad_oxidantes
    ADD CONSTRAINT unidad_oxidantes_pkey PRIMARY KEY (id);


--
-- Name: unidad_radioactivos_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY unidad_radioactivos
    ADD CONSTRAINT unidad_radioactivos_pkey PRIMARY KEY (id);


--
-- Name: unidad_solidos_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY unidad_solidos
    ADD CONSTRAINT unidad_solidos_pkey PRIMARY KEY (id);


--
-- Name: unidad_venenos_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY unidad_venenos
    ADD CONSTRAINT unidad_venenos_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: carlos
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM carlos;
GRANT ALL ON SCHEMA public TO carlos;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

