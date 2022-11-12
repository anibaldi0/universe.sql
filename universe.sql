--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_stars integer,
    has_life boolean,
    dscription text,
    galaxy_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    distance_earth_light_year integer,
    age_in_millions_year numeric,
    is_spherical boolean,
    galaxy_id integer NOT NULL,
    escape_velocity_km_s numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_million_year numeric,
    diameter numeric,
    planet_id integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_million_year numeric,
    has_moon boolean,
    how_many_moons integer,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_million_year integer,
    distance_earth_light_year numeric,
    has_planets boolean,
    how_many_planets integer,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagitarius', 35, true, 'Is one constellation of the zodiac', 8);
INSERT INTO public.constellation VALUES (2, 'Andromeda', 25, true, 'Has 12 stars with planets', 9);
INSERT INTO public.constellation VALUES (3, 'Virgo', 45, false, 'Is Is one constellation of the zodiac, like Sagittarius', 10);
INSERT INTO public.constellation VALUES (4, 'Ursa Major', 42, true, NULL, 11);
INSERT INTO public.constellation VALUES (5, 'Sculptor', 6, false, 'Is a small and faint constellation in the southern sky', 12);
INSERT INTO public.constellation VALUES (6, 'Draco', 19, false, 'Is a constellation in the far northern sky', 13);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', NULL, 32, true, 8, 550);
INSERT INTO public.galaxy VALUES ('Andromeda', 2537, 20, true, 9, 500);
INSERT INTO public.galaxy VALUES ('Sombrero', 29, 32.2, false, 10, 330);
INSERT INTO public.galaxy VALUES ('Messier 82', NULL, 13.3, false, 11, 650);
INSERT INTO public.galaxy VALUES ('Comet', 3200, 34.7, false, 12, 570);
INSERT INTO public.galaxy VALUES ('Tadpole', 400, NULL, false, 13, 760);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 15, 1000, 3, 'moon of earth');
INSERT INTO public.moon VALUES (2, 'Phobos', 16, 300, 6, 'moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 15, 350, 6, 'moon of Mars');
INSERT INTO public.moon VALUES (4, 'IO', 23, 2000, 7, 'moon of Jupiter');
INSERT INTO public.moon VALUES (5, 'Europa', 23.5, 1900, 7, 'moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymides', 24.3, 3200, 7, 'moon of Jupiter');
INSERT INTO public.moon VALUES (7, 'Callisto', 24.1, 3000, 7, 'moon of Jupiter');
INSERT INTO public.moon VALUES (8, 'Pan', 10.3, 1020, 8, NULL);
INSERT INTO public.moon VALUES (9, 'Atlas', NULL, NULL, 8, 'moon of Saturn');
INSERT INTO public.moon VALUES (10, 'Prometheus', 32.3, 3200, 8, 'moon of Saturn');
INSERT INTO public.moon VALUES (11, 'Pandora', 21.3, 3200, 8, 'moon of Saturn');
INSERT INTO public.moon VALUES (12, 'Janus', 32.1, 2100, 8, 'moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Telesto', 25.2, 1200, 8, 'moon of Saturn');
INSERT INTO public.moon VALUES (14, 'Calypso', 24.6, 2100, 8, 'moon of Saturn');
INSERT INTO public.moon VALUES (15, 'Phoebe', 53, 3200, 8, NULL);
INSERT INTO public.moon VALUES (16, 'Miranda', 54, 3400, 9, NULL);
INSERT INTO public.moon VALUES (17, 'Ariel', 34, 2310, 9, 'moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Umbriel', 28, 1899, 9, 'moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Triton', 29, 12200, 9, 'moon of Neptune');
INSERT INTO public.moon VALUES (20, 'Nereida', 35, 3400, 9, 'moon of Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 25, true, 1, 'Green Planet', 2);
INSERT INTO public.planet VALUES (4, 'Mercury', 15, false, NULL, 'Closest planet to the sun', 2);
INSERT INTO public.planet VALUES (5, 'Venus', 23, false, NULL, NULL, 2);
INSERT INTO public.planet VALUES (6, 'Mars', 24, true, 2, 'Red Planet', 2);
INSERT INTO public.planet VALUES (7, 'Jupiter', 36, true, 4, NULL, 2);
INSERT INTO public.planet VALUES (8, 'Saturn', 65, true, 10, NULL, 2);
INSERT INTO public.planet VALUES (9, 'Uranus', 43, true, 25, NULL, 2);
INSERT INTO public.planet VALUES (10, 'Neptune', 23, true, 10, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Prox Centauri A', 455, false, NULL, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Prox Centauri B', 450, false, NULL, NULL, 3);
INSERT INTO public.planet VALUES (13, 'Prox Centauri C', 445, false, NULL, NULL, 3);
INSERT INTO public.planet VALUES (14, 'Prox Centauri D', 455, true, 1, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sol', 26, 23.5, true, 10, 'Green Planet', NULL);
INSERT INTO public.star VALUES (3, 'Alpha Centaurus', 36, 30.5, false, 20, 'Has 3 stars', NULL);
INSERT INTO public.star VALUES (4, 'Procyon', 400, 900, true, 15, 'SuperGigante Azul', NULL);
INSERT INTO public.star VALUES (5, 'Sirio', 345, 8.6, true, 20, 'Enana Blanca', NULL);
INSERT INTO public.star VALUES (6, 'Canopus', 10, 309.8, true, 40, 'Super Gigante Blanco-Amarilla', NULL);
INSERT INTO public.star VALUES (7, 'Vega', 320, 25.3, true, 35, 'Gigante Blanca', NULL);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 300, 640, false, 0, 'Super Gigante Roja', NULL);
INSERT INTO public.star VALUES (10, 'Sol', 4600, 0.008, true, 8, 'Is the star at the center of the solar system', 8);
INSERT INTO public.star VALUES (11, 'Alpha Centauri', NULL, 4.36, false, NULL, 'is a solar system of three stars', 8);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 13, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation unique_constellation_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT unique_constellation_id UNIQUE (constellation_id);


--
-- Name: constellation unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

