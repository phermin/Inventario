--
-- PostgreSQL database cluster dump
--

\connect postgres

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE piryguiry;
ALTER ROLE piryguiry WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md513c58e5e10f8b94a6c00adcb5c27201c' VALID UNTIL 'infinity';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md5d12717a78a6bc62f57c4f6649205f118' VALID UNTIL 'infinity';






--
-- Database creation
--

CREATE DATABASE "DbCauchera" WITH TEMPLATE = template0 OWNER = piryguiry;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT ALL ON DATABASE template1 TO piryguiry;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect "DbCauchera"

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: cauchera; Type: SCHEMA; Schema: -; Owner: piryguiry
--

CREATE SCHEMA cauchera;


ALTER SCHEMA cauchera OWNER TO piryguiry;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = cauchera, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: articulos; Type: TABLE; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

CREATE TABLE articulos (
    id integer NOT NULL,
    codart character(4) NOT NULL,
    descripcion_art text NOT NULL,
    stock integer NOT NULL,
    minimo integer NOT NULL,
    precio money NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE cauchera.articulos OWNER TO piryguiry;

--
-- Name: articulos_id_seq; Type: SEQUENCE; Schema: cauchera; Owner: piryguiry
--

CREATE SEQUENCE articulos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cauchera.articulos_id_seq OWNER TO piryguiry;

--
-- Name: articulos_id_seq; Type: SEQUENCE OWNED BY; Schema: cauchera; Owner: piryguiry
--

ALTER SEQUENCE articulos_id_seq OWNED BY articulos.id;


--
-- Name: articulos_id_seq; Type: SEQUENCE SET; Schema: cauchera; Owner: piryguiry
--

SELECT pg_catalog.setval('articulos_id_seq', 21, true);


--
-- Name: categoria; Type: TABLE; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

CREATE TABLE categoria (
    id integer NOT NULL,
    nombre character(25) NOT NULL,
    descripcion_cat text NOT NULL
);


ALTER TABLE cauchera.categoria OWNER TO piryguiry;

--
-- Name: TABLE categoria; Type: COMMENT; Schema: cauchera; Owner: piryguiry
--

COMMENT ON TABLE categoria IS 'Categorias de los articulos';


--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: cauchera; Owner: piryguiry
--

CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cauchera.categoria_id_seq OWNER TO piryguiry;

--
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: cauchera; Owner: piryguiry
--

ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: cauchera; Owner: piryguiry
--

SELECT pg_catalog.setval('categoria_id_seq', 4, true);


--
-- Name: cliente; Type: TABLE; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

CREATE TABLE cliente (
    id integer NOT NULL,
    cedula character(8) NOT NULL,
    nombres character(75) NOT NULL,
    apellidos character(75) NOT NULL,
    rif character(20) NOT NULL
);


ALTER TABLE cauchera.cliente OWNER TO piryguiry;

--
-- Name: TABLE cliente; Type: COMMENT; Schema: cauchera; Owner: piryguiry
--

COMMENT ON TABLE cliente IS 'Información del Cliente';


--
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: cauchera; Owner: piryguiry
--

CREATE SEQUENCE cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cauchera.cliente_id_seq OWNER TO piryguiry;

--
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: cauchera; Owner: piryguiry
--

ALTER SEQUENCE cliente_id_seq OWNED BY cliente.id;


--
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: cauchera; Owner: piryguiry
--

SELECT pg_catalog.setval('cliente_id_seq', 1, false);


--
-- Name: ordenpago; Type: TABLE; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

CREATE TABLE ordenpago (
    id integer NOT NULL,
    cedula character(8) NOT NULL,
    monto money NOT NULL,
    fecha time without time zone DEFAULT now() NOT NULL,
    venta_id integer NOT NULL
);


ALTER TABLE cauchera.ordenpago OWNER TO piryguiry;

--
-- Name: TABLE ordenpago; Type: COMMENT; Schema: cauchera; Owner: piryguiry
--

COMMENT ON TABLE ordenpago IS 'Registro de Ordenes de Pago';


--
-- Name: ordenpago_id_seq; Type: SEQUENCE; Schema: cauchera; Owner: piryguiry
--

CREATE SEQUENCE ordenpago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cauchera.ordenpago_id_seq OWNER TO piryguiry;

--
-- Name: ordenpago_id_seq; Type: SEQUENCE OWNED BY; Schema: cauchera; Owner: piryguiry
--

ALTER SEQUENCE ordenpago_id_seq OWNED BY ordenpago.id;


--
-- Name: ordenpago_id_seq; Type: SEQUENCE SET; Schema: cauchera; Owner: piryguiry
--

SELECT pg_catalog.setval('ordenpago_id_seq', 1, false);


--
-- Name: usuarios; Type: TABLE; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    nombre character(25) NOT NULL,
    password character(45) NOT NULL,
    tipo boolean NOT NULL
);


ALTER TABLE cauchera.usuarios OWNER TO piryguiry;

--
-- Name: TABLE usuarios; Type: COMMENT; Schema: cauchera; Owner: piryguiry
--

COMMENT ON TABLE usuarios IS 'Usuarios de sistema';


--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: cauchera; Owner: piryguiry
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cauchera.usuarios_id_seq OWNER TO piryguiry;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: cauchera; Owner: piryguiry
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: cauchera; Owner: piryguiry
--

SELECT pg_catalog.setval('usuarios_id_seq', 4, true);


--
-- Name: venta; Type: TABLE; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

CREATE TABLE venta (
    id integer NOT NULL,
    codart character(10) NOT NULL,
    cantidad integer NOT NULL,
    monto money NOT NULL
);


ALTER TABLE cauchera.venta OWNER TO piryguiry;

--
-- Name: TABLE venta; Type: COMMENT; Schema: cauchera; Owner: piryguiry
--

COMMENT ON TABLE venta IS 'Registro de Ventas';


--
-- Name: venta_id_seq; Type: SEQUENCE; Schema: cauchera; Owner: piryguiry
--

CREATE SEQUENCE venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cauchera.venta_id_seq OWNER TO piryguiry;

--
-- Name: venta_id_seq; Type: SEQUENCE OWNED BY; Schema: cauchera; Owner: piryguiry
--

ALTER SEQUENCE venta_id_seq OWNED BY venta.id;


--
-- Name: venta_id_seq; Type: SEQUENCE SET; Schema: cauchera; Owner: piryguiry
--

SELECT pg_catalog.setval('venta_id_seq', 1, false);


--
-- Name: id; Type: DEFAULT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY articulos ALTER COLUMN id SET DEFAULT nextval('articulos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY cliente ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY ordenpago ALTER COLUMN id SET DEFAULT nextval('ordenpago_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY venta ALTER COLUMN id SET DEFAULT nextval('venta_id_seq'::regclass);


--
-- Data for Name: articulos; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--

COPY articulos (id, codart, descripcion_art, stock, minimo, precio, categoria_id) FROM stdin;
16	SH01	aceite shell	100	10	€75,00	2
17	AM01	aceite tapa amarilla	100	10	€45,00	2
20	T02 	toyo 2	100	10	€1.575,00	1
21	R01 	Rin 16\\"	100	10	€575,00	3
\.


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--

COPY categoria (id, nombre, descripcion_cat) FROM stdin;
1	Neumaticos               	Duros, Blandos, Super blandos.
2	Aceites                  	Aceites Refrigerantes, Aceites de Motor
3	Rines                    	16\\", 17\\", 18\\"
4	Frenos                   	Disco, Tambor
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--

COPY cliente (id, cedula, nombres, apellidos, rif) FROM stdin;
\.


--
-- Data for Name: ordenpago; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--

COPY ordenpago (id, cedula, monto, fecha, venta_id) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--

COPY usuarios (id, nombre, password, tipo) FROM stdin;
1	admin                    	0a5ed5a7e49f5a2d8fa57fddbb16883b656ccce0     	t
2	pepito                   	7c4a8d09ca3762af61e59520943dc26494f8941b     	f
3	juanito                  	7c4a8d09ca3762af61e59520943dc26494f8941b     	f
4	benito                   	7c4a8d09ca3762af61e59520943dc26494f8941b     	f
\.


--
-- Data for Name: venta; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--

COPY venta (id, codart, cantidad, monto) FROM stdin;
\.


--
-- Name: articulos_codart_key; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY articulos
    ADD CONSTRAINT articulos_codart_key UNIQUE (codart);


--
-- Name: articulos_pkey; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY articulos
    ADD CONSTRAINT articulos_pkey PRIMARY KEY (id);


--
-- Name: categoria_nombre_key; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_nombre_key UNIQUE (nombre);


--
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: cliente_cedula_key; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_cedula_key UNIQUE (cedula);


--
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- Name: cliente_rif_key; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_rif_key UNIQUE (rif);


--
-- Name: ordenpago_pkey; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY ordenpago
    ADD CONSTRAINT ordenpago_pkey PRIMARY KEY (id);


--
-- Name: usuarios_nombre_key; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_nombre_key UNIQUE (nombre);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: venta_pkey; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id);


--
-- Name: articulos_id_cat_fkey; Type: FK CONSTRAINT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY articulos
    ADD CONSTRAINT articulos_id_cat_fkey FOREIGN KEY (categoria_id) REFERENCES categoria(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ordenpago_cedula_fkey; Type: FK CONSTRAINT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY ordenpago
    ADD CONSTRAINT ordenpago_cedula_fkey FOREIGN KEY (cedula) REFERENCES cliente(cedula) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ordenpago_id_venta_fkey; Type: FK CONSTRAINT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY ordenpago
    ADD CONSTRAINT ordenpago_id_venta_fkey FOREIGN KEY (venta_id) REFERENCES venta(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: venta_codart_fkey; Type: FK CONSTRAINT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT venta_codart_fkey FOREIGN KEY (codart) REFERENCES articulos(codart) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\connect postgres

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect template1

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

