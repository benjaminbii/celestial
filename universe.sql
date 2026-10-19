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
    name character varying(30) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    description text,
    is_spherical boolean
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
    planet_id integer NOT NULL,
    radius numeric(10,2),
    is_spherical boolean,
    has_atmosphere boolean,
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
    star_id integer NOT NULL,
    planet_types_id integer NOT NULL,
    has_life boolean,
    num_moons integer,
    distance_from_earth numeric(10,2),
    description text
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    mass numeric(10,2),
    is_spherical boolean,
    description text
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0.00, 'Our home galaxy', false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000.00, 'Nearest major galaxy', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 2730000.00, 'A galaxy in the Local Group', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 400, 23000000.00, 'A grand design spiral galaxy', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Lenticular', 13000, 29000000.00, 'A bright galaxy with a prominent bulge', true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 10000, 21000000.00, 'A face-on spiral galaxy', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737.40, true, false, 'Earth natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.27, false, false, 'Inner moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.20, false, false, 'Outer moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.60, true, false, 'Volcanically active moon');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.80, true, false, 'Icy moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.10, true, false, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.30, true, false, 'Heavily cratered moon');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 83.50, false, false, 'Small inner moon of Jupiter');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 2574.70, true, true, 'Moon with a thick atmosphere');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 252.10, true, false, 'Icy moon with water plumes');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 198.20, true, false, 'Small cratered moon');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 763.80, true, false, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 734.50, true, false, 'Moon with contrasting hemispheres');
INSERT INTO public.moon VALUES (14, 'Dione', 6, 561.40, true, false, 'Moon of Saturn');
INSERT INTO public.moon VALUES (15, 'Tethys', 6, 531.10, true, false, 'Icy moon of Saturn');
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 235.80, true, false, 'Small moon of Uranus');
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 578.90, true, false, 'Moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 584.70, true, false, 'Dark moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Titania', 7, 788.90, true, false, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (20, 'Oberon', 7, 761.40, true, false, 'Outer major moon of Uranus');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, false, 0, 0.00, 'Smallest planet');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, false, 0, 40.00, 'Hot rocky planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, true, 1, 0.00, 'Our home planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, false, 2, 54.60, 'The red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, false, 95, 628.70, 'Largest planet');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, false, 146, 1275.00, 'Planet known for its rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, false, 28, 2723.00, 'Ice giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, false, 16, 4345.00, 'Distant ice giant');
INSERT INTO public.planet VALUES (9, 'Sirius b', 2, 1, false, 0, 8.60, 'Hypothetical example planet record');
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, 1, false, 0, 4.24, 'Exoplanet orbiting Proxima Centauri');
INSERT INTO public.planet VALUES (11, 'Vega b', 5, 2, false, 0, 25.00, 'Example planet record');
INSERT INTO public.planet VALUES (12, 'Rigel b', 6, 2, false, 0, 860.00, 'Example planet record');


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', 'Rocky planet');
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', 'Large planet composed mostly of gases');
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', 'Planet rich in volatile compounds');
INSERT INTO public.planet_types VALUES (4, 'Dwarf', 'Small planetary body that is not a full planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 1.00, true, 'Star at the center of our solar system');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, 2.06, true, 'Bright star in Canis Major');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 4850, 0.12, true, 'Nearest known star to the Sun');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 10, 16.50, true, 'Red supergiant star');
INSERT INTO public.star VALUES (5, 'Vega', 1, 455, 2.14, true, 'Bright star in the constellation Lyra');
INSERT INTO public.star VALUES (6, 'Rigel', 1, 8, 21.00, true, 'Blue supergiant star');


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 4, true);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_type_name_key UNIQUE (name);


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
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


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

