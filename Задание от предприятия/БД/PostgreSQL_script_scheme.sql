PGDMP     8    8    	            z            Cards_Master    10.19    14.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    41005    Cards_Master    DATABASE     Z   CREATE DATABASE "Cards_Master" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'ru';
    DROP DATABASE "Cards_Master";
                postgres    false            ?            1259    41194    Cards    TABLE     ?   CREATE TABLE public."Cards" (
    id integer NOT NULL,
    level integer NOT NULL,
    text text NOT NULL,
    connection integer
);
    DROP TABLE public."Cards";
       public            postgres    false            ?            1259    41192    Cards_id_seq    SEQUENCE     ?   ALTER TABLE public."Cards" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Cards_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    205            ?            1259    41147    History_game    TABLE     ?   CREATE TABLE public."History_game" (
    id integer NOT NULL,
    level integer NOT NULL,
    users integer NOT NULL,
    date timestamp without time zone,
    "time" time without time zone,
    status boolean
);
 "   DROP TABLE public."History_game";
       public            postgres    false            ?            1259    41145    History_game_id_seq    SEQUENCE     ?   ALTER TABLE public."History_game" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."History_game_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    203            ?            1259    41106    Levels    TABLE     s   CREATE TABLE public."Levels" (
    id integer NOT NULL,
    name text NOT NULL,
    "position" integer NOT NULL
);
    DROP TABLE public."Levels";
       public            postgres    false            ?            1259    41104    Levels_id_seq    SEQUENCE     ?   ALTER TABLE public."Levels" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Levels_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    201            ?            1259    41018    Roles    TABLE     Q   CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public."Roles";
       public            postgres    false            ?            1259    41016    Roles_id_seq    SEQUENCE     ?   ALTER TABLE public."Roles" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Roles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    197            ?            1259    41091    Users    TABLE     ?   CREATE TABLE public."Users" (
    id integer NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    role integer NOT NULL,
    training boolean DEFAULT false
);
    DROP TABLE public."Users";
       public            postgres    false            ?            1259    41089    Users_id_seq    SEQUENCE     ?   ALTER TABLE public."Users" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    199            ?
           2606    41201    Cards Cards_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Cards"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Cards" DROP CONSTRAINT "Cards_pkey";
       public            postgres    false    205            ?
           2606    41151    History_game History_game_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."History_game"
    ADD CONSTRAINT "History_game_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."History_game" DROP CONSTRAINT "History_game_pkey";
       public            postgres    false    203            ?
           2606    41113    Levels Levels_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Levels"
    ADD CONSTRAINT "Levels_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Levels" DROP CONSTRAINT "Levels_pkey";
       public            postgres    false    201            ?
           2606    41073    Roles Roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_pkey";
       public            postgres    false    197            ?
           2606    41098    Users Users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public            postgres    false    199            ?
           2606    41202    Cards Cards_level_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public."Cards"
    ADD CONSTRAINT "Cards_level_fkey" FOREIGN KEY (level) REFERENCES public."Levels"(id);
 D   ALTER TABLE ONLY public."Cards" DROP CONSTRAINT "Cards_level_fkey";
       public          postgres    false    201    2704    205            ?
           2606    41152 $   History_game History_game_level_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."History_game"
    ADD CONSTRAINT "History_game_level_fkey" FOREIGN KEY (level) REFERENCES public."Levels"(id);
 R   ALTER TABLE ONLY public."History_game" DROP CONSTRAINT "History_game_level_fkey";
       public          postgres    false    2704    201    203            ?
           2606    41157 $   History_game History_game_users_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."History_game"
    ADD CONSTRAINT "History_game_users_fkey" FOREIGN KEY (users) REFERENCES public."Users"(id);
 R   ALTER TABLE ONLY public."History_game" DROP CONSTRAINT "History_game_users_fkey";
       public          postgres    false    2702    203    199            ?
           2606    41099    Users Users_role_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_role_fkey" FOREIGN KEY (role) REFERENCES public."Roles"(id);
 C   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_role_fkey";
       public          postgres    false    2700    199    197           