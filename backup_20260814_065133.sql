--
-- PostgreSQL database dump
--

\restrict 3ATcFanzf2qcrhhL6Yp7hCSApuf7TxPpouZTKG9RrX8YKQhFXrz1SwI45OV8STd

-- Dumped from database version 15.19 (Debian 15.19-1.pgdg13+2)
-- Dumped by pg_dump version 15.19 (Debian 15.19-1.pgdg13+2)

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

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: cafeboreal_admin
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    identity_encrypted bytea NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.customers OWNER TO cafeboreal_admin;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: cafeboreal_admin
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO cafeboreal_admin;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cafeboreal_admin
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: cafeboreal_admin
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL
);


ALTER TABLE public.order_items OWNER TO cafeboreal_admin;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: cafeboreal_admin
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO cafeboreal_admin;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cafeboreal_admin
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: cafeboreal_admin
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_id integer,
    total numeric(10,2) DEFAULT 0 NOT NULL,
    status character varying(20) DEFAULT 'pending'::character varying,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orders OWNER TO cafeboreal_admin;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: cafeboreal_admin
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO cafeboreal_admin;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cafeboreal_admin
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: cafeboreal_admin
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    description text,
    image character varying(255) DEFAULT 'default.jpg'::character varying,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.products OWNER TO cafeboreal_admin;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: cafeboreal_admin
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO cafeboreal_admin;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cafeboreal_admin
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: cafeboreal_admin
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: cafeboreal_admin
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: cafeboreal_admin
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: cafeboreal_admin
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: cafeboreal_admin
--

COPY public.customers (id, name, email, identity_encrypted, created_at) FROM stdin;
1	María González	maria@cafeaurora.com	\\xc30d04070302cfae63c51f061cef7cd23c01af4197f9094d6a9e7749fc76294c77745560f12a6ea2ff44892315415092a59ac8d94c6c6ae240dfabd0bf015df135f74d3deace95aa24742b629b	2026-08-14 06:46:13.192938
2	Carlos Rodríguez	carlos@cafeaurora.com	\\xc30d040703023e578aa8b233893562d23c017a0d9e542ba462392794f01dca618ba49a7cd5641cf229e2d1868ec0b15375f0cf533be1104e17ef89626f4010e6f0d9fcef81640bd7fe43d42050	2026-08-14 06:46:13.192938
3	Ana Jiménez	ana@cafeaurora.com	\\xc30d040703024f131b81aebf698f78d23c01b44a76032ae8d364f8556c31228f0f110a0c0c9bbd2103554b7f78e1616b49da26adb4ee43960fba1e081cc50b1d1e3e06d787d0fbd5be2a4915a5	2026-08-14 06:46:13.192938
4	José Mora	jose@cafeaurora.com	\\xc30d04070302d8469a67bc84a5d768d23c017dc63edb46c0fcb32aa7b45ae5404975b1e78e8e6b659c0c7b9bfe8a16b4b9ce899f9fd97c9c197b746fbaab99299a420e25eaf3b8c75bb8e78be4	2026-08-14 06:46:13.192938
5	Laura Vargas	laura@cafeaurora.com	\\xc30d040703020e622afe11ee904768d23c0153fe67c2e18001097d1b4812861a0fb8c13cb779867a7508bb106b57494d226dd89c537f1726c45e87e0bec87c8bb8fc9f5d36fa2a9d06b7289802	2026-08-14 06:46:13.192938
6	Pedro Solano	pedro@cafeaurora.com	\\xc30d04070302efe6d6ee51a97a6a71d23c0125a8d5536f010862f5e117ee0ad945282590cece079280a8a7f6f38a6b136f81ec4992dcbb77908291a2ef66061da4ada397e08bce9aae00b9d488	2026-08-14 06:46:13.192938
7	Sofía Castro	sofia@cafeaurora.com	\\xc30d0407030253e7bee7c63b16c576d23c019feabd6220bad17d8edd4eb170d28ea4a1cc8c72c9c28261a121dde71b59471e093199158e0740a542f11a26b7fe7c557a6373fd2101a9ef59180c	2026-08-14 06:46:13.192938
8	Diego Herrera	diego@cafeaurora.com	\\xc30d040703022824cd04cb1a6ede6cd23c01edaaa906a618025b524ad58f0b06a14be66580d9d917ed21ef56fb0bc69d113f7ad92e496c0500b8560ec33df7e1d5c8af85407831260cdcf846d6	2026-08-14 06:46:13.192938
9	Valeria Rojas	valeria@cafeaurora.com	\\xc30d040703029d99cf12a456a9f56ed23c01d6740d3f0eae29c886af619bbd5975bb01ad152999d878a3b99f2af84274b206e887a931c28341e1f4d57abd054ef2bc660dae5245838325eec957	2026-08-14 06:46:13.192938
10	Andrés Quesada	andres@cafeaurora.com	\\xc30d040703020ff7e46f77f21d6776d23c0156d053a0a868c6b15cab047b20de79ace96dab55fad131dba394127329d3e09e6c9557175d1c6da3acf773a98abf581057eb0e8d3b937dc1be141b	2026-08-14 06:46:13.192938
11	Lucía Fernández	lucia@cafeaurora.com	\\xc30d040703024ca8645247a6e2467cd23c01e78f8982d33bf23a89478d5e3b03bef0548c3bf7f4fcbbbc8b1ae42428043005daac96d5b3ceb34cb0b3691209fa8d76521544d134a9ed2d32190d	2026-08-14 06:46:13.192938
12	Roberto Arias	roberto@cafeaurora.com	\\xc30d04070302fc17afce8b498f876bd23c010f7ddea25c23fa9ce5b3ce36d7f66b18b1d1c0cf84e29681a8bb360da49a9ff5b54ce4b8b04de575810a3c88a21b6bb1202f43e696cb6ebcea4bce	2026-08-14 06:46:13.192938
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: cafeboreal_admin
--

COPY public.order_items (id, order_id, product_id, quantity, unit_price) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: cafeboreal_admin
--

COPY public.orders (id, customer_id, total, status, created_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: cafeboreal_admin
--

COPY public.products (id, name, price, stock, description, image, created_at) FROM stdin;
1	Espresso Clásico	2.50	100	Café espresso tradicional	default.jpg	2026-08-14 06:43:02.537105
2	Americano	3.00	90	Espresso con agua caliente	default.jpg	2026-08-14 06:43:02.537105
3	Latte	4.00	80	Espresso con leche vaporizada	default.jpg	2026-08-14 06:43:02.537105
4	Cappuccino	4.25	75	Espresso, leche y espuma	default.jpg	2026-08-14 06:43:02.537105
5	Mocha	4.75	60	Espresso, chocolate y leche	default.jpg	2026-08-14 06:43:02.537105
6	Macchiato	3.50	70	Espresso manchado con leche	default.jpg	2026-08-14 06:43:02.537105
7	Flat White	4.50	65	Espresso doble con microespuma	default.jpg	2026-08-14 06:43:02.537105
8	Cold Brew	4.00	55	Café extraído en frío 12h	default.jpg	2026-08-14 06:43:02.537105
9	Frappé Mocha	5.50	50	Bebida helada chocolate café	default.jpg	2026-08-14 06:43:02.537105
10	Chai Latte	4.25	45	Té chai con leche vaporizada	default.jpg	2026-08-14 06:43:02.537105
11	Matcha Latte	5.00	40	Té matcha premium con leche	default.jpg	2026-08-14 06:43:02.537105
12	Chocolate Caliente	3.75	60	Cacao premium con leche	default.jpg	2026-08-14 06:43:02.537105
13	Té Verde	2.50	80	Té verde orgánico	default.jpg	2026-08-14 06:43:02.537105
14	Té Negro Earl Grey	2.75	70	Té negro con bergamota	default.jpg	2026-08-14 06:43:02.537105
15	Limonada Menta	3.50	55	Limonada fresca con menta	default.jpg	2026-08-14 06:43:02.537105
16	Smoothie Frutas	5.00	40	Mezcla de frutas tropicales	default.jpg	2026-08-14 06:43:02.537105
17	Croissant Mantequilla	3.25	30	Croissant artesanal francés	default.jpg	2026-08-14 06:43:02.537105
18	Muffin Arándanos	3.50	25	Muffin con arándanos frescos	default.jpg	2026-08-14 06:43:02.537105
19	Muffin Chocolate	3.50	25	Muffin doble chocolate	default.jpg	2026-08-14 06:43:02.537105
20	Bagel Cream Cheese	4.00	20	Bagel con queso crema	default.jpg	2026-08-14 06:43:02.537105
21	Tostada Aguacate	5.50	15	Pan artesanal con aguacate	default.jpg	2026-08-14 06:43:02.537105
22	Sandwich Jamón Queso	5.00	20	Sandwich clásico caliente	default.jpg	2026-08-14 06:43:02.537105
23	Panini Caprese	5.75	18	Panini tomate mozzarella	default.jpg	2026-08-14 06:43:02.537105
24	Wrap Pollo	6.00	15	Wrap de pollo con vegetales	default.jpg	2026-08-14 06:43:02.537105
25	Ensalada César	6.50	12	Ensalada con aderezo césar	default.jpg	2026-08-14 06:43:02.537105
26	Brownie	3.00	35	Brownie chocolate intenso	default.jpg	2026-08-14 06:43:02.537105
27	Cheesecake	4.50	20	Cheesecake New York style	default.jpg	2026-08-14 06:43:02.537105
28	Galleta Choco Chip	2.00	50	Galleta con chispas chocolate	default.jpg	2026-08-14 06:43:02.537105
29	Galleta Avena	2.00	45	Galleta de avena y pasas	default.jpg	2026-08-14 06:43:02.537105
30	Tiramisú	5.00	15	Postre italiano clásico	default.jpg	2026-08-14 06:43:02.537105
31	Café Grano Colombia 250g	12.00	30	Grano arábica colombiano	default.jpg	2026-08-14 06:43:02.537105
32	Café Grano Etiopía 250g	14.00	25	Grano origen Yirgacheffe	default.jpg	2026-08-14 06:43:02.537105
33	Café Grano Brasil 250g	11.00	35	Grano Santos brasileño	default.jpg	2026-08-14 06:43:02.537105
34	Café Grano Costa Rica 250g	13.00	20	Grano Tarrazú premium	default.jpg	2026-08-14 06:43:02.537105
35	Café Grano Guatemala 250g	12.50	22	Grano Antigua volcánico	default.jpg	2026-08-14 06:43:02.537105
36	Café Molido House Blend 250g	10.00	40	Mezcla de la casa molida	default.jpg	2026-08-14 06:43:02.537105
37	Café Molido Descaf 250g	10.50	30	Descafeinado Swiss Water	default.jpg	2026-08-14 06:43:02.537105
38	Café Cápsulas x10	8.00	50	Cápsulas compatibles Nespresso	default.jpg	2026-08-14 06:43:02.537105
39	French Press 350ml	18.00	10	Prensa francesa vidrio	default.jpg	2026-08-14 06:43:02.537105
40	Chemex 6 tazas	35.00	8	Cafetera Chemex clásica	default.jpg	2026-08-14 06:43:02.537105
41	V60 Dripper	15.00	12	Dripper Hario V60 cerámica	default.jpg	2026-08-14 06:43:02.537105
42	Taza Café Aurora	9.00	25	Taza cerámica logo Aurora	default.jpg	2026-08-14 06:43:02.537105
43	Tumbler Térmico 500ml	22.00	15	Vaso térmico acero inox	default.jpg	2026-08-14 06:43:02.537105
44	Filtros Papel V60 x40	5.00	30	Filtros naturales Hario	default.jpg	2026-08-14 06:43:02.537105
45	Grinder Manual	28.00	8	Molino manual ajustable	default.jpg	2026-08-14 06:43:02.537105
46	Syrup Vainilla 250ml	7.00	20	Jarabe vainilla premium	default.jpg	2026-08-14 06:43:02.537105
47	Syrup Caramelo 250ml	7.00	20	Jarabe caramelo artesanal	default.jpg	2026-08-14 06:43:02.537105
48	Syrup Avellana 250ml	7.00	18	Jarabe avellana natural	default.jpg	2026-08-14 06:43:02.537105
49	Gift Card $25	25.00	999	Tarjeta regalo $25	default.jpg	2026-08-14 06:43:02.537105
50	Gift Card $50	50.00	999	Tarjeta regalo $50	default.jpg	2026-08-14 06:43:02.537105
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cafeboreal_admin
--

SELECT pg_catalog.setval('public.customers_id_seq', 12, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cafeboreal_admin
--

SELECT pg_catalog.setval('public.order_items_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cafeboreal_admin
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cafeboreal_admin
--

SELECT pg_catalog.setval('public.products_id_seq', 50, true);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: cafeboreal_admin
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: cafeboreal_admin
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: cafeboreal_admin
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: cafeboreal_admin
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: cafeboreal_admin
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cafeboreal_admin
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cafeboreal_admin
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cafeboreal_admin
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 3ATcFanzf2qcrhhL6Yp7hCSApuf7TxPpouZTKG9RrX8YKQhFXrz1SwI45OV8STd

