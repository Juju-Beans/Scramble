--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: difficulties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.difficulties (
    id integer NOT NULL,
    turn_count integer NOT NULL,
    multiplier real NOT NULL,
    level_id integer
);


ALTER TABLE public.difficulties OWNER TO postgres;

--
-- Name: difficulties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.difficulties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.difficulties_id_seq OWNER TO postgres;

--
-- Name: difficulties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.difficulties_id_seq OWNED BY public.difficulties.id;


--
-- Name: levels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.levels (
    id integer NOT NULL,
    level_name text NOT NULL
);


ALTER TABLE public.levels OWNER TO postgres;

--
-- Name: levels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.levels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.levels_id_seq OWNER TO postgres;

--
-- Name: levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.levels_id_seq OWNED BY public.levels.id;


--
-- Name: runs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.runs (
    id integer NOT NULL,
    player_name text NOT NULL,
    score real NOT NULL,
    level_id integer,
    diff_id integer
);


ALTER TABLE public.runs OWNER TO postgres;

--
-- Name: runs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.runs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.runs_id_seq OWNER TO postgres;

--
-- Name: runs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.runs_id_seq OWNED BY public.runs.id;


--
-- Name: difficulties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.difficulties ALTER COLUMN id SET DEFAULT nextval('public.difficulties_id_seq'::regclass);


--
-- Name: levels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.levels ALTER COLUMN id SET DEFAULT nextval('public.levels_id_seq'::regclass);


--
-- Name: runs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.runs ALTER COLUMN id SET DEFAULT nextval('public.runs_id_seq'::regclass);


--
-- Data for Name: difficulties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.difficulties (id, turn_count, multiplier, level_id) FROM stdin;
1	10	1	1
2	5	1.5	2
\.


--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.levels (id, level_name) FROM stdin;
1	NOVICE
2	ADVANCED
\.


--
-- Data for Name: runs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.runs (id, player_name, score, level_id, diff_id) FROM stdin;
\.


--
-- Name: difficulties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.difficulties_id_seq', 3, true);


--
-- Name: levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.levels_id_seq', 2, true);


--
-- Name: runs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.runs_id_seq', 1, false);


--
-- Name: difficulties difficulties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.difficulties
    ADD CONSTRAINT difficulties_pkey PRIMARY KEY (id);


--
-- Name: levels levels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);


--
-- Name: runs runs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.runs
    ADD CONSTRAINT runs_pkey PRIMARY KEY (id);


--
-- Name: runs runs_player_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.runs
    ADD CONSTRAINT runs_player_name_key UNIQUE (player_name);


--
-- Name: difficulties fk_diff_level; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.difficulties
    ADD CONSTRAINT fk_diff_level FOREIGN KEY (level_id) REFERENCES public.levels(id);


--
-- Name: runs runs_diff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.runs
    ADD CONSTRAINT runs_diff_id_fkey FOREIGN KEY (diff_id) REFERENCES public.difficulties(id);


--
-- Name: runs runs_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.runs
    ADD CONSTRAINT runs_level_id_fkey FOREIGN KEY (level_id) REFERENCES public.levels(id);


--
-- PostgreSQL database dump complete
--

