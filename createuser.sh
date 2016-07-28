#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER docker;
    CREATE DATABASE docker;
    GRANT ALL PRIVILEGES ON DATABASE docker TO docker;

    CREATE USER stk132 WITH PASSWORD 'postgres';
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: mydb; Type: DATABASE; Schema: -; Owner: stk132
--

CREATE DATABASE mydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ja_JP.UTF-8' LC_CTYPE = 'ja_JP.UTF-8';


ALTER DATABASE mydb OWNER TO stk132;

\connect mydb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: news_programs; Type: TABLE; Schema: public; Owner: stk132
--

CREATE TABLE news_programs (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE news_programs OWNER TO stk132;

--
-- Name: news_programs_id_seq; Type: SEQUENCE; Schema: public; Owner: stk132
--

CREATE SEQUENCE news_programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE news_programs_id_seq OWNER TO stk132;

--
-- Name: news_programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stk132
--

ALTER SEQUENCE news_programs_id_seq OWNED BY news_programs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: stk132
--

CREATE TABLE schema_migrations (
    version integer NOT NULL
);


ALTER TABLE schema_migrations OWNER TO stk132;

--
-- Name: users; Type: TABLE; Schema: public; Owner: stk132
--

CREATE TABLE users (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE users OWNER TO stk132;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: stk132
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO stk132;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stk132
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stk132
--

ALTER TABLE ONLY news_programs ALTER COLUMN id SET DEFAULT nextval('news_programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: stk132
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: news_programs_pkey; Type: CONSTRAINT; Schema: public; Owner: stk132
--

ALTER TABLE ONLY news_programs
    ADD CONSTRAINT news_programs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: stk132
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: stk132
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: stk132
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM stk132;
GRANT ALL ON SCHEMA public TO stk132;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


EOSQL
