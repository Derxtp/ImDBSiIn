PGDMP  4                    }            galletas    17.5    17.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16389    galletas    DATABASE     |   CREATE DATABASE galletas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE galletas;
                     DERxtp    false            �            1259    16396 	   carrito_1    TABLE     _   CREATE TABLE public.carrito_1 (
    id integer NOT NULL,
    producto character varying(13)
);
    DROP TABLE public.carrito_1;
       public         heap r       postgres    false            �            1259    16399 	   carrito_2    TABLE     _   CREATE TABLE public.carrito_2 (
    id integer NOT NULL,
    producto character varying(13)
);
    DROP TABLE public.carrito_2;
       public         heap r       postgres    false            �          0    16396 	   carrito_1 
   TABLE DATA           1   COPY public.carrito_1 (id, producto) FROM stdin;
    public               postgres    false    217   �       �          0    16399 	   carrito_2 
   TABLE DATA           1   COPY public.carrito_2 (id, producto) FROM stdin;
    public               postgres    false    218   +       �   7   x�3�t�*MN,�2�H��2��*M��2�,JM+J-N��2��H,��K����� @1�      �   :   x�3�t�*MN,�2�H��2��M�+I-,���I�2�,M-��2�V%�%r��qqq ���     