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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_from_earth numeric(10,2),
    description text,
    has_life boolean NOT NULL,
    galaxy_type character varying(50) NOT NULL
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
    name character varying(100) NOT NULL,
    distance_from_planet numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    radius_in_km integer NOT NULL,
    planet_id integer
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
    name character varying(100) NOT NULL,
    planet_type character varying(50) NOT NULL,
    is_habitable boolean NOT NULL,
    diameter_in_km integer NOT NULL,
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_in_km integer NOT NULL,
    is_artificial boolean NOT NULL,
    launch_year integer
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    color character varying(50) NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000.00, 'A spiral galaxy', true, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2500000.00, 'A spiral galaxy', false, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 3000000.00, 'A spiral galaxy', false, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 4000000.00, 'A spiral galaxy', false, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 5000000.00, 'A spiral galaxy', false, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 6000000.00, 'A spiral galaxy', false, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 384400.00, true, 1737, 1);
INSERT INTO public.moon VALUES (22, 'Phobos', 9377.00, true, 11, 2);
INSERT INTO public.moon VALUES (23, 'Deimos', 23460.00, true, 6, 2);
INSERT INTO public.moon VALUES (24, 'Europa', 670900.00, true, 1561, 3);
INSERT INTO public.moon VALUES (25, 'Ganymede', 1070400.00, true, 2634, 3);
INSERT INTO public.moon VALUES (26, 'Io', 421800.00, true, 1822, 3);
INSERT INTO public.moon VALUES (27, 'Callisto', 1882700.00, true, 2410, 3);
INSERT INTO public.moon VALUES (28, 'Titan', 1221870.00, true, 2575, 4);
INSERT INTO public.moon VALUES (29, 'Enceladus', 238040.00, true, 252, 4);
INSERT INTO public.moon VALUES (30, 'Triton', 354760.00, true, 1353, 5);
INSERT INTO public.moon VALUES (31, 'Titania', 436300.00, true, 788, 6);
INSERT INTO public.moon VALUES (32, 'Oberon', 583520.00, true, 761, 6);
INSERT INTO public.moon VALUES (33, 'Ariel', 190900.00, true, 579, 6);
INSERT INTO public.moon VALUES (34, 'Umbriel', 266000.00, true, 585, 6);
INSERT INTO public.moon VALUES (35, 'Charon', 19591.00, true, 606, 9);
INSERT INTO public.moon VALUES (36, 'Gliese 581 g', 384400.00, true, 1495, 17);
INSERT INTO public.moon VALUES (37, 'Gliese 581 d', 368100.00, true, 1463, 17);
INSERT INTO public.moon VALUES (38, 'Kepler-62 f', 1216300.00, true, 1795, 18);
INSERT INTO public.moon VALUES (39, 'Kepler-22c', 1317800.00, true, 2200, 19);
INSERT INTO public.moon VALUES (40, 'Proteus', 117647.00, true, 210, 5);
INSERT INTO public.moon VALUES (41, 'Rhea', 527040.00, true, 764, 4);
INSERT INTO public.moon VALUES (42, 'Phoebe', 12947080.00, true, 107, 4);
INSERT INTO public.moon VALUES (43, 'Nereid', 5513400.00, true, 170, 5);
INSERT INTO public.moon VALUES (44, 'Hydra', 64780.00, true, 55, 5);
INSERT INTO public.moon VALUES (45, 'Pandora', 133584.00, true, 40, 4);
INSERT INTO public.moon VALUES (46, 'Amalthea', 181365.00, true, 84, 4);
INSERT INTO public.moon VALUES (47, 'Elara', 11737800.00, true, 43, 5);
INSERT INTO public.moon VALUES (48, 'Dione', 377396.00, true, 561, 4);
INSERT INTO public.moon VALUES (49, 'Larissa', 73548.00, true, 98, 5);
INSERT INTO public.moon VALUES (50, 'Atlas', 137640.00, true, 15, 4);
INSERT INTO public.moon VALUES (51, 'Miranda', 129900.00, true, 236, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', true, 12742, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', false, 6779, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', false, 12104, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Gas Giant', false, 139820, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas Giant', false, 116460, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Ice Giant', false, 49532, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', false, 50724, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Terrestrial', false, 4879, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', false, 2370, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'Terrestrial', true, 42000, 2);
INSERT INTO public.planet VALUES (11, 'HD 189733b', 'Gas Giant', false, 153000, 2);
INSERT INTO public.planet VALUES (12, 'PSR B1257+12 A', 'Rocky', false, 20000, 3);
INSERT INTO public.planet VALUES (13, '51 Pegasi b', 'Gas Giant', true, 71100, 4);
INSERT INTO public.planet VALUES (14, 'HD 209458 b', 'Gas Giant', false, 148800, 4);
INSERT INTO public.planet VALUES (15, 'Kepler-186f', 'Terrestrial', true, 12500, 5);
INSERT INTO public.planet VALUES (16, 'Kepler-452b', 'Terrestrial', true, 20000, 5);
INSERT INTO public.planet VALUES (17, 'Gliese 667 Cc', 'Terrestrial', true, 18000, 6);
INSERT INTO public.planet VALUES (18, 'Gliese 581 c', 'Terrestrial', true, 16000, 6);
INSERT INTO public.planet VALUES (19, 'GJ 1214 b', 'Waterworld', true, 14000, 6);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 13, true, 1990);
INSERT INTO public.satellite VALUES (2, 'International Space Station', 109, true, 1998);
INSERT INTO public.satellite VALUES (3, 'Voyager 1', 0, true, 1977);
INSERT INTO public.satellite VALUES (4, 'Mars Reconnaissance Orbiter', 4, true, 2005);
INSERT INTO public.satellite VALUES (5, 'Cassini', 4, true, 1997);
INSERT INTO public.satellite VALUES (6, 'Lunar Reconnaissance Orbiter', 2, true, 2009);
INSERT INTO public.satellite VALUES (7, 'Tiangong Space Station', 18, true, 2021);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow', true, 4500, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'White', true, 250, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red', true, 800, 1);
INSERT INTO public.star VALUES (4, 'Vega', 'Blue', true, 600, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 'Yellow', true, 6000, 1);
INSERT INTO public.star VALUES (6, 'Polaris', 'Yellow', true, 500, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 51, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

