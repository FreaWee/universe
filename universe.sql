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
    name character varying(20),
    type text NOT NULL,
    size_in_lightyears character varying(20),
    distance_from_earth_in_lightyears character varying(20)
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
    name character varying(20),
    its_planet character varying(20),
    diameter_in_km integer NOT NULL,
    distance_from_its_planet_in_km numeric,
    galaxy_id integer,
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
    name character varying(20),
    type text NOT NULL,
    diameter_in_km integer,
    habitable boolean,
    galaxy_id integer,
    contain_water boolean,
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
    name character varying(20),
    type text NOT NULL,
    diameter_in_km character varying(20),
    distance_from_earth_in_lightyears character varying(20),
    galaxy_id integer,
    system_id integer
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
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    name character varying(20),
    type character varying(220),
    distance_from_earth_in_lightyear character varying(20) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


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
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MILKY WAY', 'Barred Spiral Galaxy', '120000', '0.0');
INSERT INTO public.galaxy VALUES (2, 'ANDROMEDA', 'Barred spiral galaxy', '220000', '2.5 million');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 'Spiral Galaxy', '60000', '3 million');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Spiral Galaxy (with a smaller companion galaxy', '60000', '23 million');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Lenticular Galaxy', '50000', '29 million');
INSERT INTO public.galaxy VALUES (6, 'Virgo A', 'Elliptical Galaxy', '120000', '53.5 million');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'Earth', 3474, 384400, 1, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 22, 9376, 1, 4);
INSERT INTO public.moon VALUES (3, 'Io', 'Jupiter', 3643, 421700, 1, 5);
INSERT INTO public.moon VALUES (4, 'Titan', 'Saturn', 5152, 1221870, 1, 6);
INSERT INTO public.moon VALUES (5, 'Triton', 'Neptune', 2707, 354760, 1, 7);
INSERT INTO public.moon VALUES (6, 'Miranda', 'Uranus', 472, 129390, 1, 10);
INSERT INTO public.moon VALUES (7, 'Ariel', 'Uranus', 1159, 190900, 1, 10);
INSERT INTO public.moon VALUES (8, 'Umbriel', 'Uranus', 1169, 266000, 1, 10);
INSERT INTO public.moon VALUES (9, 'Titania', 'Uranus', 1577, 436300, 1, 10);
INSERT INTO public.moon VALUES (10, 'Oberon', 'Uranus', 1523, 583500, 1, 10);
INSERT INTO public.moon VALUES (11, 'Caliban', 'Uranus', 72, 7200000, 1, 10);
INSERT INTO public.moon VALUES (12, 'Sycorax', 'Uranus', 190, 12200000, 1, 10);
INSERT INTO public.moon VALUES (19, 'Hermes', 'Mercury', 100, NULL, 1, 9);
INSERT INTO public.moon VALUES (13, 'Charon', 'Pluto', 1212, 19640, 1, 13);
INSERT INTO public.moon VALUES (14, 'Nix', 'Pluto', 50, 48700, 1, 13);
INSERT INTO public.moon VALUES (20, 'Hydra', 'Pluto', 51, 64738, 1, 13);
INSERT INTO public.moon VALUES (15, 'Hiʻiaka', 'Haumea', 310, 49880, 1, 14);
INSERT INTO public.moon VALUES (16, 'Namaka', 'Haumea', 170, 25657, 1, 14);
INSERT INTO public.moon VALUES (17, 'Kepler-1625b I', 'Kepler-1625b', 49000, 3000000, 1, 15);
INSERT INTO public.moon VALUES (18, 'Dysnomia', 'Eris', 700, 37350, 1, 16);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Solid, rocky surface', 12742, true, 1, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 6779, false, 1, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 139820, false, 1, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 116460, false, 1, false, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice Giant', 49244, false, 1, false, 1);
INSERT INTO public.planet VALUES (8, 'Venus', 'Terrestrial', 12104, false, 1, false, 1);
INSERT INTO public.planet VALUES (9, 'Mercury', 'Terrestrial', 4879, false, 1, false, 1);
INSERT INTO public.planet VALUES (10, 'Uranus', 'Ice Giant', 50724, false, 1, false, 1);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 'Exoplanet', 12800, false, 1, false, 1);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'Exoplanet', 12100, true, 1, true, 8);
INSERT INTO public.planet VALUES (13, 'Pluto', 'Dwarf Planet', 2377, false, 1, false, 1);
INSERT INTO public.planet VALUES (14, 'Haumea', 'Dwarf Planet', 1632, false, 1, false, 1);
INSERT INTO public.planet VALUES (15, 'Kepler-1625b', 'Exoplanet', 143450, false, 1, false, 1);
INSERT INTO public.planet VALUES (16, 'Eris', 'Dwarf Planet', 2326, false, 1, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SUN', 'Spectral Type: G2', '1.4 million', '8 min 20 sec', 1, 1);
INSERT INTO public.star VALUES (3, 'SIRIUS A', 'A', '1.1 million', '8.6', 1, 2);
INSERT INTO public.star VALUES (4, 'AlphaCentauri A', 'G', '835000', '4.3', 1, 3);
INSERT INTO public.star VALUES (2, 'M31-RV', 'Red Variable Star', 'x10 to x100 sun', '2.5 million', 2, 5);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Red Supergiant', '1230000000', '642.5', 1, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'Blue Supergiant', '70000000', '860', 1, 1);
INSERT INTO public.star VALUES (7, 'Kepler-22', 'G', '1358000', '620', 1, 6);
INSERT INTO public.star VALUES (8, 'Trappist-1', 'Ultracool Red Dward', '167000', '40', 1, NULL);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES (1, 'SOLAR', 'Stellar', '0', 1);
INSERT INTO public.system VALUES (2, 'SIRIUS', 'Binary star system', '8.6', 1);
INSERT INTO public.system VALUES (3, 'Alpha Centauri', 'Triple star system', '4.4', 1);
INSERT INTO public.system VALUES (5, 'M31-RVS', 'Single star system', '2.5 million', 2);
INSERT INTO public.system VALUES (4, 'EPSILON ERIDANI', 'Single star system', '10.5', 1);
INSERT INTO public.system VALUES (6, 'Kepler-22 System', 'Planetary System', '620', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 6, true);


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
-- Name: system system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_name_key UNIQUE (name);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_its_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_its_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_its_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_its_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_system_id_fkey FOREIGN KEY (system_id) REFERENCES public.system(system_id);


--
-- PostgreSQL database dump complete
--

