PGDMP                          x         
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
    nom text NOT NULL
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
    public          postgres    false    200   �       �          0    16561    Panier 
   TABLE DATA           G   COPY public."Panier" ("userId", "articleId", "articleQty") FROM stdin;
    public          postgres    false    202   .       �          0    16564    User 
   TABLE DATA           B   COPY public."User" (id, email, password, prenom, nom) FROM stdin;
    public          postgres    false    203   H.       �           0    0    Article_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Article_id_seq"', 5, true);
          public          postgres    false    201            �           0    0    User_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."User_id_seq"', 34, true);
          public          postgres    false    204            1           2606    16576    Article Article_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Article"
    ADD CONSTRAINT "Article_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Article" DROP CONSTRAINT "Article_pkey";
       public            postgres    false    200            3           2606    16578    Panier Panier_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Panier"
    ADD CONSTRAINT "Panier_pkey" PRIMARY KEY ("userId", "articleId");
 @   ALTER TABLE ONLY public."Panier" DROP CONSTRAINT "Panier_pkey";
       public            postgres    false    202    202            5           2606    16580    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    203            6           2606    16581    Panier articleId    FK CONSTRAINT     {   ALTER TABLE ONLY public."Panier"
    ADD CONSTRAINT "articleId" FOREIGN KEY ("articleId") REFERENCES public."Article"(id);
 >   ALTER TABLE ONLY public."Panier" DROP CONSTRAINT "articleId";
       public          postgres    false    202    200    2865            7           2606    16586    Panier userId    FK CONSTRAINT     r   ALTER TABLE ONLY public."Panier"
    ADD CONSTRAINT "userId" FOREIGN KEY ("userId") REFERENCES public."User"(id);
 ;   ALTER TABLE ONLY public."Panier" DROP CONSTRAINT "userId";
       public          postgres    false    202    2869    203            �      x��y׮��r���_1�̻�m�bNb.��$11����?�gm��c���dSvUsT�Qh�\�_ՙ�C�f����V�_�:K��+�u.��䋷E�e~T�:.�
ï9����\���/?��OݿЁ�.)8�ieMU��_9��p���������3`�!a���"1)���Q�ʢ��=�O��1�~6c�E~"�=0�`?�d�eU=os	�opC�_s�����`��2F�u��/wc���Y2��k��o��"�%�mlW�:,�Z��d]�s��YY�o$J��4F�����������E�!���߱Zm^����@�M璶�:)�?n?�${�����a[�`��GV%��U���	9����e�,��,Ӄi
�iAn����Z�B(���s��Wkɟ��L��9�ׯ|���_n2l����K��������%i���_�O]�ȓ5����hƢ��4Y
�?0��8�:����%˱z��
0��"˾e�`������D������$�u$7���~|��R�V}�c�z�Y��M:����<�U��/M(KϖN����G����2������~�_��fYNTX=�������EGD�,��x�4~���ǖ�����Ǳ���]ٲ8'���q�ⲧ(���q�(��Ze���_����.����~H����m������O��,����̵G�c�oc�����=�g��h���=7�����:D���}Fy�N�H/&Du���p��eOm��pvFg%;��b��w\ɕX�Dѯ�p6c5���k(dNE�S�d�����ȶ���M�ǭ��^�R	w/wc�� ����	�����fܜ�mI>3M��*���&&��r�c����!I��ev�5B滜�g���8�㗊����M�>_���{-;z�z.p�����u+59�$j܌`�3F�|���v��7w9v��7�sR��1�L���g4�h��O�۸�8�n�U�;Z��p��OOi¼� �����Œ)}��Zm�c�XsZ�X��{�z�3���G|��:��3�S�I�h
WP�	�p�(��kk\�Čf,�)Uŏ��i�љo�����9��n��9T��=����kP��'	�D�ߠ;�͕Г(�=���-r>x�)
b`�m�KZ��8�n�\UR�QLK��m�<r�[�2R��06�&�$����?��:ڳAv�/T>�`��b�I���
D_Rx�ɱ�o�A�~[���|����?4�
'j,x�.�V��{w��JzI�����sK�h��r'��e`�+ח�d�}������u��I���e�����{�r"ל6��I��q1��E4��1���Hd
Ij7F��e��/R���]�!�V������gt�)��6�H]��mB!�L��UL��
�01T��u�$�V�ڂ<�� �8�o����z��Z��Z��a�^�v5IX���{���˼�эy
����E�Y��!
0{�9d]҅��PK����:�w�(�"9E�4�!i�?�u����Ɓ�,ʁ!�0�ղ�E�W�B�.��"[�3�#4r�-s�0�8�Z�$7��@mqS������7^���H�MU�ݻC�^;����o*\8r�Jw��Z�^l[�v��\8���W�:F���4�U}����ٛ�N�%oA���U�������%��_"578�!�
��@��M�d�R��ub�h����2���X*����pBC��(YLh��j�QEp��Mϫz��Oz��������ѥ� <���U�a%�Hҥb']RZ��ÑUPh���fO	�C���_�8�Kz�n����N�S舮�$���Q�e{\���^�xO=�``��t9�X�o��׈3�Y�=[�U%ev�rņAг}��}��_{Э����tdO�y��œ�~7|�8Z�}�!�P�2�N�o�J����U �ƺ����Iﬕ��*�˽��x�*��6������;��+2$<����s}���t���R�MB�,���ms�u��H6w����#إ�=��޲���$��wC�[�J�����\�P�i�8Ν������"�#d(ט:X���O�,�v��:��E�&���ƛ:����^<uK�&����s	x�]<���3�4>�C}ٌ�Q��٦{���9Taoo�k�2&�%ھ��a/��N�O�9�p��J ���/yi���NY�tX�Ԛ��f*�{��g6!�YjCT�yS��b;#�xv�Yu�(fl �ϬH6�J+��X o�6m��*��!*�:4!������Y1]�ߙ��قF���A���o���4�)Eg�L? �@*��<۳�	�c�X	��t���3R'�
Ų���d<:ff�d�ЕQ�X��|��fL�B�����ɉqA�ae�\C�Ba�a�⼞�*���#�P6Y�î�]B�P���3�_�u�5慇A��&��p�j-.�����,���w�>�%%�Ǌ�2�3���Ӏ��q��Ze̫��)�8&t6/E����:�W���0�@���J3��!�$X��"iK��%D�����OȔS ����O�,����C	��蘳�˴5�Vhv�-2�/V����&�zv�N=��Q����]������(�FwH,I��wZ�`q���|��SWR~�Ӂ;P2��.���$��D#o�T5�Ƽ�������o�{�X�L��4�uq/(K�?qO�Rkp�.�;Qa6!H�s�����  P�<@�@��F��p��r- ^�9 ����>@R	d4�1Ȑ:+�Ot����tY:'��y�#O�6@pÆ�oaSכ/S4�dnⰞl�YNV����|��M�=�^F%�m2�x���E<��2j6�9���wL�7��?���%���5���n����	9OPS�I���q�#y���IB�Ӿ̛���&�,�;��Ŋ�±6�l�,�r �Ѷ��N��)Ƚ�(#�z����\��rA�Ų�*9�y��y�biC�o0��嵽�l���)�1��fޏ[5݆�e.�nlK��XV��݋�ϲ���'c��2)J[�Ba�W� qR��8�U�A�𒟫u�K�6m�TLG<��,�N��|{δYh���RC���ʥڻ*���3n��]x��T_�4�w�E��e?]�=�d��3��� 	���	1H,�`[r�-WOi�#����m�DI����xV��6���mز�@�����Γ�xp�4"��e}v�+<������L�8 ���c���pv@&$���7���*EA��e$��)���_K�2a��.8nq����L�j���E�Ch5$?�[�#s������ �����I�<kWiw������~�|Tsgl�(�ʉ�9&���%Ͼ�|*R��������Ȩ���W�<�}���^��	�+�٫���1�x�{��Fm��LY�7%��O�t�Oc�U��;���N�UD�(\'���Cʻ���(���z ��R���jb�N��cup)Y�7&���Ս�n��1Am.?�d3��6���}�����3��M�����
t�����O���GqPE��G�,~2�%��-W�rG;AU#�1�יU)�����Y�L�?b��#�NG��N1�DT�A'6?r;+\�#���t��:�2Z���v����V#�����\8��s��^؈wDa����XK_�8I�%�'�i�5_���� 	*�7��`RPvz��P��n��Ǽ�-ZO��!����/��_X�O��w1Pc�n����>eQ{��q����׭{���^��%͍�J�غ��8k��}tڦ'��@;@?���#���G�5����-�j�\��I����<&;|��K���ҏ��YD�@�:m���j��my�t�)����� M��'��Q��3��Ȉh���s<���A}r�PMP��%7�ﭷ)��c��S@�6�-D���4�K���!�4w�<m`C0�I�ۄ�dǼ%Լ��ɱ>L�}���a$<��g4�q_���p7�� ��	�hz&�|��c�W����5�^����	���t���rWi�{�='�xvx��� -  Xŗd�j$���J�����]�z�a�E�q�c����;iF�~��Tμ��"�k� rDc�1-㊆e�:�/?8᝿M�7\)��[��<�+J��7���|�p�˽C���%��Mͱ	�V��6��̆n�����<���aғ���Z��mw����T�)$�0���!�$�җ�����:�_�$,���C��+�[~2�z���x}ܧ�Z������%V��r`��kch�d��P��Ҭ|nf1�&���µ�{��|�����'��s ���y�m��O·��M��q�^�JM�9����y1W5uΫ4��KF���֊@X�-)���PR�k�6��O���6�aX��!�P�螅�a���K�	$��E�^���F��Т����M�����٦��G^���*��Z���-~��F�+d�,��~;|�6�x���<����t��}��p��.�\7��P�β2���I�Q2k?@y�ݖ��F*�� �b"��zЏ��d�n�½n���[��Q�N{sf���5F=[hg�1�݋Z8	ɨ���Ȯ q'�.>���\�+$ˠ>�pI]+�sa�@��E���ˀ�΀Ȁd��v"�myW��Y�M&�%���t�:�*��8kX�#�~FDd��x-ϴxS�ky��;/�o��1��K�����P����h~92�=��uoc��������͉��J�p"������4�1<�	��z�3�z�evl*n	2$e�qL�6�Y1�X�U}v��X��P�0 ������ �z~'�g���g&ϯ�;o}��7I!n���1���i��@0������ŭ�,<a�(��#�����m2S�����!ȠB^�2å�{�<�8y�!��݌�m�0`�|6kZp&��t��4�aj��iP�;hw����}�5!F�	]?^.c�����;,�׻�D�1�bG��{��.�Mo��"sH�Y�,�[��;��V�ai�<quk�uf>��})ґ;O��c4q.x�K�T&�mu雥�{�j��V��d,5^#�Mm��:�	�é���)lA\�ocK(��E2�d�i����cА R�y���<��26�����{���۝,&`(?�c�'gE`��`DX���fU�wAަ��C8'򠚬9��X�i��$I*�Z������ڬ����<�_��Ԗ�I����^��τ����Z%���0��j8��pE�J�l^q�:��.�q 
w���q���Yl��>.���q��a3u@ P)}���zD#fj�e�0=�.ɐB��J�f��7����Q�b|�5�zʪ>�t�0���d9eD��~m����F�YQb޶M|>�!����`�@>0H��,���&#H�ޱ�A(	Y�~ E��Q��s8f��]*�����d��ط��y������$M���FV^,_c2�58}^'i�������[��[���/^��:�IY����8G����l�`�{��o�.��g�<���)�*^$�Y������F�2	��A���_$����(���a$�Z����������=      �      x�36�4��26�4�4����� ��      �   r   x�36�L�I��,��IM.�L-rHM+J���K-�T1JR14P����
(��p.�4�4Nv60,*ӫ�-
���v,.1v��1�M��0���6�I3����t����������� ��!�     