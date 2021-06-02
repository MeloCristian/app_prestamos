PGDMP     0    .                y            db_prestamos    13.2    13.2 j    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            3           1262    57864    db_prestamos    DATABASE     h   CREATE DATABASE db_prestamos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE db_prestamos;
                postgres    false            �            1259    57898    carreras    TABLE     �   CREATE TABLE public.carreras (
    cod_carrera numeric(10,0) NOT NULL,
    nombre character varying(100),
    id_sede integer NOT NULL
);
    DROP TABLE public.carreras;
       public         heap    postgres    false            �            1259    57896    carreras_id_sede_seq    SEQUENCE     �   CREATE SEQUENCE public.carreras_id_sede_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.carreras_id_sede_seq;
       public          postgres    false    207            4           0    0    carreras_id_sede_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.carreras_id_sede_seq OWNED BY public.carreras.id_sede;
          public          postgres    false    206            �            1259    57914    comodatarios    TABLE     �   CREATE TABLE public.comodatarios (
    cedula numeric(11,0) NOT NULL,
    codigo numeric(15,0),
    nombre character varying(50),
    cod_carrera numeric(10,0)
);
     DROP TABLE public.comodatarios;
       public         heap    postgres    false            �            1259    57930    equipos    TABLE     �   CREATE TABLE public.equipos (
    qr numeric(10,0) NOT NULL,
    garantia date,
    sn character varying(30),
    sn_disco1 character varying(30),
    sn_disco2 character varying(30),
    id_lote integer NOT NULL,
    sede_responsable integer NOT NULL
);
    DROP TABLE public.equipos;
       public         heap    postgres    false            �            1259    57926    equipos_id_lote_seq    SEQUENCE     �   CREATE SEQUENCE public.equipos_id_lote_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.equipos_id_lote_seq;
       public          postgres    false    212            5           0    0    equipos_id_lote_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.equipos_id_lote_seq OWNED BY public.equipos.id_lote;
          public          postgres    false    210            �            1259    57928    equipos_sede_responsable_seq    SEQUENCE     �   CREATE SEQUENCE public.equipos_sede_responsable_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.equipos_sede_responsable_seq;
       public          postgres    false    212            6           0    0    equipos_sede_responsable_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.equipos_sede_responsable_seq OWNED BY public.equipos.sede_responsable;
          public          postgres    false    211            �            1259    57909    funcionarios    TABLE     j   CREATE TABLE public.funcionarios (
    cedula numeric(11,0) NOT NULL,
    nombre character varying(50)
);
     DROP TABLE public.funcionarios;
       public         heap    postgres    false            �            1259    57867    lotes    TABLE     �   CREATE TABLE public.lotes (
    id_lote integer NOT NULL,
    marca character varying(20),
    modelo character varying(50),
    cpu character varying(40),
    ram character varying(20),
    hdd character varying(30)
);
    DROP TABLE public.lotes;
       public         heap    postgres    false            �            1259    57865    lotes_id_lote_seq    SEQUENCE     �   CREATE SEQUENCE public.lotes_id_lote_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.lotes_id_lote_seq;
       public          postgres    false    201            7           0    0    lotes_id_lote_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.lotes_id_lote_seq OWNED BY public.lotes.id_lote;
          public          postgres    false    200            �            1259    57959 	   prestamos    TABLE       CREATE TABLE public.prestamos (
    id_prestamo integer NOT NULL,
    qr integer NOT NULL,
    dni_comodatario bigint NOT NULL,
    dni_funcionario integer NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    lugar_prestamo integer NOT NULL,
    comodato character varying(150)
);
    DROP TABLE public.prestamos;
       public         heap    postgres    false            �            1259    57953    prestamos_dni_comodatario_seq    SEQUENCE     �   CREATE SEQUENCE public.prestamos_dni_comodatario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.prestamos_dni_comodatario_seq;
       public          postgres    false    218            8           0    0    prestamos_dni_comodatario_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.prestamos_dni_comodatario_seq OWNED BY public.prestamos.dni_comodatario;
          public          postgres    false    215            �            1259    57955    prestamos_dni_funcionario_seq    SEQUENCE     �   CREATE SEQUENCE public.prestamos_dni_funcionario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.prestamos_dni_funcionario_seq;
       public          postgres    false    218            9           0    0    prestamos_dni_funcionario_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.prestamos_dni_funcionario_seq OWNED BY public.prestamos.dni_funcionario;
          public          postgres    false    216            �            1259    57949    prestamos_id_prestamo_seq    SEQUENCE     �   CREATE SEQUENCE public.prestamos_id_prestamo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.prestamos_id_prestamo_seq;
       public          postgres    false    218            :           0    0    prestamos_id_prestamo_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.prestamos_id_prestamo_seq OWNED BY public.prestamos.id_prestamo;
          public          postgres    false    213            �            1259    57957    prestamos_lugar_prestamo_seq    SEQUENCE     �   CREATE SEQUENCE public.prestamos_lugar_prestamo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.prestamos_lugar_prestamo_seq;
       public          postgres    false    218            ;           0    0    prestamos_lugar_prestamo_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.prestamos_lugar_prestamo_seq OWNED BY public.prestamos.lugar_prestamo;
          public          postgres    false    217            �            1259    57951    prestamos_qr_seq    SEQUENCE     �   CREATE SEQUENCE public.prestamos_qr_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.prestamos_qr_seq;
       public          postgres    false    218            <           0    0    prestamos_qr_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.prestamos_qr_seq OWNED BY public.prestamos.qr;
          public          postgres    false    214            �            1259    57885    procesos    TABLE     �   CREATE TABLE public.procesos (
    id_proceso integer NOT NULL,
    proceso character varying(20) NOT NULL,
    descripcion character varying(500)
);
    DROP TABLE public.procesos;
       public         heap    postgres    false            �            1259    57883    procesos_id_proceso_seq    SEQUENCE     �   CREATE SEQUENCE public.procesos_id_proceso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.procesos_id_proceso_seq;
       public          postgres    false    205            =           0    0    procesos_id_proceso_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.procesos_id_proceso_seq OWNED BY public.procesos.id_proceso;
          public          postgres    false    204            �            1259    57997 	   registros    TABLE     �   CREATE TABLE public.registros (
    id_registro integer NOT NULL,
    id_prestamo integer NOT NULL,
    qr integer NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    id_proceso integer NOT NULL,
    pdf_soporte character varying(500)
);
    DROP TABLE public.registros;
       public         heap    postgres    false            �            1259    57991    registros_id_prestamo_seq    SEQUENCE     �   CREATE SEQUENCE public.registros_id_prestamo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.registros_id_prestamo_seq;
       public          postgres    false    223            >           0    0    registros_id_prestamo_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.registros_id_prestamo_seq OWNED BY public.registros.id_prestamo;
          public          postgres    false    220            �            1259    57995    registros_id_proceso_seq    SEQUENCE     �   CREATE SEQUENCE public.registros_id_proceso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.registros_id_proceso_seq;
       public          postgres    false    223            ?           0    0    registros_id_proceso_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.registros_id_proceso_seq OWNED BY public.registros.id_proceso;
          public          postgres    false    222            �            1259    57989    registros_id_registro_seq    SEQUENCE     �   CREATE SEQUENCE public.registros_id_registro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.registros_id_registro_seq;
       public          postgres    false    223            @           0    0    registros_id_registro_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.registros_id_registro_seq OWNED BY public.registros.id_registro;
          public          postgres    false    219            �            1259    57993    registros_qr_seq    SEQUENCE     �   CREATE SEQUENCE public.registros_qr_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.registros_qr_seq;
       public          postgres    false    223            A           0    0    registros_qr_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.registros_qr_seq OWNED BY public.registros.qr;
          public          postgres    false    221            �            1259    57875    sedes    TABLE     e   CREATE TABLE public.sedes (
    id_sede integer NOT NULL,
    sede character varying(20) NOT NULL
);
    DROP TABLE public.sedes;
       public         heap    postgres    false            �            1259    57873    sedes_id_sede_seq    SEQUENCE     �   CREATE SEQUENCE public.sedes_id_sede_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sedes_id_sede_seq;
       public          postgres    false    203            B           0    0    sedes_id_sede_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.sedes_id_sede_seq OWNED BY public.sedes.id_sede;
          public          postgres    false    202            c           2604    57901    carreras id_sede    DEFAULT     t   ALTER TABLE ONLY public.carreras ALTER COLUMN id_sede SET DEFAULT nextval('public.carreras_id_sede_seq'::regclass);
 ?   ALTER TABLE public.carreras ALTER COLUMN id_sede DROP DEFAULT;
       public          postgres    false    206    207    207            d           2604    57933    equipos id_lote    DEFAULT     r   ALTER TABLE ONLY public.equipos ALTER COLUMN id_lote SET DEFAULT nextval('public.equipos_id_lote_seq'::regclass);
 >   ALTER TABLE public.equipos ALTER COLUMN id_lote DROP DEFAULT;
       public          postgres    false    212    210    212            e           2604    57934    equipos sede_responsable    DEFAULT     �   ALTER TABLE ONLY public.equipos ALTER COLUMN sede_responsable SET DEFAULT nextval('public.equipos_sede_responsable_seq'::regclass);
 G   ALTER TABLE public.equipos ALTER COLUMN sede_responsable DROP DEFAULT;
       public          postgres    false    211    212    212            `           2604    57870    lotes id_lote    DEFAULT     n   ALTER TABLE ONLY public.lotes ALTER COLUMN id_lote SET DEFAULT nextval('public.lotes_id_lote_seq'::regclass);
 <   ALTER TABLE public.lotes ALTER COLUMN id_lote DROP DEFAULT;
       public          postgres    false    200    201    201            f           2604    57962    prestamos id_prestamo    DEFAULT     ~   ALTER TABLE ONLY public.prestamos ALTER COLUMN id_prestamo SET DEFAULT nextval('public.prestamos_id_prestamo_seq'::regclass);
 D   ALTER TABLE public.prestamos ALTER COLUMN id_prestamo DROP DEFAULT;
       public          postgres    false    213    218    218            g           2604    57963    prestamos qr    DEFAULT     l   ALTER TABLE ONLY public.prestamos ALTER COLUMN qr SET DEFAULT nextval('public.prestamos_qr_seq'::regclass);
 ;   ALTER TABLE public.prestamos ALTER COLUMN qr DROP DEFAULT;
       public          postgres    false    218    214    218            j           2604    74141    prestamos dni_comodatario    DEFAULT     �   ALTER TABLE ONLY public.prestamos ALTER COLUMN dni_comodatario SET DEFAULT nextval('public.prestamos_dni_comodatario_seq'::regclass);
 H   ALTER TABLE public.prestamos ALTER COLUMN dni_comodatario DROP DEFAULT;
       public          postgres    false    218    215    218            h           2604    57965    prestamos dni_funcionario    DEFAULT     �   ALTER TABLE ONLY public.prestamos ALTER COLUMN dni_funcionario SET DEFAULT nextval('public.prestamos_dni_funcionario_seq'::regclass);
 H   ALTER TABLE public.prestamos ALTER COLUMN dni_funcionario DROP DEFAULT;
       public          postgres    false    218    216    218            i           2604    57966    prestamos lugar_prestamo    DEFAULT     �   ALTER TABLE ONLY public.prestamos ALTER COLUMN lugar_prestamo SET DEFAULT nextval('public.prestamos_lugar_prestamo_seq'::regclass);
 G   ALTER TABLE public.prestamos ALTER COLUMN lugar_prestamo DROP DEFAULT;
       public          postgres    false    218    217    218            b           2604    57888    procesos id_proceso    DEFAULT     z   ALTER TABLE ONLY public.procesos ALTER COLUMN id_proceso SET DEFAULT nextval('public.procesos_id_proceso_seq'::regclass);
 B   ALTER TABLE public.procesos ALTER COLUMN id_proceso DROP DEFAULT;
       public          postgres    false    205    204    205            k           2604    58000    registros id_registro    DEFAULT     ~   ALTER TABLE ONLY public.registros ALTER COLUMN id_registro SET DEFAULT nextval('public.registros_id_registro_seq'::regclass);
 D   ALTER TABLE public.registros ALTER COLUMN id_registro DROP DEFAULT;
       public          postgres    false    223    219    223            l           2604    58001    registros id_prestamo    DEFAULT     ~   ALTER TABLE ONLY public.registros ALTER COLUMN id_prestamo SET DEFAULT nextval('public.registros_id_prestamo_seq'::regclass);
 D   ALTER TABLE public.registros ALTER COLUMN id_prestamo DROP DEFAULT;
       public          postgres    false    223    220    223            m           2604    58002    registros qr    DEFAULT     l   ALTER TABLE ONLY public.registros ALTER COLUMN qr SET DEFAULT nextval('public.registros_qr_seq'::regclass);
 ;   ALTER TABLE public.registros ALTER COLUMN qr DROP DEFAULT;
       public          postgres    false    221    223    223            n           2604    58003    registros id_proceso    DEFAULT     |   ALTER TABLE ONLY public.registros ALTER COLUMN id_proceso SET DEFAULT nextval('public.registros_id_proceso_seq'::regclass);
 C   ALTER TABLE public.registros ALTER COLUMN id_proceso DROP DEFAULT;
       public          postgres    false    223    222    223            a           2604    57878    sedes id_sede    DEFAULT     n   ALTER TABLE ONLY public.sedes ALTER COLUMN id_sede SET DEFAULT nextval('public.sedes_id_sede_seq'::regclass);
 <   ALTER TABLE public.sedes ALTER COLUMN id_sede DROP DEFAULT;
       public          postgres    false    203    202    203                      0    57898    carreras 
   TABLE DATA           @   COPY public.carreras (cod_carrera, nombre, id_sede) FROM stdin;
    public          postgres    false    207   �|                 0    57914    comodatarios 
   TABLE DATA           K   COPY public.comodatarios (cedula, codigo, nombre, cod_carrera) FROM stdin;
    public          postgres    false    209   �|       "          0    57930    equipos 
   TABLE DATA           d   COPY public.equipos (qr, garantia, sn, sn_disco1, sn_disco2, id_lote, sede_responsable) FROM stdin;
    public          postgres    false    212   ��                 0    57909    funcionarios 
   TABLE DATA           6   COPY public.funcionarios (cedula, nombre) FROM stdin;
    public          postgres    false    208   e                0    57867    lotes 
   TABLE DATA           F   COPY public.lotes (id_lote, marca, modelo, cpu, ram, hdd) FROM stdin;
    public          postgres    false    201   �      (          0    57959 	   prestamos 
   TABLE DATA           �   COPY public.prestamos (id_prestamo, qr, dni_comodatario, dni_funcionario, fecha_inicio, fecha_fin, lugar_prestamo, comodato) FROM stdin;
    public          postgres    false    218   �                0    57885    procesos 
   TABLE DATA           D   COPY public.procesos (id_proceso, proceso, descripcion) FROM stdin;
    public          postgres    false    205   �:      -          0    57997 	   registros 
   TABLE DATA           s   COPY public.registros (id_registro, id_prestamo, qr, fecha_inicio, fecha_fin, id_proceso, pdf_soporte) FROM stdin;
    public          postgres    false    223   !;                0    57875    sedes 
   TABLE DATA           .   COPY public.sedes (id_sede, sede) FROM stdin;
    public          postgres    false    203   >;      C           0    0    carreras_id_sede_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.carreras_id_sede_seq', 1, false);
          public          postgres    false    206            D           0    0    equipos_id_lote_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.equipos_id_lote_seq', 1, false);
          public          postgres    false    210            E           0    0    equipos_sede_responsable_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.equipos_sede_responsable_seq', 1, false);
          public          postgres    false    211            F           0    0    lotes_id_lote_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.lotes_id_lote_seq', 3, true);
          public          postgres    false    200            G           0    0    prestamos_dni_comodatario_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.prestamos_dni_comodatario_seq', 1, false);
          public          postgres    false    215            H           0    0    prestamos_dni_funcionario_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.prestamos_dni_funcionario_seq', 1, false);
          public          postgres    false    216            I           0    0    prestamos_id_prestamo_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.prestamos_id_prestamo_seq', 920, true);
          public          postgres    false    213            J           0    0    prestamos_lugar_prestamo_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.prestamos_lugar_prestamo_seq', 1, false);
          public          postgres    false    217            K           0    0    prestamos_qr_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.prestamos_qr_seq', 1, false);
          public          postgres    false    214            L           0    0    procesos_id_proceso_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.procesos_id_proceso_seq', 2, true);
          public          postgres    false    204            M           0    0    registros_id_prestamo_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.registros_id_prestamo_seq', 1, false);
          public          postgres    false    220            N           0    0    registros_id_proceso_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.registros_id_proceso_seq', 1, false);
          public          postgres    false    222            O           0    0    registros_id_registro_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.registros_id_registro_seq', 1, false);
          public          postgres    false    219            P           0    0    registros_qr_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.registros_qr_seq', 1, false);
          public          postgres    false    221            Q           0    0    sedes_id_sede_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.sedes_id_sede_seq', 4, true);
          public          postgres    false    202            z           2606    57903    carreras carreras_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (cod_carrera);
 @   ALTER TABLE ONLY public.carreras DROP CONSTRAINT carreras_pkey;
       public            postgres    false    207            ~           2606    57920 $   comodatarios comodatarios_codigo_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.comodatarios
    ADD CONSTRAINT comodatarios_codigo_key UNIQUE (codigo);
 N   ALTER TABLE ONLY public.comodatarios DROP CONSTRAINT comodatarios_codigo_key;
       public            postgres    false    209            �           2606    57918    comodatarios comodatarios_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.comodatarios
    ADD CONSTRAINT comodatarios_pkey PRIMARY KEY (cedula);
 H   ALTER TABLE ONLY public.comodatarios DROP CONSTRAINT comodatarios_pkey;
       public            postgres    false    209            �           2606    57936    equipos equipos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (qr);
 >   ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_pkey;
       public            postgres    false    212            �           2606    57938    equipos equipos_sn_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_sn_key UNIQUE (sn);
 @   ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_sn_key;
       public            postgres    false    212            |           2606    57913    funcionarios funcionarios_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (cedula);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public            postgres    false    208            p           2606    57872    lotes lotes_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.lotes
    ADD CONSTRAINT lotes_pkey PRIMARY KEY (id_lote);
 :   ALTER TABLE ONLY public.lotes DROP CONSTRAINT lotes_pkey;
       public            postgres    false    201            �           2606    57968    prestamos prestamos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (id_prestamo);
 B   ALTER TABLE ONLY public.prestamos DROP CONSTRAINT prestamos_pkey;
       public            postgres    false    218            v           2606    57893    procesos procesos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.procesos
    ADD CONSTRAINT procesos_pkey PRIMARY KEY (id_proceso);
 @   ALTER TABLE ONLY public.procesos DROP CONSTRAINT procesos_pkey;
       public            postgres    false    205            x           2606    57895    procesos procesos_proceso_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.procesos
    ADD CONSTRAINT procesos_proceso_key UNIQUE (proceso);
 G   ALTER TABLE ONLY public.procesos DROP CONSTRAINT procesos_proceso_key;
       public            postgres    false    205            �           2606    58008    registros registros_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.registros
    ADD CONSTRAINT registros_pkey PRIMARY KEY (id_registro);
 B   ALTER TABLE ONLY public.registros DROP CONSTRAINT registros_pkey;
       public            postgres    false    223            r           2606    57880    sedes sedes_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_pkey PRIMARY KEY (id_sede);
 :   ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_pkey;
       public            postgres    false    203            t           2606    57882    sedes sedes_sede_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_sede_key UNIQUE (sede);
 >   ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_sede_key;
       public            postgres    false    203            �           2606    57904    carreras carreras_id_sede_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_id_sede_fkey FOREIGN KEY (id_sede) REFERENCES public.sedes(id_sede);
 H   ALTER TABLE ONLY public.carreras DROP CONSTRAINT carreras_id_sede_fkey;
       public          postgres    false    207    203    2930            �           2606    57921 *   comodatarios comodatarios_cod_carrera_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comodatarios
    ADD CONSTRAINT comodatarios_cod_carrera_fkey FOREIGN KEY (cod_carrera) REFERENCES public.carreras(cod_carrera);
 T   ALTER TABLE ONLY public.comodatarios DROP CONSTRAINT comodatarios_cod_carrera_fkey;
       public          postgres    false    207    2938    209            �           2606    57939    equipos equipos_id_lote_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_id_lote_fkey FOREIGN KEY (id_lote) REFERENCES public.lotes(id_lote);
 F   ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_id_lote_fkey;
       public          postgres    false    212    201    2928            �           2606    57944 %   equipos equipos_sede_responsable_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.equipos
    ADD CONSTRAINT equipos_sede_responsable_fkey FOREIGN KEY (sede_responsable) REFERENCES public.sedes(id_sede);
 O   ALTER TABLE ONLY public.equipos DROP CONSTRAINT equipos_sede_responsable_fkey;
       public          postgres    false    212    203    2930            �           2606    74142 (   prestamos prestamos_dni_comodatario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_dni_comodatario_fkey FOREIGN KEY (dni_comodatario) REFERENCES public.comodatarios(cedula);
 R   ALTER TABLE ONLY public.prestamos DROP CONSTRAINT prestamos_dni_comodatario_fkey;
       public          postgres    false    218    2944    209            �           2606    57979 (   prestamos prestamos_dni_funcionario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_dni_funcionario_fkey FOREIGN KEY (dni_funcionario) REFERENCES public.funcionarios(cedula);
 R   ALTER TABLE ONLY public.prestamos DROP CONSTRAINT prestamos_dni_funcionario_fkey;
       public          postgres    false    218    2940    208            �           2606    57984 '   prestamos prestamos_lugar_prestamo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_lugar_prestamo_fkey FOREIGN KEY (lugar_prestamo) REFERENCES public.sedes(id_sede);
 Q   ALTER TABLE ONLY public.prestamos DROP CONSTRAINT prestamos_lugar_prestamo_fkey;
       public          postgres    false    218    203    2930            �           2606    57969    prestamos prestamos_qr_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_qr_fkey FOREIGN KEY (qr) REFERENCES public.equipos(qr);
 E   ALTER TABLE ONLY public.prestamos DROP CONSTRAINT prestamos_qr_fkey;
       public          postgres    false    212    2946    218            �           2606    58009 $   registros registros_id_prestamo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.registros
    ADD CONSTRAINT registros_id_prestamo_fkey FOREIGN KEY (id_prestamo) REFERENCES public.prestamos(id_prestamo);
 N   ALTER TABLE ONLY public.registros DROP CONSTRAINT registros_id_prestamo_fkey;
       public          postgres    false    218    2950    223            �           2606    58019 #   registros registros_id_proceso_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.registros
    ADD CONSTRAINT registros_id_proceso_fkey FOREIGN KEY (id_proceso) REFERENCES public.procesos(id_proceso);
 M   ALTER TABLE ONLY public.registros DROP CONSTRAINT registros_id_proceso_fkey;
       public          postgres    false    205    223    2934            �           2606    58014    registros registros_qr_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.registros
    ADD CONSTRAINT registros_qr_fkey FOREIGN KEY (qr) REFERENCES public.equipos(qr);
 E   ALTER TABLE ONLY public.registros DROP CONSTRAINT registros_qr_fkey;
       public          postgres    false    223    212    2946                  x�3���KIM���L��4����� >            x�t�Yv�0�-���
��{� �OJbHT���!2]�7���#?��z-k�6��*OEDVќ$�x�Zی�k�~������5c�����ݗ��}>���tz��_oӟ�m��_y�s�����:]���ϴ=_���|}�.��t�,�˙$�.�������y���_��r�=L���z~�.tu캱������3}����m9����r:����e�N$1�f"=H����%�^��my�����>]ަ�?���|ڿ����Ӄ��&������m���
o� ���v>�;4c�b�CӅnw�������p8��e�N��r��8���]��$�6�3D試��g"�?���N$���Z�&�OBߴy׍�]v���|�KN���r��g�5_N�i�ᆦO�Ƕ������]��>���c�>=�������탗�I)��.7i�W��N/�9��Χ��t����ӹM�8�����n���D������������=��O���S�v�������k����$��~�uz�CJ����qX����>�*�_3^��gz�������!��q~��ۿ�//��t��@�5^���,;64!�;�����X������r��D�|�X"4M껝��m:-3����uz��gڊ߲<C��C�����n������'������>��媫��;���شM��;z+���c����_?.m_��#�b}���T�v�=�J��|��X�z�ω>����L��w/���x��xY>�$p�����	&@��m>�O���`�	:�t".G�t�a�m�{�n2?��Zz�O�����K*��S�����I�5�w�ܶ���vv��8a�|����8�泝�6���ihv������&ލ���t���ߴ�s�5&F�N��t����c]��7����z�+���>_qF�hC~-���f��z\N��r����Z��D[�wXN��t�3�P��.�N?u: �Ӎ�D���y�� %�:�|�i�&]��k��7���}��aI����6�L����F�!R�}���h���F�\&��w;V�������@��q@��:R47=�	[��BG*���@��z�����˰�M����C�^oB�:y.w�ϙ���F܋7�?_���%�1������đ!�]p2�N8�!�<u��u1ƞ�:����0Ѯۓy��߯Y@���T����F:��v}��>���Z���`Eʶ`]Nbt(�Ů���t�e:��v̧�ۋ~�]��I�_ϴδ�uݦ�c�M������X}O��T�a"m�º�kz)�ޏd�D��J(�e>AIa��)?��^�c�lm�5V�vli�����:���;��/��1&
~.�
�!����a[ݧ�'�M$�=�����s���ێԵ�t��Շ�kv�C����3�K� oW%,�����3��ʄ1�d��}�יv���������֡C:6i��c��Y<ԍ�������t�gU6}P]+��q'��J����>6���zS�H������`��ˑL'�I�nߓ)�&f[��=��B��5�����9��<f�ʻՎ���u���Qk��E:�}�������ފ��}�}`sMۃ��ǅ���|�3��=��r���F&瀾��|��v�H�h4�86�\�'%H����;&5�<������$s��qr���3�fS�cH9&Dk@�~?-t���ZH��᧭V�}קV/'���Cxƞ����䰎vu��ut�ן/��H���m���]&�8�@GG���Ս�yb���*g%�dݛ����:�Z�y�d-�W�&G��������@��1١�5HiLhh����xX`�o�ά�����_薾�B�;u��v�=舙��|�a�b��	�jdh�a�,dPW�\�|$��;��Y)��˙ފ��8��%��ݐlEd8�a>�Ⱦ�1�/�dw9=	17=g�
t>Ia��:������U,��4��F�lI��ѡ���N:g><�e��Ӫz���b��,�ݽ�ȑ{����T�����E_��ߤ���]�f���`���Wz�8��&�+����� U�$xV~0����A+�t��;��r~�_����V���[����Xm�H�}���|,�.����9�F�:���B���珇.U߈��=|6C��0?�8V�F"�p���
k���Je#����e�m����t�z	��.���FW��*?�w�6���#߇>��S�#�zd,vc)��XD5����M�K�.��&���z�ÐE�8]ӾVF�rQT*����I�c�ɳaM�x.$�F?A�[E���\���}f:��(R	�˽^�P����\�;���&GZ�>�EY9{���$�ϖ%�����?��f���'���Î��y���k��T3m��˃��\�������'���(�ՠ��H1�p�T�v�����I�i�i�3�$uQ��(;$�2��rs�S���[�����M��7:�g>������xt��k���R��"�N�ilڐw����]t�A����Q�m ߕ�h01r���w�E�e�_�C��Cۦr�Tm�+�������1���&o��楜pɵ��{]ȿ��� �*D��`�-��_�5I�<��Ќz�iի�p��U� z�}r�2B���� ������בO�W���+���`��R�uN �E�l���9��j��b9u&A�M�}�+���tT��н���u!���}ewu�ᣈ�����S�ۧ��/�,VO�*��'�nL����L*㈍��������r�|�0�w!CI�br��)����_�6RK�8L�#=Z�ב���4tJH"���d���º�������f�MTed�}$�r�������'m���t}'��7����g/��udz���>�H��UA�ŋ���Z�#-�[�:6a$_ �zq���=բ���[�����!q�p��ÿ(��v-��\��Q)������|�kde�Gl��u;��+m�����Nf�\#�0��P�I򩻼J$Rh�$	a������dj>曚�G��bi�ڵEz�Jr�$�����R˻�s�O��sV��B���E
9�N%�hxv�d�݊n��1��u��tZ��<�vd�$��"�/х�9k%�Z�W�#{I,G^������i��.E�A�:K�F!4���i���N�o�~��ٻ� y;R��/M3X��c*)�����ђ�Ց(�z_����쬖�_��,,�u��ħЬdI��!ڵd�̱*�l��9��j�քH��.�=�~�8+�~���bl��/�yP��0�b�>����` ����I���:��-�/E1̄H�YV���0�_�jW���Dz�������'+��L�˹Z�LyE�Fj��^��6�:�H^^?�����1c��YY�g�m#�H����.�.lґ<_=}GBH���Z��j��ODn�>���Qze���T�>
!���y��;q��Z����E���v��'ݤ��ܤ!���&B۴�i���|}௏{y�Q�E,8��>,�*�f=	��7��Uz�G�N��xk@4� Ox>�nC��ݦIҗ�jR]�����J����T$פ���E�z��۳KI"|��T_�*��Ĺ���Q��3)��_�����qTi-�������s�ی��<3�uG��$�e��B�Kߨ	1�\gd)�w��{�@r]�x��B��Qy�!dU%$���q�ů���)�����!RC�b����&�$�+f��g�rA���i/� �H/܊�Cf+5�bɸo��\�ʳ	�d*�J���K��7z���z�4�J�"�r�����!Ř�A�%��ǜ��'�{>)j����q*�c}0�%=+-+�ѳHBG�2(�i��H4�`�"M�m��@�'�T6),��1�Z*�B�$ӂu&A�V}a$,b�O���qm�U�B�^쥊�n-�⩷c���ګe ���_����'��^�,}��37�T\����܃d���<�@.���JAv

g?C�_���@�a�,몎�m��x�M���~���7�4�V0Ԅ�@V;��P8��v'O�,��]W6��h�$C'�2 c�I    �Ҿ�H�A�fl�9_^o狊�����SRg4m���ŷW��;6i���0�1�W.H
�	��2��K�����{�֣TPY ) 䃬�=|�Mt�k�7��`4[��@�̀����,�s�|!ہ4�����q_�/����I���w��1-��i�j3
e��������Љ$��Nם�[d����GY�����/��EE�"c�����3)
��� �HI�n7t;��H�^^�(�h�F�n�ۣJ%t1�Q�v�R�R���Ȳ��2�O5F�����4Q��vuw���M������'����*��N�D�YXߛ#���wth�
"������-+�#fX2C԰�w����+�H?i	!��h�0A"cC����I7�(�2]���+i�<d���qJ^����ۭ��!���d�YuR@2���p����TR��&P��nt$���O�9�C��l^��6�R+��yH&y�p�4uE;���Ķ��@5�Ē�R�����~݋z��N݀�1d� oJ��q�}
%Z�%H����U�h���
��K\�l�&�R��H.���a~ �BF :Uu&���"�F��)��l֢�$�!oR�|D�Ī���}&�JxmwC�7J����MW�h��Ç�:�Gvh[����R�Gj�jr�����$���y��>�����8vv���hN�s�Y��V���%�K��Ǚ���{�4��G���9���`�"�J�ؖ�X�PJ.Az�r9:��7�R��q��ȇ�`���
q"5r�<�l"mSʸV���_��Z��3���x� E�*Ip`�'9Œ��:>�ۚ[��>h�4B�Ɂ(�E��6�5��̞��핬���2=A�(��F�C򳬟����N/���!2b.o����
N�(Տ��l�M�wG����~��Q8s�<,�Y�m�I��D��4����Cl�t�b)(�:�FB�>�ڋO�ƔM�T�����p��%�Ȯ��z(�/x�����5��t�:�-l����<�-�.��sζj���~����;�I�����NG��cs�{H�ƞ��Tp$$]Yi�������ߨ(!�#�]]b�ɓ�V_l��~!Y�D���Ϗ�Ĉ�W(�����H�t��e���5~2џ�-�ѡc	 �=XKU���w�ZwδX OQ�j]��"�G��V
M��%�c#�r�Hˋ^���S��!h(23����g���r�3y�?�[�/:�!�458~̧��D�nB�{$�@@�c���}�=򨧒�V�t,-)��d��O�>���9R`������,�<�U�A��r���OI]�����{2OLËM���Y�:ѹ���3 Vmj�J5/�\`���&]fx�s���m�&E��qB�����m���rz���T�	�Y�ϟ�z~h)�
���T�V�2�>��n�xS	�=�:�����RΟ�G�`���,�;�����;:��#��!b���:|���ѥH{9��2}���#.�i��+��ψdڍ��EB؛�`ܒ.϶tY#@0H I�u�J����]1�K���a/�V��Z�������S".Z��cS�����g�#W'��릕=ہ�!2+)Ҭ�����M"�l��^Z��*<�:��L�&�H%�LK޾�
�0/�y>�B�\nTw��<�@�Wׂ�ns�w!�����8����d\�7���~4��$�w)x�r_I�'�^�v�$���
�C�����G�h�5Rz�x�R���#ť����;pJ|�����J$�}V(Ȍ��l轄���>L�+F*V��;�/q~Ĩ�����$�Θ����
ήƟ���8�A/�r{�{c�þ�_
�v`� $�_��#�T*��P��.0 ��0��ר���@�'�w��/�H�C�#�w^N���ߡ���O[\?ɂ���s��-��Yt����α����c@��Q�+8��we��\�a�*L~ѓ�D�$��َ�VFl�*�db���P��R���pt	����+�CDۈvǉ�(��i�Iu�I��a�}?�G����܎˥r"�&D�����`q�j���Z���Ȟ����b��c���%�Z�Չ~j�`c�7_����B�-�c���߯�����图= !�ߋA�[:Խ?)7ځ��p�I�C�ȣ���@��g�T��:��K+�g���' �ݾ��^Pע[Ze%���f@���M��s�v�Ǆ�juH%�d��L{�)��Ӷ�E�p}��8%�H�Q�[G�%c*�>�u0K�����{{��a�z��8�lF��7lw���_?��HM�
���>��M��� ��
׃�5��T[�dT��M��bhٸ�CT:���r&Rh��������'��\��:��]���B�����Xn��I8֘Øu�Ɔ.E�p�{2N g;�ʓ�q�#v��
��̫�}?��k=c��+I�>���2i�D<D�c�f@�z���7HS��pI�f����-2 �ΐZp6�I�������N�m������'z�kPD�������wX>x���V��IE�pMD����Jq�@��@^�츔�xNn���r��x"ɷY�AQ��:�c� �"�Xp<m���U�쬺9l%�%���K%Nk���>P��7ۧ�����D�wEO3���T�&R�Q�p�=7j��;�\�c+Y  ��_�/�k���z�/���尷���I��~>�����-��Q
��9�qм�ndK̽/�*�Q�װ��1�v��H��!)�/�~�քF��i��ΩW؏
r���Ep�X2y��*(����~N/I�HΩ&Z6�g� �g�n�z��c�6���~���
�*������?�|�x����ݡ��/�O�s�NX�"XӦ.����q���Z��������z�����ӍIrc�i?M�;e�����Q|ҞW !Z� ��햓� �l�}�<,B�-)F��9�[�L���h�ob�{�_o�&����}���g"���o5h����I9��3Sŭl
Y&D��W�vZ:TH�2{D�6:\�l{?�g���!��IȳC�<t�n�Ty8۪v���g�M����	D��<$}��CQ�.�Χ�^�jg���'��R��6��K���FW쎾�;V�p����~ۖ�� B�
��5�4'U���G�"[/�-Ƒ���2�v���!���b@_��P��n���Sߪ%wa6Np"c�:��@�Z���@z���&H��$Z\S������r��+B�U��ڿ� ����B��o(�8�:��t����C�ۤC
�] ט���zE���B�	I�j.��S�s��
�(
�G�ǲ-��t�o����d�5>��s�. 9�[\'�K=�l:Oа>'E6���&\��������}6`xd��]����7����bW�8��* 3�B��a����
Q�a�T�����n���<BO�����!��	�-���M�jt��%�����_�F��C�wb��;��,͡�K�}��A�X�}���>Z�[�*ӥd���Tq��o�#.�0h�$tz}(������RU��{�-�TĊ�q�N�S<麶�4��ʑ%G�ۼSks�H7������iu���z����R N�Ań#y.�_J�n�6��r ћ�HE����:/�=�����m����x\�\U�׬&��k��(j�N�Q~$��4�C��/N��fNoWݩ��,v�FBy��x]��#��u�qWP'��Q���D�!�g���N��w�x�ʠ��z/�[k�d�*���2�)�p�KIC=�dZq�u9,�I��e���누b�
�;���Yǉ�V%+I�&K��^��o�W���"�}:��fn|�`����mL�5�q�U�/�_����������U����:�*ԕ�bDҧ�t0�b7W��G���rʁ���e���>�������\�6�E�ӨD O�6��~[e�]gңcCA�.Aj�)��b<�'�^���)�qMҶ�@
\	�[�hr=������ܸ���Z9C�JŌPFj�K��hu��%��Ku{Z��F    (5�+Q�#���7�EJ�H�K�f�2�؟�י>�ؙ\�^��������&�@afЖ�M�1{
eR?�.4���6��8{��p/nu7��H
Y�i�5�V�V�|�{�xS���eB4�K-K�U(P֑�#���	�1��m�B��8�QE���a�+ǖ��cCo�ږ � �S*{�Ś�����tB�@' �wFo
�?\�!�zΩ]��>9#p�vx�e�<|`?E�-���FɪX׻��G|�@�pKΏ���S*h�lt-+�*a@�&E(\&%��,��r'�YC_�<�L�&R�Ι
0n'Y��P�N}l��̅Bd��Ng$�h1�yI��qWU�\�+P�S��׳I"�1c�MiYq��M��є���3�S���`�#�cV镜�N��3I,)E��k�-��03�2�W&]������&���n����l!:y�4�JWs����
8M�r9S(�q���
[C.͘�7���\���*�F�	c��gx���p�uUd(���˃gOg)t�Q��X'����߃���wr)�g���z���P��;��x�����)/�0���QJ�rR*@�qo�(��,��1?]:H�{�� �i��k0�2�W�6��yo\j�0�mB�I���9'���RSn�z���c����&��O�����'�o��n��>�0
*wW���P_�>@�k���j�kկ�dJZ��_�����6�L+2	-H�_Z{j~F�o
���
�i^~�DI�D+�+k��ؠo	���k�B�H�7��طy�K#m�ׂ�澺e�~�k���:]���I�F�k&�yŇ��o��l�=�%��9S�}n�6E$�)"�:�W�K���F��I���6�}�?�Nɾ0XA�1Vʛ�1�k���:�
k_HJ�~�����qĢxGBho%zi�2���ZnE��	�暑;	Z,1�*�	}��U�5��!'z�^�����X�6�w���_%�]��3��`K<]��[Ҭ����Dmx��@��9�A#~c[�Ƽs��u} a!��S�{$��/�$���%%�_�\@
�����-)|�Lb6�\=�{���ݔ���)>*�;KH�#����ec�&i�Q��frB�<kR.%��(1��z�NPr��ߥ������&-j�4nXa
��$q6 C�Db:�ci���$D'����&��JVRWV\ +��D�;�_<Vs�'2��D*S�$ ��ov%�/�T����`������������̥����(� �t�&n���L>��Jc�"��>�T�'�����u��(>yrӾ�+�l�rY;t��J
.�= xj1���/��Ͷ:M'f[	���`�
�� �%<�kHr�rΨU�����t��\��R%��M_�T�Q��WD�M��
a������bt���4�G�'��%��w�\�#���2� �	^�݋�7GU����˅ H_ɇ&���cy��2#pG��ި�%�Ic��򎳢�r��vE8�|�f�T&�"w/b�����h��39ZL��й���r�R<N�X�8��Ҳ	�e~�3#����^���I � ��5�%xdWF�^)��F�g/����U��`�Ŷ Z����D�fL�N��������%H)��D�����u�LӮ9����2���:󆇞i���������P�pG�(~���Nnl���r�f�j̈́@{��K,�aB���.[G�X�VTX�v��O*V/t2dIۿ#�O��D�4�ř��PTI�ɭ���;$����O����a[�����B����f�-L"�'E�b1���7/a��A�$YtR!�J>oI�������`�����;i1g(�M�R�{U�$E��y���Ϩ��B���7��&��YC�������M1�ܝ��`4	����0�� D��f  I�˱E�k�ƶ�O����)d���7�x�WnjZs"R�M�H�;�������h@���RK���-�P�h綯��{:"�m��En�оZϹ�W�����F����B�t��Qj�/�zʑ�::�hI���&��ĝK�Ѕ�8�W��U�l�)-X!�ʂH]�G�a`������[�!�-F@�;HW�a�dV{�C�~:�:�ߡ�����m�n�CȲt���]�ڧE��~�8�Oq�P�S����)��J�(D�+*z� 7�zj��}9lvK5Ggi�,0dFu���:G�ʳ�|��� np����v�|	���4�2$�'O�cS}��� Ɂ�P-\��R�\�ݪ p�7��+���f�� pM�/gR�����*�?�W���ݼ��q@a´�4[�>E����iM���ڿ*[�F}�	By���0O���J�.���������G� �G� ���sf��j����D@��v��:��x�c�/���X@|�*'�p� .b�(�D!�'[�6׬{�J�i�K�#[':teQy�	!�R��u����t�.��جW�`�]�S�%]�6��߬��A��Э*�����M���ˌޓ�q�-F�Xy��r�'L�<�*X�.kW側�?�.O���9�84��6�/�������"���^��UY�
:���%T��^���9%�U
fK������G�yG�	a,NP��Hy�jjkZ�A7��!��r����a���#��~��]�vn�'TB�{������?c3bhM�}Gj�<�Ya�V�5UGR@��(-�i$T�G��_�Z��{�c���H�'��W%7D�"�;������o�k\$F�)h/îW���5B��BC�����+�,~ч|�}��vؘ��A�#��!�g�q�,*׽��X��3ΏI�L�@��-Eo|F���\9TX:6o��~���bW'׎�874����m�9��'�~4�m��*w�Fy��T��:� pX�o,=���
�JҢa��h�:����Ӱ�h��{1{���iP�g2��ZIՅlB^��9	�)��`�����Uq��d��I�������c�ڝcR�!E���J;����~ީ[�f>����08?&�۰K"r�I�Yco��4]�_����cّ��YǬ� �!Ө���3ۅ�<bK�LB�7s[%�V=���2]�C2A4���#y��<nJ��F�n�.����`�X���m��w���y+�8�C
�/����K�[�@{a" |߯d@S�Ju�;J�0�Q󒏊^@�N��E��M�4./�����󗅩y"U6-�O�O!���V ��l�ɲ&�p�Z�2v�HMӡ���htdKxy��<J����<`5����Nf0+�Mf�ݴ��ބ�PΤ�#��ծ�l̴"d��1�Rq�����8�{<��Ѧ�7gZ(�C��B]�X�\�Ɠn/2�CE�R:�q�W�%���,et�����Ջ�!{p<����i���rÜ}���V9 h'ϖ�-�83iW�\#K(ik�S��Vl<���1��a,3=����H���^YR�3!��عd�j&l��o��"r�Ҥ��
vǠ��^���Ձ1>�U�!{]CQdKQ_¿[<%u�|p$�)���l�p��jt��|YVk"ITj���N�tZ&��ڣ!ÝU�^}m����c�R�G}�ȵ��\t���!�hM2��K'�E����k>�P�Q>Pl������	�2V�]�n<�r��.C�\���,L�|A��ЪS�T:8��!��.�ܪ�z,~�"�E:�6�Ω%�I=�Av�r@��q�0��E��0��I���%�E�BR��'Ȯl�]?_�k�>�8�)����|���d{�Τ��ɵ�I��X隐Q�����V}!�Z��Zn�x�Q�^K���a�]��B���d5�S�\�7 C�~t��bi!�fh ���0BJTj�|��5?!АMo�GW��sX��𫹪ט�����B�P�����`�7`��C��[hcǪ��5}t!_��:a�;�ֳ:�w��.�E#ڕ��!�Fg�bH& vuq�����C*��~x`B��+��h[@�&P����d~��zu�n
*�.W��8��>1*��FY�q�O�|�    #2M�]m��3�N����&z�C��!��1D:1� zT�?cO/�m�w���Q�M&��"�Mk� �	 ��(v��W� ���래NtX��;���m8u��V�c2��t�;�e]G��(��H���(g�6]�ɫԈ$2k�sr[�aXtO}�Gf0�{��yD'VJ��һ�F�79���W�o�{\��i�����"zm?�z����T%��5Q�0Τ�������@��@=]�0�jj���z�ʝ �)�d����;��cc�����࠻ݵ����h7x̐��R`�6�fݱ�=�0�FL
���~b�W�j��`����gEz�E��4��u`<��o�C�j�C���aŘ�3+L��֮i�
R m���>G�(I��M�����+�Ш&")%��M'y��&�F.n}V��^�F�ku:lr,\�7�ߤ'�������b���q�fo�A���	I�5�����۶ކ�inў�
�T}u���E���j|f�B��]�-8�G첹{�*��{������D�'�W)!#�C��÷�/d�x��D"�"���>Ҫ�N=	N���D�<�_YM���?ʁb������t�Ë.��F ��'<\j��2c��������x��*�����x#7���������q���o҃{/��!c�l��F�"���Ez��1����F,C:�u9�=�yd�����z�
�]O�߲��uy�?v�blyk�P�r�x���(, �>#cיD��!��3�Ht7&��� F���>�vp��� 4~�(ć����^�V�Z�}��ю��*�;IAt���͛$�D,�2��K=�Ȅ�}q��䑪ӫ"ӡ���浢��2}@��]��������V$�b~�P�yN�^�vR���|��f�3%s���_ϩ�0Y�G��ٜԄ�=L������CF�t�|���>�4���1C�7��&++�aa���C�l�����xh�o�޻��K� �:�;|��]�2r�����t��8��Ns^�^�+r}H��2�Hщ�V��Q"&�Z̵�b�F!��Rm
�'��8(���j�,�UuW�)!4�l�������O���0a�(���`�i[':��n����̐���K�b��4��s�wڄ02�c_Fw*�r��^@p4��U	��@�*�p�#���*4p0`�l�Ȥ|�G(��6#�Bq[0��O�1<�cй@*�T�>̤��B��D,.K�EJ�^d�hK��Fx�X
�{���aoe[R	V�#�U�$"�c��\O����L���>(��+��#�>�]h�Tu�1$P��u'����eR)�3c�u��~h�C�[4!:���"�?T���*��G��z��_����Ѻe���UY��E'�%+�k-~A����H�
��ΒY��_����R�T�B1�C1���1U6��K�)6.2D-hi叧��6� .��\NV�Ga�29K�b���B�1�V�s�3��U�cX�)�[�����b�[��]V���=�6W�]�_�ħ��7)G)M����wP���P���p�s�f�����B��NZY�IEO�I��U`��<�M�z�����,`��s�(oե��c�(mB,�[��>0��״ ��t¨�ގ�	�e:F�b:	�0f#��.^��0��\i�ꊖ�>�֣�zf@�vl�u���{79G�:����eO��
�f���2����~�w���dhboגc�\�s��n���F7e������)Zچ���]��$�HW1���m�x���Ӿc�b��Z�W7�Ԉ�ԙXW�`�hrE��:�P��K���KN�]��;�7�
n)$�7�R��l���v�U0����_g���L�)�ܒ ����N�I���6c�c2	������s�2Qg���.�����D���Evs�Zt2Ԇ]�,��Il���0�F��-�L*Q�"��\n`����:�Z�!��y�_�M�L zɐ!gܯ%,[�҅�P*��k���a���!y�tG�Ӄ$�������8+!��#��u��������^#��Dk����+1�S��u���T=�)����3W���sMӅ��o���1#LJ�e"�������}W֜�ɒ�LB��q�P��|F�F�ݝ���m��<����c����)<�9t��v�(��X�5��	S��W�Fj�+�|���
cb͚���h���v�n5K�y��g熼�!R����m�<�	�Z���>����4��,w�ƾ��s'����ӣ���𘍝����<l���>��Lqs�E��AJ�`�ͩ�qIT�{����&�d�Do���Yc�<NkT�K�g�{+��0��J�I�T |��&ڧ�z}l�4IUP�n�Gf��nM8��-���Pv*�8�:��.L{ߐ�q�1� y��rZ>_�Io�M�z-%�ip�$�N�	��
�Ht�x���P��tK�a��,�e�5�6�Q�.�����Oe�>�ז2a��pn�-�!�8i킹�=�]N��ay�Ǥ�Q�<�~�v9�$c��*�ӠBH\И����u~�����QO���V�R@0̃�R�|�;�b���L���S(��`oj�V�F�7�C�m�r�=E�Y�`�3"d(�@v��XQ�$����t��$�z��*[�ƭC���&�X�$g��O[!�M*f�eԾ��]p�4�߉�[���sV��53C-��,�9:�N��Ol��#@"z��zI}�����f�*I�(<?0.8��������E��������B��tr[O�W�L�"N^b��Vx�!�Q��2�����/�feN#���u�]�+�
<� A���뜫+y�R����h
���JV>i�%|2�B���Q'�(���C�]�>��H��1U�Ɍ��\Y�����G����� ����)��^ݓ�A��ĳY߁�Pl� ��c�� >
�CϽ�ʹ8�P�F/	�~��QF"��p��?M������S3Fs�P�=q}��N1.S�MHٔҮ���h^^�Y���qIE?һ���������C�!�($�vylF}�f����;����k�Opږ�x��?� ��X^�Ìez�M֣���=���FNN|���8�����ظK�+)8l�x]�&�U&��^������.��`
���_��(H�]aU����ݓ�O�b��nd0'�!�uf�s�J%wRǑ	Y�>"�ڬ�(�c`s�S6�ɉ�{ڍ�R��U�~��L����,�%<���4mW_ϻ�VN&�y�<^�(X澊��/%z��X'li�����m�1��<��DAc���x��
d��+�d��gUOl/dr,A��k��<H=|Χ��t6�q# ��
ҿ� ���4�6n-�ʩ�,쭲Dֶ;��U�i��*x�Q�A3%53j5�m-���_vN�����b�$^��ҝ."w�WnTW�7˺>��.e0Ѓ�1�Z�xe����C����'}lYA<mBx�����k��mD�6���l�	�����4E�6S;��I��Y W@V�s����dD��y�<�4;Z1r���l��	A�C��N��/�]F�dd�7Zȿ0hI����WҼ,1fuUQ,��N���صI*�u��JI�rUm�W��9�z� �6���/s��%$W�D�����jj��Ka4�l��Ms����0g���-g�Y��g�wZ����V%h=�S�ӭ���@)�(Ǧ���y���b��F�^�D�z��m��I����Uc����߂<�fٱj�Ne��.��r��P���tXȨ�Vu��wĕ�7����5c�J���vft�
+�*���b/T�PsR����g�.�/�iK��t1��$>��L���桭\_@;��ێ؆m���{3��g�W�=�',�u�X5]�Ab�`Ӿ��2>���VQ�g�|VX���%==�eѾ�a#ۆ'h��YkBd�g�v�1��]��WQ�Mf��:�D�ϱ 1C���6�mV8�����Í��.�=�ᆶ���>p�H�    �>��J�ZD�gZ��S�`�ͷ�����h����d��vUÇ
�}d����Ֆd������1~=��Ԛ��z��Sp+l�>2w������R�������wr�F���i �]�hZ)�'b����l���|9���A������CH��X�jd0�
���0���`�fӦ菲�?��GxQ3�Sl�pl��U�|�B~_�ם/q����L
�FR����FZ� �푇�i2��-f�_g)Ѻ҆Q���+�\Q�<��(�̓���^&r���CN)���p�~�:�D]3��	h]�������@�#�Uը+ow��!�����sy�f�j�"���`2y���	D�I�a�e�C4�
H�2|Z}؟�e�v��V=L��}֏Z�ඒ���t.��'����h!=1!�1�����7�H~�m�a{�r�n��	N笷���՜o������0�X&L=�6����c�T��y\���ZV7'u�310\��譿e�(L~]TKP}E���P�G���g�� #z�@�>$k�I�a�s\*�A�6�g�i�_ҘF��g�c�ܤ��[���h���0(�ڇ�!���+�]�-���g�^i�;�W��􅰉bA-�@D*��DI��3����_[zD$}�=(}-�c�
$q�S pJ�&�C�dA5a�a��|}�;�A�g(jAv��]�L�&R�S����=Z뛠�ܯ��R9����8����k��A`�<�6~��½�Q����WQr�^+�z �:��3�D���fW���6"cd��
M%���{Q�ª->0Ѿ= �~N?���.^���7��%/���'u{/�ੵOӯz:y�&����/�奚d��{I��k�57�T�P�>.���9<T�Q�1j�5�78�?� �K�%՚�m�e�j
q��x�$r@; i4$�>B���	G���1�����TNϊY�o�96��a�L*�U��e��x<��4���#��,�DsA%%{A��,���p�u��L�(z��Yb�����V?�$�i�-]�$�v�Uۿb������?��rȠ��{����o�w��|�e��s�~�M2Z5!R�w#����T�}~LZ��E�ͬ iX���F��?�^���6(4R��oA������p��ku.;MF��ߑ!7F@;�o!�&���s�͏ʝ�L$u��4��� *[;�/w4m�d��l;�UA�R�DH �t��q�Վ�oA�9��y '�￸�Z�]쨂�f�����Wa��+鍫����a��� �g�[�M����>a�d���|�����W����)%ޫ�A8Ax�>��lt`^��?KG�z��.�{!��mCv��|���Pol۠��%@}t�6��y'%�>BvY�G��0�ӑ��z��MoZ��=�J$����n�ޒDKj��mI�aow��M����o�4z�Q��W8]���
it�#��3�Ѓ+���1i)`�0��an�.L/�E��mG_7�\ �����S��V	%�h���+���������4&�z��M�gO��q��Z'K4�TX���� @��E��)�����Սt>�L��X0+�0� �]\o����
����"��a�i�і���dIF�6�
yB׵���(9_%��|���O����B�q�3��>$�v����xL���`��|�F%�˧PSc"�T�r;�����`��;�L�)���L�)|�*�Է9�8تgXl˟���(ë��3G�<F� �9��:�қ1*q3��ּ�>+���D6����ة���� 2��΀��F>+p��������
�Ƨz�ѯ�v�����������4	w �wmS�XM�m~��#�@��βh-��#���_��,���ОFp���Y��K����Z���ĉ�Mr��B�B������2~�)aWő��� L.q�D�xZ�oG��� ��v0��S5��Yck��D�'<7����!�����z���4ſ��S%��ʌ�oe��<G�Q���oe�}�eV���rN�TTL&]"�%�Ա.crx7�@�T8~Y &oش�u��@�62�����/���FkP��D2�{]�>��A�Ѻ>u��:I�wtℊ����>�g�P�
6ٮg�Kk�Qv���U�p��"$�0�G�3#D-�x"4���
#�� J���؛�}�xO� �2v�R2p5����Vfc"3,�{������_ٺ�g騇x'����,�Iy�x�u"�����X���2'���������˭Ѽ�:���ԑc5���{��R�5�zݒ�nL	�&d�ę�h�e�~��I�C�~�SU�V�P���6џ��@Q����z�a5r�`6��R�O�q�9L����:l���u? �$<�lh��% 9�l%��,�q؃#�!h�T��$�A�j-�X��n�/:��Bb7ҋ\0�ʉ�d�P�zA� �r�T�=e���;n��V�H-�.h[����\|����"��ܪ1"�<���� [��bn{U���r(�H�B�)���7�ޅ(�N�����޿��Y���wYnh�:p:쀦�5�Ll�R|'��:��jx�R	�#�̙k�z�d5��2�����xE�E�̰��vY&��zV�Z�ƅ��S:}RmG��.0�����GB�����N������\��>�&Ç���g��x�j�c�
$GxJ��P��y�J�6I������,YQ㓧��j��С��S	�
,�t�R�(l�!v��c��{�|=.�t��R�y�����}��Dr(6�~��V�H�jDs�e]�1 ���z���T)����>��V�n͒q@݁Ǧшu��]�V����ƍ��L�!��/��[����k[�C�ooRy��0�~N��4d�Y�"�T�EpȒ���[SU�Y�,1�Xf����W*�=�	�S����P��E�������Pp��͖2���m{i�EI���U(@�1'� �gA��q���|i�1�w� P�p�/�.�u�B4�U�"K����4�B|]hr镌O��6nT�-�MRP!�%�e�E��$I�
B������wm��4X�؎�Y��ۉ�"G��%��@��,�C�2wm�T�p�`P��#��$h��� ��Xn@>J�yj�H����5&�ٶ�T%!)���!he	��xv�y�f���Ƥ.�IFل��JK0�x5�)�F�!���}�_��d(����;/q�W�4��V!�<���o�1�!cN�Fy$D���YM1/VM��A���ߩ�D�ʶ�+�7�H�\�}�r,Y��~���a��F�M���Y��5SqK�j����%Q�_&'Ƌ���J %s�Y����R�+��pt��ZBUK���޺jJ��]�ʟ�n��/,�����Q4J���b�L�K�3#3�������r+c�x�f~��c���3���/.@��˸P��x���sr�*�ﳤi��YN�������B���.}o������i?�
&)L� 8�k�����~���3S�-���.��(U�Y#�H�����()i��#`n�� ��
��/�z(��58f�[fj��3���^^_�(ZRN�%���;م�s[8�B?��B���{p�Z�N#pf5;Æ(ݒ�J���C���L��q#h�ܗ�ͩ�X1�V4�R��p�
�e���Y+�f]�ǲ�^��FMWG�<�Iϣf�ț�tW���)�ގ���؂�b�ʚ?qƀ��^Mw!4)��8�{�{��"r�g���`#/��>]W��TC9���|*ҫ7�m���<���sV�����m�l�u��WN��h7xSr�r�L��gLeR�ɕKSTΧ�,�/�	��"�=�q�Q&^DY=�8d���t� a�U�QI �E�L��O�!(Z���z@��U���Eߟɠ����u롕U2�yM`��?�A�eNJpo`������~3�	���� �챋CӢ�Uás3���g����'�66)���-������DBy� n�nU�P�q6����}�X%p�X�x,�M����K�ʛl�@    QXG@DI�iқN�e��%�����[ڔ���m%}�����+��)�*�:W?CW�!8ǻw��D�󋖅ї�b2Jg_�������9�w�RYr�W�đO�k�[�Eg}������Od���B�O�5)�f�<)CS���C�m�J�}P|�2)�hRl�R��F4�]�\*ڬ�\7�N0�y V�%�U��&x�7	a�$��&VJv���B"���_
�����~yl:�.t�l(�!=/��5)�@*bm���օ���Va���J�!�������<u63��ᖔ*�����!��T	l�~���?�QZ�(�3ʰ$���#'oRϾo��&�C��Ո@�V�YiI���uKѬ?6*�Bo�byw��Uu���tx��O%�m-��;���Q?����Ɗ �$��;4Q5�s�k{Z�&c@F���M�0Xm�p��z��r�h�L9R��k�;�$t�P�7�jZ�4��,a���
�;9@�ys��פBa��E.S���(n���`B�x���pNMnj{�)C@.�pm$p��N�#)��N�L�FQ��	�
D��z�pu,H��N]Su�(?�-�Ȧ<��ȸ����Q� �^�Z�F��H�IZ����]be*3�P�r�l�Aѕ�*�$z�2�&sW��~Z���d�s��'BC �a�����0�mmf� O��$H]�P~�����:��ށ�.ys��#�V�v�i�vLv���+,)'�&u�Q��\`ؕ��fZ<���m��1V�Rݏ��F��&�SY�!f2�V�*u.�J����ڜd���]NmJ&�7e��?�Ye����:����ф�Ye䄡]+�zj�W«X�����d�9[L���e`5+�5W?���jՓ�&c6ʿ��_�O�#�B+mR��
:���+�����=�ܭ��ca� Zr/��7��u�Ru$6v̦?NڴD$$���nQwxE�"�?u~
?�֒��԰���<O<��$�;u�IH4~\���W:y�qJ۶.54;���kߙ���)y�F���$,��@i,1��/��˒xQg
��a�������I� �M�e�&.kQ�({��q�?}! �c�`<� m!J=e~$�T�p���(�pk�m(
�zH��_�a�l�^ ��5;�)DLg{��ߋ���
���ȉ�{��E&3�����M OoyhF��l7!�&� ���ۉ�����*d5��L�3�T͸8�����x!��=�33�8�cu\��y44������b@L�7��t��.ɡ���p��%�5��Xd�s�j
"P (�1r�ǕY�7�Ǯ��D	ԁ*����&KI:��@o��1������p�j��i�[@f$��I1���u�J���̑1P�1-|W��*V��3c?���29�yp���
��Y^�Fж6�p��?��3�ߪD�ކ�f�)r�"	g]�L�.�yȕ_I��"BV��Lߘ�gB�һ j|��w�A�Ө�4���8��CN.V�R���+K�4�4�d��*��#V��cƪ��[I��T�� �@�2� �U-��ˣ��"�
�	�u��g�����f�~@_�d�ևO�ƴ�1�~5�I/�	��Xm�Y�LI��D(���E�J�%C8��|����9w�6�4��{�>�b$�s����hn>=n��Xrp�L�%���'�X��ߌ!�W��
���ϳ�_P�����I�+��p'\9I�Z�⅞dS�N�~_h��+�R�~KB������1A�f��F�8=sY�����g0m)���!i�	ɞb��Q�2��){�R�^h�t���Q
��I��w��3񡊍6IГyJ�!��H	i4��LcY�j`�Ӥ.�J�3��I�����e�4� 7<�&Օyg~[��KrUS�V8�gy���GI���HTI7;�oK[�M��4���udߴ���Q��������Hh�PpՁy뭠��nC�,�i�W�꜔ɢ���kDGOcBa��J����ͤ������U��0�3�k��y��?g�ߎv�& �m=k�~����H�Z�S�V���0�hу��[��_�7�NBl`{P�[�p[�v$C[�6l���2��6A:�~�7��k��M.jO�Ѱ�'���ZD���#	U�$���H���>��qj[n�x�}��
�OVL���X��Y��dr��JZ�=N�0�F�F�T�2�s7�����^UȔ� �s���;�@K��šsr���ΐ�Sy���i ���I��/���5#��:���*He<�>C�Ȣ�
Q�4]����8z��f���t[�
$1�9��g�-��K�F����������~�24?���z �4��:Y���!T�V�5$R*19�O�X�2!�8~(n8Ǥl��
X
�/�5��D�$c�e��A�r���J�(�bcO�BՄJpE�Pd����H3*Y��r����l�.>%����t��Yao-�ƢH���g=m�I����ޣW�{��po�^�M�Z�+��nBy�er9�W�7�m����$�dҗh�����_c.�>0�6��|(��(����=Y���Զ��&�~>1�벪�F:]���Ī2�M��<��1��_�A?(�j�:���Gh�r]&��~����{A��%��ň@!�Q{z7�&8��K:h�T9�������O�c���*������Ҳ�=2�G��T1u&�i⼼��?pJB[�+$��9��Cjl��T�ɋW\���>��UG��L��*���O��}�|#E��kҤ�N���Qm]v����RE�hC���
���r>��İ�]���n�U`(i�U������^�Y��4��b�xн	t�i�^�"�h<(��+BNh��=І����� �.�q0�P�©��|د�jde�&�$�Y�T�&���]�YR,Hp�Y><����^;�U\"Hy���A��&]����5a���ԝ�%��$�CW�3��t�_[�g�@�m^^O�?d�Y#��能��	�g�@��b��m�U��A��x[��$z�NK�$n	K�Դ�����F�X��m�n��S����Q��l5DN]�1y��"�W�b��(l �aOp���Ku@�`w����e& �w_�Kp*�mr<NM�0�������^�\���[�e�LP�B)�?�.l��}�/М�h�$4��BtF9���d�808t��]��ڦ��9�������'�&��Q�S�3�S\�gTÑ�����#\��1IO3�,5�\�Oq�Qi��0�zݺTV0������>�Q[��"tK�Y�é��6��IH�ܸ%\s����n����u�di��h�G�*�~˛��1Ĥ V��R�����������f;[tI3x�ےM��� ԑ5���5�=h��Ţ�`e�����,�*I��P��z����D�0�Ȩsc�"�}+&g$�%���ڨ��b���z�( Y,�g��ú���Apz,���jF$�����R�s��&.����y�h�,] F�r�BqgXU�ޝY��f�X�j0*�f8/@<�=��>�{LG4�Ё����T���ç�5õ�M��(�'��ZǰV�X�;���8��̚N���:c�_>�;�l�i����
i��܏.���QĲ ���v�J�r�E��18����9��f��rX1a"�xJ�	�ñ<f���t���(�5�S$u��D�a����Ef���V��|y�f�4ߡQ��Why���O�>i��Ʀ��0�,�ߢW�����e�����&�����G������x����}�)�7qyFw�/V�
�O^p3ưm&�1����B\8����tkB)���M,Î�C����a�/<��wY��?`���Xk�U�փ�1'�-�6v	�9v����ր��ru���S �>W��ޝ4V�+<`B��ϫV9|��-I�h窇4=_���W�E$3����L�O��9�N'�+��ѻ�"IJ�Z0�c�*=�}��4R(���)���MH;O�&��!�Ӹ\��d���a0[���Yހ���E�li��n�����C��L3,5l��L��<�lU�a    �����:��J~�b(�;u O�Q�(յ�A�<r�S庶
���q�<�یE����fR�J-T�T��H���l�+��X�bqu� � �w�o���$L	�:_�D�#��:.Ɠv�>S�*R���zD#Bu � I�����]�1��va�_/ˍj{HNT$y	�!�W#1Oc�����Ҏ��ɉ��0������޽L�ԙ(>��[u�pq�v8���\S�Ǧ��M��s���E8���ߑv� �O����  �h��ؗNvIa�Nے���/�d掻��Z\�os�H�3)d�Z��5^]H�d�����o�~��XHg��ɭ�A%Z�!k�;M��M���
��U�SѹlQ.\���4�B�0�K%R�K�� �@7��ST�"cRI���e�{�v��(�Ke��"�{�3+�^�"�<H`�ҬON>�r�/O
����!�wdl@�UM�;b��iۧƐ���d/ӽ�	N}]�c�"'���E8�4j ��\�`	�����M�gHk@�g�ry,��$fDW��=�� >�!��l*Tyj��뎪��f�aUA�����6b�6d��o��Y�>+�[���R)3�U���8����á,Mˇ��5�&,��,�"�Y6wJ?���o��s6��P�Ч=,�+>�A}�׿��2^��:K@ifu���$��I�m�<(�
�q��o��zf5�Y�����Z�I�A)]�f�,����핤��G�H��<��D�h;G���`7���빾��,�LkŢ��*�IQu��Y�s؃i�"��k]\�ų�K_�؛=7@�6����E�Z����+����U���\dJy��Q|CgCY�?_1I����|��h4/9��,u�kԙ �Q3�ʹQ�[����_�T�8EZ��Xa������2��{�m[�r��rV����jv"y�s��< !�.�!���������W޶��.~�-�c5���X��A��lM�X��$0C3�'�|v_�P��^�c�8զ�4����U��|�^79D����.���dE۰�� 0�/���8U��=�m��[�Xuf�� 3_�l��_)V�w��=�=��NC#	b���9�ޯ���G�=���E�>��e1��D��3ׄ5zs
�:��G�����;`�Ogz&q^?��^���P��������� �,�1�\\��UG�a�KC��KdM/k��mU#��(�4�]ˮ�)@W��.uA[9 ��
ȏn�Ǚ�a,AN �3�]=���?��:s��q��W=Jb��=/b�Ma֩��vHj�Fv����v
��T�T4�R�cr��QΤ����om7؆�੗}�rgC�ӫ�H<,^Iw��\	�$���6����@
��j�}"�Ds��m�:&ȅ��i����S�r� ���G�9�=�Z2���_���(�zX����Mg���0����!��\�N��)�HDI���3���F˙P O��kU���#Ѧ�2Rf��%f���9O8��-	�Ês��[��� ��Z�i��9�PU�(+]*�I��$E�������2we��(�i�7��v~ͪذ��!�J��ԩКL)��p���K��3������LL�j5�NrLEC�R����r�A�Xbh�-Ǉtd�W�dc����5PF���ɹ�2�`��E�48$Y2t�-��	ndAG����=��v0t���*I��8�P�Rp��|�;��� ���o@sh�U���f��y�P�D�<N���@z�����^�3�D���d��=h��i���&��ZES�z�y���H�8�� �������
&!�]�b��W�ҟ�ۃ�*�
��	Ҍ�y �Y�JL��Sg���&vℂ
d��h�.7�D��N��lBy���A�t����F�::F�8����\�f.��~�u�`jF_,ҿ�� *�8{�wͬx��1���\�d�Q*��Y�0%_�SF�[=�0����ǥ^A`0.%_��ԝ�g�F~ME��#[��h�v�4fK�ֱ#��e��Sq��`�E���~r�a�K��eq�8�r��h((T�&ja�Z.�.ڡ>k�~*��gE�5��Rh�ī����o
z}�?N�۲�ࡷ%5���||�g	���f������C pB{e^(�Dׇ�,2��DP
y����lY�a���_�+0�Uw�A�� ����dO����E8��N��~�5њ�� He�>����t�F�Ы�	�׷�v��%Q	W����
M�H�B~�su*���)	�F��B*Y�������Iq��VMS��`��u��{Z��ަG�x���U��_�ȥ�:Es��~��w3[5is��G\gju�57Y>݆~S�@�Tv�Y=�DrJ�w�ǲ��� �""CE'�>N�r��*�ѡ/'� fu���
����t�8�e��N�8ky?� �*�$ ���C.Jy��t�d�*,Ao"� �jp�ʔ�eTڢ[f (�ʬ��Mg�Z�c��D��J�s��0�.I�p3ދ:��4x�KQ��ap�xYŽ�F�4��"}���'\1��aUn��]$`R��t����([��XW� ��Ք>�U�v���f,}&ģh��*F>_�� Qx�X���d��]ld2r�H9tˋ3�ב�S�
)Gڜ;< .tI��)�0Q�(��iF��S�t�����q¹�;����yz�8?����g4���:��yt�B �>����ﮭ�uc"h&�dR��4��޿f��,KYe�uǣA�ap��x�*�e�}d)b��9��&�!8vmo�a�j������L6��ˋF��D�i�H��"s��P#;9|m,���@��v&�U��� �>�v%���ff>�����hu�!�!�(�^[�P��o��M�^�_���-��ʹ�L(dSq�K�vX'�ѹ҈hU9׀��cz{��6J!��K
�����z���ɽ־g�'[��y�n������^;� �a��!{���Ҧz}�pmx8����a}�L=$���!��A\����}T������b��b�%�W���HywX��<ނf 7J�?%,��7�|����׎�9c�9@����Uؾ��[8�b�X"��S^T�%�89-#,@FE:�-�#����d�*�)�;D$�Y Ŝ��u�-r�����ky��3���exJ�w~3L��_'�+�j�)�یs���D����`V��Zmgv��T1�%�@�y;��u�nv��X��&<x|���jV�O�<��{Ē��X�9Џ�G	ܻ.�+�gWp�����	��{��q�^�<��WgX�&�@������p�@����D��a��%�#���g�"$�7�V7�ȳh�_�����A+�O� �~9 t\��Ơ~`���}:����b��K�<����h��_���֕$G���x�^0V��I��z������3�����&�c��� �
�*���Hw	�4�b�L\v�aTv ������!�d#].@�[�zo(V��������39�Q����!�(u�z�ŅM������w<�`O�cd}-��/p�'������K�wd����!��F�9�I�'�Ve:��������1�׷��!�e�t�V��>�m� �2GQA�J�J+ɩ$A����=]UL�Vb�69ݽ�$��zpdrI��ˋ�G��!����R�v�[��L
���G�����[�w@V�P�u���V'�h����l�n"�;� Ⱥ��Ɯ������F"�c�Ҭj0N������*\��d�F���U�	�|�:�^`)��*!�H����Ȧn���������^�:Ivj��A�sоOF�zKf�إ�>(��;��5����a_c ��g:`��Y\#J�_� P��,��]���/�%�S�p%��� �����֫��R.3�x�<4P���g=)_�����5�;c@ ~'9:��Ł�J��xh�-?�cH���Ɗ6ί�b�� �y��%� w�zn'����&��s�?�k63 ���=�e �  w�}�IJ�st�d8a��iK�%�M�_��D0��Q��I~����)�:�w�3��.&��� |�1-�-p�A���z��B����zym�8qpX�
��!L��"]��F��1�G]YQmv��g=�h=�~YH�4\��|^�#/�)\�\"1��}l���襸0���$�z>Ɩ\��-4���W�q���dd��F����M&ȥ)�B��O�B2�����8��vG�q���ґg��Y�"�߉ڐ�J�Dp�9��P�iY$�)҃#�ݜ�4�2T��k�T�ǀ�^�2I�e؊���$�n��d &.a�d����������9K��3ɤZ�=���ߚ�k)���	8uB�|9(�bA٪jJm����iV�0ǝ(��_���I���b6�#�_��m�k%��m4��ŢO��r!���ꕥ`�pg�#zm�>޶]�t*�D4DΖ�2���D�*��n�@S�Ou}�?�%�E�$�[ր\�GYe���8_�3u"z�@�����< �4,S����B��'@v|�����������&ipc~[��	 ��
G���7�N�9�7�.[~5�X���I���FZ�f��M��:��F#O�}�� �9���P�����4��n�w�x��i�i1���R�%E��^Y��^�v�g���M�jz���$�!@"�t��)M@A�* A��?l�	Y'"�dCh�7�Ghg&)����{"3Y�3k�u�����H;���~<
��.�@8�TJ8Ќ	�8O�|ƈ�ڹ�u����ݯ��:D�:����h��j��K ��=�T{��c/��I�}]�F+?�Z�dLލ!��d\��B�����]j�X՞�W�o��V5��z������
����CW�����&�'�	����T���/�I㬞Lrt،��sPo[��J���L��
���eb�1I�d��%��T����oy����zpuYY�o�U�5�Vz�H +<9j���R��Bɣ���>�8!Ƃ~��$B��ξ�o\h��q4�lٟ�xxn������,�����;��{0'VY���$�觚ӆ���Q���85�Ye.��T}��J�j9z�w���¯i��2�m���Q��Y�P]��{G[�U/i`r4��
&�˅��%G�u}X�w�/�zF�����x��Lz�ہ*�Z0�u�X�]ظ"h��IJ�3/��lOSbK�	bP��K$-y��K�u@�&޽�,��cZ�S��	�TW¾%t��l\K&�ƁD���q���X��J�O�'u��̋l^ܾ~+��E���t�!	K�x�Qw�K�q�$�N�cE6����k�&��`�l)9W�����Ιz|r.}�{�8��|�L[/��m�/�5������K
ۑfGŘ�e��B��$z�+\�6��а ���s Y���V2�EE�^�ɣ���nv#�0o��#����Ec�����Qd�MBRfA�v&*T�%XI` �NFh�9��M�AvH�tTdcT��R	{k1������V+9ݨtT�[?�=�ED�j=�>�R������X�>"ƪ����Æ���H��X�YE��������`���s��A*��Ӄ7�PS���0��\��yP��K�O������Ѡ
�:�@u��ʷ7V��ca�2�T�&-���c�5��R�y�~�'5������a]��{�J�[�1�C�d�]���P����-�|���?��hN=�N��~��d>�[6�~���|�����QP      "      x�u�[n�:׭�����6D�˲9HlA�����o�fU�l>A�\����K�
m5��O]�͏P���?ݸ��n�W��w�����[�(�CZW�.�F� �v�ֺ�e��6����������z�U;�@�U{IOgII/l��.'I���?C�ȭc�J*��^-�ȭ5��t�:I*�v���rkwU'l�V�vm����I��%ul%H[���P*�v���rkwV��t�RIJ����ҭˬ�:���*�z[uU������n�@�ɭ}��v�����̄�b��[��W�[�Y�3!�rkw�ҭ�VR���"�ck���[�{�=n)g�t+(b{��ʭ}P&���rC��rk٩k�tkUl����Rq�qK�50�$��ڇ-0ȭC�&)3�Y�� �����	)u&T�0�-Y0ȭe:���N�C�['UoQnN�������w)�zHRW��Qn곮�*c+)ݺ������K*�����LXW����$ׄr+1.��̄5Vb&���.26��?^%el͔ҭzWJcŚP�+�V���ck��n��Xy܊�ʭ5̒ʭu�U]el$elը_c�*��@�N�r�:]$��X�<�
�ҭ�VRׄ��̄o{I['�.�,#��Ա�AJ����D��g$�8��Y�u�TnnWI�	+I��J��B��2�oQRηv����I}�,c���V8K*�Y�CJ�*
�2�Wހ�:V��dK��5�X��2�=���,㤫�e����2��FR�u����04�8(`�2�}Y޾K9n���r�u}�Tn�� )Y�(�[{I[�MR��ER�����2]%��;I�Lx�c��eD��p}$��]0��d{a�H����H�3�H����D��k-��fq�,c��[�_�ҭ#�_$�X���G������z�R�2�x�d��z�k�e���X��e��f���t��Ƣ[oR���>��O!�2vg����P�e,`�,c_���2�N��,c���e�{�[o�.d�U#7Y��{%��_A�#Y��l�,#`!(�e�A=�,c�Lh�qְA��; �G��݅��غ �&�����2�$����~2�P�Odk�HdKO��:��Y�,c��\b�2�e��YƞW%��-j��+�k"��߰"��2ޫ�֌�YF���D���n��RϷ���2��v"��-�Y��a#y_Ɗ�3�e��b�,cwB�Ld�īz�D]�,c�+��2.�YfW��$����[2�hP>&���@��/c�:}�/�&y_�#�ߥ�+��2�Z�Nd����,c�ָW��7�,��5�e�oX�� Y�aP�"�Xf�7�2�	�2ޔ_�2��,c�PJ�4�Ld���,cEQ��2�F&��㬈���U'YƪM�,c���,�pT*6���2� ��2�A=�,cw����򾌫�,c�)�,c���2'�JT"����rk]���2���j��F"�X�Y�a"��O��,cR��e�/��dˬ�����*�oX��0d��R�F*��eU��e�j�oXo��p�>@��0i�e�Or��2�,��=GC����G���@e"�8��"2�x��I���`�5�eh�d2�XU��e,3��V�`l�xU��IuY��TNwB�}k�]��n�K��ԱU���|�Y*���r�*K]���|�ʭC]��YJ�@������f�+x��}ݫYơ�.Yʚ�}�,c'�RVJ��˅�,��	��VY>f�kB��W���2����R�֩\=��O�꿮��0�dU����oi�g���tޖ�F����"��A7Ж%Y�:Rj�q��?R��CY>f�YF9f�׷ʂ$K��@�#���s�٦����|��N�6�ם���6����O׷ a(���S#a]��(aS
O�Ƕ�ǥ}���O�>�1I�?
���ӥ3Mx��t��Y�����q��+�~��.Oݵg	Kg��^%,����I��[%,��β�닧����>��3q�e�ߜ�����cg�L��ik��wi`�*g�YZ�^��j�wȲ����d��75��č�|�*q���ʭ��a��ּE��4ȄFnM���,�[�Pn��R��7T�Tns9A�R�5]�z�ҭ��@#�楜�d)�Ra����
-���	r�ʭ4�����a�ʭy-'�Y*�fЯ,�[7LcB+��-KnM[u�Vn�g�V+�ƫ"��[#���ԱUB�,e&ܠ~
�3����ֈ-Y�������x��%��Q��[��ɭ��yT��[c���˭xx������<%K�V�>�˭4��t��Y*�6A�Co���{V/����������R��րMjY*��k�Ɩ�r+�冺,�[�Yn�2���[@�Y*�Ƌ����� �ֆ�	��.Qn͕F��qK��֦Q�t�YJ�El���A>ʭ��%���2��m�\�3�d�,�[*�ck��n�/�e)c�U���	��g)�ZyU�5� :!1�j��$���uE�B��G��&lQ�����a]ɭaD���[u�*cB�k�g$��b�q��-�u���<�[�|8nawL�����u�2�T�AnM[Lw�@�f^����)Y�PƒeL�l,���5Y�d,Y�<�z��2�Z�J��y���d3c�,c�AY*����Tn��b�,c�0��2҄��&ˈGJI��H�5YFj1��d�Z=�,c�1�d��2˨xU�՟�MYJ�VK��cOc��2Ơ�B�1b�=K�V������j��,c�[Yʚ�F]�e�u��,K]��e���+Yƴ�[d�*��,cުt��Pw����^�2�Y�m��m�Y�Pn�eL/�2^�4�2҈�QM����2�U�eLW���i��,#��γ,e?i4$˘��r���˂oX�
��y��,c��Y*�zlP�R��U��,CK�5Y�0i4$˘�0dӖWe&�*�eL7>����0dqX��2f����k�1�X��2�����po�{�i����n=+�2��ܵY�A�+Y���z�,c^�Xd�Yy�,c��,c#c�26�sS�e�>�zQ�&˘c�2F<V���U��4d�ˆ,���o\���J]e�4d�4d��Fc��]�Y�
��q�!˘����T�RϷ�4�����ݐel4�j�2p�^�ʭ��QC�1�u�,5ybp5�Vl�e�EiC�1]Q�5fcAC���L��e��dc��ǆ,c�Y�Y�
^Q`���^����,c�!�7d�E=�,c�Yj���1��پY�ٱ��,cVz#��7Y�����}���y��ՍY���R3xqdQ�KC�����,%y�>�,cP�7d��,cS�*n�2⺃d$���d�e�36[4ޗq-���Rf�	��!�N�ߥ^1��QC�10�el4�et�s7dӳ�8���d�fqYƦ��d�XF�}ڲݐe�[̌����-��U�Y�&� !�/ zY��� ���RY�@�2�J)�,c���2Fv���2���d3^�R�Uk��f_��"�&�a�2��,��I�E�1O�.d�&��ޡ&c�2��RY��Y�7,C��}8+K�2dY�<���2�Z�7�2d�<�}�ڕ,cƹ-Y�q��Y�,�ڒeLWۚel`lk�������	#LK�1^ܭY��RV���,uM�Z��
��eN�08[��a� �z_���~�b���n�w�Z��yVw!˘n�Z��XԮd3���rk����WL0�i�/��e�3��,c�I Y��Ȅ�YF����ˁ��Y�&I[M#�g��xגe����d��0B�zMyxP�z��<�'K�	�Ӈ�U�xϨ%�fY@���y�^�,������[�+9��Y~�R���Y�E��i�Y�*�Ӷ<��O]�������6Y�|��T��v%˘�.d���+��<B�wL>��!u��{5�x8c�Cj��<`�q��m;��wL*�!Y�t+�����2��d�wV+��26���U�NR���-���Yy�,cz�����2nl��1H��*�O��^�װ�}7u�oX�Y�<�]�26An�e��7�j�Yd�Z~v%K�v\�Ȟ���UR���H�q�a��]J�џ�MK�1^)e&�n$ul��f�YFy�|����z��{uM�J t
  ���^$��<�?�d�P~� KYe���΄[I]��%e&|V%˘n|,���4?�t�f��MV��(?8:���$)�td�)����v��6E�2���'7��� �t�AGZ �}�2plJG��y�:�k��z,��x�"懔����#ˈ�.~�d��G��e�v�Ա���}�2�Yƈ!��J���2��d)ݪ�2qG�1��g�����p�ć�UF���ք7�;��Ћ�Yƴ��<�ؖ��2 �;��ѕg�f��-� Y�0cA��f_N��/cS�X���Tn�g�sڑe�C�Y�,�JyDa�ҭ���y}#��N����,�����d�@)<>앥&O�z�g�Ŷ,���˙R�ɊE��,c�w����:!Y��O�e����2�g��c2b�ZG��y�z��;�y��2خ�	+���aR�2˸��6g����,�E���2�8�2&|c1K���#���3˸*�e��6Y�0�>/㬈�f_���;&[�߰�[߼cR~�3K�FІRW��߼c�v���Fn��hԮd�F��,cd��e���2�Z5��1Y~ǤRz#�+��f7ޫ�yR�e̫��7�2�M��y�2�2�g���Mͫz�_�E��	l�[
n��Q��|s^Ƃ�,#M��{������RΎ�W���e`cH��2Z�H�߼c�]4=�e�zm�'���Aћe����,���{���.���2*Y��2���և���9��S?�}��T�1��Q5?���(����N��Y�Iƃ��ܯk�����6Z|]s(�s�ݕ_�e��	�}�5�!��}^g)��IO�0��JJy��������G�|���(_s�S����t�uMy�����W��(Ayw^ק�Q˿n�,[���>��,[~�%�޴�H�є-ߜ�����aA{����k/��Z~�����#�[}i���[E��^�/e�QVn���_onw9��>[y��K�ң�֩=[Eǁ�^z�[��k��Ӯ�2��o7)���}���Y��9���}X�W+=?��;e�E9��<<(g�ޕ���z)K��]��e매l�ɣ�b�+�h��g)GU�'�+�eﾌ��{+�<��g_z�OQ��ãs��W%�2JY�Q�)?=�����{)��.�K}G��_����*e�Q[��C��t���}hЗ�<���H���=d`��^7(�.W)Q�]Q��Q�#������Q��\��TO��^u�QqtU+���'�ꐟRj<:++FTk׷���Q�5�i<��x�VQu]TE���!Uų�An&�u�PR7������}j��6ux�g>�ƣY�|�JOʟI��t���vb��\^s�8�����h�1n�4�<I�8J��C��o��ه��(�yTVC%���C�����k�*�GO�!C�n��(q�{�P����(�E��=�Jy����9��)��9ס�H��C�ƣ�^הG�{e�D�p�{���uY{�v�5k��a���h�i61�����P��ա֯ˣ+��P����Z�PuY3�Q����w��u����s��ΐ=�h84�Þ{�;�F]���8:��;�Y��������Y���p/�6C��h��=�3�J #� ΐ��_R��;��g���ڲ�ˣ�QJ��
j4�3�-*���T��z�V��
R:���4�u�Ru�h���j%p�G7;� �p�~�)�w��F��N��j�7E�g���.|"庭jp���;8C�O�<8C��C�r��T��5�Tg�E��~]Qܓi�g��&0�%jn+��0h~�S�Ve��3�&z���rN~�R+A�ΐ�U���f�z g�JU��rݢ<?(�F���u������.3�3��g������ځ	Q�.�V���.�û2�Z�!_��/��As��������ϰL��O�p��U�|q����VJ��S`
R*�>9��}�j����?���=q�-�������~}Q�}r�;�^=$ɣYn�X�R�\���YΈ�XUz"T�3�)5뉕<Jx�X5�)?=Z����h_�UG�rC���<ZQ	�J�0"Ī�(�%DG���})ytw�ؗ�O��uE�C����<�c�Aq4a��A��1ȣ_T*�]A��Q-�4�����'�R��Ql�Cb-��zr-�V>�<���2��h�6��hԓky���)��Փy�"�ytT���ځ�.�&e�Fi�66��I�7��I-����+�I���g�QFr�'�%�gxS�g�Gő8�U�B��_�g���^Y����vRlr?�An�3������p��C�"�3<Q�\{)�~�����n��{�Q����O)呟H,�<I�u؇1�C�9�i������6j?��aGևRs؇�NJ�z6QJу����,g�mU+�@�z�5��x��wP�������ڥ��*�H鳞� ߧ<=ȳ]E�'=�=�5�9���Ԏ�^nr���'�G�FJy�vP��m@r_����꘤�G�<"=���+�}���V�#��/�K��Z�Q���1���"v)�ӫ<J�`�_Rʣ�YJytU]�]
�t�����S9����T�N��JUb�����Uz��J �����'=��OԊ�R%��Yy�T	�B��r�.���v��B���K!�`��VW_G��ad�T�iV����3���\��8�DONڥp���������?V��         �  x�UQK�1]�O� ����$�DBB��Jw��]��ni�V���QΆ�����ʚ�q�kj����3鏰r���&GJ7Lxa�����ou��z�1�������&�P@�7�n��'��#OI�������L�7]]w֩�E*L�`����W�aeţwֹ^����q���	qƻ?�7u[���i����x\�����SK����ƙ��GZ��T�Z�|g��b���J���o*T�*�
��V}�5�%�~�Y!n!W֛�3�Q�O���$}(50��a�-̘�)'7�e���˽�J��=B��J#F� ,�� ����+��7�U�zQBN��}���k�z�[�I���� KT}g�z0F=��h,!>x�/YX��������2Ƿ         �   x�M�͊�0���׫8��/MF�Ո	�'X+8̦�,���̠Wo�/��0�Sߞ~�KG�K���SV쎟��Ԣ!������>�5`!DI�����+�˪ڂ�+rr��X���4ޙߙB¯��@�(}Bn�C?�p]h}ۡf���2�i�[��8!�I����j�Q��%Ir��9c      (      x��]md�	�ݳ��Q��Md��u���zZ��9�$)ڧ���O�Pc�C��E��Oo�2��B
c�����'ʿ�������D��)�ԆD�=d)���V��cI�j��1��j��ƈC���#�!!C�N���t�U)>��2���{����p�7dHVH��� ��*5�D��4��<�Ͽ���~N�D���2��%b�� Q�z�C�2W�a3�|�	9�^6�4� �IJD2�8P�����G�n��B!oU+|D�;��.�L��k;�V���t�(�M�K�kO7 N�T+p�5�T�TMC�w]�+�,����4����x޴��d������%��cӆ��2B�M� �<T�J����I@��>�M��1#	X���$����s �l[�s1�������_�d&��'��v�<s.���r���}���Jb����=�t�'`�n��ؠ��#��c�Sm?>� ��w�`�0G��J��v�d �y�/��# �L��@.-��~`���OakK�#Գۜ$ì
9�<�\�&��v����8h���7p�s�ܠW���O���:;֜ł�V��u	Ä�n��'�e`圾��@�$S�3Ǜ�2�.4F�˽ټ� /�G���y ^�����lu�I��ة�7T  ��oz��g ^qj�)��H�@�`'�Jg 3/���"�8m�����g]�Ne ^fq�s>�Sޕla�D+gS��vuW2�V/�e�]3tJ̦@p\'�]��������_E���G�ڠQz������V� ���cVz �����/�� m�`b˛��VI�?'��$�����J�qq�"@� ����nz�}>�c�ʇ���L�[���Yܒt�0�u�QB�L�[�+��h�)�>��>F)D�Q*��~�
����C�2�B��R���Y���$�;����"@��D���
��@?�2<�������,Q(7�o�������
�{�h�v����m.���PR�|[�!����7([��C)�S��D��]�c؋|V�1DƮ�Ѯ�d��!">�F��E
D�ie1�a��1>��U��^E#��@���#`ȷ�1�C^��|��k�`�}&ЁzLC@1: 󈃴P�3u� n�DG�r>�G ���I����68Y%��, �e�r�C}��	������F�Y��$qW���� pNX���B@Y'��V�����1 ��Fˑ�� �i�_@�0��R�9� ��Z�(^{��I�b Щ��K}'1��s%3���� �����u���+x.�=�|�J��W1��Y�SϞ%@�5���)���E�������6����F���2��=I s�|����%���F�1�ޓ��60��#ix{� � �j�U/x��S�B��,ӏ�1�9�+H\�\c�q$ �H��k�<zT"�,��1/9_�4\��R˼��p�GLY�E����r4��HD�C�0gü���%�c	`�r*��1^���HHѿ$p��0i��p�1�9�hqA+���å�ȷڪd	ب�� ��2���"����a���.�̕����嫀9�+���	`��$ղV/	`���.}�:Nw`��qW�����H�{�I�}%J�~�P2�(@�<����1I��k%�1$F["`��gzo�_�D\+NY�/s� �eP byegWD\+�#��/�%��F��U�[0u\-���� ��*�%�{�c}���-���EqmPX��[�ES&&5��k�9jJ�̜DPq�ڲ�v��4pq��}GR'M�, R6�"�֐��v��&!��@)j��:�UX���h2��k��ܣ�
m!����IF��+0r���g�C��W�ȃ�k-8�I�Ҕ��^� �pf��e.��� �DF���]@/�g�J�棜� �N�1���I� �淑 �O:b���zʱ(����˵��)��M[@̵?>*�#|'�^�5��(��b�/�}`z����,��)���V��kI���B���Y�wX�̲uwd�,�������`�Z��Nr�;��Q�~;_i��V/�����}�A̵��V��Q�/׺+�ļ�|�Yc@�u�-�B�ͅ��\:$�x?��e ��`����n�22~��^vץ�D��s=I;��<0s=��^f/�x�!����������!�v�}�}�LsO���e*d|��P.�\��+>��q�|I }�-_��/s� =��PYq]���G����u�@�9�o�{���+X�>X:q��>��e�>Z$/*V�n�f	`���[�(�䇀�� ������>;��Ñm	����ˀ}�����8{`�<q��g|ү֮��E�Ʈ�H`��_���͟�d���4�n=[�q'�v�dIQ��{m���O��ۑ	�]ܝ�u�K�Y�{ҙʴ��I��.fڠ�Z3�O8��d�������5� D}��`�:�ח��x��N`�:9���������4^��:
�'��Y����&Dfc��4ٿ��m�%�x}\[�J�M�a�C�ih�Mw>���N~'#�h�x=	\^�T42�g�����E11}���N��:{�8��S?����#^o?2g�?8զ<�ɇI����E#�"���>����g_4���#M��2��������8 >�����4��n��3v���V����<�x$0z=���Cy%:�L���q��������dJ��:��Fb�/~[��s�Ȁ��%0z=?�I�퓲�q��sz�߾�{>�hg:g�%0z��TcY�K4���u�H#���3�J�Tco�`�z���̇%�z��Ç��JO�����4"�=:��!	M(�#�<��`/�����x��7�	��̐�}����H���YhDi����n ��Kv��(�u|_����}:g�d��ɖI�K֛�|_��s(�x����u�[���u���՝�Ri��L�
	�_����W/�_��mZh�c|[�~}pxr>���&l���:��j��|��8�w���/���-���ί��ݦ�y��X�����,9���֯7v[��4~�x��92]��9�K`�:̳9;o��	�_o#�F��z˖�m`�5W�|���mxs��.�D��l^=r.{�_�}�H���ҙ�R0~p�1�J�g�_G�i.E߳��j����2]w
8�.�k)U�����OTDIS�6��/	���L��.&�^cp~�)(�(�j)��uWwMԹ�J��DQ���qw�Y��Nd�zGm1�/��eW�4ߧ�[#V��鋝0�OU��	�6;�Q6r�I������hg�,<W���`t�Ȑ� �jb��K3�O+�o.�3��e˱̣@�k@�c�XUԠ��t����� �e�TKb9۽��c�-�8ͣ��d�]�@=��M����<�z|*���8y��GOW�map�>�����^q�ˀ�;�L��y\/���G̱ߊ9R�#�.j!į���0Y
Ё�O'��yo��:,hA�\����+�� 9uz�pݜ�o
�4�K`c|j�f����ZM�ʸW�m�d^��&|�9�m:��ƍsOI�86g��`��H!]��� ��29ʠ��h��Z���J�,���F6J�\D�K�h��������|��,"0�u�f���E �#�4j\q� ��E)S���J qpQ�^��_%��C�{n��6_�%č�C�oc �[�%ޭ�4�č��ܵ$d��,�U�M藵J�<G����%s/ ����C��`��7}|=2�/�؟s~��xI斺�,'�^7$_E'd\_��Ŗ�e�����4J��ȌӸ+�x�� C˫��uR���M�tH��.⽖�0���e\_����xŅ�|IDH�)�#m�鞖��1}"/=1��̣ ���f��9
/	 ���D�l��4U��yЅɎ�e�i�	ȓe�W9�wvq�`� bUk)�'`N�I-dD�	s��ܛ����I����>dC�]7��Bsb��~n\G �[O��r��XyI�i�L��n&��|��o�I}I qƽi�Yk;    �;���W�3�N�00�rڍ�I��#��F,�ɷ�b�>nM��&^�����qV1/�,1��we�>��e����潞�;�oִ|�dZ��yt���Kf�뻀;��'�=����IG��Q�ckј�^�$�7�$�w:��UGn7(��,k���_"kI�2�ǝR�}w�Z�ݾt>��- �#Z�,��t� �7!)[J�io �7!Q�w��2��8%��,��k`_�s���t�.`�`I�@	䷱Ϧ�_<������G�O�>�ڔ�%�Q�_��Qo��y_Vh@y2^��|��*t���;2)��N+W��m8|�K�蔌�A�i�*4��,s��,�fVh@u`ˆXƘ%�H,Q~Y���Epyq�'��⭁ˋ�r�_�u<ŗ��"�HM_�u�k�\^|*��o�q���E�#�S�/��K��t�~��G���E܏H|R�U��D����q���s�/���O��e�	s�w������>:�;KD�7l�gN;�]9Υ#	�t:���%s��c�wћ�8`K���W�����D�����]��H-���,��,.���\��R����`�b���䢽��{�s��q� �ݫ�;.�;,^�-����k���xq��ĺ�'��gt�e�FKjX���`pw����2i냕I�?w$�Lg��]�ޔ�owj.�.�������0w�1�-q�%�|w���Fw.����<a�v�oH���A��]M���as���� �n��/��:$��J��E�v��E8Y�{�yo�j�.��Kh�ص��Y��%��}��ǼF �2Q$n9��.��I@�e���H���h; ᩹�Ǖ��@�;c�9����4��tZ3x;$�jU����3��4݊\bs����w�40w�v��統��L�ܥ�F$����%��߈�?��y�`�,�gB��t�v)=��V�w�i�]�>Z�y�T�]�&Yb�r�=�]��d��A�v	nRj��,�4�v�r�7a��u<� ����������,�P�1t�10o�F.�|VK;s��v�t����M�^c�v�)��F*��;��D��_���Y�?�K����|n�G.s�HkM��L��%�/}��$ػ4��TZ�������K�#�D����(�l\���s$����jԊ�3*���I�v�2K �Q��3�D�Nw�w�K"��]�0��3v=Wu W��{�%PV����^b��U�^y�A/������/�W+o�������d.ڔ粻��Yz!"�fd�f�<��.����g�Ǻf׼�
���GsZ_��2�6��ށ��AI�ɋ��.==2K(�؇��Y� r�C٭�,̟�d�e<�"���9�=�m�,̋g,R]�v^�|�p��Q�yu��%U;�Xi��u����%�e�uid k@��Tf	`�po�ܞ"K[��ƭk~����%/�Q��c�&�W��ߞ�m��ool����=��u����y�Ӿf���i�\�n��Q�{}�z�������5��T�}��`�#���]@�>޹��G;�.�S��N��c����7i�~^c y�O�f�{�'��].���+�.9'�ʚm�� �m00����l�;p������2����]��3{�`��(�����Y���cQ��7��y����R{N�Mg��Q��%�h�U$��$�%�{w��G.�����,��<�����G�}�s�R�ե�T����f��h�:d���Pe���%[�����%�W�F��L�l��Y�?<��B�볾\��~D�Kw�Yu� �;"t�5�`�h���h��t�����i��X��ox}C�[9r��)�=����&כ�r���y�	���v�;U����6b�%$�Z��"��C��S��s!��#��$J)��d�����!��r�N������-VM�e��plEG����q&@��]L[�|� �㝉,3ۍ1٠���I��w7��@��������n�Bn�S4�������ͼ�$��YB���q���@�ã�z;�3�:L���e��~�ԟ�b���sd�u4��䜶v��[�4{k�/�ly	=uK�9�"�:�i��,غ��U��Sw��`�(yep��L����Q����������,s�hx\_�u����[$��8��:��2U��OI�/o ��#g���b�֑�i���ƃ���}�Ju�YL:����F�u=��l�C��^��yI y��\�Z��su:,���qʠ���	e�n���dv�Vv|�&"��@�h.�W��0�눟Y�� ���7��ĳꃰ���J��3�Q ���1mZ�$ >7/��}w7K |�Kp��|	�A�Q��ٜ�9%>�����q�n��oQG�c�|� ���N���f�=*2���LUg�Jhe�ڭ!]YG���c��z���{�4��6��#OP�]���Pw��Û#h6� ��e/u����� YG��*����YG ��1W_�<�u�)f���#f	��$��]v!�:˝�J���_tJYG�=0�� �h��gMU�& 먌 Y�0|�1#�=��Y{�
d�K�b����@p)ec��y����^���V��A�Qe�E#6뛼	DwI���D\��A��Ct���PeG�=Y��� ���f��������u�����#լ2GO�ʎF)~��_������!�yӄ�5
4��`��۵}eg�sFC�j�	�ʎ�f����wPv��4�\�{I wo��9]H�ʎF+M	�t;��
���	PF�� �5�V]xH�� ���dk�6~�ʎ>�4��I�P�Pc=�
/f	��X_��=\Odv4��d����aG�q�sػ�S�����N�A١����z.D̠�,gΒQw�.��b�[�J��%������9����4�D�x)n)�,��8<3]������}mU�.�- �8<��u�<~W���[Q�.�} %�,�����Ǖ��x����~�w�=���[c����p}d�����cO9�؉�t}���]"�v��
<v�K������c�^��m/��$����\�mt
<�(�3sN�)��x�qv�r�K<P@�q|����8\�x�	dZ�w�S
<�l��m	ҩd��³�8$T��e[�ǟ2N�&~��ė���~q�Ǟsµ��/���׋v��x��?,:��i��O�-���z����Ҵz�$I���{�=����?����rK�. �O�V��� d�f��[���/�ǃ4� �2
t �d"$f9�d`��q��8�`'�x�n��x:Y����ꬣL�6h�|��d��� �Y����m����O��Ɓ�kA��`�x-�.�7��6�{�X���?-	O2��׹�厼,�*-`o�W��l��s�v��G��1{1�v�p{���e�}�t����]_A��-�e�j����cj��X>�<�j��8�k�|�3g�Wy��^ڐ�d/�-|ߥ`�4oNS��ﳁ�כ5�^�\�3��k�_+ -�i�`_���i�[�u���G����[�/hAq-y�m�6�ׂ�;���p40^������l؃V��c�����W���H�S�~�`��\��:��<�v�q%ܿz �MY�ܮ� �M˴���ǁ��'Q���
< ?O6�x��`-�\�WG�d� E�����CZP� �M�����K: �Ms?���KP�vI��H�*��Y��>�Μ$�>��ѴRo� �F��ӈ�]�
���Y��uy:�[�#xPg)�'	���#ֶyfmz`����V��1��hw���噵�������>?h'	`>
9�r���BΊV�g	`.?kUi�<���=�O�~,7	 ��jj��_���;�r�_f��0�S�_��?F��V�5��� �ǃa���ok揑|&;��~�*0�q2��P�^������[��'�
	��V<v�h�Hc�Z\5�%�!!K*b�1-�~m�
�/�^��Qx�� �_��FԮ��UA��ࠗ�v��c$�7%	�y �	  �$nڕûHdH�i��xD?�^A�eDE���&�z(	���Z_�|}@�U	�ݶ�% z�mk}=V7I��˃�� ͗�;�r]V4_����>�r� ��H�.����'<@��Q+��/�F'H sD�ڣ!����0O�I�輼��� �#_K_����ח0�,����v�K�'�%���$�-�/�7�W�����K�[�cЗ[[^�}I ��yLS�7�_�|�����o	��!�i��i���R�k`N�1Q�؋0'TL�����L�1�Jo��|�v%�nc ��#S���;�� ����n܋0ﶈ^�����ۭ��˃��7��EK@����aKN���]����W��s��񋖀ʳl0������� �b�4y�r���#�U�Jڭ�< �ީ��Vb�f�YB���L#���<0�{�.?)`�b�,������^���bHl�Ʒ	����X��H �'5+�I ����m�՝%�����8i7ƌ��^��4d].�G.7��n�#hպ]�:I ��]j+�T�$�2mH �B�B)��g	`�d.���$].~��Zok�AY_�rف �2 }��ng�<�8����T�XP�syTF�&.;
�\��׊�?@����uuAˍ�ZeuCK;�i �ruS��J.���%�Nwg	`>�G��|�60IĚp�Ւy������@���,n@ܓ��Q��H����Mq�o�Z
.��C9�5`;��q�!{)�x�O �rs�-��,�E$_o���ˣNQ���w'�,�ET�6�buA�eO���ok�[�X��۾�����jY=�0j'!β� A�s\�^�V��}��}���&zǧ!�IԔY��.�q� chC��0I��$� ��x�X<���}��IN��<���DA;�\�(��]��c�e��4�Jb��Ԏ.���W�DW��5�z@���C=n����_	�"�����-��YU������nUpq�$��RQ�����c͌���B��	��_U0q��'ZW+|�RUpq%�O��6Sq�M��������.�%��/�б_+�s�R!g)O�8��s�����Q/�[�5Pre<�}<�I�{y������
kt�菰X��2�U
0�V����W :���{��ˠ�-�ZYt`��<�E�xG����e �ʧ�U�nfS'����j�62m���7C�6��
̣@,X�7[r]BYgx:��E�t�:d�y�$K޶+=��6�t�i��1����C:��-!�ԖʴQPue6I{9����m�8Ђ�i���Q�〮�h�?\鸳N��+S3d�AG�ag����:�� (����o�u�]y����<���-�W�P�X�I?A��E�e}�еy͠�@Q -'��eЁq#�EA��������. y��]Ω|����z���?G }��öʡoǈ�M}WF�[������x!�^,^��2��m#^�3�d�?�m�FK��b��!��G_`>��{��V	l-�l@��ܐqi�X'Pyx�N/z_ڭ�2���:�< =�fE)�Y�X[Pzv�
?��&�����^q����IZ�w�%yn�iLp4����J� ���n4���'.�=�C�Ƴހ�/��#}� ���05�S���y;���"z��>�ܳ;Ad�iq\/�{u��5O�6�ĸPI��ᦗ����Ig	��z6���s9A������0|�f �*�č��:��W?����i�o��W�a@
��՟������쐙V4_OǤ��=�U�gw�̹j�q�A�=�jkn����z�x�.�o��8��AO��������,�W�Z�
/����t6��{^�c1�[4iZ�~�/gtc�#�i�~�nQ�������ބR��m��%�����s�Wǃ0J:,�����z+ʠ� ���Ϙ{�z��\�Z�%5��b@ o����:
И�Q'�.�	`�|���=:�� �b�q�0���h̨��{�8�"иl{b��Hh�9���к,�_�؀��2jc��v�4F����;���Љ���g��Y4 ^| ��y�Y��36��SN�[l�ـ�O+����l9�VO���� #XǵDʙ`3�Q�k{��uo����q�z])�{��5t���tW�̠����D�Ss�n������K���9��y�7Ϯ�l�h��>ėL��G^���i����oM�5w�w:�A���fH{�&���0[+�˗eȌƅ����Y�@ƖJ[�澷Rq����Cd{N;��l�<����;�'���l��_�06�A젹h��;�-�'h���]���2�]�@����fS��[;��V��h�J��|���5<'�i�AE]Ӕ�m�ї�`X���d��m��n�<�d��$=���g���mЃ�]Pj���A;PU��Ұ�m����?���? �n�         [   x�3�tO,J�+9�6QAW!(�,�8���<N�����̂|�����Լ�D��Ĝ��b.#N�Բ���d4u�
ř)�
)�e��9%�\1z\\\ ��"q      -      x������ � �         4   x�3�H,.��2��,�L�I-�2�)�ML��2�9���4��(���� >D�     