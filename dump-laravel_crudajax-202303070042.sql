--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12
-- Dumped by pg_dump version 12.12

-- Started on 2023-03-07 00:42:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 48116)
-- Name: control_de_usuarios; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA control_de_usuarios;


ALTER SCHEMA control_de_usuarios OWNER TO postgres;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 48207)
-- Name: failed_jobs; Type: TABLE; Schema: control_de_usuarios; Owner: postgres
--

CREATE TABLE control_de_usuarios.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE control_de_usuarios.failed_jobs OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 48205)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: control_de_usuarios; Owner: postgres
--

CREATE SEQUENCE control_de_usuarios.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE control_de_usuarios.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 208
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: control_de_usuarios; Owner: postgres
--

ALTER SEQUENCE control_de_usuarios.failed_jobs_id_seq OWNED BY control_de_usuarios.failed_jobs.id;


--
-- TOC entry 204 (class 1259 OID 48181)
-- Name: migrations; Type: TABLE; Schema: control_de_usuarios; Owner: postgres
--

CREATE TABLE control_de_usuarios.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE control_de_usuarios.migrations OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 48179)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: control_de_usuarios; Owner: postgres
--

CREATE SEQUENCE control_de_usuarios.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE control_de_usuarios.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 203
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: control_de_usuarios; Owner: postgres
--

ALTER SEQUENCE control_de_usuarios.migrations_id_seq OWNED BY control_de_usuarios.migrations.id;


--
-- TOC entry 207 (class 1259 OID 48197)
-- Name: password_reset_tokens; Type: TABLE; Schema: control_de_usuarios; Owner: postgres
--

CREATE TABLE control_de_usuarios.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE control_de_usuarios.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 48221)
-- Name: personal_access_tokens; Type: TABLE; Schema: control_de_usuarios; Owner: postgres
--

CREATE TABLE control_de_usuarios.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE control_de_usuarios.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 48219)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: control_de_usuarios; Owner: postgres
--

CREATE SEQUENCE control_de_usuarios.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE control_de_usuarios.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 210
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: control_de_usuarios; Owner: postgres
--

ALTER SEQUENCE control_de_usuarios.personal_access_tokens_id_seq OWNED BY control_de_usuarios.personal_access_tokens.id;


--
-- TOC entry 206 (class 1259 OID 48189)
-- Name: users; Type: TABLE; Schema: control_de_usuarios; Owner: postgres
--

CREATE TABLE control_de_usuarios.users (
    id bigint NOT NULL,
    name character varying(65) NOT NULL,
    email character varying(65) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE control_de_usuarios.users OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 48187)
-- Name: users_id_seq; Type: SEQUENCE; Schema: control_de_usuarios; Owner: postgres
--

CREATE SEQUENCE control_de_usuarios.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE control_de_usuarios.users_id_seq OWNER TO postgres;

--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 205
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: control_de_usuarios; Owner: postgres
--

ALTER SEQUENCE control_de_usuarios.users_id_seq OWNED BY control_de_usuarios.users.id;


--
-- TOC entry 2715 (class 2604 OID 48210)
-- Name: failed_jobs id; Type: DEFAULT; Schema: control_de_usuarios; Owner: postgres
--

ALTER TABLE ONLY control_de_usuarios.failed_jobs ALTER COLUMN id SET DEFAULT nextval('control_de_usuarios.failed_jobs_id_seq'::regclass);


--
-- TOC entry 2713 (class 2604 OID 48184)
-- Name: migrations id; Type: DEFAULT; Schema: control_de_usuarios; Owner: postgres
--

ALTER TABLE ONLY control_de_usuarios.migrations ALTER COLUMN id SET DEFAULT nextval('control_de_usuarios.migrations_id_seq'::regclass);


--
-- TOC entry 2717 (class 2604 OID 48224)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: control_de_usuarios; Owner: postgres
--

ALTER TABLE ONLY control_de_usuarios.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('control_de_usuarios.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 2714 (class 2604 OID 48192)
-- Name: users id; Type: DEFAULT; Schema: control_de_usuarios; Owner: postgres
--

ALTER TABLE ONLY control_de_usuarios.users ALTER COLUMN id SET DEFAULT nextval('control_de_usuarios.users_id_seq'::regclass);


--
-- TOC entry 2867 (class 0 OID 48207)
-- Dependencies: 209
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: control_de_usuarios; Owner: postgres
--

COPY control_de_usuarios.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 48181)
-- Dependencies: 204
-- Data for Name: migrations; Type: TABLE DATA; Schema: control_de_usuarios; Owner: postgres
--

COPY control_de_usuarios.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_reset_tokens_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
\.


--
-- TOC entry 2865 (class 0 OID 48197)
-- Dependencies: 207
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: control_de_usuarios; Owner: postgres
--

COPY control_de_usuarios.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 48221)
-- Dependencies: 211
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: control_de_usuarios; Owner: postgres
--

COPY control_de_usuarios.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 48189)
-- Dependencies: 206
-- Data for Name: users; Type: TABLE DATA; Schema: control_de_usuarios; Owner: postgres
--

COPY control_de_usuarios.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
8	Larianna	lari@hotmail.com	\N	$2y$10$A.8y8TmMiTksOkjUBD7Gau08w/2UI0rcntOObfbUm6PRvcVHjw2QS	\N	2023-02-21 07:25:07	2023-02-21 07:25:07
9	Yeimi	tati@hotmail.com	\N	$2y$10$yUD5j1sbZoFGuF85DLbCpODRqXDa.1atBpZh1fW/Bd/zr6F6PK9q6	\N	2023-02-21 07:25:40	2023-02-21 07:25:40
10	Yulia	yulia@hotmail.com	\N	$2y$10$/4X2brMxtOJpp2Z78UNPlunEm9lIDjrQYZJiHABJWf1.0kuuwj2NS	\N	2023-02-21 07:26:00	2023-02-21 07:26:00
11	Grace	grace@gmail.com	\N	$2y$10$KehY.TpiZSlEMedTV0Hkc.NISgXrd4aiJBi0oPe67LysJVT4YXi86	\N	2023-02-21 07:26:19	2023-02-21 07:26:19
12	Rubys	esmeralda@gmail.com	\N	$2y$10$5.ZVh0UPZDIP7Mr8.s3sGuupDCx7GWUZZ2/Ay2LFM1sQtT02Urt8a	\N	2023-02-21 07:28:05	2023-02-21 07:28:05
13	Natalia	gaby@gmail.com	\N	$2y$10$X/CusvsPNkoq8tm1GvKeCOwsFp521F1/g22jYlY/OG.gYPUlLf5t2	\N	2023-02-21 07:28:25	2023-02-21 07:28:25
14	Gersire	catalina@yahoo.es	\N	$2y$10$L.pIu1elKUhYznAEUq2y0elf6vrbfVwAKrCHHcwvUJlvz1dGxsoMm	\N	2023-02-21 07:30:52	2023-02-21 07:30:52
7	Yesli	yesli@gmail.com	\N	$2y$10$NWsVz79CnBGJOFFkYxa7uugpyuXcpZbAOLgVuD4ShviAy.fzCvsSm	\N	2023-02-17 01:11:08	2023-02-21 07:36:29
6	Karoll	karoll@gmail.com	\N	$2y$10$mcuGN/yOkVzYEB0uJrp3UOAWYJpywCGf3uKU5hs2n1HMqpojZjPEy	\N	2023-02-17 01:10:51	2023-02-21 07:36:35
\.


--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 208
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: control_de_usuarios; Owner: postgres
--

SELECT pg_catalog.setval('control_de_usuarios.failed_jobs_id_seq', 1, false);


--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 203
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: control_de_usuarios; Owner: postgres
--

SELECT pg_catalog.setval('control_de_usuarios.migrations_id_seq', 4, true);


--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 210
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: control_de_usuarios; Owner: postgres
--

SELECT pg_catalog.setval('control_de_usuarios.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 205
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: control_de_usuarios; Owner: postgres
--

SELECT pg_catalog.setval('control_de_usuarios.users_id_seq', 14, true);


--
-- TOC entry 2727 (class 2606 OID 48216)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: control_de_usuarios; Owner: postgres
--

ALTER TABLE ONLY control_de_usuarios.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 48218)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: control_de_usuarios; Owner: postgres
--

ALTER TABLE ONLY control_de_usuarios.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 2719 (class 2606 OID 48186)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: control_de_usuarios; Owner: postgres
--

ALTER TABLE ONLY control_de_usuarios.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 48204)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: control_de_usuarios; Owner: postgres
--

ALTER TABLE ONLY control_de_usuarios.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 2731 (class 2606 OID 48229)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: control_de_usuarios; Owner: postgres
--

ALTER TABLE ONLY control_de_usuarios.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 48232)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: control_de_usuarios; Owner: postgres
--

ALTER TABLE ONLY control_de_usuarios.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 2721 (class 2606 OID 48196)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: control_de_usuarios; Owner: postgres
--

ALTER TABLE ONLY control_de_usuarios.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2723 (class 2606 OID 48194)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: control_de_usuarios; Owner: postgres
--

ALTER TABLE ONLY control_de_usuarios.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 1259 OID 48230)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: control_de_usuarios; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON control_de_usuarios.personal_access_tokens USING btree (tokenable_type, tokenable_id);


-- Completed on 2023-03-07 00:42:27

--
-- PostgreSQL database dump complete
--

