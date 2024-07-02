PGDMP         $                |        	   AgendaDB1    14.3    14.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24599 	   AgendaDB1    DATABASE     f   CREATE DATABASE "AgendaDB1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Greek_Greece.1253';
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
       public         heap    postgres    false            �            1259    24636    comment    TABLE     �   CREATE TABLE public.comment (
    username character varying NOT NULL,
    comment character varying NOT NULL,
    idcomment integer NOT NULL,
    idappointment integer NOT NULL,
    "time" character varying NOT NULL
);
    DROP TABLE public.comment;
       public         heap    postgres    false            �            1259    24635    comment_idcomment_seq    SEQUENCE     �   ALTER TABLE public.comment ALTER COLUMN idcomment ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comment_idcomment_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214                      0    24606    appointment 
   TABLE DATA           ]   COPY public.appointment ("time", duration, date, comments, name, interested, id) FROM stdin;
    public          postgres    false    211   N                 0    24622    appointment_has_users 
   TABLE DATA           F   COPY public.appointment_has_users (iduser, idappointment) FROM stdin;
    public          postgres    false    212   I                 0    24636    comment 
   TABLE DATA           V   COPY public.comment (username, comment, idcomment, idappointment, "time") FROM stdin;
    public          postgres    false    214   �                  0    24600    users 
   TABLE DATA           W   COPY public.users (username, password, email, id_user, firstname, surname) FROM stdin;
    public          postgres    false    209   �                  0    0    Users_Id_User_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Users_Id_User_seq"', 6, true);
          public          postgres    false    210                       0    0    comment_idcomment_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.comment_idcomment_seq', 9, true);
          public          postgres    false    213            p           2606    24642    comment comment_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (idcomment);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    214            n           2606    24612    appointment id_pk 
   CONSTRAINT     O   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT id_pk PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.appointment DROP CONSTRAINT id_pk;
       public            postgres    false    211            j           2606    24614    users id_user_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.users
    ADD CONSTRAINT id_user_pk PRIMARY KEY (id_user) INCLUDE (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT id_user_pk;
       public            postgres    false    209    209            l           2606    24616    users username 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT username UNIQUE (username);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT username;
       public            postgres    false    209            s           2606    24630 #   appointment_has_users idappointment    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment_has_users
    ADD CONSTRAINT idappointment FOREIGN KEY (idappointment) REFERENCES public.appointment(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 M   ALTER TABLE ONLY public.appointment_has_users DROP CONSTRAINT idappointment;
       public          postgres    false    3182    211    212            t           2606    24643    comment idappointment_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT idappointment_fk FOREIGN KEY (idappointment) REFERENCES public.appointment(id);
 B   ALTER TABLE ONLY public.comment DROP CONSTRAINT idappointment_fk;
       public          postgres    false    214    211    3182            r           2606    24625    appointment_has_users iduser_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment_has_users
    ADD CONSTRAINT iduser_fk FOREIGN KEY (iduser) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.appointment_has_users DROP CONSTRAINT iduser_fk;
       public          postgres    false    3178    212    209            q           2606    24617    appointment interested_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT interested_fk FOREIGN KEY (interested) REFERENCES public.users(username) NOT VALID;
 C   ALTER TABLE ONLY public.appointment DROP CONSTRAINT interested_fk;
       public          postgres    false    209    3180    211               �  x�mS;n�@�����g�l�
��.�l��E�"	��z'M��[�La�ҕ�;T,�P� wߛy��m�]0��9�9���nv�u�y�~�q�}x��������CyBETQ(,:�육<�ܔ�X���k��u(�@�Z\��͑��c��wi�)�~�I�r��E\�.3)=�H��!xR�{�h�Ρ �ۇG�L:����B3�t7��,��K궩�/�N�1�h�a�6�f����o��`�!�m�'=ڦ�oG��}P�'U8adM��컗���*{S�<I�EN�#ڤo9�e��d(����ܜ���v�NM��R.8ͨ2��r��G�F{V��|��W	>�E�L�|9�,I_%v0Hb{I�s][G�H�Ȟ	�%Yڹ2�a�PI:�s����]ʛ���9�F�x����;I�YX��&��.8�����-ǉ()��긍��8b��.� 3����~�����"��x��i�u�c�֒�q�P=}TJ��<�         _   x�%��A��;���K���:2�����K�S��pt!9��0H�.P
�6�1|U�����՘U���vi�X(����.�ݹJ�?��9�f��         �   x�u�M��@��u�}������>a �Y�pS`c�hGL2���i���-�g����-	!2 X+�s�� IZ(���Rܮ�k��q��v8�YY��%�G��ľ��a�$N|�� jZ/m��ވ�Y�m�Z�M��A!�����A���(�ӄ@OB�H�*#!&�����<��#��Ԙ�9XΕ��q�B�%Տt�S�?�|w          �   x�5�;�0��5����	����5!�A8P��$�'͛b�8���UPƩϹI�$w+���5�*�Oz|5������s̰��v��i�R�V��@�!X���vF&�H>���u���H�������ܿ�VX�_ƥB| ,"5�     