PGDMP      2                }            ecommerce_yuhw    16.8 (Debian 16.8-1.pgdg120+1)    17.4 )    B           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            C           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            D           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            E           1262    16389    ecommerce_yuhw    DATABASE     y   CREATE DATABASE ecommerce_yuhw WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF8';
    DROP DATABASE ecommerce_yuhw;
                     anthony    false            F           0    0    ecommerce_yuhw    DATABASE PROPERTIES     @   ALTER DATABASE ecommerce_yuhw SET "TimeZone" TO 'America/Lima';
                          anthony    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                     anthony    false            �            1259    16438    login_history    TABLE     �   CREATE TABLE public.login_history (
    id_login integer NOT NULL,
    id_usuario integer NOT NULL,
    fecha_login timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.login_history;
       public         heap r       anthony    false    5            �            1259    16437    login_history_id_login_seq    SEQUENCE     �   CREATE SEQUENCE public.login_history_id_login_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.login_history_id_login_seq;
       public               anthony    false    222    5            G           0    0    login_history_id_login_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.login_history_id_login_seq OWNED BY public.login_history.id_login;
          public               anthony    false    221            �            1259    16407    producto    TABLE     �  CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    nom_producto character varying(30) NOT NULL,
    descripcion character varying(100),
    precio numeric,
    is_oferta boolean DEFAULT false,
    porcentaje_oferta numeric,
    precio_final numeric NOT NULL,
    imgurl character varying(255) DEFAULT 'https://m.media-amazon.com/images/I/61gKkYQn6lL._AC_UY218_.jpg'::character varying
);
    DROP TABLE public.producto;
       public         heap r       anthony    false    5            �            1259    16406    producto_id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public.producto_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.producto_id_producto_seq;
       public               anthony    false    5    218            H           0    0    producto_id_producto_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.producto_id_producto_seq OWNED BY public.producto.id_producto;
          public               anthony    false    217            �            1259    16400    usuario    TABLE     �   CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nom_persona character varying(30) NOT NULL,
    username character varying(10) NOT NULL,
    password character varying(10) NOT NULL,
    rol character varying(15) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap r       anthony    false    5            �            1259    16399    usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public               anthony    false    5    216            I           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;
          public               anthony    false    215            �            1259    16417    venta    TABLE     �   CREATE TABLE public.venta (
    id_venta integer NOT NULL,
    id_producto integer NOT NULL,
    id_usuario integer NOT NULL,
    monto_final numeric NOT NULL,
    fecha_venta timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.venta;
       public         heap r       anthony    false    5            �            1259    16416    venta_id_venta_seq    SEQUENCE     �   CREATE SEQUENCE public.venta_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.venta_id_venta_seq;
       public               anthony    false    5    220            J           0    0    venta_id_venta_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.venta_id_venta_seq OWNED BY public.venta.id_venta;
          public               anthony    false    219            �           2604    16441    login_history id_login    DEFAULT     �   ALTER TABLE ONLY public.login_history ALTER COLUMN id_login SET DEFAULT nextval('public.login_history_id_login_seq'::regclass);
 E   ALTER TABLE public.login_history ALTER COLUMN id_login DROP DEFAULT;
       public               anthony    false    222    221    222            �           2604    16410    producto id_producto    DEFAULT     |   ALTER TABLE ONLY public.producto ALTER COLUMN id_producto SET DEFAULT nextval('public.producto_id_producto_seq'::regclass);
 C   ALTER TABLE public.producto ALTER COLUMN id_producto DROP DEFAULT;
       public               anthony    false    218    217    218            �           2604    16403    usuario id_usuario    DEFAULT     x   ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public               anthony    false    215    216    216            �           2604    16420    venta id_venta    DEFAULT     p   ALTER TABLE ONLY public.venta ALTER COLUMN id_venta SET DEFAULT nextval('public.venta_id_venta_seq'::regclass);
 =   ALTER TABLE public.venta ALTER COLUMN id_venta DROP DEFAULT;
       public               anthony    false    220    219    220            ?          0    16438    login_history 
   TABLE DATA           J   COPY public.login_history (id_login, id_usuario, fecha_login) FROM stdin;
    public               anthony    false    222   �/       ;          0    16407    producto 
   TABLE DATA           �   COPY public.producto (id_producto, nom_producto, descripcion, precio, is_oferta, porcentaje_oferta, precio_final, imgurl) FROM stdin;
    public               anthony    false    218   0       9          0    16400    usuario 
   TABLE DATA           S   COPY public.usuario (id_usuario, nom_persona, username, password, rol) FROM stdin;
    public               anthony    false    216   )2       =          0    16417    venta 
   TABLE DATA           \   COPY public.venta (id_venta, id_producto, id_usuario, monto_final, fecha_venta) FROM stdin;
    public               anthony    false    220   �2       K           0    0    login_history_id_login_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.login_history_id_login_seq', 1, false);
          public               anthony    false    221            L           0    0    producto_id_producto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.producto_id_producto_seq', 28, true);
          public               anthony    false    217            M           0    0    usuario_id_usuario_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 6, true);
          public               anthony    false    215            N           0    0    venta_id_venta_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.venta_id_venta_seq', 128, true);
          public               anthony    false    219            �           2606    16444     login_history login_history_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT login_history_pkey PRIMARY KEY (id_login);
 J   ALTER TABLE ONLY public.login_history DROP CONSTRAINT login_history_pkey;
       public                 anthony    false    222            �           2606    16415    producto producto_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public                 anthony    false    218            �           2606    16405    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public                 anthony    false    216            �           2606    16425    venta venta_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id_venta);
 :   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_pkey;
       public                 anthony    false    220            �           2606    16445 +   login_history login_history_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT login_history_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.login_history DROP CONSTRAINT login_history_id_usuario_fkey;
       public               anthony    false    216    3231    222            �           2606    16426    venta venta_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_id_producto_fkey;
       public               anthony    false    220    3233    218            �           2606    16431    venta venta_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.venta
    ADD CONSTRAINT venta_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.venta DROP CONSTRAINT venta_id_usuario_fkey;
       public               anthony    false    220    3231    216                       826    16391     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     N   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO anthony;
                        postgres    false                       826    16393    DEFAULT PRIVILEGES FOR TYPES    DEFAULT ACL     J   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO anthony;
                        postgres    false                       826    16392     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     N   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO anthony;
                        postgres    false                       826    16390    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL        ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO anthony;
                        postgres    false            ?      x������ � �      ;   	  x��TIn�@<�^��)e.�-��(��T� ��5�,� �o|��O��22����\f���]]�3F�W&o/�#�1�eF)��p�+.Q��<ׅ
\'��g�EU���nW9���NH�o��Ĩ�P��;�,����Yr�L?�O�<z,�:������$B$��lfUއ��c��!K��G��)�~SއXHIxE�m̋���	aNaFJ�������ߌȠ�����	{0ቤ��O�/Z$f�Q��]�풁�uZ�-� ��p����ԅ�8 ����r�*�%t{�WiL9��ri}I)�o(y�j��)�;SW����d$������I�3�i���dT�ش%d������C�����cRem͘p��37ڬ3v�$�z��c�w��X��������%Ǒ�DœE��r��f�jg��l��a��p��@����)6*���b����o��ZJ���1o�hс,B��ॱ�_��;Xղ�Z'�XU�A\
`��աR`��O��wd�������������t���      9   �   x�=�M
�0���9�ПT]��nD\�y�AiR&q�wr�z1ۈ]�{����O����}X�����X��뭷11����#x|C�`=]����kՐv��dDE{�Q��`^�ss٭7����C�K`6���~ifUY,L��t�}��9sF��t]	!�X�G�      =   �  x���ɍ�0D�R�@��2��1����o�Pe��Lă��  �������7�2�М��
B�o�m�ͤq=��d�-����<�HŗT^R��2SF���/���8SG��O
a+-O��l�e	_�7d|��f��+��O7�b�k_9�l�oJ�1&����~0`)�1/L����PJ{3%Y� rԸ�h,3L���=̛r� .J���
�3�u�7�~����	J�I-R��h�qc�^Ha�T탙�D��hU]�� �x��*��"u5�1�,��y�V׀�86!<(m�Ʋ��t�ʪv������'x �)��a���[bI���Rw�87��P`/ۤ 5y`�����N���8Դ�֎_0,��5��i�'?S���-���[ui����?���~��X\�/t�v�����e�<����_ȁ��{)�eI�3�����_�~���Ϳk���3�     