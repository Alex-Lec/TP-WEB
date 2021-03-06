PGDMP                          y         
   PROJET-WEB    13.1    13.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16552 
   PROJET-WEB    DATABASE     h   CREATE DATABASE "PROJET-WEB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';
    DROP DATABASE "PROJET-WEB";
                postgres    false            �            1259    16553    Article    TABLE     �   CREATE TABLE public."Article" (
    id integer NOT NULL,
    titre text NOT NULL,
    description text NOT NULL,
    img text NOT NULL,
    prix numeric(5,2),
    marque text NOT NULL
);
    DROP TABLE public."Article";
       public         heap    postgres    false            �            1259    16559    Article_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Article_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Article_id_seq";
       public          postgres    false    200            �           0    0    Article_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Article_id_seq" OWNED BY public."Article".id;
          public          postgres    false    201            �            1259    16561    Panier    TABLE     |   CREATE TABLE public."Panier" (
    "userId" integer NOT NULL,
    "articleId" integer NOT NULL,
    "articleQty" integer
);
    DROP TABLE public."Panier";
       public         heap    postgres    false            �            1259    16564    User    TABLE     �   CREATE TABLE public."User" (
    id integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    prenom text NOT NULL,
    nom text NOT NULL,
    admin boolean DEFAULT false
);
    DROP TABLE public."User";
       public         heap    postgres    false            �            1259    16570    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    203            �           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    204            .           2604    16572 
   Article id    DEFAULT     l   ALTER TABLE ONLY public."Article" ALTER COLUMN id SET DEFAULT nextval('public."Article_id_seq"'::regclass);
 ;   ALTER TABLE public."Article" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200            /           2604    16573    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203            �          0    16553    Article 
   TABLE DATA           N   COPY public."Article" (id, titre, description, img, prix, marque) FROM stdin;
    public          postgres    false    200          �          0    16561    Panier 
   TABLE DATA           G   COPY public."Panier" ("userId", "articleId", "articleQty") FROM stdin;
    public          postgres    false    202   <1       �          0    16564    User 
   TABLE DATA           I   COPY public."User" (id, email, password, prenom, nom, admin) FROM stdin;
    public          postgres    false    203   g1       �           0    0    Article_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Article_id_seq"', 5, true);
          public          postgres    false    201            �           0    0    User_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."User_id_seq"', 34, true);
          public          postgres    false    204            2           2606    16576    Article Article_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Article"
    ADD CONSTRAINT "Article_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Article" DROP CONSTRAINT "Article_pkey";
       public            postgres    false    200            4           2606    16578    Panier Panier_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Panier"
    ADD CONSTRAINT "Panier_pkey" PRIMARY KEY ("userId", "articleId");
 @   ALTER TABLE ONLY public."Panier" DROP CONSTRAINT "Panier_pkey";
       public            postgres    false    202    202            6           2606    16580    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    203            7           2606    16581    Panier articleId    FK CONSTRAINT     {   ALTER TABLE ONLY public."Panier"
    ADD CONSTRAINT "articleId" FOREIGN KEY ("articleId") REFERENCES public."Article"(id);
 >   ALTER TABLE ONLY public."Panier" DROP CONSTRAINT "articleId";
       public          postgres    false    2866    202    200            8           2606    16586    Panier userId    FK CONSTRAINT     r   ALTER TABLE ONLY public."Panier"
    ADD CONSTRAINT "userId" FOREIGN KEY ("userId") REFERENCES public."User"(id);
 ;   ALTER TABLE ONLY public."Panier" DROP CONSTRAINT "userId";
       public          postgres    false    203    202    2870            �      x��z׮�ʶ���X~�!w3�k�� ��`��$11|���w�si����k\��
�1g��0�|�Y�Y���Eu�uu9,ه�x�I�d�I��c�YG���W���Q�s?�=ƨM2���e�N����W�>:p�M�gPzT�̚���=�rڣQ���-�WBP����; Fa&!���,}01��(�P������q�A�_U� �/��}���0�	 �L�r\���?��m��1��r�f0�g�s�}����X��W�c�����2�� ���n*���;�@�����E#�0p`P�u�\/�r������0�~��_}Ztu����@�й��ڤ����aE��3�>�_��|N �?����xd��2����ؒy��(�{1]����a�1�h
��7B�F��h�_�����q�r�L�Ok���D�R�߈�&��?_ݛ5ST�g��W�}����73�>��GM��w�� �em�yW���X�w��
��"�>encm����Z`�E�������%��%'���^xv�\��Z�@�Bu��^⋴��E0fs�g��8>�4!�/2x����y�^���ڧ��������|��r���	'���,/ڢ �ghc�HƳ��-�>����2�V`Ǌ�g�"�y.pv(r�q�ⰻ(���q�(��Z$��tW��|�\��*�@��I�K�����+��{�;�"ˮ@����s����J���)�g�a�{n��DѨ��=7�t��߸6��V~^*��g�:}x��B^���l0ڽ=��5����ڎ�H�����j0��������)`N��]>��r��,���H�K՞��}��n�՜N/�.8�<��X���ݷ.ҋ����Tqs;�t UH\R��цş��$ݟ�щTǸ
��p��q���b7��+�S仿5gx|��n��l��p� A�A~vh3S��H�ƍ0��C�@�k�(l�9_�r�|.1��c��Q��[���Won�Q�_��,�d�d:QRN�i�=���]�
Ҝ;��9,��ϦDioVkk�ٜ�
Ǫ�L��Ө�+��q����*S��o||a��6W�˨ڄR�A42����\50=��1ݔ�=�ח��ϩјO*���pO�����:fW��{Or�'�N��E8�����2BK"TsMǂ����~��(����Nq��`�8�:�(�o!-�+�lc�<~� ��}����q����k�*&�ԑ����} ���f�{ʠ�/z���w��~`;�Z��y|�y��]5��
'j,Xi�g��X�����[2�:ք����6�gB-z{��t�o�7����8N0�wޖD�^�������H5�N��%i��O��?�j8����B[���i/�TOr��fq�j%��\�����)�r�-���5눂�D/�Y����!�#�S��JV��� [ͧ�I�_<{.G|.�U@�l-p�$�fc�9��~�e�\3�h�4�����`����=?��t9�Iɮ��!������J�A�쫢Hw�����2��Z�6[�we���j��"�+6`�t��r�/�=8�4|�-q� m6���,Qj,��X⢞�
��&>�R.�hA
'l(���lB���Vݥ9~R�đ�eP�#%ń�b]���[�|��T>
�6"N��/J�2���b�3"���d�"�;��`˙.!�����)�`G�g�~��,������Fla��~�fУ$�rtf�S0 �uM�,*���e7�rΦ��E9%�+�Xqx��x��tkb�����ڸDIO��b#R\��J��x+N��e7�j@\\�~��i�0�� j�W>�� ߅�h�Wt3�-�fa,����]�%�Z<mr(���;����>F����|Q�l�\���l�*A_���7�yG�K�۶����Yx��s���m���v�]U7�ߎ�	LR)l^\�� ��X���镽�Ƚ��rk�4�=2)�z�Kp��< E>	w�E�����X�Ϟ���b1U{� �~�r��`�3Ν��ds�����[=ԹeQڝ�v��֦K�K�R�4�5��3W1�%����}����j�:�������sHm�FP�+P�l�;]���ܪEĂ�M�P�HQ��b�
�s9y\^�{ǯ�q��5�WtUc�Ԡ���Z��/�zQX�)�W���H9����3k�f��h�	ev%ݭ�jj�C�*�;.j��z��a|�3���e�5��,����<)�FЕ�Z<� V�_�Z>p��=ɢŦ���H�_��� 
�������Y�L��������'�A��A����Nz��w��˲4��E�@�6�W h9~r-�Jȏ�Q��946vB��L�p���@��Hw��o�����	23�%�5�����>Ѳ>Ǳgr�A쾟rhNGŧ 1A�wq�����M �,ݠG��O��?��=�e�K4H3=� 4ȕ����U����sS�]�S"���,�R���q7 ��aeZ��y?�7�	:�Ms�5q�1�Q.������nGt��OO'�� a����/�ɟ�Y��y�&|i���9�{tW���@�>ؔ@���)+?LK��e>�v�� ��-Q�2vp=�2y�� �V?@�;g�o9P?QB��'1'�;L�i��+�,�����:��6�>E}j�2ˠ�E@��h�5�F$c��~혛��4�;؍=��a���9O6��uQ�W���=�*\���L 1`��1[|��O � �r���P�{3��9�q�^�8@��ʱ`RҠS_��C꬐ޑ�����ei����^�s{sun�[p�),���4�:��͉l֕M`!��꧈�V2��e�kf�緜h��A`q�"�Ì��T%	5�bo���WT�'�<�ݭ�$</�9<��`����)OPC�J��d�qƈ�<��u'O��:LLx��f�}�[���`�{f_����,��B�eA��n�����.Ե�m��B��P3�7Z(�����+<��O�Wt�4A$#5?��u��%�NF��r���4���+��OX�<,Áa�)� w�e�_ݐ}MK�Z|��\(����.d�uW`'��#R��)��}�`�ux��E�]��w*س��N^��G�̴Mh�.�.q�V�\m���VI��܅\U�-u	ӳ�"T鰯&A��~4���H���P'	Y��Г��2��S.�R?ޔ�ڂHekS!J����Ƴ�rsP��,�k�c��1�y�}g��J9"���ܛ�ln����R�D��t��>�=���&D��l�{����jc~Α�%:|i��&ǻ��ԩj�5�x�`Zȗ��˛��Y�����R�^�ю���KG�W�:�b{�^r�cs��ۤ$*'�{5�?W�<zr�*ԓ"<�Q���/�f=w�4*a����wj�YO�^�M�ٙ|���\���F#�BN��ѓ�#B:և����3������Y��[0�'.y�gO��渀�����B��+Ny	�8}�q1z�<��Ȏ�G�gO�nz���|��ŸoZ�eW��V�Z�D�:$:�*�3ȋׇHwO~�RD���FeY�/�v���bw_�`f/NoE�jĠ�#��ؓ"F���'+�1��OLǹ'�q�9B�(���ٿ�Q����J2��>]o����	-�����6]��H-0=0'�X����n� t��tx���1��)��n�%_����I���T�DRPv��m�.Ȭ����C]��jW��&����˥��X�/W�nϬ�N��;�M������f�<�o���s��s>�Z�z%���J�輆	��s�z�m�LW�B��A���"OKD�~/�l�+�b�Q��!m�:�T'�����u�߃��=���B����^a��V�z�W5w�z&gʹF�͊�*����[5##��p�H������&�A}�������a��^�����Z#O� ��a�OD��puy��0(����k���wxT��e�s�a�b}d�h��$Ȇ�{3�޸{4m��<*���)��t��F��F��=:�=��>4u�^Ku�3H��A/!4l��~ذ�T� $	  �O�����ϸ���i̊�l$���J�������z���A�a��}|o|��gҼ��򽪰�Y��n�rONk�9�e\��D�����;��)��+y׽s3�����"����_�hb��=���!���;
�Z�u쩉u¼Ws6�1x$n�2�;k�0jDj���iG��rfܾKe�D�k%��W��XX�BqT�Zr�VK���{P�e$��03^n�!?�tz(4��k�椮l��x�\�>��e�0U3�Z�Y�[��|��5?`kY�o�z�0��;�����]]}�uM�R��O�?�]��<֙R�O��|�uC��ʔWi�! ���V� ��(K&b�Ɛ@aR��K�,pI]nTiV]7�«���Hw/0�o?Ԕ��a�l�9R;a46~����|p�K G2uq�!�ڞ��F�

RP���
b��������z�0��~}��cߦ��7=wN,{�3��|��90�9Q�β'x4#��2.�dֺ���O�Ւ��z*#j#N�@�sq��W�JD�\�sY5�^(}���v�Ąd���Z��N+��~��_CQ@��y���q���l<��:2��3�Ե���7]���5��|��}��m�I�3�H�Q��a��d�T����ֽ߀�*��.�����FD �S���gOJ{Lϝ�y5��q5:�|���������9=4?m�W�J�:X��8l.d�c�#H�*"4�v"�a�N�j7�>��*�rM��ۋì�a0$$���֝Y�Ʊ��z�x�B�y@I��֯7K�Q��J��jOL��Wg\�9/�B`�����A����� a|�75V�.x�T�p���n�=]�d.LF2J��6A�������Y�m�eG.�v#��օ�@dKG��{��'�!g��k�;�p7��;�|]�|��^�G����h�� V�p��&�m�hI�1�fbC�[�@�
Lw��E�'��'-<%N)ԓn\�^�P�K�G3�Kc�=��Sf��ܸ27n��s�5���2��K?Y���
6��EFc�ѣ7�*M�Q{��Au8��ҽ�͈���"���B2�t����k���I��9E����yd���jl�h��עV2cg2����(��5���
�-��>��R���i�<_~1�yPM��gk����J�$
�ZL��Qke���ڨ흦9<b�_��T�IC0����獄����^rH����J��lp
���2��D�<�4���,�
����� �/D��)湟N��,�T�Ŕ>�r�hc�4�%*1Q34��Z4Qg�+�fB7��T�R=/П�Jf��,!�Uf��:Ig�ڰM�Sz�;���\�-D����,��zv�x�v
�� Ĩ�0dy��vnPP��/@:�yJB���E�_�m&��R���a>�շ�仱����p�1��:�nd����G�\�s֦e�����W��,����_���4wc�g����Տ�V6��+�Hyw������ܽM���`�c��=H&%�4}�	��1F3��	A	?��$�ԯw����F4�Y����啍�2�[��a����{��M�u���]�yzwxe���/پ �J����>���wVg�<vMւ_G蕵sY�U��Ȗ����`@�[�2��0�F�o����F�)��7�FcI�$���E��IxC�A}pݒ��{EK�~�E4M�g�^���rd��m�f��/Q�t3��S�~�E6]�(����<��f�0����~��O �飼;��_H.�������~����O>J�h��b�]1��o����rOސ�1j�)Y겍����՗m��_���r0�����cpA`p���!)��$��T��gD�!�� �����I���c�>�+(��r������*���2�o��2��?����;6���� �-�Q�E�R��#(��'��D	�$p%�5��g\Gm�3��[�(�m{]�$�{� �h�~ ȇӁ��ӌ��ﻷ^���ϖwCL�^�2�Ҕt�5��g���� �-}�E��!^����_ �o�g�4������L��q��r��@�>�n+���O��+�����>�ʻ�����<X���R�`x��h��.��o�!�0��FA�{�/�}�|�O
!~#�_�����p�����u�B�ŭv��{��,������g'@�h{���f`�ɯG%?�\I �����_A�m�7X2�0l0LR�8���zf`A�&p�������}\Ɵ ��7ȿY�������Ǐ���6      �      x�36�4��26�4�4����� ��      �   t   x�36�L�I��,��IM.�L-rHM+J���K-�T1JR14P����
(��p.�4�4Nv60,*ӫ�-
���v,.1v��1�M��0���6�I3����t�������Y����� �"4     