--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: number_guesses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guesses (
    number_guess_id integer NOT NULL,
    user_id integer NOT NULL,
    num_before_guess integer DEFAULT 0
);


ALTER TABLE public.number_guesses OWNER TO freecodecamp;

--
-- Name: number_guesses_number_guess_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_guesses_number_guess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_guesses_number_guess_id_seq OWNER TO freecodecamp;

--
-- Name: number_guesses_number_guess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_guesses_number_guess_id_seq OWNED BY public.number_guesses.number_guess_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: number_guesses number_guess_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guesses ALTER COLUMN number_guess_id SET DEFAULT nextval('public.number_guesses_number_guess_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: number_guesses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guesses VALUES (1, 2, 318);
INSERT INTO public.number_guesses VALUES (2, 3, 634);
INSERT INTO public.number_guesses VALUES (3, 2, 793);
INSERT INTO public.number_guesses VALUES (4, 2, 2);
INSERT INTO public.number_guesses VALUES (5, 2, 840);
INSERT INTO public.number_guesses VALUES (6, 4, 525);
INSERT INTO public.number_guesses VALUES (7, 5, 653);
INSERT INTO public.number_guesses VALUES (8, 4, 459);
INSERT INTO public.number_guesses VALUES (9, 4, 564);
INSERT INTO public.number_guesses VALUES (10, 4, 878);
INSERT INTO public.number_guesses VALUES (11, 6, 230);
INSERT INTO public.number_guesses VALUES (12, 7, 509);
INSERT INTO public.number_guesses VALUES (13, 6, 812);
INSERT INTO public.number_guesses VALUES (14, 6, 292);
INSERT INTO public.number_guesses VALUES (15, 6, 14);
INSERT INTO public.number_guesses VALUES (16, 8, 800);
INSERT INTO public.number_guesses VALUES (17, 8, 292);
INSERT INTO public.number_guesses VALUES (18, 9, 524);
INSERT INTO public.number_guesses VALUES (19, 9, 422);
INSERT INTO public.number_guesses VALUES (20, 8, 47);
INSERT INTO public.number_guesses VALUES (21, 8, 565);
INSERT INTO public.number_guesses VALUES (22, 8, 701);
INSERT INTO public.number_guesses VALUES (23, 10, 40);
INSERT INTO public.number_guesses VALUES (24, 10, 747);
INSERT INTO public.number_guesses VALUES (25, 11, 435);
INSERT INTO public.number_guesses VALUES (26, 11, 155);
INSERT INTO public.number_guesses VALUES (27, 10, 466);
INSERT INTO public.number_guesses VALUES (28, 10, 265);
INSERT INTO public.number_guesses VALUES (29, 10, 301);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'w');
INSERT INTO public.users VALUES (2, 'user_1737069566919');
INSERT INTO public.users VALUES (3, 'user_1737069566918');
INSERT INTO public.users VALUES (4, 'user_1737069621600');
INSERT INTO public.users VALUES (5, 'user_1737069621599');
INSERT INTO public.users VALUES (6, 'user_1737069700650');
INSERT INTO public.users VALUES (7, 'user_1737069700649');
INSERT INTO public.users VALUES (8, 'user_1737069788532');
INSERT INTO public.users VALUES (9, 'user_1737069788531');
INSERT INTO public.users VALUES (10, 'user_1737069824773');
INSERT INTO public.users VALUES (11, 'user_1737069824772');


--
-- Name: number_guesses_number_guess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_guesses_number_guess_id_seq', 29, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 11, true);


--
-- Name: number_guesses number_guesses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guesses
    ADD CONSTRAINT number_guesses_pkey PRIMARY KEY (number_guess_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: number_guesses number_guesses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guesses
    ADD CONSTRAINT number_guesses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

