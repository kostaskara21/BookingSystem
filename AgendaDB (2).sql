PGDMP     *    !                |        	   AgendaDB1    14.3    14.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24599 	   AgendaDB1    DATABASE     f   CREATE DATABASE "AgendaDB1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Greek_Greece.1253';
    DROP DATABASE "AgendaDB1";
                postgres    false            �            1259    24600    users    TABLE       CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    password character varying(256) NOT NULL,
    email character varying(225) NOT NULL,
    id_user integer NOT NULL,
    firstname character varying NOT NULL,
    surname character varying NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24605    Users_Id_User_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_Id_User_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    24606    appointment    TABLE     �   CREATE TABLE public.appointment (
    "time" time without time zone NOT NULL,
    duration character varying,
    date date NOT NULL,
    comments text,
    name character varying(225),
    interested character varying,
    id integer NOT NULL
);
    DROP TABLE public.appointment;
       public         heap    postgres    false            �            1259    24622    appointment_has_users    TABLE     o   CREATE TABLE public.appointment_has_users (
    iduser integer NOT NULL,
    idappointment integer NOT NULL
);
 )   DROP TABLE public.appointment_has_users;
       public         heap    postgres    false            �          0    24606    appointment 
   TABLE DATA           ]   COPY public.appointment ("time", duration, date, comments, name, interested, id) FROM stdin;
    public          postgres    false    211   �       �          0    24622    appointment_has_users 
   TABLE DATA           F   COPY public.appointment_has_users (iduser, idappointment) FROM stdin;
    public          postgres    false    212          �          0    24600    users 
   TABLE DATA           W   COPY public.users (username, password, email, id_user, firstname, surname) FROM stdin;
    public          postgres    false    209   R                  0    0    Users_Id_User_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Users_Id_User_seq"', 6, true);
          public          postgres    false    210            i           2606    24612    appointment id_pk 
   CONSTRAINT     O   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT id_pk PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.appointment DROP CONSTRAINT id_pk;
       public            postgres    false    211            e           2606    24614    users id_user_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.users
    ADD CONSTRAINT id_user_pk PRIMARY KEY (id_user) INCLUDE (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT id_user_pk;
       public            postgres    false    209    209            g           2606    24616    users username 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT username UNIQUE (username);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT username;
       public            postgres    false    209            l           2606    24630 #   appointment_has_users idappointment    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment_has_users
    ADD CONSTRAINT idappointment FOREIGN KEY (idappointment) REFERENCES public.appointment(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 M   ALTER TABLE ONLY public.appointment_has_users DROP CONSTRAINT idappointment;
       public          postgres    false    211    212    3177            k           2606    24625    appointment_has_users iduser_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment_has_users
    ADD CONSTRAINT iduser_fk FOREIGN KEY (iduser) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.appointment_has_users DROP CONSTRAINT iduser_fk;
       public          postgres    false    209    3173    212            j           2606    24617    appointment interested_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT interested_fk FOREIGN KEY (interested) REFERENCES public.users(username) NOT VALID;
 C   ALTER TABLE ONLY public.appointment DROP CONSTRAINT interested_fk;
       public          postgres    false    209    211    3175            �     x�m�=N�0���\ h~��]A�[nci-��J�M��@��%Ŋ$W"6(�3�yoP;i@��L����>�M/���1^��9^ǯ��&�P9�����9C�v�*-�0Q��?�oL:KFk��Jgr�8?��ۇ�>����6�,�*@;�Q��$��hmA�ɴ�e�&���2���� p����wu
թ�ϡi�S�x�Cl�J��	R�#��}W�]]?r
 u��F]uC�"P\X����1{*}54g_��U.�8�
!�D�w�      �   &   x�3�4���0�2�44�0��2L�-�L�b���� [cD      �   �   x�5�;�0��5����	����5!�A8P��$�'͛b�8���UPƩϹI�$w+���5�*�Oz|5������s̰��v��i�R�V��@�!X���vF&�H>���u���H�������ܿ�VX�_ƥB| ,"5�     