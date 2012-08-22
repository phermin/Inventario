--
-- PostgreSQL database cluster dump
--

\connect postgres

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE admin;
ALTER ROLE admin WITH SUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md5b9d11b3be25f5a1a7dc8ca04cd310b28';
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

SELECT pg_catalog.setval('articulos_id_seq', 1, true);


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

SELECT pg_catalog.setval('categoria_id_seq', 1, true);


--
-- Name: proveedores; Type: TABLE; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

CREATE TABLE proveedores (
    id integer NOT NULL,
    nit character(10) NOT NULL,
    razon_social character(75) NOT NULL,
    rif character(20) NOT NULL,
    cuenta_banco integer NOT NULL
);


ALTER TABLE cauchera.proveedores OWNER TO piryguiry;

--
-- Name: TABLE proveedores; Type: COMMENT; Schema: cauchera; Owner: piryguiry
--

COMMENT ON TABLE proveedores IS 'Información de los proveedores';


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

ALTER SEQUENCE cliente_id_seq OWNED BY proveedores.id;


--
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: cauchera; Owner: piryguiry
--

SELECT pg_catalog.setval('cliente_id_seq', 1, false);


--
-- Name: clientes; Type: TABLE; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

CREATE TABLE clientes (
    id integer NOT NULL,
    ci_rif character(20) NOT NULL,
    nombres character(40) NOT NULL,
    acpellidos character(40) NOT NULL,
    razon_social character(50) NOT NULL,
    venta_id integer NOT NULL
);


ALTER TABLE cauchera.clientes OWNER TO piryguiry;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: cauchera; Owner: piryguiry
--

CREATE SEQUENCE clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cauchera.clientes_id_seq OWNER TO piryguiry;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: cauchera; Owner: piryguiry
--

ALTER SEQUENCE clientes_id_seq OWNED BY clientes.id;


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: cauchera; Owner: piryguiry
--

SELECT pg_catalog.setval('clientes_id_seq', 1, false);


--
-- Name: compra; Type: TABLE; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

CREATE TABLE compra (
    id integer NOT NULL,
    proveedores_id integer NOT NULL,
    codart character(4) NOT NULL,
    cantidad integer NOT NULL,
    monto money NOT NULL
);


ALTER TABLE cauchera.compra OWNER TO piryguiry;

--
-- Name: compra_id_seq; Type: SEQUENCE; Schema: cauchera; Owner: piryguiry
--

CREATE SEQUENCE compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cauchera.compra_id_seq OWNER TO piryguiry;

--
-- Name: compra_id_seq; Type: SEQUENCE OWNED BY; Schema: cauchera; Owner: piryguiry
--

ALTER SEQUENCE compra_id_seq OWNED BY compra.id;


--
-- Name: compra_id_seq; Type: SEQUENCE SET; Schema: cauchera; Owner: piryguiry
--

SELECT pg_catalog.setval('compra_id_seq', 1, false);


--
-- Name: ordenpago; Type: TABLE; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

CREATE TABLE ordenpago (
    id integer NOT NULL,
    proveedores_nit character(8) NOT NULL,
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

SELECT pg_catalog.setval('usuarios_id_seq', 9, true);


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

ALTER TABLE ONLY clientes ALTER COLUMN id SET DEFAULT nextval('clientes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY compra ALTER COLUMN id SET DEFAULT nextval('compra_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY ordenpago ALTER COLUMN id SET DEFAULT nextval('ordenpago_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY proveedores ALTER COLUMN id SET DEFAULT nextval('cliente_id_seq'::regclass);


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

INSERT INTO articulos VALUES (1, 'SH01', 'Aceite shell', 100, 10, '€75,00', 1);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--

INSERT INTO categoria VALUES (1, 'Aceites                  ', 'Motor, refrigerante.');


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--



--
-- Data for Name: compra; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--



--
-- Data for Name: ordenpago; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--



--
-- Data for Name: proveedores; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--



--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--

INSERT INTO usuarios VALUES (8, 'admin                    ', 'd033e22ae348aeb5660fc2140aec35850c4da997     ', true);
INSERT INTO usuarios VALUES (1, 'piryguiry                ', '0a5ed5a7e49f5a2d8fa57fddbb16883b656ccce0     ', true);
INSERT INTO usuarios VALUES (9, 'basico                   ', '9b4fd24d2912a6c16e609bdcf27bf2cb8fec12bf     ', false);


--
-- Data for Name: venta; Type: TABLE DATA; Schema: cauchera; Owner: piryguiry
--



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

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT cliente_cedula_key UNIQUE (nit);


--
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- Name: cliente_rif_key; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT cliente_rif_key UNIQUE (rif);


--
-- Name: clientes_ci_rif_key; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_ci_rif_key UNIQUE (ci_rif);


--
-- Name: clientes_pkey; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: compra_pkey; Type: CONSTRAINT; Schema: cauchera; Owner: piryguiry; Tablespace: 
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id);


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
-- Name: clientes_venta_id_fkey; Type: FK CONSTRAINT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_venta_id_fkey FOREIGN KEY (venta_id) REFERENCES venta(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: compra_codart_fkey; Type: FK CONSTRAINT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_codart_fkey FOREIGN KEY (codart) REFERENCES articulos(codart) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: compra_proveedores_id_fkey; Type: FK CONSTRAINT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_proveedores_id_fkey FOREIGN KEY (proveedores_id) REFERENCES proveedores(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ordenpago_cedula_fkey; Type: FK CONSTRAINT; Schema: cauchera; Owner: piryguiry
--

ALTER TABLE ONLY ordenpago
    ADD CONSTRAINT ordenpago_cedula_fkey FOREIGN KEY (proveedores_nit) REFERENCES proveedores(nit) ON UPDATE CASCADE ON DELETE CASCADE;


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
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


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

