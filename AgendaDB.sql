PGDMP     3    1        
        |           AgendaDB    14.3    14.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24576    AgendaDB    DATABASE     e   CREATE DATABASE "AgendaDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Greek_Greece.1253';
    DROP DATABASE "AgendaDB";
                postgres    false            �            1259    24582    users    TABLE       CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    password character varying(25) NOT NULL,
    email character varying(225) NOT NULL,
    id_user integer NOT NULL,
    firstname character varying NOT NULL,
    surname character varying NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24585    Users_Id_User_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_Id_User_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            �            1259    24577    appointment    TABLE       CREATE TABLE public.appointment (
    id integer[] NOT NULL,
    "time" time without time zone NOT NULL,
    "duration " character varying NOT NULL,
    date date NOT NULL,
    comments text,
    name character varying(225),
    interested character varying NOT NULL
);
    DROP TABLE public.appointment;
       public         heap    postgres    false            �          0    24577    appointment 
   TABLE DATA           `   COPY public.appointment (id, "time", "duration ", date, comments, name, interested) FROM stdin;
    public          postgres    false    209   �       �          0    24582    users 
   TABLE DATA           W   COPY public.users (username, password, email, id_user, firstname, surname) FROM stdin;
    public          postgres    false    210   �       �           0    0    Users_Id_User_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Users_Id_User_seq"', 2, true);
          public          postgres    false    211            a           2606    24589    appointment id_pk 
   CONSTRAINT     O   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT id_pk PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.appointment DROP CONSTRAINT id_pk;
       public            postgres    false    209            c           2606    24587    users id_user_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.users
    ADD CONSTRAINT id_user_pk PRIMARY KEY (id_user) INCLUDE (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT id_user_pk;
       public            postgres    false    210    210            e           2606    24591    users username 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT username UNIQUE (username);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT username;
       public            postgres    false    210            f           2606    24592    appointment interested_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT interested_fk FOREIGN KEY (interested) REFERENCES public.users(username) NOT VALID;
 C   ALTER TABLE ONLY public.appointment DROP CONSTRAINT interested_fk;
       public          postgres    false    3173    210    209            �      x������ � �      �   K   x�����,�4200����vHO�K���4���'s�T�f's��@����8(��sq�%�s%�b���� u     