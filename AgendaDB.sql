PGDMP         3                |           Agenda    14.4    14.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32815    Agenda    DATABASE     l   CREATE DATABASE "Agenda" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "Agenda";
                postgres    false            �            1259    32816    users    TABLE       CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    password character varying(256) NOT NULL,
    email character varying(225) NOT NULL,
    id_user integer NOT NULL,
    firstname character varying NOT NULL,
    surname character varying NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    32821    Users_Id_User_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_Id_User_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    32822    appointment    TABLE     �   CREATE TABLE public.appointment (
    "time" time without time zone NOT NULL,
    duration character varying,
    date date NOT NULL,
    comments text,
    name character varying(225),
    interested character varying,
    id integer NOT NULL
);
    DROP TABLE public.appointment;
       public         heap    postgres    false            �          0    32822    appointment 
   TABLE DATA           ]   COPY public.appointment ("time", duration, date, comments, name, interested, id) FROM stdin;
    public          postgres    false    211          �          0    32816    users 
   TABLE DATA           W   COPY public.users (username, password, email, id_user, firstname, surname) FROM stdin;
    public          postgres    false    209   �       �           0    0    Users_Id_User_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Users_Id_User_seq"', 5, true);
          public          postgres    false    210            e           2606    33035    appointment id_pk 
   CONSTRAINT     O   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT id_pk PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.appointment DROP CONSTRAINT id_pk;
       public            postgres    false    211            a           2606    32830    users id_user_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.users
    ADD CONSTRAINT id_user_pk PRIMARY KEY (id_user) INCLUDE (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT id_user_pk;
       public            postgres    false    209    209            c           2606    32832    users username 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT username UNIQUE (username);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT username;
       public            postgres    false    209            f           2606    32833    appointment interested_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT interested_fk FOREIGN KEY (interested) REFERENCES public.users(username) NOT VALID;
 C   ALTER TABLE ONLY public.appointment DROP CONSTRAINT interested_fk;
       public          postgres    false    209    211    3171            �   A   x�34�21�20�4�4202�50�50���<7�|����-�6��$w��{n��&��!W� S�      �   K   x�����,�4200����vHO�K���4���'s�T�f's��@����8(��sq�%�s%�b���� u     