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
    name character varying(50) NOT NULL,
    has_life boolean,
    description text,
    year_find integer NOT NULL,
    people_come integer,
    space_ship numeric,
    has_metal boolean NOT NULL
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
    name character varying(50),
    year_find integer NOT NULL,
    has_life boolean NOT NULL,
    description text,
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
    name character varying(50),
    year_find integer NOT NULL,
    has_life boolean NOT NULL,
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(50),
    year_add integer NOT NULL,
    n_eng integer NOT NULL,
    description text
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
    name character varying(50),
    year_find integer NOT NULL,
    has_life boolean NOT NULL,
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

INSERT INTO public.galaxy VALUES (6, 'Milky Way', true, 'Our home galaxy with billions of stars and confirmed life on Earth', 0, 500, 1450.75, true);
INSERT INTO public.galaxy VALUES (7, 'Andromeda', false, 'Nearest spiral galaxy, expected to collide with the Milky Way', 964, 0, 0.0, false);
INSERT INTO public.galaxy VALUES (8, 'Triangulum', false, 'A small spiral galaxy, part of the Local Group', 1764, 0, 0.0, false);
INSERT INTO public.galaxy VALUES (9, 'Sombrero', false, 'Galaxy with bright nucleus and large central bulge', 1781, 0, 0.0, false);
INSERT INTO public.galaxy VALUES (10, 'Whirlpool', false, 'Interacting galaxy with well-defined spiral arms', 1773, 0, 0.0, false);
INSERT INTO public.galaxy VALUES (11, 'Messier 87', false, 'Elliptical galaxy known for hosting a supermassive black hole', 1781, 0, 0.0, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', -1000, true, 'Earth''s natural satellite', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, false, 'Larger of Mars'' two moons', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, false, 'Smaller of Mars'' two moons', 3);
INSERT INTO public.moon VALUES (4, 'Europa', 1610, true, 'Icy moon of Jupiter, may harbor subsurface ocean', 4);
INSERT INTO public.moon VALUES (5, 'Ganymede', 1610, false, 'Largest moon in the Solar System', 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 1610, false, 'Heavily cratered moon of Jupiter', 6);
INSERT INTO public.moon VALUES (7, 'Io', 1610, false, 'Most volcanically active moon', 7);
INSERT INTO public.moon VALUES (8, 'Titan', 1655, true, 'Largest moon of Saturn, thick atmosphere', 8);
INSERT INTO public.moon VALUES (9, 'Rhea', 1672, false, 'Second-largest moon of Saturn', 9);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1671, false, 'Two-toned coloration moon of Saturn', 10);
INSERT INTO public.moon VALUES (11, 'Dione', 1684, false, 'Moon of Saturn with bright icy cliffs', 11);
INSERT INTO public.moon VALUES (12, 'Tethys', 1684, false, 'Contains a huge canyon called Ithaca Chasma', 12);
INSERT INTO public.moon VALUES (13, 'Enceladus', 1789, true, 'Sprays water from its south pole, may have subsurface ocean', 13);
INSERT INTO public.moon VALUES (14, 'Mimas', 1789, false, 'Known for its large crater Herschel', 14);
INSERT INTO public.moon VALUES (15, 'Oberon', 1787, false, 'One of Uranus'' largest moons', 15);
INSERT INTO public.moon VALUES (16, 'Titania', 1787, false, 'Largest moon of Uranus', 16);
INSERT INTO public.moon VALUES (17, 'Ariel', 1851, false, 'Moon of Uranus with canyons and ridges', 1);
INSERT INTO public.moon VALUES (18, 'Umbriel', 1851, false, 'Dark moon of Uranus', 2);
INSERT INTO public.moon VALUES (19, 'Triton', 1846, false, 'Largest moon of Neptune, retrograde orbit', 3);
INSERT INTO public.moon VALUES (20, 'Charon', 1978, false, 'Largest moon of Pluto', 4);
INSERT INTO public.moon VALUES (21, 'Nix', 2005, false, 'Small moon of Pluto', 5);
INSERT INTO public.moon VALUES (22, 'Hydra', 2005, false, 'Another small moon of Pluto', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Gliese 581g', 2010, true, 'Potentially habitable exoplanet', 3);
INSERT INTO public.planet VALUES (3, 'HD 209458 b', 1999, false, 'First exoplanet seen to transit its star', 4);
INSERT INTO public.planet VALUES (4, '51 Pegasi b', 1995, false, 'First discovered exoplanet orbiting a Sun-like star', 5);
INSERT INTO public.planet VALUES (5, 'TRAPPIST-1d', 2017, true, 'One of seven Earth-size planets in TRAPPIST-1 system', 6);
INSERT INTO public.planet VALUES (6, 'Proxima b', 2016, true, 'Closest known exoplanet to the Solar System', 7);
INSERT INTO public.planet VALUES (7, 'TOI 700 d', 2020, true, 'Earth-size exoplanet in habitable zone', 8);
INSERT INTO public.planet VALUES (8, 'WASP-12b', 2008, false, 'Extremely hot gas giant with decaying orbit', 9);
INSERT INTO public.planet VALUES (9, 'GJ 1214 b', 2009, false, 'Sub-Neptune with potential water vapor', 10);
INSERT INTO public.planet VALUES (10, 'K2-18b', 2015, true, 'Exoplanet with water vapor in its atmosphere', 11);
INSERT INTO public.planet VALUES (11, 'HD 189733 b', 2005, false, 'Known for violent weather and blue color', 12);
INSERT INTO public.planet VALUES (12, 'LHS 1140 b', 2017, true, 'Rocky exoplanet in the habitable zone', 13);
INSERT INTO public.planet VALUES (1, 'Kepler-22b', 2011, true, 'First known transiting planet in the habitable zone', 2);
INSERT INTO public.planet VALUES (14, 'OGLE-2005-BLG-390Lb', 2005, false, 'Frozen planet far from its star', 2);
INSERT INTO public.planet VALUES (16, 'HD 69830 c', 2006, false, 'Neptune-mass planet in inner zone of its system', 2);
INSERT INTO public.planet VALUES (13, 'Kapteyn b', 2014, true, 'Oldest known potentially habitable exoplanet', 7);
INSERT INTO public.planet VALUES (15, 'Ross 128 b', 2017, true, 'Temperate planet orbiting a quiet red dwarf', 7);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Luna Satellite', 1959, 1, 'First artificial satellite to orbit the Earth, launched by the Soviet Union.');
INSERT INTO public.satellite VALUES (2, 'Phobos Probe', 1988, 3, 'Launched to explore Mars'' moon Phobos, by the Soviet Union.');
INSERT INTO public.satellite VALUES (3, 'Europa Orbiter', 2025, 4, 'Future mission planned to study Europa, one of Jupiter''s moons.');
INSERT INTO public.satellite VALUES (4, 'Ganymede Explorer', 2030, 5, 'Planned mission to explore Ganymede, largest moon of Jupiter.');
INSERT INTO public.satellite VALUES (5, 'Titan Voyager', 2032, 2, 'Mission to study Saturn''s largest moon, Titan, to search for signs of life.');
INSERT INTO public.satellite VALUES (6, 'Charon Satellite', 2005, 1, 'Pluto''s largest moon, visited by NASA''s New Horizons spacecraft.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Lyra', 2019, false, 'A distant star in the Lyra constellation', 6);
INSERT INTO public.star VALUES (4, 'Vega', 2020, true, 'Possible life signs detected', 7);
INSERT INTO public.star VALUES (5, 'Altair', 2018, false, 'Part of the Summer Triangle', 8);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 2017, false, 'Red supergiant near explosion', 9);
INSERT INTO public.star VALUES (7, 'Sirius', 2021, true, 'Brightest star in the night sky', 10);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 2016, true, 'Closest known star to the Sun', 6);
INSERT INTO public.star VALUES (9, 'Rigel', 2022, false, 'Blue supergiant in Orion', 7);
INSERT INTO public.star VALUES (10, 'Aldebaran', 2015, false, 'Orange giant in Taurus', 8);
INSERT INTO public.star VALUES (11, 'Deneb', 2014, false, 'One of the most luminous stars', 9);
INSERT INTO public.star VALUES (12, 'Antares', 2023, false, 'Red supergiant in Scorpius', 10);
INSERT INTO public.star VALUES (13, 'Canopus', 2020, false, 'Second-brightest star in the sky', 11);
INSERT INTO public.star VALUES (2, 'Lynx', 2019, false, 'no', 11);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


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

