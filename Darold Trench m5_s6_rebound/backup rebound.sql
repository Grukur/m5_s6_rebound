PGDMP         '                {            m5_s6_rebound    15.2    15.2     (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    17353    m5_s6_rebound    DATABASE     �   CREATE DATABASE m5_s6_rebound WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE m5_s6_rebound;
                postgres    false            �            1259    17359    clientes    TABLE       CREATE TABLE public.clientes (
    run character varying(10) NOT NULL,
    nombre character varying(120) NOT NULL,
    correo character varying(80) NOT NULL,
    direccion character varying(120) NOT NULL,
    telefono character varying(15) NOT NULL,
    alta character(1) NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    17354    empresas    TABLE       CREATE TABLE public.empresas (
    run character varying(10) NOT NULL,
    nombre character varying(120) NOT NULL,
    direccion character varying(120) NOT NULL,
    telefono character varying(15) NOT NULL,
    correo character varying(80) NOT NULL,
    web character varying(50)
);
    DROP TABLE public.empresas;
       public         heap    postgres    false            �            1259    17410    mantenciones    TABLE     �   CREATE TABLE public.mantenciones (
    id numeric(12,0) NOT NULL,
    fecha date DEFAULT now(),
    trabajaos_realizados character varying(1000),
    id_venta numeric(12,0) NOT NULL
);
     DROP TABLE public.mantenciones;
       public         heap    postgres    false            �            1259    17369    marcas    TABLE     j   CREATE TABLE public.marcas (
    id numeric(12,0) NOT NULL,
    nombre character varying(120) NOT NULL
);
    DROP TABLE public.marcas;
       public         heap    postgres    false            �            1259    17374    tipo_vehiculos    TABLE     r   CREATE TABLE public.tipo_vehiculos (
    id numeric(12,0) NOT NULL,
    nombre character varying(120) NOT NULL
);
 "   DROP TABLE public.tipo_vehiculos;
       public         heap    postgres    false            �            1259    17379 	   vehiculos    TABLE     �  CREATE TABLE public.vehiculos (
    id numeric(12,0) NOT NULL,
    patente character varying(10) NOT NULL,
    marca character varying(20) NOT NULL,
    modelo character varying(20) NOT NULL,
    color character varying(15) NOT NULL,
    precio numeric(12,2) NOT NULL,
    frecuencia_matencion numeric(5,0) NOT NULL,
    id_marca numeric(12,0) NOT NULL,
    id_tipovehiculo numeric(12,0) NOT NULL
);
    DROP TABLE public.vehiculos;
       public         heap    postgres    false            �            1259    17394    ventas    TABLE     �   CREATE TABLE public.ventas (
    folio numeric(12,0) NOT NULL,
    fecha date DEFAULT now(),
    monto numeric(12,2) NOT NULL,
    id_vehiculo numeric(12,0) NOT NULL,
    id_cliente character varying(10) NOT NULL
);
    DROP TABLE public.ventas;
       public         heap    postgres    false                       0    17359    clientes 
   TABLE DATA                 public          postgres    false    215   @"                 0    17354    empresas 
   TABLE DATA                 public          postgres    false    214   �"       %          0    17410    mantenciones 
   TABLE DATA                 public          postgres    false    220   �#       !          0    17369    marcas 
   TABLE DATA                 public          postgres    false    216   �#       "          0    17374    tipo_vehiculos 
   TABLE DATA                 public          postgres    false    217   ($       #          0    17379 	   vehiculos 
   TABLE DATA                 public          postgres    false    218   �$       $          0    17394    ventas 
   TABLE DATA                 public          postgres    false    219   �%       �           2606    17363    clientes clientes_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (run);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    215                       2606    17358    empresas empresas_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (run);
 @   ALTER TABLE ONLY public.empresas DROP CONSTRAINT empresas_pkey;
       public            postgres    false    214            �           2606    17417    mantenciones mantenciones_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.mantenciones
    ADD CONSTRAINT mantenciones_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.mantenciones DROP CONSTRAINT mantenciones_pkey;
       public            postgres    false    220            �           2606    17373    marcas marcas_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT marcas_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.marcas DROP CONSTRAINT marcas_pkey;
       public            postgres    false    216            �           2606    17378 "   tipo_vehiculos tipo_vehiculos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tipo_vehiculos
    ADD CONSTRAINT tipo_vehiculos_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tipo_vehiculos DROP CONSTRAINT tipo_vehiculos_pkey;
       public            postgres    false    217            �           2606    17383    vehiculos vehiculos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.vehiculos DROP CONSTRAINT vehiculos_pkey;
       public            postgres    false    218            �           2606    17399    ventas ventas_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (folio);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public            postgres    false    219            �           2606    17418 '   mantenciones mantenciones_id_venta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mantenciones
    ADD CONSTRAINT mantenciones_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES public.ventas(folio);
 Q   ALTER TABLE ONLY public.mantenciones DROP CONSTRAINT mantenciones_id_venta_fkey;
       public          postgres    false    219    220    3209            �           2606    17384 !   vehiculos vehiculos_id_marca_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_id_marca_fkey FOREIGN KEY (id_marca) REFERENCES public.marcas(id);
 K   ALTER TABLE ONLY public.vehiculos DROP CONSTRAINT vehiculos_id_marca_fkey;
       public          postgres    false    218    216    3203            �           2606    17389 (   vehiculos vehiculos_id_tipovehiculo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_id_tipovehiculo_fkey FOREIGN KEY (id_tipovehiculo) REFERENCES public.tipo_vehiculos(id);
 R   ALTER TABLE ONLY public.vehiculos DROP CONSTRAINT vehiculos_id_tipovehiculo_fkey;
       public          postgres    false    218    3205    217            �           2606    17405    ventas ventas_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(run);
 G   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_id_cliente_fkey;
       public          postgres    false    219    215    3201            �           2606    17400    ventas ventas_id_vehiculo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_id_vehiculo_fkey FOREIGN KEY (id_vehiculo) REFERENCES public.vehiculos(id);
 H   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_id_vehiculo_fkey;
       public          postgres    false    218    219    3207                �   x���=�0�w~�m@R�-���H�`"�^�Ԕ�����.L����q�=]?���~��{��V�2��dn�,͓C��Cb����N>ɆQ/s�7�[;@��-�\��R�i�6�+�a����8�1<F���bi�|�t"+�2���ѕ&t�b�֓��O�|u�ʗ$_�[\�         �   x�M�A�@໿bn*l��etɃ!Һ��ƺ#��?/����TuS>[����ک#'C��!0��y�	�C�o���k�lmi��]�_e��d�R_�_(9R/]E��w����%N�iv:�n�<�Y�&���Skm�'���G8      %   
   x���          !   U   x���v
Q���W((M��L��M,JN,V��L�Q���M*J�Ts�	uV�0�QPɯ�/IT״��$M�PspiUiv&H3 X
%      "   Y   x���v
Q���W((M��L�+�,ȏ/K��L.��/V��L�Q���M*J�Ts�	uV�02�QPNMI�S״��$�C�!�a #�� */      #     x�͓�j� ����.-H���]u�4��A�vU�q���`u�>���J���|�ʑ���j۬��m��?(�_�]r��	f�#�3'���r�b:�n��xl��|E�Bs���Ё�����m�����9얏��f4��ժ,)��5��?epK�LЃb�W$C-��@Jp���� f�7�H�L	=�X��n�&-�h6��I�,���B���]A�D@r�Z���Э�6n��C��6�7+O��:!��2�b���~�_?	���^W� �!5      $   �   x����
�@�O17vev׍�SB�u�V\�4H}�� $�S�a�g����I3��� ���F����^�X�(��r��n�d��^WFu��5û��۟�<F���EI��% %� `8����J��:��[�����B�Q�^D >FqށX��p*����;��r&p�'��     