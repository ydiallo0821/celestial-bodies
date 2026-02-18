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
    diameter_in_mly numeric(7,1),
    distance_in_ly integer,
    discovered date,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_size_in_km numeric(7,1),
    distance_to_planet_in_km integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    diameter_in_km integer,
    distance_to_star integer,
    is_earth_like boolean NOT NULL,
    has_rings boolean NOT NULL,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    diameter_in_km integer,
    distance_in_ly numeric(8,1),
    description text,
    star_type_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(60) NOT NULL,
    letter character varying(1) NOT NULL
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 87400.0, 0, NULL, 'Home galaxy of Earth. Barred spiral galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Ursa Major III', 103.0, 0, NULL, 'Satellite of Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Draco II', 120.0, 0, NULL, 'Satellite of Milky Way');
INSERT INTO public.galaxy VALUES (4, 'Tucana III', 220.0, 0, NULL, 'Satellite of Milky Way that is being tidally disrupted');
INSERT INTO public.galaxy VALUES (5, 'Segue I', NULL, 0, NULL, 'Satellite of Milky Way');
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf Sphr SagDEG', 10000.0, 0, NULL, 'Satellite of Milky Way (partial accretion by Milky Way)');
INSERT INTO public.galaxy VALUES (7, 'Hydrus I', 348.0, 0, NULL, 'Satellite of Milky Way');
INSERT INTO public.galaxy VALUES (8, 'Carina III', 200.0, 0, NULL, 'Satellite of Milky Way');
INSERT INTO public.galaxy VALUES (9, 'Ursa Major II Dwarf', 1800.0, 0, NULL, 'Satellite of Milky Way (accretion by Milky Way)');
INSERT INTO public.galaxy VALUES (10, 'Triangulum II', NULL, 0, NULL, 'Satellite of Milky Way (accretion by Milky Way)');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (24, 'moon', 3, 3474.0, 384400, 'The Moon is the only natural satellite of the Earth. It orbits at an average distance of 384,400 km (238,900 mi), about 30 times the diameter of Earth.');
INSERT INTO public.moon VALUES (25, 'Phobos', 4, 22.0, 6000, 'Phobos is the innermost and larger of the two natural satellites of Mars');
INSERT INTO public.moon VALUES (26, 'Deimos', 4, 12.0, 23460, 'Deimos is the smaller and outer of the two natural satellites of Mars');
INSERT INTO public.moon VALUES (27, 'Io', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (28, 'Europa', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (29, 'Ganymede', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (30, 'Callisto', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (31, 'Amalthea', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (32, 'Metis', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (33, 'Adrastea', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (34, 'Thebe', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (35, 'Carpo', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (36, 'Orae', 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (37, 'Pan', 6, 27.0, 367200, 'Pan is the innermost named moon of Saturn.');
INSERT INTO public.moon VALUES (38, 'Daphnis', 6, 8.0, 273000, 'Daphnis is an inner satellite of Saturn. It is also known as Saturn XXXV');
INSERT INTO public.moon VALUES (39, 'Atlas', 6, 30.0, 273400, 'Atlas is an inner satellite of Saturn which was discovered by Richard Terrile in 1980');
INSERT INTO public.moon VALUES (40, 'Pandora', 6, 80.0, 283400, 'Pandora is an inner satellite of Saturn. It was discovered in 1980 from photos taken by the Voyager 1');
INSERT INTO public.moon VALUES (41, 'Naia', 7, 60.0, 96448, 'Also known as Neptune III, named after the naiads of Greek legend');
INSERT INTO public.moon VALUES (42, 'Thalassa', 7, 81.0, 114800, 'also known as Neptune IV, is the second-innermost satellite of Neptune. Thalassa was named after sea goddess Thalassa, a daughter of Aether and Hemera from Greek mythology.');
INSERT INTO public.moon VALUES (43, 'Despina', 7, 156.0, 105052, 'Also known as Neptune V, is the third-closest inner moon of Neptune. It is named after Greek mythological character Despoina, a nymph who was a daughter of Poseidon and Demeter.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1550, NULL, false, false, 'Mercury is the first planet from the Sun and the smallest in the Solar System. In English, it is named after the ancient Roman god Mercurius (Mercury), god of commerce and communication, and the messenger of the gods.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12103, NULL, false, false, 'Venus is the second planet from the Sun. It is a terrestrial planet and is the closest in mass and size to its orbital neighbour Earth. Venus has by far the densest atmosphere of the terrestrial planets, composed mostly of carbon dioxide with a thick, global sulfuric acid cloud cover. ');
INSERT INTO public.planet VALUES (3, 'Earth', 1, NULL, NULL, true, false, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being an ocean world, the only one in the Solar System sustaining liquid surface water. ');
INSERT INTO public.planet VALUES (4, 'Mars', 1, NULL, NULL, false, false, 'Mars is the fourth planet from the Sun. The surface of Mars is orange-red because it is covered in iron(III) oxide dust, giving it the nickname "the Red Planet". Mars is among the brightest objects in the sky of Earth, and its high-contrast albedo features have made it a common subject for telescope viewing. ');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, NULL, NULL, false, false, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than 2.5 times that of all the other planets in the Solar System combined and slightly less than one-thousandth the mass of the Sun. ');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, NULL, NULL, false, true, 'Saturn is the sixth planet from the Sun and the second largest in the Solar System, after Jupiter. It is a gas giant, with an average radius of about nine times that of Earth.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, NULL, NULL, false, false, 'Uranus is the seventh planet from the Sun. It is a gaseous cyan-coloured ice giant. Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which astronomy calls "ice" or volatiles. ');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, NULL, NULL, false, false, 'Neptune is the eighth and farthest known planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth. Compared to its fellow ice giant Uranus, Neptune is slightly more massive, but denser and smaller.');
INSERT INTO public.planet VALUES (9, 'Proxima Centaury b', 4, NULL, NULL, true, false, 'The first confirmed exoplanet discovered in the Proxima Centauri system was Proxima Centauri b, in 2016.');
INSERT INTO public.planet VALUES (10, 'YZ Ceti', 5, NULL, NULL, false, true, 'YZ Ceti is a red dwarf star in the constellation Cetus. Although it is relatively close to the Sun at just 12 light years, this star cannot be seen with the naked eye. It is classified as a flare star that undergoes intermittent fluctuations in luminosity. YZ Ceti is about 13 percent the mass of the Sun and 17% of its radius.');
INSERT INTO public.planet VALUES (11, 'Gliese 367', 6, NULL, NULL, false, false, 'It is suspected to be a variable with amplitude 0.012 stellar magnitude and period 5.16 years.');
INSERT INTO public.planet VALUES (12, 'GJ 1002 b', 8, NULL, NULL, true, false, 'GJ 1002 b (also designated as Gliese 1002 b) is a potentially habitable exoplanet located 16 light-years away, in the constellation of Cetus.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, 1391400.0, 'The Sun is the star at the center of the Solar System. It is a massive, nearly perfect sphere of hot plasma, heated to incandescence by nuclear fusion reactions in its core, radiating the energy from its surface mainly as visible light and infrared radiation with 10% at ultraviolet energies.', 8);
INSERT INTO public.star VALUES (4, 'Promima Centauri', 1, NULL, 4.4, 'Proxima Centauri is the nearest star to Earth after the Sun, located 4.25 light-years away in the southern constellation of Centaurus.', 8);
INSERT INTO public.star VALUES (5, 'Barnards Star', 1, NULL, 6.0, NULL, 8);
INSERT INTO public.star VALUES (6, 'Wolf 359', 1, NULL, 7.9, NULL, 8);
INSERT INTO public.star VALUES (10, 'Luyten 726-8 A', 1, NULL, 8.8, NULL, 8);
INSERT INTO public.star VALUES (8, 'Sirius A', 1, NULL, 8.7, 'Sirius is the brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (9, 'Sirius B', 1, NULL, 8.7, NULL, 1);
INSERT INTO public.star VALUES (2, 'AE Andromedae', 2, NULL, 2500000.0, 'AE Andromedae (AE And) is a luminous blue variable (LBV), a type of variable star. The star is one of the most luminous variables in M31, the Andromeda Galaxy.', 3);
INSERT INTO public.star VALUES (3, 'M31-RV', 3, NULL, NULL, 'M31-RV is a possible red cataclysmic variable star located in the Andromeda Galaxy (M31) that experienced an outburst in 1988,[4] which was similar to the outburst V838 Monocerotis experienced in 2002.', 3);
INSERT INTO public.star VALUES (7, 'Lalande 21185', 1, NULL, 8.3, NULL, 5);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'hypergiants or extremely luminous supergiants', 'O');
INSERT INTO public.star_type VALUES (2, 'luminous supergiants', 'B');
INSERT INTO public.star_type VALUES (3, 'intermediate-size luminous supergiants', 'A');
INSERT INTO public.star_type VALUES (4, 'less luminous supergiants', 'F');
INSERT INTO public.star_type VALUES (5, 'bright giants', 'G');
INSERT INTO public.star_type VALUES (6, 'normal giants', 'K');
INSERT INTO public.star_type VALUES (7, 'subgiants', 'M');
INSERT INTO public.star_type VALUES (8, 'main-sequence stars (dwarfs)', 'W');
INSERT INTO public.star_type VALUES (9, 'subdwarfs', 'S');
INSERT INTO public.star_type VALUES (10, 'white dwarfs', 'C');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 10, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 43, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 10, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 10, true);


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
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_name_key UNIQUE (name);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--