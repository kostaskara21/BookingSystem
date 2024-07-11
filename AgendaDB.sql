PGDMP     /                    |        	   AgendaDB1    14.4    14.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            
           1262    33092 	   AgendaDB1    DATABASE     o   CREATE DATABASE "AgendaDB1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "AgendaDB1";
                postgres    false            �            1259    33093    users    TABLE       CREATE TABLE public.users (
    username character varying(25) NOT NULL,
    password character varying(256) NOT NULL,
    email character varying(225) NOT NULL,
    id_user integer NOT NULL,
    firstname character varying NOT NULL,
    surname character varying NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    33098    Users_Id_User_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id_user ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_Id_User_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209            �            1259    33099    appointment    TABLE     �   CREATE TABLE public.appointment (
    "time" time without time zone NOT NULL,
    duration character varying,
    date date NOT NULL,
    name character varying(225),
    id integer NOT NULL,
    creator character varying
);
    DROP TABLE public.appointment;
       public         heap    postgres    false            �            1259    33104    appointment_has_users    TABLE     o   CREATE TABLE public.appointment_has_users (
    iduser integer NOT NULL,
    idappointment integer NOT NULL
);
 )   DROP TABLE public.appointment_has_users;
       public         heap    postgres    false            �            1259    33107    comment    TABLE     �   CREATE TABLE public.comment (
    username character varying NOT NULL,
    comment character varying NOT NULL,
    idcomment integer NOT NULL,
    idappointment integer NOT NULL,
    "time" character varying NOT NULL
);
    DROP TABLE public.comment;
       public         heap    postgres    false            �            1259    33112    comment_idcomment_seq    SEQUENCE     �   ALTER TABLE public.comment ALTER COLUMN idcomment ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comment_idcomment_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213                      0    33099    appointment 
   TABLE DATA           P   COPY public.appointment ("time", duration, date, name, id, creator) FROM stdin;
    public          postgres    false    211   �                 0    33104    appointment_has_users 
   TABLE DATA           F   COPY public.appointment_has_users (iduser, idappointment) FROM stdin;
    public          postgres    false    212   �                 0    33107    comment 
   TABLE DATA           V   COPY public.comment (username, comment, idcomment, idappointment, "time") FROM stdin;
    public          postgres    false    213   �       �          0    33093    users 
   TABLE DATA           W   COPY public.users (username, password, email, id_user, firstname, surname) FROM stdin;
    public          postgres    false    209   H                  0    0    Users_Id_User_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Users_Id_User_seq"', 7, true);
          public          postgres    false    210                       0    0    comment_idcomment_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.comment_idcomment_seq', 35, true);
          public          postgres    false    214            p           2606    33114    comment comment_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (idcomment);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    213            n           2606    33116    appointment id_pk 
   CONSTRAINT     O   ALTER TABLE ONLY public.appointment
    ADD CONSTRAINT id_pk PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public.appointment DROP CONSTRAINT id_pk;
       public            postgres    false    211            j           2606    33118    users id_user_pk 
   CONSTRAINT     f   ALTER TABLE ONLY public.users
    ADD CONSTRAINT id_user_pk PRIMARY KEY (id_user) INCLUDE (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT id_user_pk;
       public            postgres    false    209    209            l           2606    33120    users username 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT username UNIQUE (username);
 8   ALTER TABLE ONLY public.users DROP CONSTRAINT username;
       public            postgres    false    209            q           2606    33121 #   appointment_has_users idappointment    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment_has_users
    ADD CONSTRAINT idappointment FOREIGN KEY (idappointment) REFERENCES public.appointment(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 M   ALTER TABLE ONLY public.appointment_has_users DROP CONSTRAINT idappointment;
       public          postgres    false    212    211    3182            s           2606    33126    comment idappointment_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT idappointment_fk FOREIGN KEY (idappointment) REFERENCES public.appointment(id);
 B   ALTER TABLE ONLY public.comment DROP CONSTRAINT idappointment_fk;
       public          postgres    false    213    211    3182            r           2606    33131    appointment_has_users iduser_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointment_has_users
    ADD CONSTRAINT iduser_fk FOREIGN KEY (iduser) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.appointment_has_users DROP CONSTRAINT iduser_fk;
       public          postgres    false    212    3178    209               �  x�m�;��@���)���~�S��QK�.�M<�.ےʒ�9�pnAH���+1�eK$�����w�\�Yeh38�<�8;?�:�����������<͘s�m	�%&���F��=��$T��l�i!�\�A6#�y���x|Cs��<�v�5�\T��q�	���{�m�������\���i0��ֵX�bQ����Z-���}�����	¡)7MY��%�J+Ӓ2�^ͱp2N\ט���1�T6�8V۰	��1��I�BФ@��K�b�5{�6�c������n�f�	�{%݊�8���y��i��G��hrڥ�����E�y'5��X����.LM�Xv���D�@OM�Aem��K�C~la�Bޯ�PŴ�U��
pN�A��g��֖ �t����i��-:���+K˸u�����=�٬'�I�����g`"�n2��U�9���1˸]��X�������/i���         S   x�%���PC�o� �������$�)/c�Gx%�5���la���Rq�fP�'���F��S=�:8��(�C73�<����R         9  x�}�OJ�@���)r;�Ϳ��(�Zą��C��$@�,��o�^��vJ��M���{��T��֮* A)&���1)�\Z��q?��?�)�ۺ]����(�Ei�>O�P�����Xo\|
*��\ͯ�4_-һ�b����"rqj���ko�f��۹m��z��C��?�^��:�?h"Nz�綮�X$�Y�.�!�v\]ޏ(�/!t��%��ߘ	�@"�5Vf�v��N2�Y�Ə���>~���7�G���*ґ����e)_j��<��9ҹ�q��[f����*I�.��      �   �   x��O9�0��ߠ�'v�./�@(��Ʌ؄�דp��j���c��2�%��kb��4@��w��t���N����a`�к� ��]	�ۊJ�/�Ċ,��l��҇��SuUx2H�aQ��6�J[V�J�!0��r��o3���֍���k��Y��4qp�߮��UY8�8eB�w*Ye     