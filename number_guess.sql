--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    id integer NOT NULL,
    username character varying(22) NOT NULL,
    games integer NOT NULL,
    guess integer NOT NULL
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Name: number_guess_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_guess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_guess_id_seq OWNER TO freecodecamp;

--
-- Name: number_guess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_guess_id_seq OWNED BY public.number_guess.id;


--
-- Name: number_guess id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess ALTER COLUMN id SET DEFAULT nextval('public.number_guess_id_seq'::regclass);


--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES (44, 'user_1789045689392', 2, 571);
INSERT INTO public.number_guess VALUES (43, 'user_1789045689393', 5, 146);
INSERT INTO public.number_guess VALUES (46, 'user_1789045768458', 2, 734);
INSERT INTO public.number_guess VALUES (45, 'user_1789045768459', 5, 170);
INSERT INTO public.number_guess VALUES (48, 'user_1789045869020', 2, 358);
INSERT INTO public.number_guess VALUES (47, 'user_1789045869021', 5, 203);
INSERT INTO public.number_guess VALUES (50, 'user_1789045918706', 2, 280);
INSERT INTO public.number_guess VALUES (49, 'user_1789045918707', 5, 283);
INSERT INTO public.number_guess VALUES (16, 'John', 6, 5);


--
-- Name: number_guess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_guess_id_seq', 50, true);


--
-- Name: number_guess number_guess_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess
    ADD CONSTRAINT number_guess_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

