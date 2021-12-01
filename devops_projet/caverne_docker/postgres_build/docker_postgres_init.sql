CREATE ROLE olivierx LOGIN;
ALTER ROLE olivierx CREATEDB;
CREATE DATABASE perso OWNER olivierx;
ALTER ROLE olivierx WITH ENCRYPTED PASSWORD 'XXXX';
ALTER ROLE olivierx SET client_encoding TO 'utf8';
ALTER ROLE olivierx SET default_transaction_isolation TO 'read committed';
ALTER ROLE olivierx SET timezone TO 'Europe/Paris';
GRANT ALL PRIVILEGES ON DATABASE perso TO olivierx;

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO olivierx;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO olivierx;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO olivierx;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO olivierx;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO olivierx;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO olivierx;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO olivierx;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO olivierx;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO olivierx;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO olivierx;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO olivierx;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO olivierx;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO olivierx;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO olivierx;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO olivierx;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO olivierx;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO olivierx;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO olivierx;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO olivierx;

--
-- Name: joueur_carac; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.joueur_carac (
    id bigint NOT NULL,
    nom character varying(50) NOT NULL,
    valeur integer NOT NULL,
    personnages_id bigint NOT NULL
);


ALTER TABLE public.joueur_carac OWNER TO olivierx;

--
-- Name: joueur_carac_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.joueur_carac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.joueur_carac_id_seq OWNER TO olivierx;

--
-- Name: joueur_carac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.joueur_carac_id_seq OWNED BY public.joueur_carac.id;


--
-- Name: joueur_classe; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.joueur_classe (
    id bigint NOT NULL,
    nom character varying(50) NOT NULL,
    bonus_def integer NOT NULL,
    pdv integer NOT NULL,
    recuperation integer NOT NULL
);


ALTER TABLE public.joueur_classe OWNER TO olivierx;

--
-- Name: joueur_classe_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.joueur_classe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.joueur_classe_id_seq OWNER TO olivierx;

--
-- Name: joueur_classe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.joueur_classe_id_seq OWNED BY public.joueur_classe.id;


--
-- Name: joueur_def; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.joueur_def (
    id bigint NOT NULL,
    nom character varying(50) NOT NULL,
    valeur integer NOT NULL,
    personnages_id bigint NOT NULL
);


ALTER TABLE public.joueur_def OWNER TO olivierx;

--
-- Name: joueur_def_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.joueur_def_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.joueur_def_id_seq OWNER TO olivierx;

--
-- Name: joueur_def_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.joueur_def_id_seq OWNED BY public.joueur_def.id;


--
-- Name: joueur_personnages; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.joueur_personnages (
    id bigint NOT NULL,
    nom character varying(50) NOT NULL,
    age integer NOT NULL,
    sex character varying(50) NOT NULL,
    taille integer NOT NULL,
    poids integer NOT NULL,
    alignement character varying(100) NOT NULL,
    divinite character varying(100) NOT NULL,
    initiative integer NOT NULL,
    point_carac integer NOT NULL,
    classe_id bigint NOT NULL,
    race_id bigint NOT NULL,
    utilisateur_id integer NOT NULL
);


ALTER TABLE public.joueur_personnages OWNER TO olivierx;

--
-- Name: joueur_personnages_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.joueur_personnages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.joueur_personnages_id_seq OWNER TO olivierx;

--
-- Name: joueur_personnages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.joueur_personnages_id_seq OWNED BY public.joueur_personnages.id;


--
-- Name: joueur_race; Type: TABLE; Schema: public; Owner: olivierx
--

CREATE TABLE public.joueur_race (
    id bigint NOT NULL,
    nom character varying(50) NOT NULL,
    bonus_carac integer NOT NULL,
    vitesse_dep integer NOT NULL,
    cat_taille character varying(50) NOT NULL,
    vision boolean NOT NULL
);


ALTER TABLE public.joueur_race OWNER TO olivierx;

--
-- Name: joueur_race_id_seq; Type: SEQUENCE; Schema: public; Owner: olivierx
--

CREATE SEQUENCE public.joueur_race_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.joueur_race_id_seq OWNER TO olivierx;

--
-- Name: joueur_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivierx
--

ALTER SEQUENCE public.joueur_race_id_seq OWNED BY public.joueur_race.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: joueur_carac id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_carac ALTER COLUMN id SET DEFAULT nextval('public.joueur_carac_id_seq'::regclass);


--
-- Name: joueur_classe id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_classe ALTER COLUMN id SET DEFAULT nextval('public.joueur_classe_id_seq'::regclass);


--
-- Name: joueur_def id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_def ALTER COLUMN id SET DEFAULT nextval('public.joueur_def_id_seq'::regclass);


--
-- Name: joueur_personnages id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_personnages ALTER COLUMN id SET DEFAULT nextval('public.joueur_personnages_id_seq'::regclass);


--
-- Name: joueur_race id; Type: DEFAULT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_race ALTER COLUMN id SET DEFAULT nextval('public.joueur_race_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add classe	1	add_classe
2	Can change classe	1	change_classe
3	Can delete classe	1	delete_classe
4	Can view classe	1	view_classe
5	Can add race	2	add_race
6	Can change race	2	change_race
7	Can delete race	2	delete_race
8	Can view race	2	view_race
9	Can add personnages	3	add_personnages
10	Can change personnages	3	change_personnages
11	Can delete personnages	3	delete_personnages
12	Can view personnages	3	view_personnages
13	Can add def	4	add_def
14	Can change def	4	change_def
15	Can delete def	4	delete_def
16	Can view def	4	view_def
17	Can add carac	5	add_carac
18	Can change carac	5	change_carac
19	Can delete carac	5	delete_carac
20	Can view carac	5	view_carac
21	Can add log entry	6	add_logentry
22	Can change log entry	6	change_logentry
23	Can delete log entry	6	delete_logentry
24	Can view log entry	6	view_logentry
25	Can add permission	7	add_permission
26	Can change permission	7	change_permission
27	Can delete permission	7	delete_permission
28	Can view permission	7	view_permission
29	Can add group	8	add_group
30	Can change group	8	change_group
31	Can delete group	8	delete_group
32	Can view group	8	view_group
33	Can add user	9	add_user
34	Can change user	9	change_user
35	Can delete user	9	delete_user
36	Can view user	9	view_user
37	Can add content type	10	add_contenttype
38	Can change content type	10	change_contenttype
39	Can delete content type	10	delete_contenttype
40	Can view content type	10	view_contenttype
41	Can add session	11	add_session
42	Can change session	11	change_session
43	Can delete session	11	delete_session
44	Can view session	11	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$2BQvloitAuXOQc1KjD3G1g$N018/GW7TXsAzgDGApetf8mUrpQS2Ph4ICiVVNg4TuM=	2021-11-17 16:54:52.023955+01	f	Olivier_N	Olivier	NESME	olivier.nesme@gmail.com	f	t	2021-11-17 16:54:51.682837+01
2	pbkdf2_sha256$260000$QnNvH5zJNs0iZOK4nBl9lP$kW5tL9r/BrnIko2wjfEbUsh6eBHKgWoGnHBZqkIyjWk=	2021-11-27 16:28:42.574424+01	f	Oliv	Olivier	NESME	olivier@gmail.com	f	t	2021-11-19 08:36:49.008951+01
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	joueur	classe
2	joueur	race
3	joueur	personnages
4	joueur	def
5	joueur	carac
6	admin	logentry
7	auth	permission
8	auth	group
9	auth	user
10	contenttypes	contenttype
11	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-11-07 15:51:50.913227+01
2	auth	0001_initial	2021-11-07 15:51:51.048911+01
3	admin	0001_initial	2021-11-07 15:51:51.088376+01
4	admin	0002_logentry_remove_auto_add	2021-11-07 15:51:51.103601+01
5	admin	0003_logentry_add_action_flag_choices	2021-11-07 15:51:51.119467+01
6	contenttypes	0002_remove_content_type_name	2021-11-07 15:51:51.150537+01
7	auth	0002_alter_permission_name_max_length	2021-11-07 15:51:51.164475+01
8	auth	0003_alter_user_email_max_length	2021-11-07 15:51:51.181642+01
9	auth	0004_alter_user_username_opts	2021-11-07 15:51:51.198481+01
10	auth	0005_alter_user_last_login_null	2021-11-07 15:51:51.214398+01
11	auth	0006_require_contenttypes_0002	2021-11-07 15:51:51.219094+01
12	auth	0007_alter_validators_add_error_messages	2021-11-07 15:51:51.233235+01
13	auth	0008_alter_user_username_max_length	2021-11-07 15:51:51.256969+01
14	auth	0009_alter_user_last_name_max_length	2021-11-07 15:51:51.27852+01
15	auth	0010_alter_group_name_max_length	2021-11-07 15:51:51.29532+01
16	auth	0011_update_proxy_permissions	2021-11-07 15:51:51.309695+01
17	auth	0012_alter_user_first_name_max_length	2021-11-07 15:51:51.324243+01
18	joueur	0001_initial	2021-11-07 15:51:51.453819+01
19	sessions	0001_initial	2021-11-07 15:51:51.476448+01
20	joueur	0002_alter_personnages_sex	2021-11-17 16:46:09.39723+01
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
3iigs05rv9zb60nqe4nw554nky1lc6zw	.eJxVy0kKAjEQQNG7ZC1NJUUml4LnCJVKhTT2AKazEu-uggvd_sd_qETjaGl0uae5qLMy6vTbMvFNtg8Q8z62o0_rXmTp03Wlebl8-e9p1Nt7wKoZCpINEMmbgJE1giPWBsC6XIoX1CZXjZLJIhjjJHuhUJkiRfV8Ab6HMw8:1moQvJ:yICQgKTPMYwMmFWLaUsYbk_LK_WgaCShm8BRQVpNveE	2021-12-04 15:00:57.025371+01
0rdyayodm3eyysfpivpvg1rv3kz9plir	.eJxVy0kKAjEQQNG7ZC1NJUUml4LnCJVKhTT2AKazEu-uggvd_sd_qETjaGl0uae5qLMy6vTbMvFNtg8Q8z62o0_rXmTp03Wlebl8-e9p1Nt7wKoZCpINEMmbgJE1giPWBsC6XIoX1CZXjZLJIhjjJHuhUJkiRfV8Ab6HMw8:1mqzd4:kasTePgZ24eGC151ezKELKn3Xgwak5gS8fwn8FQSlOI	2021-12-11 16:28:42.57744+01
\.


--
-- Data for Name: joueur_carac; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.joueur_carac (id, nom, valeur, personnages_id) FROM stdin;
\.


--
-- Data for Name: joueur_classe; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.joueur_classe (id, nom, bonus_def, pdv, recuperation) FROM stdin;
8	Guerrier	2	15	9
9	Magicien	2	10	6
10	Prêtre	2	12	7
\.


--
-- Data for Name: joueur_def; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.joueur_def (id, nom, valeur, personnages_id) FROM stdin;
\.


--
-- Data for Name: joueur_personnages; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.joueur_personnages (id, nom, age, sex, taille, poids, alignement, divinite, initiative, point_carac, classe_id, race_id, utilisateur_id) FROM stdin;
\.


--
-- Data for Name: joueur_race; Type: TABLE DATA; Schema: public; Owner: olivierx
--

COPY public.joueur_race (id, nom, bonus_carac, vitesse_dep, cat_taille, vision) FROM stdin;
4	Elf	2	7	M	t
5	Nain	2	5	M	t
6	Tieffelin	2	6	M	t
7	Drakéïde	2	6	M	f
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: joueur_carac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.joueur_carac_id_seq', 64, true);


--
-- Name: joueur_classe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.joueur_classe_id_seq', 10, true);


--
-- Name: joueur_def_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.joueur_def_id_seq', 36, true);


--
-- Name: joueur_personnages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.joueur_personnages_id_seq', 16, true);


--
-- Name: joueur_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivierx
--

SELECT pg_catalog.setval('public.joueur_race_id_seq', 7, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: joueur_carac joueur_carac_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_carac
    ADD CONSTRAINT joueur_carac_pkey PRIMARY KEY (id);


--
-- Name: joueur_classe joueur_classe_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_classe
    ADD CONSTRAINT joueur_classe_pkey PRIMARY KEY (id);


--
-- Name: joueur_def joueur_def_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_def
    ADD CONSTRAINT joueur_def_pkey PRIMARY KEY (id);


--
-- Name: joueur_personnages joueur_personnages_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_personnages
    ADD CONSTRAINT joueur_personnages_pkey PRIMARY KEY (id);


--
-- Name: joueur_race joueur_race_pkey; Type: CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_race
    ADD CONSTRAINT joueur_race_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: joueur_carac_personnages_id_93a07ba2; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX joueur_carac_personnages_id_93a07ba2 ON public.joueur_carac USING btree (personnages_id);


--
-- Name: joueur_def_personnages_id_d9b92b64; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX joueur_def_personnages_id_d9b92b64 ON public.joueur_def USING btree (personnages_id);


--
-- Name: joueur_personnages_classe_id_70a1a68b; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX joueur_personnages_classe_id_70a1a68b ON public.joueur_personnages USING btree (classe_id);


--
-- Name: joueur_personnages_race_id_b0fde387; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX joueur_personnages_race_id_b0fde387 ON public.joueur_personnages USING btree (race_id);


--
-- Name: joueur_personnages_utilisateur_id_2effc7b2; Type: INDEX; Schema: public; Owner: olivierx
--

CREATE INDEX joueur_personnages_utilisateur_id_2effc7b2 ON public.joueur_personnages USING btree (utilisateur_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joueur_carac joueur_carac_personnages_id_93a07ba2_fk_joueur_personnages_id; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_carac
    ADD CONSTRAINT joueur_carac_personnages_id_93a07ba2_fk_joueur_personnages_id FOREIGN KEY (personnages_id) REFERENCES public.joueur_personnages(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joueur_def joueur_def_personnages_id_d9b92b64_fk_joueur_personnages_id; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_def
    ADD CONSTRAINT joueur_def_personnages_id_d9b92b64_fk_joueur_personnages_id FOREIGN KEY (personnages_id) REFERENCES public.joueur_personnages(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joueur_personnages joueur_personnages_classe_id_70a1a68b_fk_joueur_classe_id; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_personnages
    ADD CONSTRAINT joueur_personnages_classe_id_70a1a68b_fk_joueur_classe_id FOREIGN KEY (classe_id) REFERENCES public.joueur_classe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joueur_personnages joueur_personnages_race_id_b0fde387_fk_joueur_race_id; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_personnages
    ADD CONSTRAINT joueur_personnages_race_id_b0fde387_fk_joueur_race_id FOREIGN KEY (race_id) REFERENCES public.joueur_race(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: joueur_personnages joueur_personnages_utilisateur_id_2effc7b2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: olivierx
--

ALTER TABLE ONLY public.joueur_personnages
    ADD CONSTRAINT joueur_personnages_utilisateur_id_2effc7b2_fk_auth_user_id FOREIGN KEY (utilisateur_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

