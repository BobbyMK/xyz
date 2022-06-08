--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7 (Ubuntu 13.7-0ubuntu0.21.10.1)
-- Dumped by pg_dump version 13.7 (Ubuntu 13.7-0ubuntu0.21.10.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO bobby;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO bobby;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO bobby;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO bobby;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO bobby;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO bobby;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: bobby
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


ALTER TABLE public.auth_user OWNER TO bobby;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO bobby;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO bobby;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO bobby;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO bobby;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO bobby;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: bobby
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


ALTER TABLE public.django_admin_log OWNER TO bobby;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO bobby;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO bobby;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO bobby;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO bobby;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO bobby;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO bobby;

--
-- Name: shop_cart; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.shop_cart (
    id bigint NOT NULL,
    total_amount integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.shop_cart OWNER TO bobby;

--
-- Name: shop_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.shop_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_cart_id_seq OWNER TO bobby;

--
-- Name: shop_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.shop_cart_id_seq OWNED BY public.shop_cart.id;


--
-- Name: shop_order; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.shop_order (
    id bigint NOT NULL,
    cost integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.shop_order OWNER TO bobby;

--
-- Name: shop_order_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.shop_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_order_id_seq OWNER TO bobby;

--
-- Name: shop_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.shop_order_id_seq OWNED BY public.shop_order.id;


--
-- Name: shop_orderitem; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.shop_orderitem (
    id bigint NOT NULL,
    count smallint NOT NULL,
    bought boolean NOT NULL,
    purchase_date timestamp with time zone,
    cart_id bigint,
    order_id bigint,
    product_id bigint,
    price integer NOT NULL,
    sale smallint NOT NULL,
    CONSTRAINT shop_orderitem_count_check CHECK ((count >= 0)),
    CONSTRAINT shop_orderitem_sale_check CHECK ((sale >= 0))
);


ALTER TABLE public.shop_orderitem OWNER TO bobby;

--
-- Name: shop_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.shop_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_orderitem_id_seq OWNER TO bobby;

--
-- Name: shop_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.shop_orderitem_id_seq OWNED BY public.shop_orderitem.id;


--
-- Name: shop_product; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.shop_product (
    id bigint NOT NULL,
    vendor_code character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    image character varying(100),
    basic_price integer NOT NULL,
    final_price integer,
    status character varying(20) NOT NULL,
    monthly_sales integer NOT NULL,
    monthly_cost integer NOT NULL
);


ALTER TABLE public.shop_product OWNER TO bobby;

--
-- Name: shop_product_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.shop_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_product_id_seq OWNER TO bobby;

--
-- Name: shop_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.shop_product_id_seq OWNED BY public.shop_product.id;


--
-- Name: shop_sale; Type: TABLE; Schema: public; Owner: bobby
--

CREATE TABLE public.shop_sale (
    id bigint NOT NULL,
    percent smallint NOT NULL,
    CONSTRAINT shop_sale_percent_check CHECK ((percent >= 0))
);


ALTER TABLE public.shop_sale OWNER TO bobby;

--
-- Name: shop_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: bobby
--

CREATE SEQUENCE public.shop_sale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_sale_id_seq OWNER TO bobby;

--
-- Name: shop_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bobby
--

ALTER SEQUENCE public.shop_sale_id_seq OWNED BY public.shop_sale.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: shop_cart id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_cart ALTER COLUMN id SET DEFAULT nextval('public.shop_cart_id_seq'::regclass);


--
-- Name: shop_order id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_order ALTER COLUMN id SET DEFAULT nextval('public.shop_order_id_seq'::regclass);


--
-- Name: shop_orderitem id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_orderitem ALTER COLUMN id SET DEFAULT nextval('public.shop_orderitem_id_seq'::regclass);


--
-- Name: shop_product id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_product ALTER COLUMN id SET DEFAULT nextval('public.shop_product_id_seq'::regclass);


--
-- Name: shop_sale id; Type: DEFAULT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_sale ALTER COLUMN id SET DEFAULT nextval('public.shop_sale_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: bobby
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
25	Can add sale	7	add_sale
26	Can change sale	7	change_sale
27	Can delete sale	7	delete_sale
28	Can view sale	7	view_sale
29	Can add cart	8	add_cart
30	Can change cart	8	change_cart
31	Can delete cart	8	delete_cart
32	Can view cart	8	view_cart
33	Can add order item	9	add_orderitem
34	Can change order item	9	change_orderitem
35	Can delete order item	9	delete_orderitem
36	Can view order item	9	view_orderitem
37	Can add product	10	add_product
38	Can change product	10	change_product
39	Can delete product	10	delete_product
40	Can view product	10	view_product
41	Can add order	11	add_order
42	Can change order	11	change_order
43	Can delete order	11	delete_order
44	Can view order	11	view_order
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$lnoi9yeyhGBvf2qYR8kvPS$LOPcecJeoBp+1LJZhNk2YTjcbAx9CzxbDm1Iq9zsjDM=	2022-06-07 18:51:58.885+03	t	bobby				t	t	2022-05-31 20:09:16.937+03
2	pbkdf2_sha256$320000$RDZgd6wUdQTmN941mEwNgm$Puj4E4xLXGOj8EOSnAYm9Ar8IBT0gAUSOxkw9OGdrKc=	\N	f	beny				f	t	2022-06-05 20:36:02.052+03
3	pbkdf2_sha256$320000$GQ1BHHGE019QpPrzb5kq59$eq7f9uba6O3dAfKncsuzoArggx7731C/awKYgES+9C0=	2022-06-07 18:49:08.358+03	f	Bonny	qwe	qweqw	qwe@qwe.ru	f	t	2022-06-07 16:20:18+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-06-03 22:27:22.936+03	2	Sale object (2)	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0446\\u0435\\u043d\\u0442 \\u0441\\u043a\\u0438\\u0434\\u043a\\u0438"]}}]	7	1
2	2022-06-03 22:40:10.939+03	2	Sale object (2)	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0446\\u0435\\u043d\\u0442 \\u0441\\u043a\\u0438\\u0434\\u043a\\u0438"]}}]	7	1
3	2022-06-03 23:01:43.74+03	3	Product object (3)	1	[{"added": {}}]	10	1
4	2022-06-04 18:17:33.117+03	4	Product object (4)	1	[{"added": {}}]	10	1
5	2022-06-04 19:56:09.863+03	2	Sale object (2)	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0446\\u0435\\u043d\\u0442 \\u0441\\u043a\\u0438\\u0434\\u043a\\u0438"]}}]	7	1
6	2022-06-04 19:56:19.203+03	2	Sale object (2)	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0446\\u0435\\u043d\\u0442 \\u0441\\u043a\\u0438\\u0434\\u043a\\u0438"]}}]	7	1
7	2022-06-04 19:57:31.817+03	2	Sale object (2)	2	[]	7	1
8	2022-06-04 19:57:45.979+03	2	Sale object (2)	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0446\\u0435\\u043d\\u0442 \\u0441\\u043a\\u0438\\u0434\\u043a\\u0438"]}}]	7	1
9	2022-06-04 20:34:45.796+03	11	Product object (11)	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b", "\\u0411\\u0430\\u0437\\u043e\\u0432\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	10	1
10	2022-06-04 20:34:53.685+03	11	Product object (11)	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b", "\\u0411\\u0430\\u0437\\u043e\\u0432\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	10	1
11	2022-06-04 20:35:14.058+03	11	Product object (11)	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b", "\\u0411\\u0430\\u0437\\u043e\\u0432\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	10	1
12	2022-06-04 20:35:28.376+03	11	Product object (11)	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b", "\\u0411\\u0430\\u0437\\u043e\\u0432\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	10	1
13	2022-06-04 20:39:08.923+03	11	Product object (11)	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b", "\\u0411\\u0430\\u0437\\u043e\\u0432\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	10	1
14	2022-06-04 20:39:16.761+03	11	Product object (11)	2	[{"changed": {"fields": ["\\u0411\\u0430\\u0437\\u043e\\u0432\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	10	1
15	2022-06-04 20:40:03.831+03	11	Product object (11)	2	[{"changed": {"fields": ["\\u0411\\u0430\\u0437\\u043e\\u0432\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	10	1
16	2022-06-05 16:13:03.12+03	2	Product object (2)	2	[{"changed": {"fields": ["\\u0411\\u0430\\u0437\\u043e\\u0432\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	10	1
17	2022-06-05 16:16:27.724+03	2	Sale object (2)	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0446\\u0435\\u043d\\u0442 \\u0441\\u043a\\u0438\\u0434\\u043a\\u0438"]}}]	7	1
18	2022-06-05 17:05:30.923+03	2	toaster	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0438\\u043c\\u0435\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
19	2022-06-05 17:05:50.48+03	3	ball	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0438\\u043c\\u0435\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
60	2022-06-06 14:29:57.319+03	17	OrderItem object (17)	3		9	1
20	2022-06-05 17:06:09.078+03	4	lips	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0438\\u043c\\u0435\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
21	2022-06-05 17:06:22.816+03	5	cube	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0438\\u043c\\u0435\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
22	2022-06-05 17:06:34.942+03	8	roobikscube	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0438\\u043c\\u0435\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
23	2022-06-05 17:06:49.612+03	9	coin	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0438\\u043c\\u0435\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
24	2022-06-05 17:07:00.641+03	10	apple	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0438\\u043c\\u0435\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430", "\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
25	2022-06-05 17:07:05.852+03	11	123	3		10	1
26	2022-06-05 17:18:22.3+03	12	barrel	3		10	1
27	2022-06-05 17:18:46.982+03	13	barrel	3		10	1
28	2022-06-05 17:20:42.234+03	10	apple	2	[]	10	1
29	2022-06-05 17:21:04.737+03	10	apple	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b"]}}]	10	1
30	2022-06-05 17:21:08.451+03	10	apple	2	[{"changed": {"fields": ["\\u0410\\u0440\\u0442\\u0438\\u043a\\u0443\\u043b"]}}]	10	1
31	2022-06-05 17:21:58.404+03	10	apple	2	[]	10	1
32	2022-06-05 17:22:01.559+03	10	apple	2	[]	10	1
33	2022-06-05 17:26:56.863+03	14	barrel	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
34	2022-06-05 17:34:37.092+03	15	lock	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
35	2022-06-05 17:37:00.567+03	15	lock	3		10	1
36	2022-06-05 17:37:45.633+03	16	lock	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
37	2022-06-05 17:47:35.308+03	16	lock	3		10	1
38	2022-06-05 17:48:06.258+03	17	lock	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
39	2022-06-05 17:49:43.835+03	17	lock	3		10	1
40	2022-06-05 17:50:10.33+03	18	lock	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
41	2022-06-05 17:50:20.599+03	18	lock	3		10	1
42	2022-06-05 17:56:11.844+03	19	lock	2	[{"changed": {"fields": ["\\u041e\\u0431\\u043b\\u043e\\u0436\\u043a\\u0430"]}}]	10	1
43	2022-06-05 20:36:02.356+03	2	beny	1	[{"added": {}}]	4	1
44	2022-06-05 23:02:36.527+03	3	OrderItem object (3)	3		9	1
45	2022-06-06 13:22:17.573+03	9	OrderItem object (9)	3		9	1
46	2022-06-06 13:22:17.713+03	8	OrderItem object (8)	3		9	1
47	2022-06-06 13:22:17.723+03	7	OrderItem object (7)	3		9	1
48	2022-06-06 13:22:17.734+03	6	OrderItem object (6)	3		9	1
49	2022-06-06 13:22:17.745+03	5	OrderItem object (5)	3		9	1
50	2022-06-06 13:22:17.756+03	4	OrderItem object (4)	3		9	1
51	2022-06-06 14:17:26.429+03	13	OrderItem object (13)	3		9	1
52	2022-06-06 14:17:26.448+03	12	OrderItem object (12)	3		9	1
53	2022-06-06 14:17:26.459+03	11	OrderItem object (11)	3		9	1
54	2022-06-06 14:17:26.47+03	10	OrderItem object (10)	3		9	1
55	2022-06-06 14:17:26.481+03	2	OrderItem object (2)	3		9	1
56	2022-06-06 14:20:22.3+03	15	OrderItem object (15)	3		9	1
57	2022-06-06 14:20:22.325+03	14	OrderItem object (14)	3		9	1
58	2022-06-06 14:29:57.266+03	19	OrderItem object (19)	3		9	1
59	2022-06-06 14:29:57.309+03	18	OrderItem object (18)	3		9	1
61	2022-06-06 14:29:57.341+03	16	OrderItem object (16)	3		9	1
62	2022-06-06 14:30:03.222+03	2	Cart object (2)	2	[{"changed": {"fields": ["\\u041e\\u0431\\u0449\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	8	1
63	2022-06-06 14:47:35.863+03	21	OrderItem object (21)	3		9	1
64	2022-06-06 14:47:35.883+03	20	OrderItem object (20)	3		9	1
65	2022-06-06 14:48:00.854+03	2	Cart object (2)	2	[{"changed": {"fields": ["\\u041e\\u0431\\u0449\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	8	1
66	2022-06-06 14:49:05.659+03	2	Cart object (2)	2	[{"changed": {"fields": ["\\u041e\\u0431\\u0449\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	8	1
67	2022-06-06 14:49:12.648+03	22	OrderItem object (22)	3		9	1
68	2022-06-06 14:50:38.699+03	2	Cart object (2)	2	[{"changed": {"fields": ["\\u041e\\u0431\\u0449\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	8	1
69	2022-06-06 14:50:46.238+03	24	OrderItem object (24)	3		9	1
70	2022-06-06 14:50:46.251+03	23	OrderItem object (23)	3		9	1
71	2022-06-06 14:51:22.15+03	26	OrderItem object (26)	3		9	1
72	2022-06-06 14:51:22.166+03	25	OrderItem object (25)	3		9	1
73	2022-06-06 14:51:25.963+03	2	Cart object (2)	2	[{"changed": {"fields": ["\\u041e\\u0431\\u0449\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	8	1
74	2022-06-06 14:51:57.173+03	27	OrderItem object (27)	3		9	1
75	2022-06-06 14:52:04.507+03	2	Cart object (2)	2	[{"changed": {"fields": ["\\u041e\\u0431\\u0449\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	8	1
76	2022-06-06 14:52:33.004+03	28	OrderItem object (28)	3		9	1
77	2022-06-06 14:52:38.718+03	2	Cart object (2)	2	[{"changed": {"fields": ["\\u041e\\u0431\\u0449\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430"]}}]	8	1
78	2022-06-06 19:09:14.953+03	2	Order object (2)	3		11	1
79	2022-06-06 19:51:48.865+03	9	Order object (9)	3		11	1
80	2022-06-06 19:51:48.931+03	8	Order object (8)	3		11	1
81	2022-06-06 19:51:48.948+03	7	Order object (7)	3		11	1
82	2022-06-06 19:51:48.959+03	6	Order object (6)	3		11	1
83	2022-06-06 19:51:48.97+03	5	Order object (5)	3		11	1
84	2022-06-06 19:54:41.673+03	4	Order object (4)	3		11	1
85	2022-06-06 19:54:41.691+03	3	Order object (3)	3		11	1
86	2022-06-06 19:54:41.703+03	1	Order object (1)	3		11	1
87	2022-06-06 20:08:17.646+03	13	Order object (13)	3		11	1
88	2022-06-06 20:08:17.693+03	12	Order object (12)	3		11	1
89	2022-06-06 20:08:17.704+03	11	Order object (11)	3		11	1
90	2022-06-07 14:16:41.037+03	2	Sale object (2)	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0446\\u0435\\u043d\\u0442 \\u0441\\u043a\\u0438\\u0434\\u043a\\u0438"]}}]	7	1
91	2022-06-07 14:16:52.35+03	2	Sale object (2)	2	[{"changed": {"fields": ["\\u041f\\u0440\\u043e\\u0446\\u0435\\u043d\\u0442 \\u0441\\u043a\\u0438\\u0434\\u043a\\u0438"]}}]	7	1
92	2022-06-07 16:20:18.853+03	3	Bonny	1	[{"added": {}}]	4	1
93	2022-06-07 16:20:35.917+03	3	Bonny	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
94	2022-06-08 14:42:19.209+03	4	bunny	3		4	1
95	2022-06-08 14:42:19.222+03	5	test_user	3		4	1
96	2022-06-08 14:44:50.867+03	7	test_user	3		4	1
97	2022-06-08 14:46:32.666+03	8	test_user	3		4	1
98	2022-06-08 14:51:41.52+03	9	test_user	3		4	1
99	2022-06-08 15:04:39.433+03	10	test_user	3		4	1
100	2022-06-08 15:05:36.547+03	11	test_user	3		4	1
101	2022-06-08 15:08:00.598+03	12	test_user	3		4	1
102	2022-06-08 15:08:56.737+03	13	test_user	3		4	1
103	2022-06-08 15:36:03.803+03	14	test_user	3		4	1
104	2022-06-08 15:36:17.184+03	15	test_user	3		4	1
105	2022-06-08 16:00:55.151+03	20	test	3		10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	shop	sale
8	shop	cart
9	shop	orderitem
10	shop	product
11	shop	order
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-05-31 15:58:34.961989+03
2	auth	0001_initial	2022-05-31 15:58:36.024456+03
3	admin	0001_initial	2022-05-31 15:58:36.268758+03
4	admin	0002_logentry_remove_auto_add	2022-05-31 15:58:36.298296+03
5	admin	0003_logentry_add_action_flag_choices	2022-05-31 15:58:36.328179+03
6	contenttypes	0002_remove_content_type_name	2022-05-31 15:58:36.382182+03
7	auth	0002_alter_permission_name_max_length	2022-05-31 15:58:36.418807+03
8	auth	0003_alter_user_email_max_length	2022-05-31 15:58:36.452092+03
9	auth	0004_alter_user_username_opts	2022-05-31 15:58:36.48418+03
10	auth	0005_alter_user_last_login_null	2022-05-31 15:58:36.510149+03
11	auth	0006_require_contenttypes_0002	2022-05-31 15:58:36.524677+03
12	auth	0007_alter_validators_add_error_messages	2022-05-31 15:58:36.552058+03
13	auth	0008_alter_user_username_max_length	2022-05-31 15:58:36.629979+03
14	auth	0009_alter_user_last_name_max_length	2022-05-31 15:58:36.662755+03
15	auth	0010_alter_group_name_max_length	2022-05-31 15:58:36.690593+03
16	auth	0011_update_proxy_permissions	2022-05-31 15:58:36.719311+03
17	auth	0012_alter_user_first_name_max_length	2022-05-31 15:58:36.775288+03
18	sessions	0001_initial	2022-05-31 15:58:36.958048+03
19	shop	0001_initial	2022-06-03 21:56:58.460332+03
20	shop	0002_alter_product_status	2022-06-03 22:44:09.884572+03
21	shop	0003_alter_product_status	2022-06-03 22:56:43.977739+03
22	shop	0004_alter_product_final_price	2022-06-04 18:21:28.85107+03
23	shop	0005_orderitem_price_orderitem_sale_and_more	2022-06-05 01:25:34.951352+03
24	shop	0006_alter_orderitem_count	2022-06-05 18:19:42.142358+03
25	shop	0007_alter_orderitem_purchase_date	2022-06-05 22:10:44.073779+03
26	shop	0008_alter_orderitem_product_alter_product_monthly_cost	2022-06-08 17:07:56.650282+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
80fjbnumi789rfwe3l2q869jkmfjy1sx	.eJxVjMsOwiAQRf-FtSFDOxRw6d5vIDM8pGogKe3K-O_apAvd3nPOfQlP21r81tPi5yjOQonT78YUHqnuIN6p3poMra7LzHJX5EG7vLaYnpfD_Tso1Mu3dmgALWjnOKtsMsEAAyHabCcdJzSMymSOKqUAegyaVbKReATIGByL9wfHMjfO:1nybUs:VfGQ39OY_VzzdH-ONHA0pcm9XhsVNjkN3paXHaa_1AU	2022-06-21 18:51:58.925+03
\.


--
-- Data for Name: shop_cart; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.shop_cart (id, total_amount, user_id) FROM stdin;
1	0	2
2	0	1
3	0	3
\.


--
-- Data for Name: shop_order; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.shop_order (id, cost, user_id) FROM stdin;
34	948	1
10	63	1
14	1308	1
15	1284	1
16	328	1
17	695	1
18	542	1
19	642	1
20	55	1
21	55	3
22	397	3
23	2819	1
24	654	1
25	55	1
26	55	1
27	1210	1
\.


--
-- Data for Name: shop_orderitem; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.shop_orderitem (id, count, bought, purchase_date, cart_id, order_id, product_id, price, sale) FROM stdin;
63	1	t	2022-06-07 18:59:39.583+03	\N	26	10	55	30
64	22	t	2022-06-07 19:00:50.816+03	\N	27	10	55	30
65	1	f	\N	\N	\N	8	572	30
66	1	f	\N	\N	\N	8	572	30
67	1	f	\N	\N	\N	10	55	30
74	2	t	2022-06-08 16:48:55.873191+03	\N	34	5	474	30
29	3	t	2022-06-06 19:07:56.876+03	\N	\N	2	748	20
30	2	t	2022-06-06 19:07:56.976+03	\N	\N	9	642	20
31	2	t	2022-06-06 19:07:56.832+03	\N	\N	10	63	20
32	1	t	2022-06-06 19:07:56.59+03	\N	\N	4	695	20
33	1	t	2022-06-06 19:07:56.932+03	\N	\N	3	328	20
34	15	t	2022-06-06 19:07:57.021+03	\N	\N	8	654	20
35	3	t	2022-06-06 19:36:39+03	\N	\N	9	642	20
36	1	t	2022-06-06 19:36:38.993+03	\N	\N	10	63	20
37	1	t	2022-06-06 19:36:39.011+03	\N	\N	2	748	20
38	10	t	2022-06-06 19:39:26.558+03	\N	\N	9	642	20
39	1	t	2022-06-06 19:46:14.885+03	\N	\N	3	328	20
40	1	t	2022-06-06 19:46:14.897+03	\N	\N	2	748	20
41	2	t	2022-06-06 19:50:29.997+03	\N	\N	10	63	20
42	2	t	2022-06-06 19:50:30.004+03	\N	\N	9	642	20
43	3	t	2022-06-06 19:51:02.767+03	\N	\N	10	63	20
44	2	t	2022-06-06 19:51:29.537+03	\N	\N	9	642	20
45	2	t	2022-06-06 19:51:29.549+03	\N	\N	2	748	20
46	1	t	2022-06-06 19:54:50.194+03	\N	10	10	63	20
47	2	t	2022-06-06 20:08:22.953+03	\N	14	8	654	20
48	2	t	2022-06-06 20:08:34.487+03	\N	15	9	642	20
49	1	t	2022-06-06 20:08:39.745+03	\N	16	3	328	20
50	1	t	2022-06-06 20:09:03.423+03	\N	17	4	695	20
51	1	t	2022-06-06 20:09:08.581+03	\N	18	5	542	20
52	1	t	2022-06-06 20:09:13.68+03	\N	19	9	642	20
53	1	t	2022-06-07 15:11:02.178+03	\N	20	10	55	30
54	2	t	2022-06-07 18:58:04.159+03	\N	23	5	474	30
55	2	t	2022-06-07 18:58:04.181+03	\N	23	8	572	30
56	1	t	2022-06-07 18:58:04.17+03	\N	23	9	562	30
57	1	t	2022-06-07 16:21:42.437+03	\N	21	10	55	30
58	2	t	2022-06-07 18:49:29.152+03	\N	22	10	55	30
59	1	t	2022-06-07 18:49:29.161+03	\N	22	3	287	30
60	3	t	2022-06-07 18:58:04.15+03	\N	23	10	55	30
61	1	t	2022-06-07 18:58:29.778+03	\N	24	2	654	30
62	1	t	2022-06-07 18:58:58.891+03	\N	25	10	55	30
68	1	t	2022-06-08 14:56:45.933+03	\N	\N	10	55	30
69	1	t	2022-06-08 15:04:50.692+03	\N	\N	10	55	30
70	1	t	2022-06-08 15:06:06.912+03	\N	\N	10	55	30
71	1	t	2022-06-08 15:08:03.959+03	\N	\N	10	55	30
72	1	t	2022-06-08 15:35:49.133+03	\N	\N	10	55	30
73	1	t	2022-06-08 15:36:09.712+03	\N	\N	10	55	30
\.


--
-- Data for Name: shop_product; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.shop_product (id, vendor_code, title, image, basic_price, final_price, status, monthly_sales, monthly_cost) FROM stdin;
3	qBUtQiRc	ball	img/ball.jpeg	411	287	ONSALE	4	1271
4	kIzNbkzN	lips	img/lips.jpeg	869	608	ONSALE	2	1390
5	UhhsuU3V	cube	img/cube.jpg	678	474	ONSALE	5	1490
8	QlWtQIqv	roobikscube	img/roobikscube.jpg	818	572	ONSALE	19	1880
9	BXtKoEZI	coin	img/coin.jpeg	803	562	ONSALE	23	5056
2	GeJXgEGV	toaster	img/toaster.jpg	935	654	ONSALE	8	3646
10	De3VPyST	apple	img/apple.jpeg	79	55	ONSALE	46	1030
14	uJOoUlhE	barrel	img/barrel.jpeg	182	127	DRAFT	0	0
19	UXj37gMZ	lock	img/lock.jpeg	543	380	DRAFT	0	0
\.


--
-- Data for Name: shop_sale; Type: TABLE DATA; Schema: public; Owner: bobby
--

COPY public.shop_sale (id, percent) FROM stdin;
2	30
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 105, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: shop_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.shop_cart_id_seq', 3, true);


--
-- Name: shop_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.shop_order_id_seq', 34, true);


--
-- Name: shop_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.shop_orderitem_id_seq', 74, true);


--
-- Name: shop_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.shop_product_id_seq', 19, true);


--
-- Name: shop_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bobby
--

SELECT pg_catalog.setval('public.shop_sale_id_seq', 2, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: shop_cart shop_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_cart
    ADD CONSTRAINT shop_cart_pkey PRIMARY KEY (id);


--
-- Name: shop_cart shop_cart_user_id_key; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_cart
    ADD CONSTRAINT shop_cart_user_id_key UNIQUE (user_id);


--
-- Name: shop_order shop_order_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_pkey PRIMARY KEY (id);


--
-- Name: shop_orderitem shop_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_orderitem
    ADD CONSTRAINT shop_orderitem_pkey PRIMARY KEY (id);


--
-- Name: shop_product shop_product_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_pkey PRIMARY KEY (id);


--
-- Name: shop_product shop_product_vendor_code_key; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_vendor_code_key UNIQUE (vendor_code);


--
-- Name: shop_sale shop_sale_pkey; Type: CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_sale
    ADD CONSTRAINT shop_sale_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: shop_order_user_id_00aba627; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX shop_order_user_id_00aba627 ON public.shop_order USING btree (user_id);


--
-- Name: shop_orderitem_cart_id_6e7bfcc2; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX shop_orderitem_cart_id_6e7bfcc2 ON public.shop_orderitem USING btree (cart_id);


--
-- Name: shop_orderitem_order_id_2f1b00cf; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX shop_orderitem_order_id_2f1b00cf ON public.shop_orderitem USING btree (order_id);


--
-- Name: shop_orderitem_product_id_48153f22; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX shop_orderitem_product_id_48153f22 ON public.shop_orderitem USING btree (product_id);


--
-- Name: shop_product_vendor_code_7aba9367_like; Type: INDEX; Schema: public; Owner: bobby
--

CREATE INDEX shop_product_vendor_code_7aba9367_like ON public.shop_product USING btree (vendor_code varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_cart shop_cart_user_id_27925ac6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_cart
    ADD CONSTRAINT shop_cart_user_id_27925ac6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order shop_order_user_id_00aba627_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_user_id_00aba627_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_orderitem shop_orderitem_cart_id_6e7bfcc2_fk_shop_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_orderitem
    ADD CONSTRAINT shop_orderitem_cart_id_6e7bfcc2_fk_shop_cart_id FOREIGN KEY (cart_id) REFERENCES public.shop_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_orderitem shop_orderitem_order_id_2f1b00cf_fk_shop_order_id; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_orderitem
    ADD CONSTRAINT shop_orderitem_order_id_2f1b00cf_fk_shop_order_id FOREIGN KEY (order_id) REFERENCES public.shop_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_orderitem shop_orderitem_product_id_48153f22_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: bobby
--

ALTER TABLE ONLY public.shop_orderitem
    ADD CONSTRAINT shop_orderitem_product_id_48153f22_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

