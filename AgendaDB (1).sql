PGDMP                         |        	   AgendaDB1    14.3    14.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    32827 	   AgendaDB1    DATABASE     f   CREATE DATABASE "AgendaDB1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Greek_Greece.1253';
    DROP DATABASE "AgendaDB1";
                postgres    false            �            1259    32828    users    TABLE       CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    password character varying(256) NOT NULL,
    email character varying(225) NOT NULL,
    id_user integer NOT NULL,
    firstname character varying NOT NULL,
    surname character varying NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    32833    Users_Id_User_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_Id_User_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    32834    appointment    TABLE     �   CREATE TABLE public.appointment (
    "time" time without time zone NOT NULL,
    duration character varying,
    date date NOT NULL,
    name character varying(225),
    id integer NOT NULL,
    creator character varying
);
    DROP TABLE public.appointment;
       public         heap    postgres    false            �            1259    32839    appointment_has_users    TABLE     o   CREATE TABLE public.appointment_has_users (
    iduser integer NOT NULL,
    idappointment integer NOT NULL
);
 )   DROP TABLE public.appointment_has_users;
       public         heap    postgres    false            �            1259    32842    comment    TABLE     �   CREATE TABLE public.comment (
    username character varying NOT NULL,
    comment character varying NOT NULL,
    idcomment integer NOT NULL,
    idappointment integer NOT NULL,
    "time" character varying NOT NULL
);
    DROP TABLE public.comment;
       public         heap    postgres    false            �            1259    32847    comment_idcomment_seq    SEQUENCE     �   ALTER TABLE public.comment ALTER COLUMN idcomment ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comment_idcomment_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213            �            1259    41024    notifications    TABLE     �   CREATE TABLE public.notifications (
    iduser integer NOT NULL,
    message character varying NOT NULL,
    appointment character varying NOT NULL
);
 !   DROP TABLE public.notifications;
       public         heap    postgres    false                      0    32834    appointment 
   TABLE DATA           P   COPY public.appointment ("time", duration, date, name, id, creator) FROM stdin;
    public          postgres    false    211   �                 0    32839    appointment_has_users 
   TABLE DATA           F   COPY public.appointment_has_users (iduser, idappointment) FROM stdin;
    public          postgres    false    212   �                 0    32842    comment 
   TABLE DATA           V   COPY public.comment (username, comment, idcomment, idappointment, "time") FROM stdin;
    public          postgres    false    213          	          0    41024    notifications 
   TABLE DATA           E   COPY public.notifications (iduser, message, appointment) FROM stdin;
    public          postgres    false    215                    0    32828    users 
   TABLE DATA           W   COPY public.users (username, password, email, id_user, firstname, surname) FROM stdin;
    public          postgres    false    209   8                  0    0    Users_Id_User_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Users_Id_User_seq"', 9, true);
          public          postgres    false    210                       0    0    comment_idcomment_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.comment_idcomment_seq', 43, true);
          public          postgres    false    214            t           2606    32849    comment comment_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (idcomment);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    213            r           2606    32851    appointment id_pk 
   CONSTRAINT     O   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT id_pk PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.appointment DROP CONSTRAINT id_pk;
       public            postgres    false    211            n           2606    32853    users id_user_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.users
    ADD CONSTRAINT id_user_pk PRIMARY KEY (id_user) INCLUDE (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT id_user_pk;
       public            postgres    false    209    209            p           2606    32855    users username 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT username UNIQUE (username);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT username;
       public            postgres    false    209            u           2606    32856 #   appointment_has_users idappointment    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment_has_users
    ADD CONSTRAINT idappointment FOREIGN KEY (idappointment) REFERENCES public.appointment(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 M   ALTER TABLE ONLY public.appointment_has_users DROP CONSTRAINT idappointment;
       public          postgres    false    3186    212    211            w           2606    32861    comment idappointment_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT idappointment_fk FOREIGN KEY (idappointment) REFERENCES public.appointment(id);
 B   ALTER TABLE ONLY public.comment DROP CONSTRAINT idappointment_fk;
       public          postgres    false    211    3186    213            v           2606    32866    appointment_has_users iduser_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment_has_users
    ADD CONSTRAINT iduser_fk FOREIGN KEY (iduser) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.appointment_has_users DROP CONSTRAINT iduser_fk;
       public          postgres    false    209    212    3182               �   x�e�KN�0D��S�A��/�X ���M3X3q,���L�H	�m���*�A� % �$=J7J�[' x�����*�E�+J:���[M�>��=�3xBir���&��cƍ
����6|�)s;�/�֓6�uh�uj�<r����&4�x����p�c��Ǧ=�!�2�43 jm�����ٟ��>�R~:���.�F�S ���Xh��wʽ�m,�+��������^��)�c         L   x�M���0�s��Oإ��Q���'۲��������<�F��an�Z�o�Q5��`}H�}ިC���"�y�B         �   x�u��M1D�=Qt���������`�c�l�Yb�6&,�4���T�TUGO����$�	UF����G��V���A	e���0+�����Ւ6�+EH���Z�vWut��aTP3m�I�r-�������{���x���֔�)�f.O/��]�-0#��vfO�7�- �CO��	�(��KHy����Y����H�O�=F��&������^w]�}#�n�      	   $   x�3��H,VHJM�SHM�,IM�,I-.����� }�          �   x��P�n�0�׿��cw�H)��*͞_q ��r)��c�����]if5��a	���2z_�A�G��{�-H�{���̐1�qf��	�� 9�:��Z�禳ʺ��T/�v.o쇮�V+�4ͥR*��Π���ȸ���;�Dp��b��]e����\dF�aXk�Ї���(���y��2�Q�$L��w��������]N���V
6�X��^�?*�����     