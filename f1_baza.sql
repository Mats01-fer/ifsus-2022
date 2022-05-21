--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO matejbutkovic;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO matejbutkovic;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO matejbutkovic;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO matejbutkovic;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO matejbutkovic;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO matejbutkovic;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: matejbutkovic
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


ALTER TABLE public.auth_user OWNER TO matejbutkovic;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO matejbutkovic;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO matejbutkovic;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO matejbutkovic;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO matejbutkovic;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO matejbutkovic;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO matejbutkovic;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: matejbutkovic
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


ALTER TABLE public.django_admin_log OWNER TO matejbutkovic;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO matejbutkovic;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO matejbutkovic;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO matejbutkovic;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO matejbutkovic;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO matejbutkovic;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO matejbutkovic;

--
-- Name: f1_complaint; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.f1_complaint (
    id integer NOT NULL,
    descirption character varying(1140) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    status character varying(140) NOT NULL,
    resolved boolean NOT NULL,
    team_id integer NOT NULL,
    fia_officer_id integer
);


ALTER TABLE public.f1_complaint OWNER TO matejbutkovic;

--
-- Name: f1_complaint_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.f1_complaint_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.f1_complaint_id_seq OWNER TO matejbutkovic;

--
-- Name: f1_complaint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.f1_complaint_id_seq OWNED BY public.f1_complaint.id;


--
-- Name: f1_driver; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.f1_driver (
    number integer NOT NULL,
    name character varying(140) NOT NULL,
    last_name character varying(140) NOT NULL,
    points integer NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.f1_driver OWNER TO matejbutkovic;

--
-- Name: f1_location; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.f1_location (
    id integer NOT NULL,
    name character varying(140) NOT NULL,
    city character varying(140) NOT NULL,
    country character varying(140) NOT NULL
);


ALTER TABLE public.f1_location OWNER TO matejbutkovic;

--
-- Name: f1_location_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.f1_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.f1_location_id_seq OWNER TO matejbutkovic;

--
-- Name: f1_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.f1_location_id_seq OWNED BY public.f1_location.id;


--
-- Name: f1_pointsupdate; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.f1_pointsupdate (
    id integer NOT NULL,
    descirption character varying(140) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    points integer NOT NULL,
    driver_id integer NOT NULL,
    race_id integer NOT NULL,
    "FIA_officer_id" integer
);


ALTER TABLE public.f1_pointsupdate OWNER TO matejbutkovic;

--
-- Name: f1_pointsupdate_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.f1_pointsupdate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.f1_pointsupdate_id_seq OWNER TO matejbutkovic;

--
-- Name: f1_pointsupdate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.f1_pointsupdate_id_seq OWNED BY public.f1_pointsupdate.id;


--
-- Name: f1_race; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.f1_race (
    id integer NOT NULL,
    name character varying(140) NOT NULL,
    location_id integer,
    date date NOT NULL,
    completed boolean NOT NULL
);


ALTER TABLE public.f1_race OWNER TO matejbutkovic;

--
-- Name: f1_race_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.f1_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.f1_race_id_seq OWNER TO matejbutkovic;

--
-- Name: f1_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.f1_race_id_seq OWNED BY public.f1_race.id;


--
-- Name: f1_team; Type: TABLE; Schema: public; Owner: matejbutkovic
--

CREATE TABLE public.f1_team (
    id integer NOT NULL,
    name character varying(140) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    points integer NOT NULL,
    owner_id integer
);


ALTER TABLE public.f1_team OWNER TO matejbutkovic;

--
-- Name: f1_team_id_seq; Type: SEQUENCE; Schema: public; Owner: matejbutkovic
--

CREATE SEQUENCE public.f1_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.f1_team_id_seq OWNER TO matejbutkovic;

--
-- Name: f1_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matejbutkovic
--

ALTER SEQUENCE public.f1_team_id_seq OWNED BY public.f1_team.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: f1_complaint id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_complaint ALTER COLUMN id SET DEFAULT nextval('public.f1_complaint_id_seq'::regclass);


--
-- Name: f1_location id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_location ALTER COLUMN id SET DEFAULT nextval('public.f1_location_id_seq'::regclass);


--
-- Name: f1_pointsupdate id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_pointsupdate ALTER COLUMN id SET DEFAULT nextval('public.f1_pointsupdate_id_seq'::regclass);


--
-- Name: f1_race id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_race ALTER COLUMN id SET DEFAULT nextval('public.f1_race_id_seq'::regclass);


--
-- Name: f1_team id; Type: DEFAULT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_team ALTER COLUMN id SET DEFAULT nextval('public.f1_team_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.auth_group (id, name) FROM stdin;
1	FIA
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add token	8	add_tokenproxy
30	Can change token	8	change_tokenproxy
31	Can delete token	8	delete_tokenproxy
32	Can view token	8	view_tokenproxy
33	Can add driver	9	add_driver
34	Can change driver	9	change_driver
35	Can delete driver	9	delete_driver
36	Can view driver	9	view_driver
37	Can add race	10	add_race
38	Can change race	10	change_race
39	Can delete race	10	delete_race
40	Can view race	10	view_race
41	Can add team	11	add_team
42	Can change team	11	change_team
43	Can delete team	11	delete_team
44	Can view team	11	view_team
45	Can add points update	12	add_pointsupdate
46	Can change points update	12	change_pointsupdate
47	Can delete points update	12	delete_pointsupdate
48	Can view points update	12	view_pointsupdate
49	Can add complaint	13	add_complaint
50	Can change complaint	13	change_complaint
51	Can delete complaint	13	delete_complaint
52	Can view complaint	13	view_complaint
53	Can add location	14	add_location
54	Can change location	14	change_location
55	Can delete location	14	delete_location
56	Can view location	14	view_location
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$mi8vMxBJa7niZcHvDUqkim$YNu2rZWYzxBfD6Vzu8Tk8u0AQ31I8V446hISw4FSh00=	2022-04-04 22:14:14+02	t	matejadmin			matej.butkovic@fer.hr	t	t	2022-04-04 22:14:00+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-04-06 22:20:48.169448+02	1	FIA	1	[{"added": {}}]	3	1
2	2022-04-06 22:20:57.923469+02	1	matejadmin	2	[{"changed": {"fields": ["Groups"]}}]	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	authtoken	token
8	authtoken	tokenproxy
9	f1	driver
10	f1	race
11	f1	team
12	f1	pointsupdate
13	f1	complaint
14	f1	location
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-04-04 22:13:24.680725+02
2	auth	0001_initial	2022-04-04 22:13:24.776704+02
3	admin	0001_initial	2022-04-04 22:13:24.809443+02
4	admin	0002_logentry_remove_auto_add	2022-04-04 22:13:24.834381+02
5	admin	0003_logentry_add_action_flag_choices	2022-04-04 22:13:24.849005+02
6	contenttypes	0002_remove_content_type_name	2022-04-04 22:13:24.879155+02
7	auth	0002_alter_permission_name_max_length	2022-04-04 22:13:24.893632+02
8	auth	0003_alter_user_email_max_length	2022-04-04 22:13:24.909071+02
9	auth	0004_alter_user_username_opts	2022-04-04 22:13:24.918194+02
10	auth	0005_alter_user_last_login_null	2022-04-04 22:13:24.935195+02
11	auth	0006_require_contenttypes_0002	2022-04-04 22:13:24.937485+02
12	auth	0007_alter_validators_add_error_messages	2022-04-04 22:13:24.946164+02
13	auth	0008_alter_user_username_max_length	2022-04-04 22:13:24.965278+02
14	auth	0009_alter_user_last_name_max_length	2022-04-04 22:13:24.976502+02
15	auth	0010_alter_group_name_max_length	2022-04-04 22:13:24.988903+02
16	auth	0011_update_proxy_permissions	2022-04-04 22:13:25.007951+02
17	auth	0012_alter_user_first_name_max_length	2022-04-04 22:13:25.015697+02
18	authtoken	0001_initial	2022-04-04 22:13:25.036155+02
19	authtoken	0002_auto_20160226_1747	2022-04-04 22:13:25.074023+02
20	authtoken	0003_tokenproxy	2022-04-04 22:13:25.077001+02
21	f1	0001_initial	2022-04-04 22:13:25.122469+02
22	sessions	0001_initial	2022-04-04 22:13:25.135982+02
23	f1	0002_complaint	2022-04-04 22:21:57.534958+02
24	f1	0003_auto_20220406_2028	2022-04-06 22:28:09.925978+02
25	f1	0004_auto_20220409_1747	2022-04-09 19:49:14.257508+02
26	f1	0005_remove_driver_user	2022-04-09 19:57:11.744773+02
27	f1	0006_complaint_fia_officer	2022-04-09 20:16:27.325081+02
28	f1	0007_rename_reace_pointsupdate_race	2022-04-09 20:26:22.647051+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
l028y9gjrnvluwofzibecwcayd5i1r6r	.eJxVjEEOwiAQRe_C2hBgBgou3XsGQodBqoYmpV0Z765NutDtf-_9l4hpW2vcOi9xyuIstDj9bmOiB7cd5Htqt1nS3NZlGuWuyIN2eZ0zPy-H-3dQU6_fmgfDZFSB5AABkRNRQbIlIFtnCDg4ZQKA1-R8Gaz2aICCQyBEpcT7A9zhNuc:1nbT5a:NO-vARVA-vcUMP8HfrpmIvM_7PUi6XdTIVt1W3FFG9c	2022-04-18 22:14:14.604692+02
\.


--
-- Data for Name: f1_complaint; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.f1_complaint (id, descirption, created_at, modified, status, resolved, team_id, fia_officer_id) FROM stdin;
\.


--
-- Data for Name: f1_driver; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.f1_driver (number, name, last_name, points, team_id) FROM stdin;
55	Carlos	Sainz	0	38
16	Charles	Leclerc	0	38
10	Pierre	Gasly	0	35
22	Yuki	Tsunoda	0	35
44	Lewis	Hamilton	0	41
63	George	Russell	0	41
11	Sergio	Pérez	0	42
33	Max	Verstappen	0	42
5	Sebastian	Vettel	0	37
18	Lance	Stroll	0	37
27	Nico	Hülkenberg	0	37
4	Lando	Norris	0	40
3	Daniel	Ricciardo	0	40
20	Kevin	Magnussen	0	39
47	Mick	Schumacher	0	39
6	Nicholas	Latifi	0	43
23	Alexander	Albon	0	43
31	Esteban	Ocon	0	36
14	Fernando	Alonso	0	36
77	Valtteri	Bottas	0	34
24	Guanyu	Zhou	0	34
\.


--
-- Data for Name: f1_location; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.f1_location (id, name, city, country) FROM stdin;
1	Albert Park Grand Prix Circuit	Melbourne	Australia
2	Circuit of the Americas	Austin	USA
3	Bahrain International Circuit	Sakhir	Bahrain
4	Baku City Circuit	Baku	Azerbaijan
5	Circuit de Barcelona-Catalunya	Montmeló	Spain
6	Hungaroring	Budapest	Hungary
7	Autodromo Enzo e Dino Ferrari	Imola	Italy
8	Autódromo José Carlos Pace	São Paulo	Brazil
9	Jeddah Corniche Circuit\tJeddah	Saudi	Arabia
10	Marina Bay Street Circuit	Marina Bay	Singapore
11	Miami International Autodrome	Miami	United States
12	Circuit de Monaco	Monte-Carlo	Monaco
13	Autodromo Nazionale di Monza	Monza	Italy
14	Red Bull Ring	Spielberg	Austria
15	Circuit Paul Ricard	Le Castellet	France
16	Autódromo Hermanos Rodríguez	Mexico City	Mexico
17	Silverstone Circuit	Silverstone	UK
18	Circuit de Spa-Francorchamps	Spa	Belgium
19	Suzuka Circuit	Suzuka	Japan
20	Circuit Gilles Villeneuve	Montreal	Canada
21	Yas Marina Circuit	Abu Dhabi	UAE
22	Circuit Park Zandvoort	Zandvoort	Netherlands
\.


--
-- Data for Name: f1_pointsupdate; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.f1_pointsupdate (id, descirption, created_at, modified, points, driver_id, race_id, "FIA_officer_id") FROM stdin;
\.


--
-- Data for Name: f1_race; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.f1_race (id, name, location_id, date, completed) FROM stdin;
68	Bahrain Grand Prix	3	2022-03-20	f
69	Saudi Arabian Grand Prix	\N	2022-03-27	f
70	Australian Grand Prix	1	2022-04-10	f
71	Emilia Romagna Grand Prix	7	2022-04-24	f
72	Miami Grand Prix	11	2022-05-08	f
73	Spanish Grand Prix	5	2022-05-22	f
74	Monaco Grand Prix	12	2022-05-29	f
75	Azerbaijan Grand Prix	4	2022-06-12	f
76	Canadian Grand Prix	20	2022-06-19	f
77	British Grand Prix	17	2022-07-03	f
78	Austrian Grand Prix	14	2022-07-10	f
79	French Grand Prix	15	2022-07-24	f
80	Hungarian Grand Prix	6	2022-07-31	f
81	Belgian Grand Prix	18	2022-08-28	f
82	Dutch Grand Prix	22	2022-09-04	f
83	Italian Grand Prix	13	2022-09-11	f
84	Singapore Grand Prix	10	2022-10-02	f
85	Japanese Grand Prix	19	2022-10-09	f
86	United States Grand Prix	2	2022-10-23	f
87	Mexico City Grand Prix	16	2022-10-30	f
88	Brazilian Grand Prix	8	2022-11-13	f
89	Abu Dhabi Grand Prix	21	2022-11-20	f
\.


--
-- Data for Name: f1_team; Type: TABLE DATA; Schema: public; Owner: matejbutkovic
--

COPY public.f1_team (id, name, created_at, modified, points, owner_id) FROM stdin;
34	Alfa Romeo	2022-04-06 23:28:19.737361+02	2022-04-06 23:28:19.737361+02	0	\N
35	AlphaTauri	2022-04-06 23:28:19.737361+02	2022-04-06 23:28:19.737361+02	0	\N
36	Alpine F1 Team	2022-04-06 23:28:19.737361+02	2022-04-06 23:28:19.737361+02	0	\N
37	Aston Martin	2022-04-06 23:28:19.737361+02	2022-04-06 23:28:19.737361+02	0	\N
38	Ferrari	2022-04-06 23:28:19.737361+02	2022-04-06 23:28:19.737361+02	0	\N
39	Haas F1 Team	2022-04-06 23:28:19.737361+02	2022-04-06 23:28:19.737361+02	0	\N
40	McLaren	2022-04-06 23:28:19.737361+02	2022-04-06 23:28:19.737361+02	0	\N
41	Mercedes	2022-04-06 23:28:19.737361+02	2022-04-06 23:28:19.737361+02	0	\N
42	Red Bull	2022-04-06 23:28:19.737361+02	2022-04-06 23:28:19.737361+02	0	\N
43	Williams	2022-04-06 23:28:19.737361+02	2022-04-06 23:28:19.737361+02	0	\N
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: f1_complaint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.f1_complaint_id_seq', 1, false);


--
-- Name: f1_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.f1_location_id_seq', 22, true);


--
-- Name: f1_pointsupdate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.f1_pointsupdate_id_seq', 2, true);


--
-- Name: f1_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.f1_race_id_seq', 89, true);


--
-- Name: f1_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matejbutkovic
--

SELECT pg_catalog.setval('public.f1_team_id_seq', 43, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: f1_complaint f1_complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_complaint
    ADD CONSTRAINT f1_complaint_pkey PRIMARY KEY (id);


--
-- Name: f1_driver f1_driver_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_driver
    ADD CONSTRAINT f1_driver_pkey PRIMARY KEY (number);


--
-- Name: f1_location f1_location_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_location
    ADD CONSTRAINT f1_location_pkey PRIMARY KEY (id);


--
-- Name: f1_pointsupdate f1_pointsupdate_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_pointsupdate
    ADD CONSTRAINT f1_pointsupdate_pkey PRIMARY KEY (id);


--
-- Name: f1_race f1_race_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_race
    ADD CONSTRAINT f1_race_pkey PRIMARY KEY (id);


--
-- Name: f1_team f1_team_pkey; Type: CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_team
    ADD CONSTRAINT f1_team_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: f1_complaint_fia_officer_id_b3921ad0; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX f1_complaint_fia_officer_id_b3921ad0 ON public.f1_complaint USING btree (fia_officer_id);


--
-- Name: f1_complaint_team_id_5644f53c; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX f1_complaint_team_id_5644f53c ON public.f1_complaint USING btree (team_id);


--
-- Name: f1_driver_team_id_72d95ca4; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX f1_driver_team_id_72d95ca4 ON public.f1_driver USING btree (team_id);


--
-- Name: f1_pointsupdate_FIA_officer_id_014f93cf; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX "f1_pointsupdate_FIA_officer_id_014f93cf" ON public.f1_pointsupdate USING btree ("FIA_officer_id");


--
-- Name: f1_pointsupdate_driver_id_29dbaf8a; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX f1_pointsupdate_driver_id_29dbaf8a ON public.f1_pointsupdate USING btree (driver_id);


--
-- Name: f1_pointsupdate_reace_id_448bc9eb; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX f1_pointsupdate_reace_id_448bc9eb ON public.f1_pointsupdate USING btree (race_id);


--
-- Name: f1_race_location_id_e7578aba; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX f1_race_location_id_e7578aba ON public.f1_race USING btree (location_id);


--
-- Name: f1_team_owner_id_0315ccb5; Type: INDEX; Schema: public; Owner: matejbutkovic
--

CREATE INDEX f1_team_owner_id_0315ccb5 ON public.f1_team USING btree (owner_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: f1_complaint f1_complaint_fia_officer_id_b3921ad0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_complaint
    ADD CONSTRAINT f1_complaint_fia_officer_id_b3921ad0_fk_auth_user_id FOREIGN KEY (fia_officer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: f1_complaint f1_complaint_team_id_5644f53c_fk_f1_team_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_complaint
    ADD CONSTRAINT f1_complaint_team_id_5644f53c_fk_f1_team_id FOREIGN KEY (team_id) REFERENCES public.f1_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: f1_driver f1_driver_team_id_72d95ca4_fk_f1_team_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_driver
    ADD CONSTRAINT f1_driver_team_id_72d95ca4_fk_f1_team_id FOREIGN KEY (team_id) REFERENCES public.f1_team(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: f1_pointsupdate f1_pointsupdate_FIA_officer_id_014f93cf_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_pointsupdate
    ADD CONSTRAINT "f1_pointsupdate_FIA_officer_id_014f93cf_fk_auth_user_id" FOREIGN KEY ("FIA_officer_id") REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: f1_pointsupdate f1_pointsupdate_driver_id_29dbaf8a_fk_f1_driver_number; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_pointsupdate
    ADD CONSTRAINT f1_pointsupdate_driver_id_29dbaf8a_fk_f1_driver_number FOREIGN KEY (driver_id) REFERENCES public.f1_driver(number) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: f1_pointsupdate f1_pointsupdate_race_id_036a382e_fk_f1_race_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_pointsupdate
    ADD CONSTRAINT f1_pointsupdate_race_id_036a382e_fk_f1_race_id FOREIGN KEY (race_id) REFERENCES public.f1_race(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: f1_race f1_race_location_id_e7578aba_fk_f1_location_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_race
    ADD CONSTRAINT f1_race_location_id_e7578aba_fk_f1_location_id FOREIGN KEY (location_id) REFERENCES public.f1_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: f1_team f1_team_owner_id_0315ccb5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: matejbutkovic
--

ALTER TABLE ONLY public.f1_team
    ADD CONSTRAINT f1_team_owner_id_0315ccb5_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

