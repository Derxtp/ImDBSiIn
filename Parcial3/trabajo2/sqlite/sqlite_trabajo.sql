PGDMP      -                }            galletas    17.5    17.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16389    galletas    DATABASE     |   CREATE DATABASE galletas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE galletas;
                     DERxtp    false            �            1259    16403    directorio_telefonico    TABLE     �   CREATE TABLE public.directorio_telefonico (
    customer_id integer,
    type_phone character varying(10),
    number_ character varying(20)
);
 )   DROP TABLE public.directorio_telefonico;
       public         heap r       postgres    false            �          0    16403    directorio_telefonico 
   TABLE DATA           Q   COPY public.directorio_telefonico (customer_id, type_phone, number_) FROM stdin;
    public               postgres    false    219   �       �   e   x�U�=
�0���ܥ�4�I�^��%�����W�]��~!D�Z΢u`f#)�,=2U]t�	7����v"&It`m7�?�'�ٻ���F��y�V�#�     