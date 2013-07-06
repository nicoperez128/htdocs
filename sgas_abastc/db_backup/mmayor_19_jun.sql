--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: carrozado_mantencion; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE carrozado_mantencion (
    carrozado_mantencion_id integer NOT NULL,
    descricpion character varying(150),
    observacion character varying(500),
    fecha_creacion date,
    fecha_actualizacion date,
    modelo_id integer
);


ALTER TABLE public.carrozado_mantencion OWNER TO carlos;

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE categoria (
    categoria_id integer NOT NULL,
    descripcion text NOT NULL,
    categoria_padre_id integer
);


ALTER TABLE public.categoria OWNER TO carlos;

--
-- Name: chasis_mantencion; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE chasis_mantencion (
    chasis_mantencion_id integer NOT NULL,
    descricpion character varying(150),
    observacion character varying(500),
    fecha_creacion date,
    fecha_actualizacion date,
    modelo_id integer
);


ALTER TABLE public.chasis_mantencion OWNER TO carlos;

--
-- Name: compannia; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE compannia (
    compannia_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(255),
    telefono character varying(255),
    cuerpo_id integer
);


ALTER TABLE public.compannia OWNER TO carlos;

--
-- Name: comuna; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE comuna (
    comuna_id integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    provincia_id integer
);


ALTER TABLE public.comuna OWNER TO carlos;

--
-- Name: cuerpo; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE cuerpo (
    cuerpo_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    comuna_id integer
);


ALTER TABLE public.cuerpo OWNER TO carlos;

--
-- Name: evento; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE evento (
    evento_id integer NOT NULL,
    descricpion character varying(150),
    observacion character varying(500),
    fecha_evento date,
    fecha_creacion date,
    fecha_actualizacion date,
    categoria_id integer,
    vehiculo_id integer
);


ALTER TABLE public.evento OWNER TO carlos;

--
-- Name: modelo; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE modelo (
    modelo_id integer NOT NULL,
    tipo character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    categoria_id integer
);


ALTER TABLE public.modelo OWNER TO carlos;

--
-- Name: provincia; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE provincia (
    provincia_id integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    region_id integer
);


ALTER TABLE public.provincia OWNER TO carlos;

--
-- Name: region; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE region (
    region_id integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.region OWNER TO carlos;

--
-- Name: rol; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE rol (
    rol_id character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion text
);


ALTER TABLE public.rol OWNER TO carlos;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE usuario (
    usuario_id character varying(255) NOT NULL,
    usuario character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL,
    apellidos text,
    contrasenna character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    rol_id character varying(255) NOT NULL
);


ALTER TABLE public.usuario OWNER TO carlos;

--
-- Name: vehiculo; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE vehiculo (
    vehiculo_id integer NOT NULL,
    numero_chasis character varying(30),
    numero_motor character varying(30),
    numero_serie character varying(30),
    vin character varying(30),
    descripcion text,
    anno integer,
    peso integer,
    planos character varying(255),
    fecha_ingreso date,
    fecha_actualizacion date,
    patente character varying(255),
    denominacion character varying(25),
    anotaciones_vigentes text,
    primera_inscripcion text,
    pauta_asignada character(1),
    folio_chasis character varying(255),
    carrozado_mantencion_id integer,
    chasis_mantencion_id integer
);


ALTER TABLE public.vehiculo OWNER TO carlos;

--
-- Name: vehiculo_documento; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE vehiculo_documento (
    vehiculo_documento_id integer NOT NULL,
    numero_orden_compra character varying(10),
    fecha_orden_compra character varying(255),
    documento_orden_compra character varying(255),
    numero_declaracion_ingreso integer,
    fecha_declaracion_ingreso character varying(255),
    documento_declaracion_ingreso character varying(255),
    factura_comercial character varying(255),
    bill_of_lading character varying(255),
    packing_list character varying(255),
    acta_recepcion character varying(255),
    solicitud_extension_iva character varying(255),
    fecha_solicitud_extension_iva character varying(255),
    resolucion_extension_iva character varying(255),
    fecha_resolucion_extension_iva character varying(255),
    valor_compra integer,
    proveedor character varying(255),
    agente_aduana character varying(255),
    manual_usuario character varying(255),
    manual_mantencion character varying(255),
    certificado_homologacion character varying(255),
    vehiculo_id integer,
    cuerpo_id integer,
    compannia_id integer
);


ALTER TABLE public.vehiculo_documento OWNER TO carlos;

--
-- Name: vehiculo_fotografia; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE vehiculo_fotografia (
    vehiculo_fotografia_id integer NOT NULL,
    imagen character varying(255),
    categoria_id integer,
    vehiculo_id integer
);


ALTER TABLE public.vehiculo_fotografia OWNER TO carlos;

--
-- Name: vehiculo_informacion_general; Type: TABLE; Schema: public; Owner: carlos; Tablespace: 
--

CREATE TABLE vehiculo_informacion_general (
    vehiculo_informacion_general_id integer NOT NULL,
    categoria_id integer,
    vehiculo_id integer,
    modelo_id integer
);


ALTER TABLE public.vehiculo_informacion_general OWNER TO carlos;

--
-- Data for Name: carrozado_mantencion; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY carrozado_mantencion (carrozado_mantencion_id, descricpion, observacion, fecha_creacion, fecha_actualizacion, modelo_id) FROM stdin;
\.


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY categoria (categoria_id, descripcion, categoria_padre_id) FROM stdin;
1	Vista	\N
2	Vista Frontal	1
3	Vista Lateral	1
4	Vista Trasera	1
5	Proveedor	\N
6	Proveedor 1	5
8	Tipo Vehiculos Padron	\N
10	Camión	8
11	Tipo Vehiculos Bomberil	\N
14	Marca de Chasis	\N
15	RENAULT	14
17	Modelo de Chasis	\N
18	Modelo Chasis 1	17
20	Marca de Motor	\N
23	Color	\N
24	AMARILLO	23
26	Marca de Carrozado	\N
27	Camiva	26
29	Condicion	\N
32	Tipo Caja de Cambio	\N
35	Marca Caja de Cambio	\N
36	ALLISON	35
38	Modelo Caja de Cambio	\N
39	AV3000	38
41	Tipo de Combustible	\N
42	DIESEL	41
44	Marca Bomba	\N
45	CAMIVA	44
47	Modelo de Bomba	\N
48	CBZ 90/1 BRONCE	47
50	Pais Origen Carrozado	\N
51	Pais Carrozado 1	50
52	Pais Carrozado 2	50
53	Pais Origen Chasis	\N
54	Pais Chasis 1	53
55	Pais Chasis 2	53
56	Bomba Primera Intervención	11
57	MERCEDES BENZ	14
58	Modelo Chasis 2	17
60	NARANJA	23
61	Crimson Fire	26
63	MECÁNICA	32
64	ZF	35
66	GASOLINA	41
67	DARLEY	44
68	CHZ 180/3	47
69	Proveedor 2	5
70	Region Cuerpo	\N
71	Cuerpo Bomberos	\N
72	Compania	\N
74	Cuerpo 1	71
75	Compañia 1	72
76	Tipo Evento	\N
77	Accidente	76
78	Falla	76
79	Motor 2	20
80	Camioneta	8
81	Carrobomba	8
82	Automóvil	8
83	Bomba Forestal	11
85	Motor 1	20
86	E-One	26
88	Proveedor 3	5
89	RM	70
90	Bomba Semi Urbano	11
91	Bomba Urbano Estándar	11
92	Bomba Urbano Mayor	11
93	Camionetas de Apoyo	11
94	Carro Aljibe	11
95	Carro con Escala Telescópica	11
96	Carro con Escala Telescópica con Bomba y Estanque	11
97	Carro de Transporte Sanitario	11
98	Carro HAZ MAT	11
99	Carro Porta Escala Básico	11
100	Carro Porta Escala Tradicional	11
101	Carro Rescate Estándar	11
102	Carro Rescate Mediano	11
103	Carro Rescate Técnico Pesado	11
104	Furgones y Buses	11
105	Puestos de Comando	11
106	Vehículos Especiales	11
107	AZUL	23
108	BLANCO	23
109	GRANATE	23
110	ROJO	23
111	VERDE	23
112	VERDE LIMÓN	23
113	OTRO	23
114	ITURRI	26
116	PIERCE	26
117	ROSENBAUER	26
118	6AS 1000 TO	38
119	6S 1000 TO	38
120	CHZ 90/3	47
121	FURGÓN	8
122	rENAULT	20
123	CB90	47
124	Primera compañia	72
125	DODGE	14
126	BERLIET	14
127	MAGIRUS DEUTZ	14
128	rOJO BLANCO	23
87	AUTOMATICA	32
129	R120	47
130	ROSEMBAUER	47
131	reLIQUIA	11
132	NISSAN	14
133	mack	14
134	transporte de personal	11
135	chevrolet	14
136	delahaye	14
137	FORD	14
138	SPARTAN	14
139	rosenbauer	14
140	E-ONE	14
141	AMBULANCIA	11
142	WHELEN	26
143	international	14
144	FREIGHTLINER	14
145	peugeot	14
146	iveco	14
147	bertonati	26
148	HYUNDAI	14
149	Carro snorkel	11
150	volkswagen	14
151	kia	14
152	man	14
153	grumman	14
154	PIERCE.	14
155	PIERCE..	26
156	mitsubishi	14
157	pegaso	14
158	ssangyong	14
159	great wall	14
160	beige	23
161	daewoo	14
162	toyota	14
163	Suphten	14
164	magirus	14
165	Pirchs	26
166	dimex	14
167	plata	23
168	ISUZU	14
169	CITROEN	14
170	american lefrance	14
171	american lefrance.	26
172	mazda	14
173	mahindra	14
174	volvo	14
175	Techniques Y Supples	26
176	jac	14
115	MAGIRUS	26
177	BEDFORD	14
178	SCANIA	14
179	ward la france	26
180	jmc	14
181	san jose	26
182	sides	26
30	EN SERVICIO	32
187	DARLEY	26
183	RELIQUIA	29
184	EN REPARACIÓN	29
185	EN SERVICIO	29
186	FUERA DE SERVICIO	29
188	GRIS	23
189	AUTORRAD	14
190	LAND ROVER	14
191	DENNIS	14
192	ZX	14
193	AGRALE	14
194	DAIHATSU	14
195	SUZUKI	14
196	JURMAR	26
197	CHANGAN	14
198	KME	14
199	FERRARA	14
200	FERRARA	26
201	FIAT	14
202	EVS 3000	38
203	HORTON EMERGENCY VEHICLES	26
204	MARCOPOLO	26
205	BUS	8
206	SAMSUNG	14
207	HINO	14
208	GMC	14
209	DAF	14
\.


--
-- Data for Name: chasis_mantencion; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY chasis_mantencion (chasis_mantencion_id, descricpion, observacion, fecha_creacion, fecha_actualizacion, modelo_id) FROM stdin;
\.


--
-- Data for Name: compannia; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY compannia (compannia_id, nombre, direccion, telefono, cuerpo_id) FROM stdin;
1120	Segunda Compañia			22
1129	Bernhardt Eunom Philippi 			22
340	Segunda			136
719	EDUARDO LEMP LUTHI 			250
295	CHILE EXCELSIOR			170
766	PRIMERA			206
1407	Tte. Hernan  Merino Correa 			153
1431	Tercera 			283
334	Bomba Esmeralda			222
298	MÁXIMO HUMBSER			170
486	Primera			5
1211	Valle Hermoso			49
204	OCTAVA			142
242	TERCERA COMPAÑIA 			6
198	SEGUNDA			142
301	VITACURA			170
609	PRIMERA COMPAÑÍA DE BOMBEROS DE MEHUIN			162
244	QUINTA COMPAÑIA 			6
304	RENCA			170
328	Tercera			220
1392	SEGUNDA COMPAÑIA BOMBA ESPAÑA			286
1013	Primera Compañía			81
821	Isla de Yaquil 			83
193	Primera Cía German Tenderini			171
1306	TERCERA COMPAÑIA			281
862	TERCERA COMPAÑÍA 			278
1345	PEDRO DE VALDIVIA			156
786	Primera Compañía			21
256	Primera			9
1396	Cuarta Compañia			279
1397	Quinta Compañia Bomba Croata			279
667	SEGUNDA COMPAÑIA			270
567	Quilitapia.			19
422	Primera			116
199	TERCERA			142
243	CUARTA COMPAÑIA 			6
279	Segunda Compañía			232
293	BOMBA ESPAÑA			170
296	PROVIDENCIA			170
887	Segunda de Hornopiren			151
702	PRIMERA			42
202	SEXTA			142
1356	SEXTA			224
1357	SEPTIMA			224
705	PRIMERA			76
711	PRIMERA			280
317	Pucará			139
534	4ta.			41
1393	TERCERA			286
374	Cuarta			136
412	Martir Guillermo Gonzalez Rojas			94
1394	CUARTA			286
294	POMPA ITALIA			170
611	Primera Compañía			189
200	CUARTA			142
1265	QUINTA COMPAÑÍA			278
341	Tercera			136
272	Undecima			607
329	Cuarta			220
1316	TERCERA  CARELMAPU			161
1250	ARTURO PRAT CHACÓN 			290
318	Rinconada			139
1455	TERCERA			614
245	SEXTA COMPAÑIA 			6
376	Bomba Lo Encañado			169
1398	Sexta Compañia			279
747	PRIMERA			262
774	PRIMERA COMPAÑIA			270
1242	Compañia de Bomberos Alto Molle N° 2			612
823	Primera compañia Bomba Yelcho			284
886	Llifén			150
297	THE BRITISH AND COMMONWEALTH FIRE COMPANY			170
300	CERRILLOS			170
282	MAPOCHO			170
303	APOQUINDO			170
468	Primera			13
1436	Primera Virtual 3			624
1448	SEGUNDA COMPAÑIA			5
378	Tercera Compañía Lonquen			171
1227	Segunda			40
485	Bomba Azapa			1
693	PRIMERA			275
389	Primera			86
649	Tercera			611
436	Alfonso Pacheco Letelier			121
333	Bomba Batuco			222
327	Segunda			220
861	José Miguel Carrera			130
1395	Sexta			255
266	Quinta			607
267	Sexta			607
966	Diego Portales			238
330	Quinta			220
269	Octava			607
271	Decima			607
582	GERMANIA			291
501	JUAN  VEGA  VEGA			18
405	Segunda			92
236	Guacolda			253
706	PRIMERA			286
425	Cuarta			116
1449	SEGUNDA COMPAÑIA			98
388	Segunda			90
258	Tercera Cia 			174
1414	Bomba Cordillera			19
1399	Septima Compañia			279
1432	Bomba new york			148
1094	2da. Cia.BERNARDO ESCALANTE CARRASCO			35
250	Segunda			7
822	Tercera			137
354	Bomba Malloco			144
1429	--			259
1108	Bomba George Garland			68
525	Primera			608
849	Bomba Abraam Hidalgo Romero			83
1121	Sapeurs Pompiers			22
390	Segunda			86
1355	QUINTA			224
1141	Carlos Manríquez Súpper			24
313	Bomba Chile			139
392	Cuarta Bomba Cesar Quintanilla 			86
1178	Segunda Compañía			196
833	primera			261
846	BOMBA CHUQUICAMATA			7
694	PRIMERA COMPAÑIA			276
421	Bomba Lontué			97
1024	CUARTA COMPAÑÍA			276
798	CARACOLES			613
1271	SEGUNDA			160
1219	Tercera Compañía			279
859	Pablo A. Fuentes 			240
881	QUINTA 			291
904	Tercera Compañía			189
365	Libertador Bernardo O´Higgins			148
367	Chile España			148
1413	La Ligua			19
939	1ª Requinoa			115
837	Segunda			255
360	CUARTA 			145
439	Primera			123
387	Primera			90
979	SEGUNDA			154
464	Cuarta Compañía			11
416	Primera			296
462	Segunda Compañía 			11
1450	TERCERA COMPAÑIA			98
1348	Bomba Bernardo O'Higgins			608
1362	CUARTA			282
864	PRIMERA COMPAÑÍA			278
326	Primera			220
716	Tercera Compañía			245
1011	primera			101
1102	Pompe France			68
1008	Primera			72
779	PRIMERA COMPAÑIA			273
471	Primera			15
338	Manuel rodriguez			135
474	EDUARDO FARLEY			17
836	Primera			269
473	AMBROSIO OHIGGINS			17
665	Tercera Compañía			268
508	Ferroviaria			20
817	Sexta Compañía			268
863	SEGUNDA COMPAÑÍA 			278
480	Presidente Pedro Aguirre Cerda			1
1217	Primera Compañia			279
507	Rubén Gómez Escobar			20
531	Juan Araneda Zuñiga			130
1160	Bomba Abanico			129
519	Primera			31
530	Republica de Austria			240
953	Quinta Compañía			268
532	CUARTA COMPAÑÍA			278
1363	Primera Compañía			268
1444	8			181
514	Arturo Prat Chacón			20
1014	Primera			155
503	Bomba Romualdo Díaz			19
253	Primera Bomba Internacional			8
441	Primera			125
614	TERCERA			260
315	El Alcazar			139
1163	Primera Compañía			133
451	Primera			127
1277	BOMBA 			147
316	Los Héroes			139
311	Eduardo Ramirez Mazzoni			139
883	CUARTA 			291
764	PRIMERA			204
677	BOMBA QUILPUE			59
827	primera			247
679	BOMBA EL BELLOTO			59
1179	Tercera Compañía			196
520	Segunda Compañia Bomba 21 de Mayo			31
1437	Segunda			57
352	DALIBOR SVOBODA			144
855	PRESIDENTE BALMACEDA			243
796	Primera Compañía			231
526	Director Luis Ackermann			197
408	Bomba Linares			94
339	Primera			136
728	Bomba Arturo Prat			219
731	PRIMERA			256
662	COMPAÑIA DE JESUS			83
992	Prímera Compañía 26 de Diciembre			65
1122	Cuarta Compañía			22
884	SEXTA			291
809	SEXTA COMPAÑIA			272
1103	Cristóforo Colombo			68
1142	Federico W. Schwager			24
737	PRIMERA			160
403	Primera			91
261	Primera			607
913	3			108
573	Primera Compañía			246
982	Quinta Compañía			97
734	ESMERALDA			156
587	Primera de Contao			151
898	MANUEL RODRIGUEZ			157
624	PRIMERA COMPAÑIA			263
725	PRIMERA			252
749	PRIMERA			57
409	Arturo Prat			94
696	PRIMERA COMPAÑÍA			277
589	6era.			136
626	1era.Capitán Romualdo Fuentealba Aravena			197
602	REINARD WESTERMEIER GEBAUER			157
238	Pillanlelbun			253
1230	Segunda			274
1176	Segunda Compañía			195
672	SEGUNDA			128
1006	Cáhuil			109
1249	Tercera Compañía Guaico Tres			120
1350	SEGUNDA			206
1247	Brigada de Puerto Ibañez			216
860	Mateo de Toro y Zambrano			130
628	3era.			264
650	Elga Sarmiento Soto			121
314	El Abrazo			139
657	3era.			168
431	Primera Retiro			118
763	Primera Compañia 			114
312	Cerrillos			139
920	4º CIA.			197
370	Carlos Gonzalez Castillo			148
592	Primera Compañía			137
925	Segunda Compañía			198
605	PEDRO URREA SAN MARTIN			159
1004	SEGUNDA			256
641	3era.			267
752	PRIMERA			218
756	PRIMERA			58
1351	TERCERA			206
630	Quinta Compañia			198
1451	CUARTA COMPAÑIA			98
724	PRIMERA			98
973	Primera Compañía			29
1415	SEGUNDA COMPAÑÍA MAULE			296
976	Bomba La Serena			32
680	Isabel Soto			254
739	Primera Compañía			191
988	Segunda Compañía 			114
781	Primera			274
638	BOMBA EL RETIRO			59
854	FEDERICO BENAVENTE			243
820	ARTURO PRAT CHACON			157
841	CUARTA 			244
504	Bomba Chile			20
510	Amador Rojas Rojas			20
1318	QUINTA QUENUIR			161
813	Bernardo Ohiggins Riquelme			150
583	Bomba Arturo Prat			150
1254	Tercera Compañía			239
440	Segunda			123
270	Novena			607
410	Manuel Rodriguez			94
411	Cuarta			94
856	SEGUNDA			275
598	TERCERA			154
432	Segunda Copihue			118
521	Tercera 			31
919	2 Compañía Germania			197
1170	Segunda Compañía			30
831	primera			258
1438	Bomberos de San Pedro de Alcantara			179
828	primera			249
512	Guanaqueros			20
1130	Octava Compañía			22
1452	SEGUNDA COMPAÑIA			50
789	PRIMERA			260
771	PRIMERA			63
834	primera			264
792	Orlando Rojas Parra			265
465	Quinta Compañía			11
433	Primera Compañía Bomba España			120
729	PRIMERA			50
915	SEGUNDA COMPAÑIA			263
642	Tercera Compañía 			114
829	Primera			255
1255	Catripulli			246
810	Cuarta Compañía			268
847	AGUSTIN BRIONES GUZMAN			83
832	primera			259
867	Segunda Compañia			284
882	TERCERA			291
928	Bomba Chile			219
917	8º COMPAÑIA			197
1256	Segunda			247
971	ELEUTERIO RAMIREZ 			289
730	Arturo Prat			52
912	2ª Cía. de Bomberos Chincolco			56
918	5 CIA RELONCAVI			197
997	Cuarta			255
584	ARTURO PRAT 			250
1034	Ignacio Alfonso			32
362	Primera			146
524	Tercera Las Camelias			118
974	Tercera Compañía Copiulemu			29
848	CUNACO			83
758	PRIMERA			202
513	Femenina			20
901	Segunda Compañía			189
1319	SEXTA LA PASADA			161
893	Segunda Compañía			158
916	BOMBA INDEPENDENCIA			263
721	Guillermo Widerhold Mann			48
1418	Quinta			249
1131	Novena Compañía			22
929	Bomba Alemana			219
1093	MANUEL RODRIGUEZ ERDOIZA			80
794	PRIMERA			610
770	PRIMERA			67
467	Segunda El Salvador			299
470	Segunda			14
911	QUINTA			165
1023	TERCERA COMPAÑÍA			276
840	QUINTA			244
935	Marcos Hahn Chandia			60
1257	Tercera			247
995	SEGUNDA			67
1026	ORFEÓN INSTRUMENTAL			276
1290	QUINTA			154
812	Tercera Director Feliciano González Labraña			197
1051	SEGUNDA			262
1052	TERCERA			262
472	Primera			16
1291	Segunda			9
355	Cuarta Compañía Padre Hurtado			144
1015	PRIMERA COMPAÑÍA			166
1105	Bomba Zapadores Franco-Chilenos			68
1447	Segunda Compañia			626
1401	SEGUNDA			202
1124	Primera			283
1022	SEGUNDA COMPAÑÍA			276
1025	QUINTA COMPAÑIA			276
1283	SEGUNDA COMPAÑIA			167
596	B. O"higgins - Zapadores hacha			32
1341	Tercera Compañía			76
942	Godofredo Mera			208
921	Director Guillermo Varas Oyarzún			197
1068	segunda			101
393	Primera			87
1042	Bomba Lo Miranda			77
924	Tercera Compañia			198
357	PRIMERA			145
1380	MOISES DEL FIERRO ARCAYA			66
945	BOMBA MARIQUINA			208
1453	TERCERA COMPAÑIA			50
686	Primera			109
346	Manuel Rodríguez			141
1033	Primera Compañia Bomba Coquimbo			32
1233	Segunda			269
612	Primera Compañía			190
1402	TERCERA			202
502	Carlos Aros Ansieta			18
391	Tercera bomba Arturo Prat			86
1060	SEXTA COMPAÑIA RIO BLANCO			51
755	PRIMERA COMPAÑIA ARTURO PRAT			200
1043	SEGUNDA COMPAÑIA			200
970	Segunda Compañia Isla Negra			43
469	Primera			14
1046	QUINTA  COMPAÑIA			200
1053	CUARTA			262
1133	Primera Compañía			235
452	Segunda			127
826	PRIMERA			244
1234	Tercera			269
687	Compañia Bomberos Paredones			179
1069	Quinta			101
838	SEGUNDA			244
1403	CUARTA			202
1057	TERCERA COMPAÑIA ANDINA			51
1457	3ª El Abra			115
795	Primera			611
753	1era Cia.Bomba Victor Hugo Valdivia			35
989	Segunda			611
358	SEGUNDA			145
1132	Decima Compañía			22
1009	primera			74
371	PRIMERA			149
1409	GENERAL BAQUEDANO			613
653	Tercera Compañía			229
815	Gabriela Mistral			37
723	PRIMERA			154
839	TERCERA			244
1229	Cuarta			274
1044	TERCERA COMPAÑIA			200
206	DECIMA			142
265	Bomba Lo Ovalle			607
1071	DECIMA COMPAÑIA 			6
659	Segunda Cia. 			210
666	tercera			16
1106	Zapadores Freire			68
264	Bomba San Miguel			607
1125	Segunda 			283
453	Tercera			127
1434	San Antonio de Matilla			3
1138	Segunda Compañía			132
1126	Primera Compañía			606
975	Bomba Mair Cazés Sady			32
1139	Tercera Compañía			132
678	ESTEBAN SANTIC			59
972	Segunda Compañía			29
1202	Quinta Compañía			237
353	Segunda Compañía			144
1183	Cuarta Compañía			229
424	Tercera			116
885	Heroes de La Concepción			150
201	QUINTA			142
478	Primera Compañía			129
1231	Tercera			274
993	Segunda Compañía			231
262	Segunda			607
1458	Primera			618
1099	Bomba Germania			68
682	PRIMERA			99
1435	primera			623
835	1era			267
640	2da.			267
381	Bomba Fernando Vivanco Roco			172
923	Sexta Compañia			198
1032	SegundaCompañía			81
1056	SEGUNDA COMPAÑIA ITALO CHILENA POMPA ROMA			51
751	PRIMERA			167
420	HECTOR ARISTEGUI VILLALOBOS			97
268	BOMBA AUSTRIA			607
1439	Segunda Compañia			201
1289	CUARTA			154
613	Primera Compañía			193
445	Cuarta Compañía			124
875	Cuarta Compañía			245
581	CAUPOLICÁN			290
255	Tercera Bomba Angamos			8
1045	CUARTA COMPAÑIA			200
1161	Eduardo Rodríguez			130
1166	Cuarta Compañía			133
1048	BOMBA FIDEL AZOCAR 			113
305	LEALTAD Y SACRIFICIO			170
709	PRIMERA			73
1196	Juan Guillermo Sosa Severino 			236
1118	Primera Compañía			24
1167	Quinta Compañía			133
241	SEGUNDA COMPAÑIA DE BOMBEROS			6
910	TERCERA			165
1197	Decima Compañia			236
1216	CUARTA COMPAÑIA TROVOLHUE			242
1119	Primera Compañia			22
195	Bomba Alberto Correa Valenzuela			78
380	Bomba Chacabuco			172
1134	Bomba Caleu			172
448	Sexta Compañía			124
1308	Bomba Comalle			126
418	Primera Compañía			97
1381	BOMBA ITALIA			66
1408	BRIGADA LOS PINOS			59
1270	Rinconada de Alcones			102
413	Presidente José Manuel Balmaceda			96
331	Bomba Estados Unidos de America			222
511	Tierras Blancas			20
428	Primera			117
483	Pompe France			1
757	PRIMERA			201
1305	SEGUNDA COMPAÑÍA			281
618	Compañia de Bomberos de Bucalemu			179
1054	QUINTA			262
249	Bomba Calama			7
1465	CUARTA COMPAÑIA			184
1049	BOMBA NEW YORK 			113
1284	Tercera Compañia 			167
940	CUARTA			64
401	ESPECIALIDADES Y RESCATE			89
414	Primera Compañía			95
684	PRIMERA			104
417	Primera			217
527	Brigada Quenac			275
793	PRIMERA			266
415	Segunda Compañía			95
509	Centenario			20
1235	Segunda Compañía Bomberos Viña del Mar			70
717	FEDERICO SCHULZ			289
1030	SEPTIMA COMPAÑIA			272
868	Tercera Compañía			75
447	Quinta Compañía			124
1007	Primera Compañía de Bomberos			82
342	PRIMERA			140
1454	BOMBA PAHUIL			90
1091	Sexta Compañia			116
1382	BOMBA PANQUEHUE			66
830	OTTO LINKE			257
1092	BOMBA CHILE - ESPAÑA			80
825	Primera Compañía Bomba 			242
1214	2ª Cia Bomba 			242
1158	Segunda Compañia			131
429	Segunda			117
1466	QUINTA COMPAÑIA			184
221	Eduardo Rivas Melo			85
1260	SEGUNDA			252
394	JOSE GUILLERMO MACIAS ALVARADO			88
700	PRIMERA			40
964	TERCERA COMPAÑIA LORENZO BAVESTRELLO TASSARA			69
858	Armando de Folliot			240
1272	Cuarta 			149
1215	TERCERA COMPAÑIA			242
1342	Cuarta Compañia  tinguiririca 			76
1055	SEXTA			262
1100	Bomba Cousiño y A. Edwards			68
1282	Primera			620
395	Segunda			88
505	Bomba Esmeralda			20
427	Primera			297
1038	Tercera Compañía de Bomberos			82
938	SEGUNDA			266
889	Segunda Compañía			182
853	Manuel Bunster			243
1117	MANUEL RODRIGUEZ			153
1430	SEGUNDA			58
1427	codegua 			76
337	Jose Miguel Carrera			135
708	PRIMERA			614
620	Primera Compañía			108
619	1ª Compañía Alberto Callejas Zamora			56
1220	SEGUNDA			71
715	Primera Compañia El Tabo			44
983	SEGUNDA			260
1245	Tercera Compañía 			95
1218	Segunda compañia Bomba Chiloé - España			279
1276	QUINTA Compañía			177
701	Julio Montt Salamanca			41
691	BOMBA CHILE ESPAÑA			83
497	Iquique			2
1213	Guillermo Gonzalez Rojas			85
251	Tercera			7
1089	Tercera			618
689	primera			111
969	Bomba Doñihue			77
423	Segunda			116
880	SEGUNDA			291
484	Capitán de Fragata Arturo Prat Chacón			1
481	Bomba 7 de Junio			1
419	Alejandro Dussaillant Loundre			97
1248	Cuarta Compañia			95
1169	Hernán Andrade Espejo			134
695	Jose Bunster			240
1240	Quinta Compañía, Almirante Luis Gómez Carreño			70
1411	Segunda Compañia Las Cruces			44
506	Hugo Cossgrove			20
1113	Primera			619
1340	Segunda  convento viejo 			76
591	ENRIQUE LOPEZ MAQUEIRA			47
490	Española			2
492	Ausonia 			2
1087	Cuarta			618
1442	QUINTA			202
1462	Segunda			624
1424	Quinta Compañia 			86
896	Cuarta Compañía			158
784	PRIMERA			71
1076	Primera			616
791	Segunda			288
235	Primera Compañia Enrique Balbontin Urquiza			54
718	PRIMERA			292
435	Carlos Méndez Guerra			121
479	Libertador Gral. Bernardo O'Higgins R.			1
965	CUARTA COMPAÑIA			69
888	Tercera Compañía			182
1239	Sexta Compañía Francisco Ortiz Navarro 			70
778	Bomba Americana			68
398	BOMBA SARGENTO ALDEA			89
207	UNDECIMA			142
1112	Decimo Tercera			68
434	Segunda Compañía Los Queñes			120
247	OCTAVA COMPAÑIA 			6
1135	Tercera Compañía El Manzano			18
1463	Tercera			624
802	Quinta Compañía			245
644	 Segunda Herminio Concha			204
994	Primera Cia. 			210
906	Segunda Compañía			193
785	Manuel Rodriguez			130
1010	Guillermo Burmesters Zuñiga			106
932	Tercera Compañía Canteras			226
494	Sargento Aldea			2
1212	Los Molles			49
981	HANS FEHLANDT			159
1303	BOMBA CHILE 			113
683	PRIMERA			103
1104	Bomba España			68
799	FEDERICO VARELA 			271
890	Cuarta Compañía Trupan			182
1172	Tercera Compañía			187
1275	CUARTA San Javier			177
1228	CUARTA			614
894	Quinta Compañía			158
1098	Compañía Costa Mar			209
437	Primera Compañia Matias Silva 			122
349	Segunda Compania			143
726	PRIMERA Germania			177
1383	BOMBA ARTURO PRAT CHACON			66
487	San Andrés de Pica			3
668	SARGENTO ALDEA			271
703	PRIMERA			285
735	Primera Compañía			187
426	Quinta			116
1171	Segunda Compañía			187
962	CUARTA COMPAÑIA			272
1162	Cuarta Compañía			132
958	HIJOS DE TRAIGUÉN			271
325	SEPTIMA			147
1241	Octava Compañía Bomba Ismael Ruiz-Tagle Leniz			70
957	REHUE			271
733	PRIMERA COMPAÑIA BOMBA ANDES			51
643	2ª Los Lirios			115
1187	Segunda Compañia			233
319	BOMBA MANUEL RODRIGUEZ			147
454	PRIMERA			128
322	BOMBA RENE SCHNEIDER CHEREAU 			147
879	Eleuterio Ramírez			290
1039	Cuarta Compañía de Bomberos  			82
937	ENRIQUE MILLER BROWN			60
1146	Bernardo O'higgins			24
946	Primera Compañía			234
772	Eduardo Cornou Chabry			236
495	Tarapacá			2
1192	Fünfte Deutsche Feuerwehrkompanie Talcahuano 			236
754	Bomba Magallanes			219
1343	Bomba Israel			68
1280	Compañía Villa Puaucho			209
790	PRIMERA			199
895	Sexta Compañía			158
936	JOSÉ MARÍA LANDETA 			60
768	BOMBA ACONCAGUA			66
1281	SEXTA PTO NUEVO			177
1236	Tercera Compañía Libertador Bernardo OHiggins			70
1251	ARTURO PRAT 			290
286	POMPE FRANCE			170
343	"Ignacio Serrano Montaner"			141
1101	Bomba Almirante Manuel Blanco Encalada			68
489	Segunda 			4
1252	SAN SEBASTIÁN			290
1464	Cuarta			624
1259	2a Compañía "ALIRO ROSATI MUÑOZ" 			241
891	CARLOS ALFARO CORTES			47
320	BOMBA LUIS DITTMANM			147
980	Sargento Aldea			52
1095	BOMBA PUENTE NEGRO 			80
1358	TERCERA			128
1096	BOMBA CHILE ITALIA 			80
287	ARTURO PRAT			170
1040	Quinta Compañía de Bomberos			82
714	Primera Compañia El Quisco			43
488	Primera 			4
1368	Bomba Chicureo			222
1107	Eduardo Farley Bomba Chileno-Arabe			68
1238	Séptima Compañía Viña del Mar Alto			70
967	Segunda Compañía			239
1223	SEGUNDA 			55
671	SEGUNDA COMPAÑIA BOMBA BUENAVENTURA JOGLAR			69
616	BOMBA PABLO GALLEGUILLOS			34
361	QUINTA			145
931	"Jose Zambrano Riffo"			265
950	Primera Compañía			268
1274	TERCERA José Alberto Vera Vera			177
745	Primera Compañía			195
926	Bomba Croacia			219
323	BOMBA CERRO NAVIA 			147
1297	ANTONIO TIRADO LANAS			34
1300	SEPTIMA 			34
800	Primera Compañía			239
402	BOMBA SARMIENTO 			89
632	Bomba Francesa			219
664	Segunda Compañía			268
720	Bruno Uslar			181
283	ESMERALDA			170
1177	Tercera Compañía Lirquén			195
968	Cuarta Compañia			239
698	José Serey Sagredo			39
990	Segunda Compañía			229
601	Tercera			255
1210	Placilla			49
252	Bomba Alemania			7
1153	Tercera Compañía			184
842	SEGUNDA COMPAÑIA DE PERALILLO 			107
397	BOMBA ALBERTO OSORIO FLORES			89
400	BOMBA LOS NICHES			89
1263	ARTE Y CULTURA 			89
1005	SEGUNDA COMPAÑIA			273
907	OSCAR ESPINOZA ARNAO			34
1301	CERRILLOS DE TAMAYA 			34
1128	Bomba José Quintino F. 			22
843	Quinta			255
1041	Sexta Compañía de Bomberos 			82
1352	CUARTA			206
738	PRIMERA			161
1147	Segunda Compañía Talcamavida			181
1386	TERCERA ELEUTERIO RAMIREZ			163
1164	Segunda Compañía Zapadores			133
765	Hacha y Escala			205
399	BOMBA LUIS CRUZ MARTÍNEZ			89
685	PRIMERA COMPAÑIA DE PERALILLO			107
347	José Miguel Carrera			141
712	PRIMERA			282
1370	Brigada Chacabuco			222
1173	Cuarta Compañía			187
285	CLARO ABASOLO			170
321	BOMBA COMANDANTE GUSTAVE NEVEU			147
1058	CUARTA COMPAÑIA CALLE LARGA			51
324	BOMBA PUDAHUEL			147
1050	BOMBA EL TENIENTE 			113
1296	TERCERA 			34
1111	Reino de Bélgica			68
1298	QUINTA COMPAÑIA DE SOTAQUI 			34
1302	BOMBA CHILE 			113
482	Bomba Carlos Ibañez del Campo			1
1404	ARTURO  PRAT			153
1320	PRIMERA			224
760	LUIS ARAYA FLORES			60
1140	José María Dillinger			24
652	TERCERA			64
1353	QUINTA			206
529	Cuarta Compañía de Hurtado			18
288	SALVADORES Y GUARDIAS DE PROPIEDAD			170
1322	PRIMERA COMPAÑIA DE HUELLEUE			152
430	Primera			119
902	Cuarta Compañía			189
1189	Segunda Compañía			235
449	Bomba Daniel Vargas Gaete 			126
1360	SEGUNDA			282
1059	QUINTA COMPAÑIA 			51
442	Primera Compañía			124
1165	Tercera Compañía			133
767	PRIMERA			64
1378	LA INTERNACIONAL			66
1384	18 de Febrero			96
344	Cristobal Colón			141
406	Roberto Gil Oyaneder			93
539	Primera Compañía			26
407	Segunda Compañia Iloca			93
1159	Primera Compañía			131
382	Villa Alhue			173
302	LO BARNECHEA			170
1315	SEGUNDA			161
851	Tercera Compañía			26
377	Segunda Compañía Bomba Arturo Prat			171
1109	Luis Bravo Osses "Bomba Suiza"			68
1143	Ramón Medina Arévalo			24
617	PRIMERA			165
903	Quinta Compañía			189
289	HONOR Y PATRIA			170
952	Septima Compañía			268
780	PRIMERA COMPAÑIA			69
1359	Segunda Compañia Jhonn F. Kennedy			100
1191	Segunda Compañía Zapadores			236
803	Segunda Compañía 			245
1336	9º COMPAÑIA			197
1088	Segunda			618
1127	Segunda Compañia			606
1354	CUARTA			224
1326	3			249
850	Segunda Compañía			223
660	Segunda Compañía			234
443	Segunda Compañía			124
585	Primera Compañía			251
1361	TERCERA			282
1405	CUARTA COMPAÑIA			270
444	Tercera Compañía			124
1020	SEGUNDA			224
345	Comandante Raul Galdamez Olivares			141
1328	Sexta Compañía			11
538	Segunda Compañía			26
1299	CARLOS CAZAUDEHORE DOURS			34
254	Segunda Bomba ferrocarril			8
290	LA UNIÓN ES FUERZA			170
782	Primera Compañía Bomba Jose Francisco Vergara			70
707	Primera Compañía			134
475	PEDRO ALVAREZ CORTES			17
819	CEMENTO MELÓN 			47
986	SEGUNDA			199
743	PRIMERA			55
927	Bomba España			219
1193	Salvadora			236
736	Primera Compañia Leoncio Lizana Valenzuela			100
1237	Cuarta Compañía José Rafael Brunet Barreiro			70
336	Segunda Compañía de Bomberos de Pataguilla			221
697	Tercera Compañía			131
1325	SEGUNDA			249
985	segunda			264
905	Segunda Compañía			190
476	HERMANOS CARRERA			17
590	Primera Compañía			46
1136	SEGUNDA COMPAÑÍA			294
1347	Cuarta Compañia			233
570	Primera Compañía			245
690	EUGENIO LOPEZ DONOSO			80
1337	segunda compañia 			226
1327	4			249
1338	diego de almeyda de aracena y godoy			12
1324	RENATO DE LA CRUZ			257
351	Cuarta Compania			143
350	Tercera Compania			143
651	SEGUNDA			64
457	alfredo molina godoy			12
955	Octava Compañía			268
633	TERCERA			199
908	SEGUNDA			165
1317	CUARTA			161
1018	CUARTA			165
1019	SEXTA			165
909	SEPTIMA			165
1090	OCTAVA 			165
1017	Primera Compañia Germania			164
1310	Segunda Compañia de Bomberos			164
1190	Salvadora y Guardia de Propiedad			236
1311	Tercera Compañia de Bomberos			164
292	ANICETO IZAGA			170
1312	Cuarta Compañia de Bomberos			164
866	Bomba Quintay			41
944	Emilio Habert			208
1077	Cuarta Compañía 			211
623	Tercera 			4
943	Fundación La Dehesa			208
941	Cuarta Compañía			208
1085	SEGUNDA			298
656	Segunda Compañía			208
1145	Luís Alberto Molina Báez			24
1198	Bomba San Vicente 			236
1344	TOMÁS LAGOS GODOY			156
948	Cuarta Compañía			234
1144	Sexta Compañía			24
692	PRIMERA LA PAMPA ALTO HOSPICIO			298
1323	HECTOR DE LA CRUZ AREND			257
777	Primera Compañía 			211
797	Compañia Chilena de Bomberos			612
670	Gloria Torres Espejo			37
463	Tercera Compañia			11
1203	Sexta Compañía			237
947	Tercera Compañía			234
1065	Quarta Compagnia di Pompieri di Talcahuano 			236
1194	Almirante Calixto Rogers 			236
496	Victoria			2
1195	Bomba Huachipato 			236
572	Primera Compañía			25
775	Primera Compañía			237
1309	Bomba Cautin			253
1199	Segunda Compañía			237
1201	Cuarta Compañía			237
364	Tercera			146
951	Novena Compañía			268
871	Carlos Collin			27
543	Cuarta Compañía			27
1285	Séptima Compañía			237
1286	Octava Compañía			237
960	PRIMERA COMPAÑIA			272
1114	Primera Compañía			30
959	QUINTA COMPAÑIA			272
961	TERCERA COMPAÑIA			272
954	Decima Compañía			268
477	RAFAEL TORREBLANCA			17
493	Dalmacia 			2
669	SEGUNDA COMPAÑIA			272
930	Bomba 18 de Septiembre			219
240	PRIMERA COMPAÑIA 			6
363	Segunda			146
309	Cuarta			138
228	Guillermo Rahaussen			253
1047	BOMBA ARTURO PRAT 			113
877	Tercera Compañía			25
1115	Primera Compañía			23
348	Primera Compania			143
857	Segunda			38
762	BOMBA OHIGGINS 			113
1186	Primera Compañía			233
491	Germania			2
1267	Quinta			295
1037	Hermanos Núñez Cuadra			605
1364	Pinguino de Humbolt			605
1137	Primera Compañía			132
299	CHILE			170
541	Novena Compañía			27
499	Guardiamarina Ernesto Riquelme Venegas			2
332	Bomba Lampa			222
227	Bomba Suiza			253
872	Primera Compañía			27
1287	Tercera Compañía			27
873	Sexta Compañía			27
1288	Zapadores Franceses			27
1168	Séptima Compañía			27
561	Tercera Compañía Caleta Tortel			223
1321	TERCERA			224
1313	Bernardo O'Higgins 			238
1016	PRIMERA COMPAÑÍA DE BOMBEROS CHOSHUENCO			287
1262	IGNACIO DOMEYKO			17
876	Segunda Compañía			25
787	Sven Krarup V.			45
257	Primera Cia. 			174
892	Tercera Compañía			158
515	Primera			295
516	Segunda			295
517	Tercera			295
897	CAMILO HENRIQUEZ			157
1268	Sexta			295
874	Segunda Compañía			21
1232	Tercera Compañía			21
518	Cuarta			295
713	Primera Compañía			28
722	Enrique Doll Rojas			49
1067	Segunda Compañía			49
542	Décima Compañía			27
956	TERCERA COMPAÑIA			270
681	Primera			79
977	Pedro Aguirre Cerda			183
372	Segunda			149
597	Teniente Hernán Merino Correa			183
588	Primera Compañía			182
1152	Segunda Compañía			184
1149	Tercera Compañía de Bomberos Cerro Alto			185
1366	SEGUNDA COMPAÑIA DE BOMBEROS DE CHOSHUENCO			287
1367	TERCERA COMPAÑÍA DE BOMBEROS DE PUERTO FUY			287
356	Quinta Compañía Santa Rosa 			144
615	BOMBA GABRIELA MISTRAL			105
603	Carlos Condell 			33
310	Quinta			138
899	CLAUDIO ROZAS TOLEDO			157
1074	Manuel Rodríguez			186
748	Francisco Mulligan			225
610	Froilan Latorre Ortega			188
197	PRIMERA			142
727	Primera Compañía			184
1075	Tercera Compañía			186
978	Presidente Jorge Alessandri Rodríguez			183
1154	Bomba Chile España			186
1148	Segunda Compañía de Bomberos Antihuala			185
1156	Bomba Chileno Alemana			186
1073	Bomba Bio Bio			186
1155	Quinta Compañía			186
1157	Séptima Compañía			186
375	Primera			169
1072	Octava Compañía			211
1174	Moisés López Castro			188
746	Primera Compañía			196
1175	César Sanhueza Sanhueza			188
1078	Segunda Compañía 			211
987	Primera Compañía			180
1292	Segunda Compañía			180
1180	Primera Compañía			227
1181	Segunda Compañía			227
1182	Tercera Compañía			227
783	Arturo Prat			238
1079	Tercera Compañía			211
710	PRIMERA COMPAÑÍA			281
1204	Gino Grandi Alonso			175
773	Allen Jara Sepulveda			175
1371	Segunda 			616
1080	Quinta Compañía 			211
203	SEPTIMA			142
578	Primera Compañía Raul Samur Yañez			248
625	Puyuhuapi			215
1346	Tercera Compañía de Bomberos de Pidima			248
878	Segunda Compañía Bomberos Pailahueque			248
744	Primera Compañía			194
788	PRIMERA			293
631	SEGUNDA NILAHUE CORNEJO			110
373	Tercera			149
1264	Bomba El Corazón			119
933	Primera Compañia			226
1150	Alberto Gruebler			192
761	Primera Compañía			228
769	Primera Compañía			230
1184	Segunda Compañía			230
688	PRIMERA PUMANQUE			110
1205	Maximo Puffe			238
192	Puerto Cisnes			215
1151	Segunda Compañía La Concepción			192
991	Primera Compañía			229
776	Primera Compañía			176
396	BOMBA ESMERALDA			89
804	BOMBA RANCAGUA			113
306	Primera			138
307	Segunda			138
308	Tercera			138
900	FRANCISCO PINOCHET MOLINA			33
404	Primera			92
1445	Segunda Compañía			23
1028	2ª Compañía  localidad de La Junta			215
194	1ª Cía. Comandante Juvenal Leyton Barrientos			216
229	2º Compañía - Bomba España			216
231	4ª Compañía 			216
852	PRIMERA COMPAÑÍA			223
869	Primera			213
870	Segunda Compañía			213
1002	PUERTO GUADAL			213
1246	Brigada de Puerto Aguirre			214
1207	Tercera Compañía			214
750	PRIMERA COMPAÑÍA			214
1081	Sexta Compañía 			211
205	NOVENA			142
1084	Décima Compañía 			211
1446	Primera Compañia			626
230	Carlos Brito Jorquera			216
1433	3ª COMPAÑIA DE BOMBEROS			212
574	Primera			288
1209	MAÑIHUALES			214
1208	Egon Klocker  Winkler			214
1206	Bomba España			214
1083	Novena Compañía 			211
801	PRIMERA			38
1304	BLANCO ENCALADA 			203
196	Bomba Marcelo Godoy Hernandez			78
922	2ª COMPAÑIA DE BOMBEROS 			212
1012	Primera			617
366	Domingo Eyzaguirre			148
368	Chile			148
369	Con Honor Firme la Quinta			148
1480	TERCERA COMPAÑIA "SAN SEBASTIAN"			210
233	Primera Compañía Bomba Tomas Fleming Olmedo			61
704	Primera Compañía			75
808	BOMBA GULTRO			105
824	1ª Compañía "Juan Ratti Maga"			241
599	Primera Compañía			158
629	Primera Compañía			198
1253	Marquesa - Nueva Talcuna			37
1471	Novena Compañia			186
1483	Primera			625
1027	SEGUNDA			614
461	Primera Compañía 			11
1482	Tercera			621
260	Sexta Cía MART. LUIS MOYA Y WALTER FERNANDEZ			174
1003	Septima Cía 			174
1470	Octava Compañía			186
234	2ª Cia. Bomba Teniente 3º Miguel Brito Ortiz			61
914	Segunda Compañía			108
1472	2º Zapadores			84
1473	3º Compañia			84
1475	5º Compañia Sauzal			84
1474	4º Compañia Estación			84
1487	Tercera de Ayacara			151
259	Cuarta Cia. 			174
1481	primera			621
1484	Segunda			625
1486	BOMBA BICENTENARIO			80
291	Primera			84
1468	Septima  			295
1485	la vega			39
1082	Séptima Compañía 			211
1385	SEGUNDA GERMANIA			163
741	PRIMERA ARTURO PRAT			163
1387	CUARTA HACHA Y ESCALA			163
1388	QUINTA SALVADORA Y GUARDA PROPIEDADES			163
1389	SEXTA RAHUE			163
1390	SEPTIMA OVEJERIA			163
607	Bomba Hector Montecinos			102
1391	OCTAVA MANUEL RODRIGUEZ			163
1488	CHILLEPIN			36
1490	SEGUNDA			104
1412	Los Llanos			19
742	PRIMERA			178
379	 Bomba Manuel Rodriguez Erdoiza			172
1491	Cuarta			288
1496	SEPTIMA			262
1489	OCTAVA			224
1493	3era Cia.BOMBA HUMBERTO JULIO ARGOMEDO			35
1497	SEXTA			145
1501	BRIGADA MAIPO - 3RA CIA. EN FORMACION			294
865	Bomba Casablanca			41
1476	Tercera			288
359	TERCERA			145
1369	Bomba Valle Grande			222
1500	María Pinto			140
732	Primera Compañía			185
335	Primera Compañía de Bomberos de Curacaví			221
450	Bomba Héctor Ramiro Salinas Contalba			126
1492	Septima Compañia 			32
1498	Primera Compañia Bomberos Austral			622
456	Segunda			10
1307	Bomba Juan Catalán Marín			126
1495	Quinta compañia			143
1502	BOMBA  			217
844	Segunda Compañía			251
845	Tercera Compañía			251
740	Primera Compañìa de Nogales			53
627	1ª Compañía de Bomberos			212
280	Tercera Compañía			232
1505	TERCERA			104
1506	Tercera Compañía, Bomba Biobio			233
455	Primera			10
1504	MINAS DEL  PRADO			21
1031	Fuad Aguad Castill.			36
1061	Facundo Carvajal Gallardo			36
281	PRIMERA COMPAÑÍA			294
1507	Bomba Bernardo O,Higgins			68
278	Primera Compañia			232
1063	Tercera Compañía Bomba El Poligono			53
1062	Segunda Compañóa El Melón			53
1123	Bomba Reino Bélgica 			22
438	Segunda			122
595	Bomba Juan Soldado			32
1508	Séptima Compañía			124
1515	FOLILCO			156
1509	SEGUNDA			87
1510	Cuarta Compañia			146
1516	MANUEL JOSE SALINAS SOTOMAYOR			58
1511	SAN LORENZO PUEBLO DE TARAPACA			620
1273	SEGUNDA Carlos Vogel Meyer			177
1512	Amador Cisterna Baeza			121
1513	Tercera Compañia			230
1514	Santiago Bueras			33
1379	3ª CIA. BOMBEROS SAN FELIPE			66
1221	Tercera			122
466	Primera			299
1519	Octava Compañía 			124
1518	Ernie Saavedra Esquivel			627
1520	Segunda			627
\.


--
-- Data for Name: comuna; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY comuna (comuna_id, descripcion, provincia_id) FROM stdin;
1	LA HIGUERA	10
2	LA SERENA	10
3	VICUÑA	10
4	PAIHUANO	10
5	COQUIMBO	10
6	ANDACOLLO	10
7	RIO HURTADO	11
8	OVALLE	11
9	MONTE PATRIA	11
10	PUNITAQUI	11
11	COMBARBALA	11
13	ILLAPEL	12
14	SALAMANCA	12
15	LOS VILOS	12
16	PETORCA	13
17	CABILDO	13
18	PAPUDO	13
19	LA LIGUA	13
20	ZAPALLAR	13
21	PUTAENDO	14
22	SANTA MARIA	14
23	SAN FELIPE	14
24	PANQUEHUE	14
25	CATEMU	14
26	LLAY LLAY	14
27	NOGALES	16
28	LA CALERA	16
29	HIJUELAS	16
30	LAS CRUCES	16
31	QUILLOTA	16
32	OLMUE	16
33	LIMACHE	16
34	LOS ANDES	15
35	RINCONADA	15
36	CALLE LARGA	15
37	SAN ESTEBAN	15
38	PUCHUNCAVI	17
39	QUINTERO	17
40	VIÑA DEL MAR	17
41	VILLA ALEMANA	54
42	QUILPUE	17
43	VALPARAISO	17
44	JUAN FERNANDEZ	17
45	CASABLANCA	17
46	CONCON	17
47	ISLA DE PASCUA	19
48	ALGARROBO	18
49	EL QUISCO	18
50	EL TABO	18
51	CARTAGENA	18
52	SAN ANTONIO	18
53	SANTO DOMINGO	18
54	MOSTAZAL	26
55	CODEGUA	26
56	GRANEROS	26
57	MACHALI	26
58	RANCAGUA	26
59	OLIVAR	26
60	DOÑIHUE	26
61	REQUINOA	26
62	COINCO	26
63	COLTAUCO	26
64	QUINTA TILCOCO	26
65	LAS CABRAS	26
66	RENGO	26
67	PEUMO	26
68	PICHIDEGUA	26
69	MALLOA	26
70	SAN VICENTE	26
71	NAVIDAD	28
72	LA ESTRELLA	28
73	MARCHIGUE	28
74	PICHILEMU	28
75	LITUECHE	28
76	PAREDONES	28
77	SAN FERNANDO	27
78	PERALILLO	27
79	PLACILLA	27
80	CHIMBARONGO	27
81	PALMILLA	27
82	NANCAGUA	27
83	SANTA CRUZ	27
84	PUMANQUE	27
85	CHEPICA	27
86	LOLOL	27
87	TENO	29
88	ROMERAL	29
89	RAUCO	29
90	CURICO	29
91	SAGRADA FAMILIA	29
92	HUALAÑE	29
93	VICHUQUEN	29
94	MOLINA	29
95	LICANTEN	29
96	RIO CLARO	30
97	CUREPTO	30
98	PELARCO	30
99	TALCA	30
100	PENCAHUE	30
101	SAN CLEMENTE	30
102	CONSTITUCION	30
103	MAULE	30
104	EMPEDRADO	30
105	SAN RAFAEL	30
106	SAN JAVIER	31
107	COLBUN	31
108	VILLA ALEGRE	31
109	YERBAS BUENAS	31
110	LINARES	31
111	LONGAVI	31
112	RETIRO	31
113	PARRAL	31
114	CHANCO	32
115	PELLUHUE	30
116	CAUQUENES	32
117	COBQUECURA	33
118	ÑIQUEN	33
119	SAN FABIAN	33
120	SAN CARLOS	33
121	QUIRIHUE	33
122	NINHUE	33
123	TREHUACO	33
124	SAN NICOLAS	33
125	COIHUECO	33
126	CHILLAN	33
127	PORTEZUELO	33
128	PINTO	33
129	COELEMU	33
130	BULNES	33
131	SAN IGNACIO	33
132	RANQUIL	33
133	QUILLON	33
134	EL CARMEN	33
135	PEMUCO	33
136	YUNGAY	33
137	CHILLAN VIEJO	33
138	TOME	34
139	FLORIDA	34
140	PENCO	34
141	TALCAHUANO	34
142	CONCEPCION	34
143	HUALQUI	34
144	CORONEL	34
145	LOTA	34
146	SANTA JUANA	34
147	CHIGUAYANTE	34
148	SAN PEDRO DE LA PAZ	34
149	HUALPEN	34
150	CABRERO	36
151	YUMBEL	36
152	TUCAPEL	36
153	ANTUCO	36
154	SAN ROSENDO	36
155	LAJA	36
156	QUILLECO	36
157	LOS ANGELES	36
158	NACIMIENTO	36
159	NEGRETE	36
160	SANTA BARBARA	36
161	QUILACO	36
162	MULCHEN	36
163	ARAUCO	35
164	CURANILAHUE	35
165	LOS ALAMOS	35
166	LEBU	35
167	CAÑETE	35
168	CONTULMO	35
169	TIRUA	35
170	RENAICO	37
171	ANGOL	37
172	COLLIPULLI	37
173	LOS SAUCES	37
174	PUREN	37
175	ERCILLA	37
176	LUMACO	37
177	VICTORIA	37
178	TRAIGUEN	37
179	CURACAUTIN	37
180	LONQUIMAY	37
181	PERQUENCO	38
182	GALVARINO	38
183	LAUTARO	38
184	VILCUN	38
185	TEMUCO	38
186	CARAHUE	38
187	MELIPEUCO	38
188	NUEVA IMPERIAL	38
189	PUERTO SAAVEDRA	38
190	CUNCO	38
191	FREIRE	38
192	PITRUFQUEN	38
193	TEODORO SCHMIDT	38
194	GORBEA	38
195	PUCON	38
196	VILLARRICA	38
197	TOLTEN	38
198	CURARREHUE	38
199	LONCOCHE	38
200	PADRE LAS CASAS	38
201	CHOLCHOL	38
202	LANCO	39
203	MARIQUINA	39
204	PANGUIPULLI	39
205	MAFIL	39
206	VALDIVIA	39
207	LOS LAGOS	39
208	CORRAL	39
209	PAILLACO	39
210	FUTRONO	52
211	LAGO RANCO	52
212	LA UNION	52
213	RIO BUENO	52
214	SAN PABLO	40
215	SAN JUAN	40
216	OSORNO	40
217	PUYEHUE	40
218	RIO NEGRO	40
219	PURRANQUE	40
220	PUERTO OCTAY	40
221	FRUTILLAR	41
222	FRESIA	41
223	LLANQUIHUE	41
224	PUERTO VARAS	41
225	LOS MUERMOS	41
226	PUERTO MONTT	41
227	MAULLIN	41
228	CALBUCO	41
229	COCHAMO	41
230	ANCUD	42
231	QUEMCHI	42
232	DALCAHUE	42
233	CURACO DE VELEZ	42
234	CASTRO	42
235	CHONCHI	42
236	QUEILEN	42
237	QUELLON	42
238	QUINCHAO	42
239	PUQUELDON	42
240	CHAITEN	43
241	FUTALEUFU	43
242	PALENA	43
243	HUALAIHUE	43
244	GUAITECAS	44
245	PUERTO CISNES	44
246	AYSEN	44
247	COYHAIQUE	45
248	LAGO VERDE	45
249	RIO IBAÑEZ	46
250	CHILE CHICO	46
251	COCHRANE	47
252	TORTEL	47
253	TORRES DEL PAINE	48
254	PUERTO NATALES	48
255	LAGUNA BLANCA	49
256	SAN GREGORIO	49
257	RIO VERDE	49
258	PUNTA ARENAS	49
259	PORVENIR	50
260	PRIMAVERA	50
261	TIMAUKEL	50
262	ANTARTICA	51
263	TILTIL	21
264	COLINA	21
265	LAMPA	21
266	CONCHALI	20
267	QUILICURA	20
268	RENCA	20
269	LAS CONDES	20
270	PUDAHUEL	20
271	QUINTA NORMAL	20
272	PROVIDENCIA	20
273	SANTIAGO	20
274	LA REINA	20
275	ÑUÑOA	20
276	SAN MIGUEL	20
277	MAIPU	20
278	LA CISTERNA	20
279	LA FLORIDA	20
280	LA GRANJA	20
281	INDEPENDENCIA	20
282	HUECHURABA	20
283	RECOLETA	20
284	VITACURA	20
285	LO BARNECHEA	20
286	MACUL	20
287	PEÑALOLEN	20
288	SAN JOAQUIN	20
289	LA PINTANA	20
290	SAN RAMON	20
291	EL BOSQUE	20
292	P. AGUIRRE CERDA	20
293	LO ESPEJO	20
294	ESTACION CENTRAL	20
295	CERRILLOS	20
296	LO PRADO	20
297	CERRO NAVIA	20
298	SAN JOSE DE MAIPO	22
299	PUENTE ALTO	22
300	PIRQUE	22
301	SAN BERNARDO	23
302	CALERA DE TANGO	23
303	BUIN	23
304	PAINE	23
305	PEÑAFLOR	24
306	TALAGANTE	24
307	EL MONTE	24
308	ISLA DE MAIPO	24
309	CURACAVI	25
310	MARIA PINTO	25
311	MELIPILLA	25
314	ALHUE	25
315	PADRE HURTADO	24
316	GRAL. LAGOS	2
317	PUTRE	2
318	ARICA	1
319	CAMARONES	1
320	CAMIÑA	3
321	HUARA	3
322	POZO ALMONTE	3
323	IQUIQUE	3
324	PICA	3
325	COLCHANE	3
326	ALTO HOSPICIO	3
327	TOCOPILLA	4
328	MARIA ELENA	4
329	OLLAGUE	5
330	CALAMA	5
331	SAN PEDRO ATACAMA	5
332	SIERRA GORDA	6
333	MEJILLONES	6
334	ANTOFAGASTA	6
335	TALTAL	6
336	DIEGO DE ALMAGRO	7
337	CHAÑARAL	7
338	CALDERA	8
339	COPIAPO	8
340	TIERRA AMARILLA	8
341	HUASCO	9
342	FREIRINA	9
343	VALLENAR	9
344	ALTO DEL CARMEN	9
346	O HIGGINS	47
347	NAVARINO	51
348	SAN PEDRO	25
349	CANELA	12
350	ALTO BIO BIO	36
351	Curimon	14
352	LA CRUZ	16
353	CAPITAN PASTENE	37
0	sin definir	0
\.


--
-- Data for Name: cuerpo; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY cuerpo (cuerpo_id, nombre, comuna_id) FROM stdin;
78	Graneros	56
267	Renaico	170
44	El Tabo	50
623	virtualv2	297
624	Virtualv3	272
259	Melipeuco	187
280	Corte Alto	219
250	Galvarino	182
144	Peñaflor	305
16	Tierra Amarilla	340
248	Ercilla	175
8	Mejillones	333
3	Pica	324
610	Rinconada	35
264	Puerto Saavedra	189
91	Empedrado	104
272	Victoria	177
153	Lago Ranco	211
114	Rengo	66
121	Sagrada Familia	91
99	Litueche	75
83	Santa Cruz	83
100	Machali	57
117	Pelluhue	116
37	Vicuña	3
120	Romeral	88
103	Nancagua	82
227	Quillon	133
256	Lonquimay	180
175	Tirua	169
92	Hualañe	92
157	Los Muermos	225
119	Rauco	89
625	Canela	349
10	Caldera	338
84	Cauquenes	116
109	Pichilemu	74
275	Achao	238
161	Maullin	227
201	Queilen	236
204	Reumen	209
154	Lanco	202
136	Isla de Maipo	308
160	Malalhue	202
128	Yerbas Buenas	109
617	Quinta de Tilcoco	64
171	Talagante	306
82	San Vicente de T. T.	70
152	Huellelhue	206
243	Collipulli	172
158	Llanquihue	223
279	Castro	234
127	Villa Alegre	108
9	Tal Tal	335
254	LicanRay	196
106	Peumo	67
286	Chonchi	235
28	El Carmen	134
76	Chimbarongo	80
190	Negrete	159
143	Paine	304
98	Las Cabras	65
58	Putaendo	21
57	Puchuncavi	38
123	San Javier	106
137	La Cisterna	278
90	Chanco	114
220	Buin	303
159	Mafil	205
296	Maule	103
147	Quinta Normal	271
77	Doñihue	60
13	Freirina	342
12	Chañaral	337
135	El Monte	307
156	Los Lagos	207
224	Conchali	266
252	Lastarria	194
277	Antilhue	206
276	Ancud	230
55	Papudo	18
53	Nogales	27
163	Osorno	216
131	Bulnes	130
22	Concepcion	142
189	Nacimiento	158
237	Tome	138
176	Trehuaco	123
61	Quintero	39
239	Yungay	136
218	Puerto Williams	347
15	Inca de Oro	336
217	Puerto Porvenir	259
206	Rio Bueno	213
122	San Clemente	101
168	San Miguel	276
52	Llay Llay	26
285	Chacao	230
268	Temuco	185
86	Constitucion	102
85	Colbun	107
200	Purranque	219
32	La Serena	2
79	La Estrella	72
241	Capitan Pastene	353
247	Cherquenco	184
5	Huara	321
219	Punta Arenas	258
283	Curaco de Velez	233
1	Arica	318
101	Malloa	69
269	Teodoro Schmidt	193
255	Loncoche	199
608	Pencahue	100
68	Valparaiso	43
31	Illapel	13
170	Santiago	273
24	Coronel	144
162	Mehuin	203
29	Florida	139
270	Tolten	197
195	Penco	140
194	Pemuco	135
232	San Rosendo	154
93	Licanten	95
148	San Bernardo	291
116	Parral	113
7	Calama	330
626	Rio Hurtado	7
150	Futrono	210
261	Perquenco	171
293	Lolol	86
97	Molina	94
244	CUNCO	190
95	Longavi	111
260	Nueva Imperial	188
108	Pichidegua	68
49	La Ligua	19
289	Entre Lagos	217
140	Maria Pinto	310
274	Villarrica	196
271	Traiguen	178
27	Chillan	126
102	Marchigue	73
188	Mulchen	162
191	Ninhue	122
192	Ñipas	132
193	Ñiquen	118
74	Coltauco	63
196	Pinto	128
110	Pumanque	84
263	Pucon	195
607	Metropolitano Sur	276
297	Pelarco	98
88	Curepto	97
262	Pitrufquen	192
287	Choshuenco	204
124	Talca	99
245	Curacautin	179
249	Freire	191
166	PichiRopulli	209
203	Quemchi	231
223	Cochrane	251
81	San Francisco de Mostazal	54
139	Maipu	277
291	Frutillar	221
35	Punitaqui	10
211	Valdivia	206
605	La Higuera	1
104	Navidad	71
292	Futaleufu	241
181	Hualqui	143
225	Portezuelo	127
180	Quilaco	161
226	Quilleco	156
231	San Nicolas	124
134	Cobquecura	117
70	Viña del Mar	40
149	San Jose de Maipo	298
298	Alto Hospicio	326
64	San Antonio	52
36	Salamanca	14
118	Retiro	112
40	Cartagena	51
39	Cabildo	17
240	Angol	171
177	La Union	212
4	Pozo Almonte	322
213	Chile Chico	250
63	Santo Domingo	53
111	Placilla	79
299	Diego de Almagro	336
43	El Quisco	49
253	Lautaro	183
179	Paredones	76
142	Ñuñoa	275
216	Coyhaique	247
266	Quitratue	194
202	Quellon	237
281	Corral	208
60	Quillota	31
80	San Fernando	77
278	Calbuco	228
235	Santa Juana	146
48	La Cruz	352
228	Quirihue	121
234	San Pedro de la Paz	148
96	Llico	93
236	Talcahuano	141
174	Tocopilla	327
151	Hualaihue	243
25	Curanilahue	164
33	Los Vilos	15
178	Palena	242
138	La Granja	290
246	Curarrehue	198
165	Panguipulli	204
17	Vallenar	343
208	San Jose De La Mariquina	203
155	Las Cascadas	216
290	Fresia	222
197	Puerto Montt	226
129	Antuco	153
47	La Calera	28
6	Antofagasta	334
113	Rancagua	58
146	Quilicura	267
222	Colina	264
59	Quilpue	42
11	Copiapo	339
87	Cumpeo	96
619	Chol-Chol	201
42	Catemu	25
94	Linares	110
258	Lumaco	176
20	Coquimbo	5
205	Riachuelo	218
2	IQUIQUE	323
14	Huasco	341
115	Requinoa	61
50	Limache	33
67	Santa Maria	22
145	Puente Alto	299
66	San Felipe	23
257	Los Sauces	173
614	Cochamo	229
38	Algarrobo	52
182	Huepil	152
72	Codegua	55
132	Cabrero	150
198	Puerto Varas	224
613	Sierra Gorda	332
26	Chiguayante	147
56	Petorca	16
30	Coelemu	129
183	Laja	155
621	Paihuano	4
184	Lebu	166
41	Casablanca	45
238	Yumbel	151
45	Hijuelas	29
167	Puerto Octay	220
616	San Pedro de Atacama	331
21	Coihueco	125
19	Combarbala	11
221	Curacavi	309
622	Carretera Austral	226
169	San Pedro de Melipilla	348
133	Cañete	167
214	Puerto Aysen	246
294	Calera de Tango	302
65	San Esteban	37
265	Puren	174
18	Andacollo	6
75	Chepica	85
185	Los Alamos	165
229	San Carlos	120
230	San Ignacio	131
611	Rio Negro	218
273	Vilcun	184
618	Virtual	348
141	Melipilla	311
172	Til Til	263
69	Villa Alemana	41
251	Gorbea	194
89	Curico	90
199	Puqueldon	239
173	Villa Alhue	314
620	Camiña	320
164	Paillaco	209
54	Olmue	32
612	Santa Rosa de Huantajaya	326
210	San Pablo	214
34	Ovalle	8
242	Carahue	186
46	Isla de Pascua	47
215	Puerto Cisnes	245
209	San Juan de la Costa	215
606	Hualpen	149
187	Lota	145
233	Santa Barbara	160
212	Puerto Natales	254
105	Olivar	59
23	Contulmo	168
107	Peralillo	78
282	Crucero	213
125	San Rafael	105
126	Teno	87
288	Dalcahue	232
51	Los Andes	34
73	Coinco	62
295	El Palqui	9
186	Los Angeles	157
284	Chaiten	240
130	Arauco	163
71	Zapallar	20
627	Maria Elena	328
\.


--
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY evento (evento_id, descricpion, observacion, fecha_evento, fecha_creacion, fecha_actualizacion, categoria_id, vehiculo_id) FROM stdin;
\.


--
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY modelo (modelo_id, tipo, descripcion, categoria_id) FROM stdin;
9	Chasis	pREMIUM 260	15
10	Chasis	S-170	15
11	Chasis	g 230	15
12	Chasis	m 200	15
14	Chasis	rg 11	125
16	Chasis	B110	15
17	Chasis	770 KB6	126
18	Chasis	RW2	127
19	Chasis	GCK 200	126
20	Chasis	gak20	126
21	Chasis	95130 4x4	15
22	Chasis	85.150 4X4	15
23	Chasis	ME-180	15
24	Chasis	JP 13	15
25	Chasis	M 120	15
26	Chasis	b-90	15
27	Chasis	JN 90	15
28	Chasis	CA07C1	15
29	Chasis	JUNIOR FL-40	132
30	Chasis	45	133
31	Chasis	METZ 	57
32	Chasis	c 30	135
33	Chasis	plano	136
34	Chasis	d-500	125
35	Chasis	170	127
36	Chasis	unimog 1550l	57
2	Chasis	MIDLUM 240	15
3	Chasis	MIDLUM 270	15
4	Chasis	300	15
5	Chasis	280	15
7	Chasis	MIDLUM 210	15
8	Chasis	MIDLUM 220	15
128	Chasis	l200	156
13	Chasis	ME 160	15
15	Chasis	S 150	15
37	Chasis	ALBERTVILLE	15
38	Chasis	M 210	15
39	Chasis	F 350	137
40	Chasis	METRO STAR	138
41	Chasis	Advantage FF MS 1250	139
42	Chasis	g 235	15
43	Chasis	TYPHOONE	140
44	Chasis	S 180	15
45	Chasis	E-350	137
46	Chasis	navistar	143
47	Chasis	M 2106	144
48	Chasis	Boxer	145
49	Chasis	D-max	135
50	Chasis	Daily	146
51	Chasis	Premium 210	15
52	Chasis	b 120	15
53	Chasis	suburban	135
54	Chasis	navara	132
55	Chasis	d22 terrano	132
56	Chasis	H-1	148
57	Chasis	H-100	148
58	Chasis	savien	15
59	Chasis	4700 	143
60	Chasis	pg 60	15
61	Chasis	durastar	143
62	Chasis	amarok	150
63	Chasis	kodiak 241	135
64	Chasis	K 3600	151
65	Chasis	812	57
66	Chasis	premium 300	15
67	Chasis	m-2 4x4	144
68	Chasis	f44rlx	152
69	Chasis	TGA18360 4X4	152
70	Chasis	CH 613	133
71	Chasis	tlf-24	127
72	Chasis	dl-50	127
73	Chasis	150 e24	146
74	Chasis	rw-2	146
75	Chasis	sprinter	57
76	Chasis	fire cat	153
77	Chasis	sABER - CUSTOM	154
78	Chasis	HP-75	140
79	Chasis	SORENTO	151
80	Chasis	MIDLUM 280	15
81	Chasis	17220	150
82	Chasis	mascott	15
83	Chasis	eps 30	146
84	Chasis	fuso	156
85	Chasis	midlum 300	15
86	Chasis	fl 60	144
87	Chasis	Express	135
88	Chasis	npr 70	135
89	Chasis	besta	151
90	Chasis	vetter 130	127
91	Chasis	1065	157
92	Chasis	van 30	135
93	Chasis	grace	148
94	Chasis	15 180	150
95	Chasis	rio	151
96	Chasis	action	158
97	Chasis	partner	145
98	Chasis	cargo	137
99	Chasis	luv	135
100	Chasis	frontier	151
101	Chasis	combo	135
102	Chasis	d 21	132
103	Chasis	safe	159
104	Chasis	wingle	159
105	Chasis	atego	57
106	Chasis	1017	57
107	Chasis	GLADIATOR	138
108	Chasis	FL-40	144
109	Chasis	E-450	137
110	Chasis	14-150	150
111	Chasis	HAVAL 5	159
112	Chasis	8100	143
113	Chasis	C 40	135
114	Chasis	musso	161
115	Chasis	310	57
116	Chasis	hilux	162
117	Chasis	deluge	163
118	Chasis	corsa	135
119	Chasis	lance	154
120	Chasis	160E	164
121	Chasis	17.250	150
122	Chasis	midlum 220.10	15
123	Chasis	custom contender	154
124	Chasis	1720	57
125	Chasis	2423k	57
126	Chasis	SERENA	132
127	Chasis	lm 11	135
129	Chasis	eurocargo	146
130	Chasis	1618	166
131	Chasis	delica	156
132	Chasis	1190	125
133	Chasis	WFR	168
134	Chasis	ram	125
135	Chasis	BERLINGO	169
136	Chasis	l300	156
137	Chasis	century series	170
138	Chasis	s-10	135
139	Chasis	lancer	156
140	Chasis	bt-50	172
141	Chasis	FL-680	132
142	Chasis	xl dca 2.6	173
143	Chasis	RANGER	137
144	Chasis	TLF-16	127
145	Chasis	914	57
146	Chasis	Montero sport	156
147	Chasis	jumper	169
148	Chasis	f-450	137
149	Chasis	1624	57
150	Chasis	1113	57
151	Chasis	1632	57
152	Chasis	qashqai	132
153	Chasis	n300	135
154	Chasis	WORK TRUCK	135
155	Chasis	ft-20	174
156	Chasis	forward	168
157	Chasis	1618.	57
158	Chasis	ESCAPE	137
159	Chasis	bronto	140
160	Chasis	dl-30	127
161	Chasis	Duple fire truck	143
162	Chasis	711	57
163	Chasis	1520	57
164	Chasis	1725	57
165	Chasis	carens	151
166	Chasis	tlf-16	57
167	Chasis	refine 	176
168	Chasis	trooper	135
169	Chasis	SOCOOL	159
170	Chasis	ATLAS	132
171	Chasis	g260	15
172	Chasis	4300	143
173	Chasis	tgm 18.280	152
174	Chasis	F-600D	137
175	Chasis	darley	137
176	Chasis	mighty h-250	148
177	Chasis	740	174
178	Chasis	trafic	15
179	Chasis	VITO	57
180	Chasis	1120	57
181	Chasis	208	57
182	Chasis	COMBEH	177
183	Chasis	LB 81	178
184	Chasis	92 M	178
185	Chasis	transit	137
186	Chasis	chevy van	135
187	Chasis	mobile truck	180
188	Chasis	c 60	135
189	Chasis	hiace	162
190	Chasis	pajero	156
191	Chasis	135 d10	127
192	Chasis	3046	157
193	Chasis	c-850	137
194	Chasis	O352	57
195	Chasis	1819	57
196	Chasis	FF	126
197	Chasis	S300	15
198	Chasis	VANETTE	132
199	Chasis	1226	57
200	Chasis	TLD 46	168
201	Chasis	EXPLORER	137
202	Chasis	DEER	159
203	Chasis	609	57
204	Chasis	MERKUR 125A	127
205	Chasis	CF-600	133
206	Chasis	C10	135
207	Chasis	FTR 1421	135
208	Chasis	ACM 80	146
209	Chasis	CENTURY	189
210	Chasis	150 D10	127
211	Chasis	TERRACAN	148
212	Chasis	1620	57
213	Chasis	1418	57
214	Chasis	TL	177
215	Chasis	407	57
216	Chasis	109	190
217	Chasis	HOVER	159
218	Chasis	DS151	191
219	Chasis	ADMIRAL	192
220	Chasis	CANTER	156
221	Chasis	1414	57
222	Chasis	SS133	191
223	Chasis	6000	193
224	Chasis	URBAN HFC	176
225	Chasis	FVR 1723	135
226	Chasis	SS237	191
227	Chasis	RAM VAN 150	125
228	Chasis	V-8	137
229	Chasis	DELTA	194
230	Chasis	DAKOTA	125
231	Chasis	RAM 2500	125
232	Chasis	APV	195
233	Chasis	330-30	146
234	Chasis	7217	157
235	Chasis	JUPITER	127
236	Chasis	FL-614	174
237	Chasis	G 231	15
238	Chasis	DYNA	162
239	Chasis	S 300	197
240	Chasis	KOVATCH	198
241	Chasis	H4300	199
242	Chasis	C30	143
243	Chasis	F-11000	137
244	Chasis	FL-80	144
245	Chasis	MIDLUM 150	15
246	Chasis	7400	143
247	Chasis	1413	57
248	Chasis	1114 ECOLINER	57
249	Chasis	SAMURAI	195
250	Chasis	R-200	15
251	Chasis	160 E30	146
252	Chasis	ESCORT	137
253	Chasis	COROLLA	162
254	Chasis	MAVERIK	137
255	Chasis	F-4000	137
256	Chasis	G-1313	125
257	Chasis	250 SERIES	168
258	Chasis	ELF 250	168
259	Chasis	2000	132
260	Chasis	LAND CRUISER	162
261	Chasis	673	201
262	Chasis	CLIO	15
263	Chasis	D-14000	135
264	Chasis	F-14000	137
265	Chasis	ELF 150	168
266	Chasis	UD	132
267	Chasis	E-250	137
268	Chasis	C-8000	137
269	Chasis	GRAND NOMADE	195
270	Chasis	C20	135
271	Chasis	PATHFINDER	132
272	Chasis	1724	57
273	Chasis	4400	143
274	Chasis	1420	57
275	Chasis	TUCSON	148
276	Chasis	COLORADO	135
277	Chasis	F-5	137
278	Chasis	COUNTY	148
279	Chasis	TRUCK SV	206
280	Chasis	321	57
281	Chasis	LOADSTAR 1800	143
282	Chasis	1114	57
283	Chasis	URVAN	132
284	Chasis	312	57
285	Chasis	VERANEIO	135
286	Chasis	RANGER.	207
287	Chasis	SAFARI	132
288	Chasis	SIERRA	208
289	Chasis	DUCATO	201
290	Chasis	1619	57
291	Chasis	SURBURBAN	135
292	Chasis	9.136	152
293	Chasis	1513	57
294	Chasis	1518	57
295	Chasis	CERES	151
296	Chasis	405A	133
297	Chasis	1946	137
298	Chasis	F-700	137
299	Chasis	F-6	137
300	Chasis	45-210	209
301	Chasis	F-800	137
302	Chasis	CONDOR	132
\.


--
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY provincia (provincia_id, descripcion, region_id) FROM stdin;
2	Parinacota	1
3	Iquique	1
4	Tocopilla	2
5	El Loa	2
6	Antofagasta	2
7	Chañaral	3
8	Copiapo	3
9	Huasco	3
10	Elqui	4
11	Limari	4
12	Choapa	4
13	Petorca	5
14	San Felipe de Aconcagua	5
15	Los Andes	5
16	Quillota	5
17	Valparaiso	5
18	San Antonio	5
19	Isla de Pascua	5
20	Santiago	13
21	Chacabuco	13
22	Cordillera	13
23	Maipo	13
24	Talagante	13
25	Melipilla	13
26	Cachapoal	6
27	Colchagua	6
28	Cardenal Caro	6
29	Curico	7
30	Talca	7
31	Linares	7
32	Cauquenes	7
33	Ñuble	8
34	Concepción	8
35	Arauco	8
36	BioBío	8
37	Malleco	9
38	Cautín	9
52	RANCO	14
40	Osorno	10
41	Llanquihue	10
42	Chiloé	10
43	Palena	10
44	Aisén	11
45	Coihaique	11
46	Gral. Carrera	11
47	Capitan Prat	11
48	Ultima Esperanza	12
49	Magallanes	12
50	Tierra del Fuego	12
51	Antartica Chilena	12
39	Valdivia	14
1	Arica	15
53	Paihuano	4
54	Marga Marga	5
0	sin definir	0
\.


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY region (region_id, descripcion) FROM stdin;
1	Región de Tarapacá
2	Región de Antofagasta
3	Región de Atacama
4	Región de Coquimbo
5	Región de Valparaíso
6	Región del Libertador Bernardo O higgins
7	Región del Maule
8	Región del Bío Bío
9	Región de la Araucanía
10	Región de los Lagos
11	Región de Aysén del General Carlos Ibañez del Campo
12	Región de Magallanes y la Antártica Chilena
13	Región Metropolitana
14	Región de los Ríos
15	Región de Arica
0	sin definir
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY rol (rol_id, nombre, descripcion) FROM stdin;
1	Administrador	Administra el Sistema
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY usuario (usuario_id, usuario, nombre, apellidos, contrasenna, email, rol_id) FROM stdin;
1	administrador	Administrador	\N	91f5167c34c400758115c2a6826ec2e3	roman@upr.edu.cu	1
\.


--
-- Data for Name: vehiculo; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY vehiculo (vehiculo_id, numero_chasis, numero_motor, numero_serie, vin, descripcion, anno, peso, planos, fecha_ingreso, fecha_actualizacion, patente, denominacion, anotaciones_vigentes, primera_inscripcion, pauta_asignada, folio_chasis, carrozado_mantencion_id, chasis_mantencion_id) FROM stdin;
32	KST0953	04724	\N	\N	\N	1981	16000	\N	2013-01-23	\N	DYXP67-7	B-1	\N	\N	0	\N	\N	\N
10	4900143120	2414120RA0147-02	\N	4900143120	\N	1982	1000	\N	2012-11-27	2012-11-28	DYXD21-8	rx5	\N	\N	0	4900143120	\N	\N
43	KFT0649	04216	\N	\N	\N	1979	16000	\N	2013-01-23	\N	DYXP77-4	BX-4	\N	\N	0	\N	\N	\N
15	KFT0218	771599	771599	KFT0218	\N	1976	1000	\N	2012-11-28	\N	DYXP51-0	r1	\N	\N	0	KFT0218	\N	\N
7	VF640ACA000001834	5000202959	500020295	VF640ACA000001834	\N	1992	1000	\N	2012-11-27	2012-11-28	DYXD19-6	m 42	\N	\N	0	VF640ACA000001834	\N	\N
23	VF6JP1A1200015218	004034	\N	VF6JP1A1200015218	\N	1985	7000	\N	2013-01-23	\N	DYXP58-8	bx-6	\N	\N	0	\N	\N	\N
3	VFGJS500AO00009072	MTDR0602120	\N	VFGJS500AO0000907	\N	1991	1000	\N	2012-11-27	2012-11-28	DYXD15-3	M11	\N	\N	0	VFGJS500AO00009072	\N	\N
11	VF640ACC000002937	83M0189874	\N	VF640ACC000002937	\N	1995	1000	\N	2012-11-28	2012-11-28	DYXD22-6	m2	\N	\N	0	VF640ACC000002937	\N	\N
59	83M0192684	25600564367	\N	VF6JE13AC00007117	\N	1995	16000	\N	2013-01-25	\N	DYXP41-3	BX-7	\N	\N	0	\N	\N	\N
46	KFT1135     	05166FB  	\N	\N	\N	1982	16000	\N	2013-01-23	\N	DZCC24-3	B-2	\N	\N	0	\N	\N	\N
27	ZI69680	105000202990	\N	\N	\N	1984	9800	\N	2013-01-23	\N	DYXP62-6	BX-1	\N	\N	0	\N	\N	\N
33	3406	8255715	\N	\N	\N	1996	16000	\N	2013-01-23	\N	DYXP68-5	\N	\N	\N	0	\N	\N	\N
38	VF6JP1A1200018505	004317AH	\N	VF6JP1A1200018505	\N	1987	16000	\N	2013-01-23	\N	DYXP72-3	\N	\N	\N	0	\N	\N	\N
54	VF6JS00A000009132	MIDR060212D	\N	VF6JS00A000009132	\N	1991	16000	\N	2013-01-25	\N	DYXP37-5	B-3	\N	\N	0	\N	\N	\N
18	FEY0847	F633	\N	FEY0847	\N	1974	1000	\N	2012-11-29	2012-11-29	DYXP54-5	b3	\N	\N	0	FEY0847	\N	\N
4	VF622AXA0P0000161	83MO385431	\N	VF622AXA0P0000161	\N	2000	1000	\N	2012-11-27	2012-11-28	DYXD16-1	m22	\N	\N	0	VF622AXA0P0000161	\N	\N
51	KFT0850 	81798	\N	\N	\N	1960	16000	\N	2013-01-23	\N	DYXP34-0	BX-3	\N	\N	0	\N	\N	\N
24	VF64X4JP100000127	122426	\N	VF64X4JP100000127	\N	1992	7000	\N	2013-01-23	2013-01-23	DYXP59-6	B-2	\N	\N	0	\N	\N	\N
5	VF6BA03A00000798	6498	6498	VF6BA03A00000798	\N	1987	1000	\N	2012-11-27	2012-11-28	DYXD17	h4	\N	\N	0	VF6BA03A00000798	\N	\N
39	KTF 0477	62030F	\N	\N	\N	1977	16000	\N	2013-01-23	\N	DYXP73-1	B-3	\N	\N	0	\N	\N	\N
47	JE16AC00000881 	83MO189880	\N	\N	\N	1995	16000	\N	2013-01-23	\N	DYXP30-8	QB-2	\N	\N	0	\N	\N	\N
28	KFT0932	01010M9	\N	\N	\N	1981	16000	\N	2013-01-23	2013-01-23	DYXP63-4	B-3	\N	\N	0	\N	\N	\N
34	VF640AACC000004390	M60226W	\N	VF640AACC00000439	\N	1996	16000	\N	2013-01-23	2013-01-23	DYXP69-3	\N	\N	\N	0	\N	\N	\N
16	453440GSC26	1435225	1435225	453440GSC26	\N	1971	1000	\N	2012-11-28	2012-11-28	DYXP52-9	b1	\N	\N	0	453440GSC26	\N	\N
6	VF6BA03A0000011355	523931	523931	VF6BA03A000001135	\N	1990	1000	\N	2012-11-27	2012-11-28	DYXD18-8	rb8	\N	\N	0	VF6BA03A0000011355	\N	\N
57	KFT1075	5600200213	\N	\N	\N	1979	16000	\N	2013-01-25	\N	DYXP39-1	B-2	\N	\N	0	\N	\N	\N
13	1400015542	8521816	8521816	1400015542	\N	1986	16000	\N	2012-11-28	2012-12-26	DYXP49-9	\N	\N	\N	0	1400015542	\N	\N
29	VF6JE16AC00000886	83MO191095	\N	VF6JE16AC00000886	\N	1995	16000	\N	2013-01-23	\N	DYXP64-2	B-1	\N	\N	0	\N	\N	\N
40	KFT1097	NE201261	\N	\N	\N	1981	16000	\N	2013-01-23	\N	DYXP76-6	B-1	\N	\N	0	\N	\N	\N
2	vf644alm00000644	10716914	10716914	vf644alm00000644	\N	2008	7900	\N	2012-11-27	2012-11-28	bytp44	b2	\N	\N	0	\N	\N	\N
25	VF6JE15AC00000670	83M0148626	\N	VF6JE15AC00000670	\N	1994	16000	\N	2013-01-23	2013-01-23	DYXP60-K	BX-2 	\N	\N	0	\N	\N	\N
35	9540	89M0106825	\N	\N	\N	1993	16000	\N	2013-01-23	\N	DYXP70-7	B-4	\N	\N	0	\N	\N	\N
48	JP1A12011842  	\N	\N	\N	\N	1982	16000	\N	2013-01-23	\N	DYXP31-6	BX-7	\N	\N	0	\N	\N	\N
20	KFT1079	771598	\N	\N	\N	1981	16000	\N	2013-01-23	\N	DYXP56-1	B1	\N	\N	0	\N	\N	\N
44	VF6FN40A000031488	1219023	\N	VF6FN40A000031488	\N	1990	1000	\N	2013-01-23	2013-01-23	DYXP29-4	r-7	\N	\N	0	\N	\N	\N
30	VF6770KB6KFT01626	15036	\N	VF6770KB6KFT01626	\N	1983	12000	\N	2013-01-23	\N	DYXP65-0	B-6	\N	\N	0	\N	\N	\N
22	AVH0330	018731	\N	AVH0330	\N	1972	11000	\N	2013-01-23	\N	DYXP57-K	b-5	\N	\N	0	\N	\N	\N
36	VF6JS00A000009074	83M0012857	\N	VF6JS00A000009074	\N	1989	16000	\N	2013-01-23	\N	DYXP71-5	RX-8	\N	\N	0	\N	\N	\N
64	ZI69680TIPEJP1A12	5000344178	\N	ZI69680TIPEJP1A12	\N	1984	16000	\N	2013-01-25	\N	DYXP46-4	B-5	\N	\N	0	\N	\N	\N
45	KFT0652 	04372	\N	\N	\N	1976	16000	\N	2013-01-23	\N	DYXP78-2	B-5	\N	\N	0	\N	\N	\N
31	VF6JS00A000002946	003355EF	\N	VF6JS00A000002946	\N	1984	16000	\N	2013-01-23	\N	DYXP66-9	\N	\N	\N	0	\N	\N	\N
63	KFT0480	02796	\N	\N	\N	1978	16000	\N	2013-01-25	\N	DYXP45-6	\N	\N	\N	0	\N	\N	\N
41	011706	22701	\N	\N	\N	1982	16000	\N	2013-01-23	2013-01-23	DYXP74-K	B-5	\N	\N	0	\N	\N	\N
37	JE16AC00000878	83M0190422	\N	JE16AC00000878	\N	1995	16000	\N	2013-01-23	\N	DZCC23-5	\N	\N	\N	0	\N	\N	\N
49	JE13AC0006461 	2301B	\N	\N	\N	1991	16000	\N	2013-01-23	\N	DYXP32-4	B-7	\N	\N	0	\N	\N	\N
42	KFT1285	08382	\N	\N	\N	1983	16000	\N	2013-01-23	\N	DYXP75-8	B-7	\N	\N	0	\N	\N	\N
56	VF6JP1200015217	004008MD	\N	\N	\N	1983	16000	\N	2013-01-25	\N	DYXP38-3	BX-1	\N	\N	0	\N	\N	\N
61	83M0142950	5600564306	\N	\N	\N	1993	16000	\N	2013-01-25	\N	DYXP43-K	\N	\N	\N	0	\N	\N	\N
50	ZI69680	3121981102	\N	\N	\N	1985	16000	\N	2013-01-23	\N	DYXP33-2	BX-1	\N	\N	0	\N	\N	\N
60	BFGJS00A000007572	5600406216	\N	BFGJS00A000007572	\N	1989	16000	\N	2013-01-25	\N	DYXP42-1	B-5	\N	\N	0	\N	\N	\N
62	010291	032311	\N	\N	\N	1983	16000	\N	2013-01-25	\N	DYXP44-8	M-1	\N	\N	0	\N	\N	\N
66	JE16AC00000908	5600565125	\N	\N	\N	1995	16000	\N	2013-01-25	\N	DYXP48-0	B-6	\N	\N	0	\N	\N	\N
67	JEI3AC00004849	MID50602123	\N	\N	\N	1992	16000	\N	2013-01-25	\N	DYXP78-4	B-1	\N	\N	0	\N	\N	\N
68	VFGJS00A000004662	5606406216	\N	\N	\N	1987	16000	\N	2013-01-25	\N	DZHR79-2	BX-3	\N	\N	0	\N	\N	\N
69	KFT0589	03698	\N	\N	\N	1982	16000	\N	2013-01-25	\N	DZHR80-6	B-2	\N	\N	0	\N	\N	\N
87	\N	\N	\N	\N	\N	\N	\N	\N	2013-01-25	\N	\N	bx-1	\N	\N	0	\N	\N	\N
70	VF6JE13AC00007127	83MA194041	\N	VF6JE13AC00007127	\N	1994	16000	\N	2013-01-25	\N	DZHR81-4	B-3	\N	\N	0	\N	\N	\N
71	JE13AC00006450	83M0T24065	\N	\N	\N	1993	16000	\N	2013-01-25	\N	DZHR82-2	RH-1	\N	\N	0	\N	\N	\N
72	KFE0365	35390410130561	\N	\N	\N	1972	16000	\N	2013-01-25	\N	DZHR83-0	\N	\N	\N	0	\N	\N	\N
75	KFT1161	771588	\N	\N	\N	1982	16000	\N	2013-01-25	\N	DZHR86-5	B-4	\N	\N	0	\N	\N	\N
100	KFT0188	MID062030D	\N	\N	\N	1977	16000	\N	2013-01-25	\N	FBFC52-7	\N	\N	\N	0	\N	\N	\N
90	8402	83M0319020	\N	\N	\N	1992	16000	\N	2013-01-25	\N	FBFC42-K	B-4	\N	\N	0	\N	\N	\N
125	KFT1080	0121501	\N	\N	\N	1981	16000	\N	2013-01-28	\N	FBZD31-8	BX-2	\N	\N	0	\N	\N	\N
120	 VF6JS00A000004570	522474	\N	 VF6JS00A00000457	\N	1987	16000	\N	2013-01-28	\N	FBZD26-1	BX-1	\N	\N	0	\N	\N	\N
112	VF6JS00A000009649	\N	\N	VF6JS00A000009649	\N	1994	16000	\N	2013-01-28	\N	FBZD18-0	H-6	\N	\N	0	\N	\N	\N
86	VF6IPIAI200014513	DP1A12	\N	VF6IPIAI200014513	\N	1984	16000	\N	2013-01-25	\N	DZHR96-2	BX-1	\N	\N	0	\N	\N	\N
101	833775	366771805	\N	\N	\N	1986	16000	\N	2013-01-25	\N	FBFC53-5	B-22	\N	\N	0	\N	\N	\N
73	VF6JS00A000007040	5000202990	\N	VF6JS00A000007040	\N	1993	22000	\N	2013-01-25	2013-01-25	DZHR84-9	RX-4	\N	\N	0	\N	\N	\N
102	VFBA03A0000012341	5010092541	\N	VFBA03A0000012341	\N	1992	16000	\N	2013-01-25	\N	FBFC54-3	B-6	\N	\N	0	\N	\N	\N
52	VF6JP1A1200015213 	003961LD       	\N	VF6JP1A1200015213	\N	1984	16000	\N	2013-01-23	2013-04-30	DYXP35-9	B-3	\N	\N	0	\N	\N	\N
53	VF6JE13AC00006447	83M0123888	\N	VF6JE13AC00006447	\N	1992	16000	\N	2013-01-23	2013-04-30	DYXP36-7	B-2	\N	\N	0	\N	\N	\N
88	833775	MID06020301	\N	\N	\N	1970	16000	\N	2013-01-25	\N	DZHR97-0	B-32	\N	\N	0	\N	\N	\N
76	KFT1165	\N	\N	KFT1165	\N	1978	16000	\N	2013-01-25	\N	DZHR87-3	B-5	\N	\N	0	\N	\N	\N
89	VF6JE13AC00008940	83MO387005	\N	VF6JE13AC00008940	\N	1999	16000	\N	2013-01-25	\N	FBFC41-1	BX-2	\N	\N	0	\N	\N	\N
77	JE13AC00006463	\N	\N	\N	\N	1994	23000	\N	2013-01-25	\N	DZHR88-1	\N	\N	\N	0	\N	\N	\N
103	HUE0037	722F9425AC0142536	\N	\N	\N	1986	12000	\N	2013-01-25	\N	FBFC55-1	M-0	\N	\N	0	\N	\N	\N
135	VF61S00A000004583	\N	\N	VF61S00A000004583	\N	\N	16000	\N	2013-01-28	\N	FCDV63-0	\N	\N	\N	0	\N	\N	\N
144	KFT1111	1059	\N	\N	\N	1981	16000	\N	2013-01-28	\N	FCDV72-K	M-51	\N	\N	0	\N	\N	\N
113	VF640ACA000001046	MIDR060226H	\N	VF640ACA000001046	\N	1991	16000	\N	2013-01-28	\N	FBZD19-9	Q-5	\N	\N	0	\N	\N	\N
104	VG6JP1A1200014400	5000202959BP	\N	VG6JP1A1200014400	\N	1983	16000	\N	2013-01-25	\N	FBFC56-K	B-31	\N	\N	0	\N	\N	\N
80	KFT1160	\N	\N	\N	\N	1981	16000	\N	2013-01-25	\N	DZHR90-3	b-2	\N	\N	0	\N	\N	\N
121	VF6JS00A000009580	525544	\N	VF6JS00A000009580	\N	1992	16000	\N	2013-01-28	\N	FBZD27-K	B-2	\N	\N	0	\N	\N	\N
93	SDEG11A00BD706544	\N	\N	\N	\N	1987	16000	\N	2013-01-25	\N	FBFC45-4	\N	\N	\N	0	\N	\N	\N
131	AVH415	352.904-10-403044	\N	\N	\N	1971	16000	\N	2013-01-28	\N	FBZD37-7	b-4	\N	\N	0	\N	\N	\N
81	VF6JP1A1200015296	5000344178	\N	VF6JP1A1200015296	\N	1984	16000	\N	2013-01-25	\N	DZHR91-1	BX-1	\N	\N	0	\N	\N	\N
114	KFT0648	\N	\N	\N	\N	1979	16000	\N	2013-01-28	\N	FBZD20-2	C-9	\N	\N	0	\N	\N	\N
105	83M0123783	5600564367	\N	\N	\N	1992	13000	\N	2013-01-28	\N	FBFC57-8	B-4	\N	\N	0	\N	\N	\N
94	VF64X4JP100000148	2058022878AN	\N	VF64X4JP100000148	\N	1992	15000	\N	2013-01-25	\N	FBFC46-2	B-2	\N	\N	0	\N	\N	\N
82	KFT0493	2927	\N	\N	\N	1979	16000	\N	2013-01-25	\N	DZHR92-K	B-3	\N	\N	0	\N	\N	\N
126	VF622ACAOA0016901\t	83MO0375732\t	\N	VF622ACAOA0016901	\N	1999	10700	\N	2013-01-28	\N	FBZD32-6	b-5	\N	\N	0	\N	\N	\N
83	KFT0994	1122HO	\N	\N	\N	1979	16000	\N	2013-01-25	\N	DZHR93-8	BX-1	\N	\N	0	\N	\N	\N
106	ZI69680	5000204889	\N	\N	\N	1982	16000	\N	2013-01-28	\N	FBFC58-6	B-2	\N	\N	0	\N	\N	\N
95	KFTO822	01014MG	\N	\N	\N	1980	16000	\N	2013-01-25	\N	FBFC47-0	B-3	\N	\N	0	\N	\N	\N
122	VF6JP2A1400015458	521819	\N	VF6JP2A1400015458	\N	1985	16000	\N	2013-01-28	\N	FBZD28-8	\N	\N	\N	0	\N	\N	\N
84	KFE177	FE6NPFE6B	\N	\N	\N	1973	16000	\N	2013-01-25	\N	DZHR94-6	B-4	\N	\N	0	\N	\N	\N
115	KFT0644	02898	\N	\N	\N	1976	16000	\N	2013-01-28	\N	FBZD21-0	BX-2	\N	\N	0	\N	\N	\N
107	\N	04933	\N	\N	\N	1978	16000	\N	2013-01-28	\N	FBZD13-K	\N	\N	\N	0	\N	\N	\N
96	VF6BA3A000006421	14001	\N	VF6BA3A000006421	\N	1984	16000	\N	2013-01-25	\N	FBFC48-9	BX-4	\N	\N	0	\N	\N	\N
85	KFT0200	MID62030D	\N	\N	\N	1977	16000	\N	2013-01-25	\N	DZHR95-4	BX-3	\N	\N	0	\N	\N	\N
138	VFGJS00A000007635	010216KJ5600406216	\N	VFGJS00A000007635	\N	1990	16000	\N	2013-01-28	\N	FCDV66-5	B-10	\N	\N	0	\N	\N	\N
143	VF6JS00A000007803	MIDR060212	\N	VF6JS00A000007803	\N	1991	16000	\N	2013-01-28	\N	FCDV71-1	B-2	\N	\N	0	\N	\N	\N
127	JE13AC000007124	83M0193703	\N	\N	\N	1995	11000	\N	2013-01-28	\N	FBZD33-4	B-8	\N	\N	0	\N	\N	\N
97	522337	5600457060	\N	\N	\N	1986	16000	\N	2013-01-25	\N	FBFC49-7	B-0	\N	\N	0	\N	\N	\N
108	KFT0942	01076	\N	\N	\N	1980	16000	\N	2013-01-28	\N	FBZD14-8	R-5	\N	\N	0	\N	\N	\N
98	VF677KB6KFTO1631	\N	\N	VF677KB6KFTO1631	\N	\N	16000	\N	2013-01-25	\N	FBFC50-0	\N	\N	\N	0	\N	\N	\N
123	VF644ALM000000807	10795693	\N	VF644ALM000000807	\N	2009	16000	\N	2013-01-28	\N	FBZD29-6	B-2	\N	\N	0	\N	\N	\N
109	8009617	AVH471	\N	\N	\N	1972	16000	\N	2013-01-28	\N	FBZD15-6	BX-4	\N	\N	0	\N	\N	\N
117	VFGFN40A000031489	524367	\N	VFGFN40A000031489	\N	1990	\N	\N	2013-01-28	\N	FBZD23-7	R-1	\N	\N	0	\N	\N	\N
141	VFGJS00A000007725	010281	\N	VFGJS00A000007725	\N	1989	16000	\N	2013-01-28	\N	FCDV69-K	B-5	\N	\N	0	\N	\N	\N
110	VF6LS00A000004349	MIDR060212D	\N	VF6LS00A000004349	\N	1987	16000	\N	2013-01-28	\N	FBZD16-4	BX-7	\N	\N	0	\N	\N	\N
99	CL300140	01679D	\N	\N	\N	1981	16000	\N	2013-01-25	2013-01-25	FBFC51-9	BX-2	\N	\N	0	\N	\N	\N
128	AVH403	3520160601	\N	\N	\N	1973	16000	\N	2013-01-28	\N	FBZD34-2	B-4	\N	\N	0	\N	\N	\N
118	JE16AC00000832	\N	\N	\N	\N	1990	16000	\N	2013-01-28	\N	FBZD24-5	BX-5	\N	\N	0	\N	\N	\N
111	VF6FN60A000004980	\N	\N	VF6FN60A000004980	\N	1994	\N	\N	2013-01-28	\N	FBZD17-2	XR-8	\N	\N	0	\N	\N	\N
124	5828526453	5600564367	\N	\N	\N	1995	16000	\N	2013-01-28	\N	FBZD30-K	B-1	\N	\N	0	\N	\N	\N
139	VFGJS00A000009648	83M0143743	\N	VFGJS00A000009648	\N	1994	16000	\N	2013-01-28	\N	FCDV67-3	B-6	\N	\N	0	\N	\N	\N
140	VF6JS00A000009594	83M0169744	\N	VF6JS00A000009594	\N	1995	16000	\N	2013-01-28	\N	FCDV68-1	B-3	\N	\N	0	\N	\N	\N
119	KFT0934	\N	\N	\N	\N	1983	16000	\N	2013-01-28	\N	FBZD25-3	\N	\N	\N	0	\N	\N	\N
129	KFT0990	\N	\N	\N	\N	1978	16000	\N	2013-01-28	\N	FBZD35-0	B-1	\N	\N	0	\N	\N	\N
136	VF640ACC000002673	83M0184389	\N	VF640ACC000002673	\N	1994	16000	\N	2013-01-28	2013-01-28	FCDV64-9	m-1	\N	\N	0	\N	\N	\N
134	VFGJ8231600004334	83M0172870	\N	VFGJ8231600004334	\N	1987	16000	\N	2013-01-28	\N	FCDV62-2	RX-3	\N	\N	0	\N	\N	\N
130	JE15AC00000822	5600565125	\N	\N	\N	1987	16000	\N	2013-01-28	\N	FBZD36-9	\N	\N	\N	0	\N	\N	\N
137	VFGJS00A000009561	83M0110165	\N	VFGJS00A000009561	\N	1994	16000	\N	2013-01-28	2013-01-28	FCDV65-7	B-6	\N	\N	0	\N	\N	\N
142	KFT1107	\N	\N	\N	\N	1974	16000	\N	2013-01-28	\N	FCDV70-3	\N	\N	\N	0	\N	\N	\N
146	KFT1141	MID062030E	\N	\N	\N	1981	16000	\N	2013-01-28	\N	FCDV74-6	B-5	\N	\N	0	\N	\N	\N
148	KFT1155	05827	\N	\N	\N	1981	16000	\N	2013-01-29	\N	FCDV76-2	B-1	\N	\N	0	\N	\N	\N
145	52004888	2465FD	\N	\N	\N	1983	16000	\N	2013-01-28	\N	FCDV73-8	M-11	\N	\N	0	\N	\N	\N
150	VF6JS00A000004631	06343	\N	\N	\N	1986	18000	\N	2013-01-29	\N	FCDV78-9	\N	\N	\N	0	\N	\N	\N
149	KFT0102	MID062030D	\N	\N	\N	1976	16000	\N	2013-01-29	2013-01-29	FCDV77-0	B-3	\N	\N	0	\N	\N	\N
151	KF02165	MID62030A	\N	\N	\N	1976	16000	\N	2013-01-29	\N	FCFC41-6	bx-2	\N	\N	0	\N	\N	\N
152	VFGFN40A000045386	525267	\N	VFGFN40A000045386	\N	1991	4500	\N	2013-01-29	\N	FCFC42-4	R-1	\N	\N	0	\N	\N	\N
153	JE16A00000880	5600565125	\N	\N	\N	1995	16000	\N	2013-01-29	\N	FCFG55-5	B-3	\N	\N	0	\N	\N	\N
154	JE13AC00007125	\N	\N	\N	\N	1995	18000	\N	2013-01-29	\N	FCFG56-3	b-3	\N	\N	0	\N	\N	\N
155	VF6JS00A000009139	\N	\N	VF6JS00A000009139	\N	1991	18000	\N	2013-01-29	\N	FCFG57-1	B-4	\N	\N	0	\N	\N	\N
174	VF6JJ00A000009131	010030A	\N	VF6JJ00A000009131	\N	1990	16000	\N	2013-01-29	\N	FCFG53-9	b-1	\N	\N	0	\N	\N	\N
156	653908	37699510158272	\N	\N	\N	1965	16000	\N	2013-01-29	\N	FCFG58-K	bx-3	\N	\N	0	\N	\N	\N
176	VF6JS00A000009133	\N	\N	VF6JS00A000009133	\N	1989	16000	\N	2013-01-29	\N	FCFG51-2	B-7	\N	\N	0	\N	\N	\N
157	653908	37699510158272	\N	\N	\N	1965	16000	\N	2013-01-29	\N	FCFG58-K	BX-3	\N	\N	1	\N	\N	\N
158	619NAGB164	376909101712025	\N	\N	\N	1969	16000	\N	2013-01-29	\N	FCFG59-8	BX-2	\N	\N	0	\N	\N	\N
216	KMFZAD7HP7U328982	D4BH7489314	\N	KMFZAD7HP7U328982	\N	2008	\N	\N	2013-01-31	\N	BC JP 58	h-0	\N	\N	0	\N	\N	\N
190	\N	6498	\N	\N	\N	1987	\N	\N	2013-01-30	\N	DYXD 17	h-4	\N	\N	0	\N	\N	\N
205	1FVACYDJ85HU63501	90698100444011	\N	1FVACYDJ85HU63501	\N	2005	\N	\N	2013-01-30	\N	ZU 6510	rb-9	\N	\N	0	\N	\N	\N
159	14287	002261	\N	\N	\N	1983	16000	\N	2013-01-29	\N	FCFG60-1	b-21	\N	\N	0	\N	\N	\N
173	VF6JP2A1400015402	\N	\N	VF6JP2A1400015402	\N	1987	16000	\N	2013-01-29	\N	FCFG52-0	Q-3	\N	\N	0	\N	\N	\N
199	VF645ACA000010212	83M0716997	\N	VF645ACA000010212	\N	2007	\N	\N	2013-01-30	\N	MX 43385	b-7	\N	\N	0	\N	\N	\N
208	4S7CT2B978C070258	46977716	\N	4S7CT2B978C070258	\N	2010	\N	\N	2013-01-31	\N	CGCG 97	q-10	\N	\N	0	\N	\N	\N
160	VF6JS00A000009717	83M0186287	\N	VF6JS00A000009717	\N	1995	16000	\N	2013-01-29	\N	FCFG61-K	B-3	\N	\N	0	\N	\N	\N
191	VF645ACA000010208	83MO716665	\N	VF645ACA000010208	\N	2007	\N	\N	2013-01-30	\N	NW 62018	b-6	\N	\N	0	\N	\N	\N
223	F8L413V	5344257	\N	\N	\N	1975	\N	\N	2013-01-31	\N	VG 9111	M-2	\N	\N	0	\N	\N	\N
200	3431	83M0256271	\N	\N	\N	1996	\N	\N	2013-01-30	\N	SP 85039	r-7	\N	\N	0	\N	\N	\N
177	KFT0844	153799	\N	\N	\N	1979	16000	\N	2013-01-29	\N	FCFG40-7	BR-1	\N	\N	0	\N	\N	\N
162	VF6JS00A000007631	5600406216	\N	VF6JS00A000007631	\N	1989	16000	\N	2013-01-29	\N	FCFG63-6	B-4	\N	\N	0	\N	\N	\N
178	WDB6693611N016463	01225D1	\N	WDB6693611N016463	\N	1981	16000	\N	2013-01-30	\N	DYXD24-2	bx-1	\N	\N	0	\N	\N	\N
179	L40-02345	H500326	\N	\N	\N	1965	1000	\N	2013-01-30	\N	DYXD25-0	RB-11	\N	\N	0	\N	\N	\N
163	KEH182	34494010610109	\N	\N	\N	1974	16000	\N	2013-01-29	\N	FCFG64-4	B-2	\N	\N	0	\N	\N	\N
180	4551534	153624-7748-1	\N	\N	\N	1950	1000	\N	2013-01-30	\N	DYXD26-9	rb-3	\N	\N	0	\N	\N	\N
181	312.026.5515177	3121881102	\N	\N	\N	1955	1000	\N	2013-01-30	\N	DYXD27-7	\N	\N	\N	0	\N	\N	\N
164	Z169680	002148	\N	\N	\N	1983	16000	\N	2013-01-29	\N	FCFG65-2	b-3	\N	\N	0	\N	\N	\N
220	\N	D4BH8047754	\N	\N	\N	2000	\N	\N	2013-01-31	\N	BCJS 23	r-1	\N	\N	0	\N	\N	\N
182	310031W100004	CES08389	\N	\N	\N	1971	1000	\N	2013-01-30	\N	DYXD28-5	J-8	\N	\N	0	\N	\N	\N
165	KFT0828	153799	\N	\N	\N	1981	16000	\N	2013-01-29	\N	FCFG66-0	b-3	\N	\N	0	\N	\N	\N
213	MNTVCUD40Z0030727	YD25268718T	\N	MNTVCUD40Z003072	\N	2011	\N	\N	2013-01-31	\N	CTTL34	k-2	\N	\N	0	\N	\N	\N
183	87	23097	\N	\N	\N	1950	1000	\N	2013-01-30	\N	DYXD29-3	b-0	\N	\N	0	\N	\N	\N
209	VF622ACA0A0013883	83M0353290	\N	VF622ACA0A0013883	\N	1999	\N	\N	2013-01-31	\N	TV 37314	b-11	\N	\N	0	\N	\N	\N
201	VF643ACA000008024	83M0614446	\N	VF643ACA000008024	\N	2004	\N	\N	2013-01-30	\N	YP 68184	b-8	\N	\N	0	\N	\N	\N
184	VF645ACA000007773	83MO677106	\N	VF645ACA000007773	\N	2005	\N	\N	2013-01-30	\N	WE 67409	B-1	\N	\N	0	\N	\N	\N
217	5828526155	5600565125	\N	\N	\N	1994	\N	\N	2013-01-31	\N	\N	br-0	\N	\N	0	\N	\N	\N
194	9813	83MO240508	\N	\N	\N	1996	\N	\N	2013-01-30	\N	SL 33293	R-6	\N	\N	0	\N	\N	\N
168	KFT0827	91395B25	\N	\N	\N	1979	16000	\N	2013-01-29	\N	FCFG70-9	B-1	\N	\N	0	\N	\N	\N
185	3429	83MO256263	\N	3429	\N	1996	\N	\N	2013-01-30	\N	SP 85055	R-1	\N	\N	0	\N	\N	\N
169	KFT0854	8337751223	\N	\N	\N	1979	16000	\N	2013-01-29	\N	FCFG71-7	B-2	\N	\N	0	\N	\N	\N
206	VF3232B2215258776	10HJR73002662	\N	VF3232B2215258776	\N	1997	\N	\N	2013-01-31	2013-01-31	RK 40019	s-2	\N	\N	0	\N	\N	\N
202	1HTWCAZR3CJ591418	570HM2N8008483	\N	1HTWCAZR3CJ591418	\N	2012	\N	\N	2013-01-30	\N	DSFK 68	r-8	\N	\N	0	\N	\N	\N
186	1FTJW35F9TEA92203	TNV73C8DAAA	\N	1FTJW35F9TEA92203	\N	1996	\N	\N	2013-01-30	\N	RT 82347	H-1	\N	\N	0	\N	\N	\N
195	4ENRAAA8X81003833	46846605	\N	4ENRAAA8X81003833	\N	2008	\N	\N	2013-01-30	\N	BHSJ 80	B-3	\N	\N	0	\N	\N	\N
170	5600532534	83M0107916	\N	VF6JS00A000009555	\N	1993	16000	\N	2013-01-29	\N	FCFG72-5	R-9	\N	\N	0	\N	\N	\N
187	VF640ACE400005259	83MO310292	\N	VF640ACE400005259	\N	1998	\N	\N	2013-01-30	\N	\N	r-2	\N	\N	0	\N	\N	\N
171	5600532138	50187EM	\N	\N	\N	1991	16000	\N	2013-01-29	\N	FCFG73-3	\N	\N	\N	0	\N	\N	\N
210	ZCFC50A2105771330	890328	\N	ZCFC50A2105771330	\N	2009	\N	\N	2013-01-31	\N	CBBB-19	r-11	\N	\N	0	\N	\N	\N
227	YV1245773K1832882	\N	\N	YV1245773K1832882	\N	2012	\N	\N	2013-01-31	\N	SY 4473	j-4	\N	\N	0	\N	\N	\N
172	5600406216	06321BH	\N	\N	\N	1987	16000	\N	2013-01-29	\N	FCFG74-1	\N	\N	\N	0	\N	\N	\N
196	VF642ACA000001325	83M0438105	\N	VF642ACA000001325	\N	2001	\N	\N	2013-01-30	\N	UY 2079	R-3	\N	\N	0	\N	\N	\N
188	457HT2B9460055249	46473329	\N	457HT2B9460055249	\N	2007	\N	\N	2013-01-30	\N	WH 47525	b-4	\N	\N	0	\N	\N	\N
203	VF6BA03000011355	523931	\N	VF6BA03000011355	\N	1990	\N	\N	2013-01-30	\N	DYXD18	BX-8	\N	\N	0	\N	\N	\N
214	JN1CPGD22U0075423	YD25227783A	\N	JN1CPGD22U0075423	\N	2007	\N	\N	2013-01-31	\N	MZ 2770	k-3	\N	\N	0	\N	\N	\N
207	VF622ACA000101521	83M0432282	\N	VF622ACA000101521	\N	2000	\N	\N	2013-01-31	\N	UP 89216	b-10	\N	\N	0	\N	\N	\N
189	CJ 2322	CJ 2322	\N	\N	\N	1981	\N	\N	2013-01-30	\N	HV 62591	bx-4	\N	\N	0	\N	\N	\N
197	VF645ACA000007795	\N	\N	VF645ACA000007795	\N	2005	\N	\N	2013-01-30	\N	VF645ACA	b-5	\N	\N	0	\N	\N	\N
204	VF622AXA0P0000087	83M0308357	\N	VF622AXA0P0000087	\N	1998	\N	\N	2013-01-30	\N	TE 50761	B-9	\N	\N	0	\N	\N	\N
198	4900143120	5681288	\N	\N	\N	1982	\N	\N	2013-01-30	\N	DYXD21	rx-5	\N	\N	0	\N	\N	\N
224	8181	83MO301604	\N	\N	\N	1998	\N	\N	2013-01-31	\N	TD 5053	B-3	\N	\N	0	\N	\N	\N
211	10246	2540008	\N	\N	\N	1998	\N	\N	2013-01-31	\N	TE 50788	x-1	\N	\N	0	\N	\N	\N
215	KWJWAH7HP8U096927	D4BH8047754	\N	KWJWAH7HP8U096927	\N	2009	\N	\N	2013-01-31	\N	BC JS 21	K-1	\N	\N	0	\N	\N	\N
221	VF6JE13AC00009233	83MO439698	\N	VF6JE13AC00009233	\N	2000	\N	\N	2013-01-31	\N	US 4948	b-2	\N	\N	0	\N	\N	\N
212	3GCEC26R6XG236012	236012	\N	3GCEC26R6XG236012	\N	2000	\N	\N	2013-01-31	\N	TP 1351	k-1	\N	\N	0	\N	\N	\N
232	CBSK3	\N	\N	\N	\N	2007	\N	\N	2013-01-31	\N	\N	k-3	\N	\N	0	\N	\N	\N
230	CBSK1	\N	\N	\N	\N	2008	\N	\N	2013-01-31	\N	\N	k-1	\N	\N	0	\N	\N	\N
222	\N	100322	\N	\N	\N	1984	\N	\N	2013-01-31	\N	HV 6260	q-2	\N	\N	0	\N	\N	\N
219	VF645ACA000010268	83MO717262	\N	VF645ACA000010268	\N	2007	\N	\N	2013-01-31	\N	BCGY 85	b-1	\N	\N	0	\N	\N	\N
226	3HAMMAAR1BL376961	1572283	\N	3HAMMAAR1BL376961	\N	2011	\N	\N	2013-01-31	\N	CTHJ 25	z-4	\N	\N	0	\N	\N	\N
229	9GDP7H1J8WB861008	2FRO2507	\N	9GDP7H1J8WB861008	\N	1999	\N	\N	2013-01-31	\N	SY 4473	z-5	\N	\N	0	\N	\N	\N
225	VF643ACA000007887	\N	\N	VF643ACA000007887	\N	2004	\N	\N	2013-01-31	\N	YB 1189	B-4	\N	\N	0	\N	\N	\N
228	8150	83MO300272	\N	\N	\N	1998	\N	\N	2013-01-31	\N	TD 5001	b-5	\N	\N	0	\N	\N	\N
231	CBSK2	\N	\N	\N	\N	2001	\N	\N	2013-01-31	\N	\N	k-2	\N	\N	0	\N	\N	\N
233	90315\t	30864	\N	\N	\N	1997	\N	\N	2013-01-31	\N	RK 6373	k-4	\N	\N	0	\N	\N	\N
234	CBSK4	\N	\N	\N	\N	2013	\N	\N	2013-01-31	\N	\N	k-6	\N	\N	0	\N	\N	\N
235	9BM.688.187-PB-971526	\N	\N	9BM.688.187-PB-97	\N	1994	\N	\N	2013-01-31	\N	KU-9620	j-1	\N	\N	0	\N	\N	\N
237	VF622AC0A0A016489	83M03725356	\N	VF622AC0A0A016489	\N	2000	\N	\N	2013-01-31	\N	UC 7436	h-17	\N	\N	0	\N	\N	\N
238	1FVACXCS09HAJ4049	906728088	\N	1FVACXCS09HAJ4049	\N	2008	\N	\N	2013-01-31	\N	BXDH 96	rh-16	\N	\N	0	\N	\N	\N
239	VF622AXA0009795	83M0237678	\N	VF622AXA0009795	\N	1996	\N	\N	2013-01-31	\N	SL 3331	bx-16	\N	\N	0	\N	\N	\N
242	38903	EMF-300-4F1863	\N	\N	\N	1994	\N	\N	2013-01-31	\N	CXGJ 74	mx-13	\N	\N	0	\N	\N	\N
243	VF6FN00004390	M60226W	\N	\N	\N	1996	\N	\N	2013-01-31	\N	\N	m-9	\N	\N	0	\N	\N	\N
240	WMA92SZZ88L052505	515187037868	\N	WMA92SZZ88L052505	\N	2011	\N	\N	2013-01-31	\N	DDFL 17	mx-15	\N	\N	0	\N	\N	\N
241	WMAH51ZZ050418587	988016	\N	WMAH51ZZ050418587	\N	2005	\N	\N	2013-01-31	\N	WB 1203	rx-15	\N	\N	0	\N	\N	\N
276	GA45716810678640	1PIF1058XAAA	\N	GA45716810678640	\N	1988	\N	\N	2013-02-04	\N	CXGJ 48	B-22	\N	\N	0	\N	\N	\N
288	CBC1 	\N	\N	CBC1 	\N	2004	\N	\N	2013-02-04	\N	CBC1 	BR-0	\N	\N	0	\N	\N	\N
244	ZCAFA1LJ0102363312	FA-AE06891B	\N	ZCAFA1LJ010236331	\N	2002	\N	\N	2013-02-01	\N	BU 67 07	q-15	\N	\N	0	\N	\N	\N
268	VF622GXA0C0000018	83M0226867	\N	VF622GXA0C0000018	\N	1997	\N	\N	2013-02-01	\N	CXGH 72	b-10	\N	\N	0	\N	\N	\N
258	1FACYCS79HAH3911	1FACYCS79HAH3911	\N	1FACYCS79HAH3911	\N	2009	\N	\N	2013-02-01	\N	CBDH 96	rh-1	\N	\N	0	\N	\N	\N
283	VF644ALH000000829 	10799144	\N	VF644ALH000000829	\N	2009	\N	\N	2013-02-04	\N	CGBS 74 	B-1	\N	\N	0	\N	\N	\N
245	VF622AXA000101760	83M0439311	\N	VF622AXA000101760	\N	2001	\N	\N	2013-02-01	\N	UY 35 96	q-12	\N	\N	0	\N	\N	\N
277	4EN6AAA8071803616	46809914	\N	4EN6AAA8071803616	\N	2008	\N	\N	2013-02-04	\N	BPKY 87	BX-13	\N	\N	0	\N	\N	\N
259	1FDKE30M2HA47050	1FDKE30M2HA47050	\N	1FDKE30M2HA47050	\N	1994	\N	\N	2013-02-01	\N	SA 6916	s-2	\N	\N	0	\N	\N	\N
246	VF640ACE400003405	83M0255456	\N	VF640ACE400003405	\N	1996	\N	\N	2013-02-01	\N	SS 2300	bx-11	\N	\N	0	\N	\N	\N
269	VF645ACA00010243	83M0717193	\N	VF645ACA00010243	\N	2007	\N	\N	2013-02-01	\N	BHGD 59	b-11	\N	\N	0	\N	\N	\N
305	9022	83M0314739	\N	\N	\N	1998	\N	\N	2013-02-04	\N	TG 7783	b-5	\N	\N	0	\N	\N	\N
247	4900083151	595993	\N	\N	\N	1984	\N	\N	2013-02-01	\N	CXGJ 56	rx-7	\N	\N	0	\N	\N	\N
296	ZCFA1MM1302531664	0504491	\N	ZCFA1MM1302531664	\N	2008	\N	\N	2013-02-04	\N	BYTP 61	m-1	\N	\N	0	\N	\N	\N
260	ZCFC49701V5131433	2362105	\N	ZCFC49701V5131433	\N	1997	\N	\N	2013-02-01	\N	RS 8283	X-1	\N	\N	0	\N	\N	\N
248	49000138377	6594024	\N	\N	\N	1982	\N	\N	2013-02-01	\N	VG 3922	m-7	\N	\N	0	\N	\N	\N
289	VF6JE13AC00009305 	\N	\N	VF6JE13AC00009305	\N	2001	\N	\N	2013-02-04	\N	US 4942 	B-3	\N	\N	0	\N	\N	\N
284	VF643ACA000008013 	83M0613954	\N	VF643ACA000008013	\N	2005	\N	\N	2013-02-04	\N	YH 1686 	BX-21	\N	\N	0	\N	\N	\N
270	AEN6AAA8081003629	86820321	\N	AEN6AAA8081003629	\N	2008	\N	\N	2013-02-01	\N	BHSJ 81	b-13	\N	\N	0	\N	\N	\N
249	VF622AXA000101760.	83M0439311.	\N	\N	\N	2001	\N	\N	2013-02-01	\N	UY 3596	q-8	\N	\N	0	\N	\N	\N
261	8AC9046638A990069	61198200000000	\N	8AC9046638A990069	\N	2008	\N	\N	2013-02-01	\N	BRDK 68	x-2	\N	\N	0	\N	\N	\N
278	4EN6AAA8271003617	6842141	\N	4EN6AAA8271003617	\N	2008	\N	\N	2013-02-04	\N	BPKY 86	BX-20	\N	\N	0	\N	\N	\N
250	322.033-10-039661	11882	\N	\N	\N	2001	\N	\N	2013-02-01	\N	VG 3922	q-7	\N	\N	0	\N	\N	\N
262	GA045716810678640	\N	\N	GA045716810678640	\N	1988	\N	\N	2013-02-01	\N	CXGJ 54	b-1	\N	\N	0	\N	\N	\N
304	KMJWWH7SP1U242323	G4CSY643915	\N	KMJWWH7SP1U242323	\N	2011	\N	\N	2013-02-04	\N	TL 9661	j-4	\N	\N	0	\N	\N	\N
251	VF622ACA000102869	83M0474211	\N	VF622ACA000102869	\N	2001	\N	\N	2013-02-01	\N	VG 3923	q-6	\N	\N	0	\N	\N	\N
271	VF622AXA000100785	83M0406990	\N	VF622AXA000100785	\N	2000	\N	\N	2013-02-01	\N	UL 6203	b-14	\N	\N	0	\N	\N	\N
301	VF643ACA000007331	83M0541950	\N	VF643ACA000007331	\N	2002	\N	\N	2013-02-04	\N	VX 1641	b-4	\N	\N	0	\N	\N	\N
279	CBS21	\N	\N	CBS21	\N	2010	\N	\N	2013-02-04	\N	CBS21	BX-21	\N	\N	0	\N	\N	\N
252	4900155053	6842169	\N	\N	\N	1983	\N	\N	2013-02-01	\N	CXGF 35	rh-6	\N	\N	0	\N	\N	\N
263	VF6622AXA0P0000046	83M0301925	\N	VF6622AXA0P000004	\N	1998	\N	\N	2013-02-01	\N	TE 5079	b-2	\N	\N	0	\N	\N	\N
293	VF644ALH000000832 	10799387	\N	VF644ALH000000832	\N	2009	\N	\N	2013-02-04	\N	CGBS 75 	b-6	\N	\N	0	\N	\N	\N
253	S73091718	4S7CT2B93AC072899	\N	\N	\N	2010	\N	\N	2013-02-01	\N	CXHF 12	rx-6	\N	\N	0	\N	\N	\N
272	4ENRAAA8091004717	46846628	\N	4ENRAAA8091004717	\N	2008	\N	\N	2013-02-01	\N	BYXS 31	b-16	\N	\N	0	\N	\N	\N
264	VF6622AXA0P000045	83M0301576	\N	VF6622AXA0P000045	\N	1998	\N	\N	2013-02-01	\N	TE 5081	b-3	\N	\N	0	\N	\N	\N
254	VF640ACE400003406	83M0255715	\N	VF640ACE400003406	\N	1996	\N	\N	2013-02-01	\N	SS 2299	h-4	\N	\N	0	\N	\N	\N
285	ZCF50A2105773500 	906433	\N	ZCF50A2105773500 	\N	2009	\N	\N	2013-02-04	\N	CBBB 35 	R-1	\N	\N	0	\N	\N	\N
280	CBS19	\N	\N	CBS19	\N	2010	\N	\N	2013-02-04	\N	CBS19	bx-19	\N	\N	0	\N	\N	\N
255	1FVACYCS39HAJ2320	90697900727415	\N	1FVACYCS39HAJ2320	\N	2009	\N	\N	2013-02-01	\N	BZDX 35	z-18	\N	\N	0	\N	\N	\N
265	VF6JS00A000009540	83M0106825	\N	VF6JS00A000009540	\N	1993	\N	\N	2013-02-01	\N	DYXP 70	b-4	\N	\N	0	\N	\N	\N
299	VF644AHH000004756	11004139	\N	VF644AHH000004756	\N	2011	\N	\N	2013-02-04	\N	DLKW 25	b-3	\N	\N	0	\N	\N	\N
290	VF3YBAMFB11508262 	10TRJ10245041 	\N	VF3YBAMFB11508262	\N	2009	\N	\N	2013-02-04	\N	BHXL 48 	J-3	\N	\N	0	\N	\N	\N
256	1FVACYCS59HAJ2321	90697900730313	\N	1FVACYCS59HAJ2321	\N	2009	\N	\N	2013-02-01	\N	BWLH 17	z-10	\N	\N	0	\N	\N	\N
274	4PICTO24XA0000031	WM2657N1184727	\N	4PICTO24XA0000031	\N	2000	\N	\N	2013-02-04	\N	\N	B-20	\N	\N	0	\N	\N	\N
266	4S7CT2B98AC072722	S7309172Z	\N	4S7CT2B98AC072722	\N	2010	\N	\N	2013-02-01	\N	CXHF 11	b-5	\N	\N	0	\N	\N	\N
257	1FVACYCS79HAJ2322	90697900730306	\N	1FVACYCS79HAJ2322	\N	2009	\N	\N	2013-02-01	\N	BZDX 34	z-2	\N	\N	0	\N	\N	\N
281	1FVDCYCS9AHAP7352	1FVDCYCS9AHAP7352	\N	1FVDCYCS9AHAP7352	\N	2010	\N	\N	2013-02-04	\N	CPJC 81	RH-19	\N	\N	0	\N	\N	\N
267	4ENRAAA8971003322	46760728	\N	4ENRAAA8971003322	\N	2007	\N	\N	2013-02-01	\N	BFGF 11	b-9	\N	\N	0	\N	\N	\N
286	VF644ALM000000794 	10789293	\N	VF644ALM000000794	\N	2009	\N	\N	2013-02-04	\N	CGBS 73 	B-2	\N	\N	0	\N	\N	\N
275	VF645ACA00010226	83M0717071	\N	VF645ACA00010226	\N	2007	\N	\N	2013-02-04	\N	MX 4337	B-21	\N	\N	0	\N	\N	\N
297	VF643ACA000007964	83M0611242	\N	VF643ACA000007964	\N	2006	\N	\N	2013-02-04	\N	YB 1337	b-2	\N	\N	0	\N	\N	\N
294	VF652AFA000035829	3480861	\N	VF652AFA000035829	\N	2002	\N	\N	2013-02-04	\N	VX 1643	r-1	\N	\N	0	\N	\N	\N
291	VF645ACA000010178	83M0716508	\N	VF645ACA000010178	\N	2007	\N	\N	2013-02-04	\N	BCGY 84 	b-4	\N	\N	0	\N	\N	\N
287	9533N82T9CR218552	36347602	\N	9533N82T9CR218552	\N	2002	\N	\N	2013-02-04	\N	DPXR 85	Z-2	\N	\N	0	\N	\N	\N
282	KNAKU811AC5326608	G4KECH728699	\N	KNAKU811AC5326608	\N	2012	\N	\N	2013-02-04	\N	DXZS 62	k-1	\N	\N	0	\N	\N	\N
303	1GCFG25M7X1140497	1GCFG25M7X1140497	\N	1GCFG25M7X1140497	\N	1999	\N	\N	2013-02-04	\N	TT 3879	s-4	\N	\N	0	\N	\N	\N
298	T41028033	6DB1159304	\N	\N	\N	1973	\N	\N	2013-02-04	\N	SP 3579	mx-2	\N	\N	0	\N	\N	\N
295	VF645AC000010157	83M0716170	\N	VF645AC000010157	\N	2007	\N	\N	2013-02-04	\N	MX 4339	b-1	\N	\N	0	\N	\N	\N
300	1FV6GFBCXSL663484	45085959	\N	1FV6GFBCXSL663484	\N	1995	\N	\N	2013-02-04	\N	XB 8617	r-3	\N	\N	0	\N	\N	\N
292	VF645ACA000010148 	83M0715955	\N	VF645ACA000010148	\N	2007	\N	\N	2013-02-04	\N	MW 6200 	b-5	\N	\N	0	\N	\N	\N
308	JAANPR70PXX7100743	641232	\N	JAANPR70PXX710074	\N	2000	\N	\N	2013-02-04	\N	\N	r-6	\N	\N	0	\N	\N	\N
302	CBMS4	CBMS4	\N	\N	\N	2002	\N	\N	2013-02-04	\N	TJ 9875	r-4	\N	\N	0	\N	\N	\N
306	VF65500A000009581	83M0119163	\N	VF65500A000009581	\N	1993	\N	\N	2013-02-04	\N	PN 9340	bx-5	\N	\N	0	\N	\N	\N
307	cbms6	\N	\N	cbms6	\N	2004	\N	\N	2013-02-04	\N	YB 1348	b-6	\N	\N	0	\N	\N	\N
309	347506	168698	\N	\N	\N	1997	\N	\N	2013-02-04	\N	RD 2583	j-6	\N	\N	0	\N	\N	\N
310	8166	830O3014356	\N	\N	\N	1998	\N	\N	2013-02-04	\N	TD 4994	b-7	\N	\N	0	\N	\N	\N
311	4900140660	661113	\N	\N	\N	1983	\N	\N	2013-02-04	\N	CXGJ 51	q-7	\N	\N	0	\N	\N	\N
312	932C3570148311935	3802322	\N	932C3570148311935	\N	2004	\N	\N	2013-02-04	\N	XS 4455	j-7	\N	\N	0	\N	\N	\N
313	VF6JE13AC00009291	83M0444139	\N	VF6JE13AC00009291	\N	2000	\N	\N	2013-02-04	\N	US 4946	b-8	\N	\N	0	\N	\N	\N
314	133400321	98512761	\N	\N	\N	1977	\N	\N	2013-02-04	\N	HY 5219	z-8	\N	\N	0	\N	\N	\N
315	CPT357306028	877129	\N	\N	\N	1987	\N	\N	2013-02-04	\N	MS 0005	j-8	\N	\N	0	\N	\N	\N
273	4900154034	6842141	\N	\N	\N	1983	\N	\N	2013-02-01	2013-02-14	DZCC 32	b-19	\N	\N	0	\N	\N	\N
316	KMJFD27APVU352853	D4BAV382932	\N	KMJFD27APVU352853	\N	1997	\N	\N	2013-02-04	\N	RG 6675	j-9	\N	\N	0	\N	\N	\N
330	VFG43ACA00007312	83M0538746	\N	VFG43ACA00007312	\N	2002	\N	\N	2013-02-04	\N	VX 1640	b-2	\N	\N	0	\N	\N	\N
358	VF645AC000010156	83M0716170	\N	VF645AC000010156	\N	2007	\N	\N	2013-02-05	\N	MX 4389	b-1	\N	\N	0	\N	\N	\N
317	VF645ACA000010135	83M0715842	\N	VF645ACA000010135	\N	2003	\N	\N	2013-02-04	\N	NW 6195	b-9	\N	\N	0	\N	\N	\N
352	VF652AFA000035831	3480862	\N	VF652AFA000035831	\N	2003	\N	\N	2013-02-05	\N	XE 8432	r-1	\N	\N	0	\N	\N	\N
331	KNCSE063277260823	D4BH7478520 	\N	KNCSE063277260823	\N	2008	\N	\N	2013-02-04	\N	CFHL 23	ut-2	\N	\N	0	\N	\N	\N
318	9BWNE72S35R500063	6074677	\N	9BWNE72S35R500063	\N	2005	\N	\N	2013-02-04	\N	YG 9206	ut-10	\N	\N	0	\N	\N	\N
343	3MGC13547K015270	KA24886738M	\N	3MGC13547K015270	\N	2009	\N	\N	2013-02-04	\N	TX 8019	j-5	\N	\N	0	\N	\N	\N
372	VF640AEB000000927	83M0362668	\N	VF640AEB000000927	\N	1999	\N	\N	2013-02-05	\N	TV 3727	R-1	\N	\N	0	\N	\N	\N
369	4900011674	5251028	\N	\N	\N	1976	\N	\N	2013-02-05	\N	BTTT 22	M-7	\N	\N	0	\N	\N	\N
364	VF622ACA000101509	83M0432091	\N	VF622ACA000101509	\N	2000	\N	\N	2013-02-05	\N	US 4940	BX-1	\N	\N	0	\N	\N	\N
319	VF645ACA000010266	83M0717234	\N	VF645ACA000010266	\N	2007	\N	\N	2013-02-04	\N	BCGY 76	b-10	\N	\N	0	\N	\N	\N
332	1FDSS34PD4HB20363	04HB20363	\N	1FDSS34PD4HB20363	\N	2005	\N	\N	2013-02-04	\N	XK 2949	s-2	\N	\N	0	\N	\N	\N
344	CBLGK5	\N	\N	\N	\N	1997	\N	\N	2013-02-04	\N	RB 5156	x-5	\N	\N	0	\N	\N	\N
320	VF645CA000010133	83M0715637	\N	VF645CA000010133	\N	2007	\N	\N	2013-02-04	\N	NW 6193	b-11	\N	\N	0	\N	\N	\N
333	CBLGJ2	\N	\N	\N	\N	2008	\N	\N	2013-02-04	\N	BFDY 29 	j-2	\N	\N	0	\N	\N	\N
353	9BM958054BB738976	904967U0898919	\N	9BM958054BB738976	\N	2011	\N	\N	2013-02-05	\N	CWKT 74	z-1	\N	\N	0	\N	\N	\N
321	8146	83M0299162	\N	\N	\N	1998	\N	\N	2013-02-04	\N	TD 4987	bx-11	\N	\N	0	\N	\N	\N
345	\N	100323	\N	\N	\N	1984	\N	\N	2013-02-04	\N	HV 6263	q-6	\N	\N	0	\N	\N	\N
334	CBLGB3	\N	\N	\N	\N	1997	\N	\N	2013-02-04	\N	CBLGB3	b-3	\N	\N	0	\N	\N	\N
359	VF622ACA000101520	83M0611242	\N	VF622ACA000101520	\N	2004	\N	\N	2013-02-05	\N	YB 1337	b-2	\N	\N	0	\N	\N	\N
322	KNAKG811AA7708641	D4EA9H421055	\N	KNAKG811AA7708641	\N	2010	\N	\N	2013-02-04	\N	CLTG 80	k-1	\N	\N	0	\N	\N	\N
335	CBLGZ3	\N	\N	\N	\N	2005	\N	\N	2013-02-04	\N	VJ 5688 	z-3	\N	\N	0	\N	\N	\N
323	KNADH411AA6675352	G4EEAH303070	\N	KNADH411AA6675352	\N	2010	\N	\N	2013-02-04	\N	CLTG 79	k-2	\N	\N	0	\N	\N	\N
346	LGWEF2	D080349806	\N	\N	\N	2008	\N	\N	2013-02-04	\N	BTTY 24	j-1	\N	\N	0	\N	\N	\N
354	8158	83M0300374	\N	\N	\N	1998	\N	\N	2013-02-05	\N	TD 4999	b-2	\N	\N	0	\N	\N	\N
336	8GGTFSD531A105498	983926	\N	8GGTFSD531A105498	\N	2001	\N	\N	2013-02-04	\N	WK 8643	j-3	\N	\N	0	\N	\N	\N
324	KMJFD27FP2K510103	D413F1162537	\N	KMJFD27FP2K510103	\N	2002	\N	\N	2013-02-04	\N	VJ 7457	k-3	\N	\N	0	\N	\N	\N
378	15436992	10FZ710187256	\N	\N	\N	1998	\N	\N	2013-02-05	\N	RZ 9643	LT-1	\N	\N	0	\N	\N	\N
347	LGWCBC1739B081041	0804438745	\N	LGWCBC1739B081041	\N	2008	\N	\N	2013-02-04	\N	BTVH 32	k-1	\N	\N	0	\N	\N	\N
325	KPTCOB1659P059112 	1G19511OOO4896 	\N	KPTCOB1659P059112	\N	2009	\N	\N	2013-02-04	\N	CCKB 89	k-1	\N	\N	0	\N	\N	\N
337	VFG45ACA000010179 	83M0716522	\N	VFG45ACA000010179	\N	2007	\N	\N	2013-02-04	\N	BCGY 80 	b-4	\N	\N	0	\N	\N	\N
360	VF645ACA000010124	833M0715375	\N	VF645ACA000010124	\N	2007	\N	\N	2013-02-05	\N	LW 3193	b-4	\N	\N	0	\N	\N	\N
326	8JO33372 	1OJBBA000G306	\N	\N	\N	2008	\N	\N	2013-02-04	\N	BDYP 82	k-2	\N	\N	0	\N	\N	\N
338	CBLGM4	\N	\N	\N	\N	2009	\N	\N	2013-02-04	\N	BZDY 19 	m-4	\N	\N	0	\N	\N	\N
355	VF644BLM000001199	11093218	\N	VF644BLM000001199	\N	1984	\N	\N	2013-02-05	\N	DSFK 70	bx-2	\N	\N	0	\N	\N	\N
327	VFG45ACA00010136	83M0715839	\N	VFG45ACA00010136	\N	2007	\N	\N	2013-02-04	\N	NW 6925 	b-1	\N	\N	0	\N	\N	\N
339	CBLGJ4	\N	\N	\N	\N	1996	\N	\N	2013-02-04	\N	ML 7459	j-4	\N	\N	0	\N	\N	\N
328	CBLGR1	\N	\N	\N	\N	2002	\N	\N	2013-02-04	\N	UV 9992	r-1	\N	\N	0	\N	\N	\N
348	866TFR6FHWA054144	546921	\N	866TFR6FHWA054144	\N	1998	\N	\N	2013-02-04	\N	SA 6656	k-2	\N	\N	0	\N	\N	\N
366	CFC49700T5104618	2216297	\N	CFC49700T5104618	\N	1997	\N	\N	2013-02-05	2013-02-05	RC 6916	H-2	\N	\N	0	\N	\N	\N
340	WOLOSBF2513040943 	\N	\N	WOLOSBF2513040943	\N	2002	\N	\N	2013-02-04	\N	UX 1935	jx-4	\N	\N	0	\N	\N	\N
329	8GGTFSD561A104863	982585	\N	8GGTFSD561A104863	\N	2001	\N	\N	2013-02-04	\N	UJ 8282	j-1	\N	\N	0	\N	\N	\N
361	VFGJ500A00009108	\N	\N	VFGJ500A00009108	\N	2000	\N	\N	2013-02-05	\N	TG 7783	b-5	\N	\N	0	\N	\N	\N
356	KMJWA37HABU322650	D4BHA068361	\N	KMJWA37HABU322650	\N	2011	\N	\N	2013-02-05	\N	CYJD 89	j-2	\N	\N	0	\N	\N	\N
349	KMJWAH7HP8U037451	D4BH7532821	\N	KMJWAH7HP8U037451	\N	2008	\N	\N	2013-02-05	\N	BBHT 82	j-1	\N	\N	0	\N	\N	\N
377	3NGDD23T52K873	KA24-470804A	\N	3NGDD23T52K873	\N	2011	\N	\N	2013-02-05	\N	DGXY 76	K-3	\N	\N	0	\N	\N	\N
370	3800171445980078	35395010507639	\N	3800171445980078	\N	1978	\N	\N	2013-02-05	\N	CXJH 68	Q-4	\N	\N	0	\N	\N	\N
341	VF622AXA00100101	83M0389750	\N	VF622AXA00100101	\N	2000	\N	\N	2013-02-04	\N	UB 9593	b-5	\N	\N	0	\N	\N	\N
350	VF645ACA000010228	83M0717066	\N	VF645ACA000010228	\N	2007	\N	\N	2013-02-05	\N	BCGY 86	b-1	\N	\N	0	\N	\N	\N
357	KMFFD27GPTU259663	G4CTS940632	\N	KMFFD27GPTU259663	\N	1996	\N	\N	2013-02-05	\N	PG 2207	j-0	\N	\N	0	\N	\N	\N
342	VF6JE13AC00009287	83M0444280	\N	VF6JE13AC00009287	\N	2000	\N	\N	2013-02-04	\N	US 4945	bx-5	\N	\N	0	\N	\N	\N
367	1FTSW30L2XEB64706	64706	\N	1FTSW30L2XEB64706	\N	2000	\N	\N	2013-02-05	\N	TB 1745	H-4	\N	\N	0	\N	\N	\N
351	VF6JE13AC00009199	83M0434767	\N	VF6JE13AC00009199	\N	2001	\N	\N	2013-02-05	\N	US 4947	bx-1	\N	\N	0	\N	\N	\N
362	8128	83M0294095	\N	\N	\N	1998	\N	\N	2013-02-05	\N	SZ 1870	b-6	\N	\N	0	\N	\N	\N
373	1FV6GFBC2XH925377	CUM5544625	\N	1FV6GFBC2XH925377	\N	1999	\N	\N	2013-02-05	\N	BRWT 87	R-3	\N	\N	0	\N	\N	\N
375	1FVEGFBC2XH966384	56480496	\N	1FVEGFBC2XH966384	\N	1999	\N	\N	2013-02-05	\N	BTCG 16	R-6	\N	\N	0	\N	\N	\N
371	S29XT6U06FC423757	L1034508777	\N	S29XT6U06FC423757	\N	1985	\N	\N	2013-02-05	\N	BTCF 76	Q-7	\N	\N	0	\N	\N	\N
368	KMJWWH7HPV802061	D4CBB839081	\N	KMJWWH7HPV802061	\N	2011	\N	\N	2013-02-05	\N	BDYX 61	K-1	\N	\N	0	\N	\N	\N
363	8166	83M03014356	\N	\N	\N	1998	\N	\N	2013-02-05	\N	TD 4994	B-7	\N	\N	0	\N	\N	\N
381	8163	83M0301366	\N	\N	\N	1998	\N	\N	2013-02-05	\N	TD 4991	R-1	\N	\N	0	\N	\N	\N
376	9BWXTAEZ6VR508203	6025728	\N	9BWXTAEZ6VR508203	\N	1998	\N	\N	2013-02-05	\N	SV 5559	Z-2	\N	\N	0	\N	\N	\N
374	1FDXE45F52HA41311	\N	\N	1FDXE45F52HA41311	\N	2002	\N	\N	2013-02-05	\N	BTCF 24	R-5	\N	\N	0	\N	\N	\N
379	LGWEF3A52DB606837	SLD4455	\N	LGWEF3A52DB606837	\N	2012	\N	\N	2013-02-05	\N	FGKC 99	K-2	\N	\N	0	\N	\N	\N
380	VF645ACA000010126	83M0715387	\N	VF645ACA000010126	\N	2007	\N	\N	2013-02-05	\N	LW 3191	B-1	\N	\N	0	\N	\N	\N
382	VF644ALM000001163	11001939	\N	VF644ALM000001163	\N	2012	\N	\N	2013-02-05	\N	DLKR 54	BX-1	\N	\N	0	\N	\N	\N
383	KMJWAH7HP8U071753	KMJWAH7HP8U071753	\N	KMJWAH7HP8U071753	\N	2008	\N	\N	2013-02-05	\N	BBHT 98	K-1	\N	\N	0	\N	\N	\N
384	ZCFC50A2105777717	906431	\N	ZCFC50A2105777717	\N	1992	\N	\N	2013-02-06	\N	CBBB 32	r-1	\N	\N	0	\N	\N	\N
385	VF643ACA00007942	83M0609674	\N	VF643ACA00007942	\N	2004	\N	\N	2013-02-06	\N	YB 1350	b-2	\N	\N	0	\N	\N	\N
386	VF643ACA00007929	83M060991	\N	VF643ACA00007929	\N	2004	\N	\N	2013-02-06	\N	YB 1357	b-3	\N	\N	0	\N	\N	\N
388	JE16AC0000011829	\N	\N	JE16AC0000011829	\N	1994	\N	\N	2013-02-06	\N	PP 4179	B-5	\N	\N	0	\N	\N	\N
389	1HTSLNMMONH401487	\N	\N	1HTSLNMMONH401487	\N	1992	\N	\N	2013-02-06	\N	YJ 1738	R-6	\N	\N	0	\N	\N	\N
387	J2312586	7079492	\N	\N	\N	2002	\N	\N	2013-02-06	2013-02-27	VB 1493	S-1	\N	\N	0	\N	\N	\N
390	VF645ACA000010210	83M0716666	\N	VF645ACA000010210	\N	2007	\N	\N	2013-02-06	\N	BCGY 81	B-7	\N	\N	0	\N	\N	\N
405	VF645ACA000010245	83M0717193	\N	VF645ACA000010245	\N	2007	\N	\N	2013-02-06	\N	BCGY 83	b-1	\N	\N	0	\N	\N	\N
391	IJBHR33NIJI103512	BJJ103512	\N	IJBHR33NIJI103512	\N	1988	\N	\N	2013-02-06	\N	HX 2529	HX-7	\N	\N	0	\N	\N	\N
415	8AC9046635A926374	61198170025953	\N	8AC9046635A926374	\N	2005	\N	\N	2013-02-06	\N	YZ 5881	r-5	\N	\N	0	\N	\N	\N
406	VF6JE13AC00008164	83M0301365	\N	VF6JE13AC00008164	\N	1998	\N	\N	2013-02-06	\N	TD 4992	b-3	\N	\N	0	\N	\N	\N
392	VF645ACA000010131	\N	\N	VF645ACA000010131	\N	2007	\N	\N	2013-02-06	\N	LW 3197	B-4	\N	\N	0	\N	\N	\N
423	LGWFF26548A068210 	D070926984	\N	LGWFF26548A068210	\N	2008	\N	\N	2013-02-06	\N	BDZP 57	k-1	\N	\N	0	\N	\N	\N
440	9533N82T4CR224324	36355805	\N	9533N82T4CR224324	\N	2012	\N	\N	2013-02-07	\N	DPXR 90	Z-0	\N	\N	0	\N	\N	\N
395	VFGJE13AC00009250	83M0440951	\N	VFGJE13AC00009250	\N	2000	\N	\N	2013-02-06	2013-02-07	US 4949	b-2	\N	\N	0	\N	\N	\N
407	VF6JE13AC00009302	83M0445126	\N	VF6JE13AC00009302	\N	2000	\N	\N	2013-02-06	\N	US 4937	b-4	\N	\N	0	\N	\N	\N
448	4PLCC01M09A009611	46977735	\N	4PLCC01M09A009611	\N	2009	\N	\N	2013-02-07	\N	BPVZ 22	b-3	\N	\N	0	\N	\N	\N
416	VF645ACA000010205 	83M0716489	\N	VF645ACA000010205	\N	2007	\N	\N	2013-02-06	\N	BCGY 78	b-1	\N	\N	0	\N	\N	\N
424	9BGSE19NOYC113715	QD0000910	\N	9BGSE19NOYC113715	\N	2000	\N	\N	2013-02-06	\N	TX 4843	k-2	\N	\N	0	\N	\N	\N
408	VF644ALM000001174	11012476	\N	VF644ALM000001174	\N	2011	\N	\N	2013-02-06	\N	DLKW 24	b-2	\N	\N	0	\N	\N	\N
393	\N	83M0299230	\N	\N	\N	1998	\N	\N	2013-02-06	2013-02-07	TD 4988	bX-1	\N	\N	0	\N	\N	\N
417	VF645ACA4010164 	83M0716177	\N	VF645ACA4010164 	\N	2007	\N	\N	2013-02-06	\N	BCGY 77	b-2	\N	\N	0	\N	\N	\N
409	KNHTP7352V6342587	412182	\N	KNHTP7352V6342587	\N	1997	\N	\N	2013-02-06	\N	PA 9043	j-3	\N	\N	0	\N	\N	\N
397	VF64SACA000010154	83M0716049	\N	VF64SACA000010154	\N	2007	\N	\N	2013-02-06	\N	LW 3195	b-3	\N	\N	0	\N	\N	\N
425	FR16HDL-E8071 	328777	\N	\N	\N	1994	\N	\N	2013-02-06	\N	LR 7268	j-4	\N	\N	0	\N	\N	\N
398	KMJWA37HAAV201421	D4BH9054320	\N	KMJWA37HAAV201421	\N	2011	\N	\N	2013-02-06	\N	CTHH 77	k-1	\N	\N	0	\N	\N	\N
418	VF644LM0000000164	10427213 	\N	VF644LM0000000164	\N	2007	\N	\N	2013-02-06	\N	BGVF 59	b-4	\N	\N	0	\N	\N	\N
410	1GCFG25W3W1021829	CW1021829	\N	1GCFG25W3W1021829	\N	1998	\N	\N	2013-02-06	\N	SG 5743	r-1	\N	\N	0	\N	\N	\N
399	KPTE0B1DS1P242764	42675	\N	KPTE0B1DS1P242764	\N	2001	\N	\N	2013-02-06	\N	UN 9586	k-1	\N	\N	0	\N	\N	\N
411	KMJWA37HAAU182575	D4BH9035849	\N	KMJWA37HAAU182575	\N	2010	\N	\N	2013-02-06	\N	BKZB 63	k-1	\N	\N	0	\N	\N	\N
400	VF645ACA000010125	83M0715276	\N	VF645ACA000010125	\N	2007	\N	\N	2013-02-06	\N	LW 3189	b-3	\N	\N	0	\N	\N	\N
441	VF6JE13AC00009301	83M0445171	\N	VF6JE13AC00009301	\N	2000	\N	\N	2013-02-07	\N	US 4941	b-1	\N	\N	0	\N	\N	\N
419	8AC9036727A957195	61198170056679X	\N	8AC9036727A957195	\N	2007	\N	\N	2013-02-06	\N	WB 7262	j-1	\N	\N	0	\N	\N	\N
401	29802	472287	\N	\N	\N	1990	\N	\N	2013-02-06	\N	DL 3702	h-3	\N	\N	0	\N	\N	\N
426	VF643ACA000007978	83M0612415	\N	VF643ACA000007978	\N	2004	16000	\N	2013-02-06	\N	YB 1352	b-4	\N	\N	0	\N	\N	\N
412	ZCFCS0A2105773714	904831	\N	ZCFCS0A2105773714	\N	2009	\N	\N	2013-02-06	\N	CBBB 34	rx-3	\N	\N	0	\N	\N	\N
402	8156	83M0299821	\N	\N	\N	1998	\N	\N	2013-02-06	\N	TD 4997	b-4	\N	\N	0	\N	\N	\N
439	VF644BLM000001173	11012475	\N	VF644BLM000001173	\N	2011	\N	\N	2013-02-07	\N	DLKR 55	B-1	\N	\N	0	\N	\N	\N
420	JTB33UNG8W0002742	ZRZ1729181	\N	JTB33UNG8W0002742	\N	1998	\N	\N	2013-02-06	\N	RX 7789	k-2	\N	\N	0	\N	\N	\N
413	VF6JE13AC00008142	83M0297693	\N	VF6JE13AC00008142	\N	1998	\N	\N	2013-02-06	\N	TA 4510	b-4	\N	\N	0	\N	\N	\N
403	VF6JE13A00009257	83M0441838	\N	VF6JE13A00009257	\N	2000	\N	\N	2013-02-06	\N	US 4951	bx-1	\N	\N	0	\N	\N	\N
436	VF647BCA000003048	83M0715427	\N	VF647BCA000003048	\N	2007	\N	\N	2013-02-06	\N	BCGY 82	b-3	\N	\N	0	\N	\N	\N
404	ZCFC50A2105772074	899381	\N	ZCFC50A2105772074	\N	2009	\N	\N	2013-02-06	\N	CBBB18	r-1	\N	\N	0	\N	\N	\N
421	1HTSLAAM2VH449778	449778	\N	1HTSLAAM2VH449778	\N	1997	\N	\N	2013-02-06	\N	BUCK 97	r-1	\N	\N	0	\N	\N	\N
396	2CFC49700T5102999	2211519	\N	2CFC49700T5102999	\N	1997	\N	\N	2013-02-06	2013-02-07	RC 6918	r-2	\N	\N	0	\N	\N	\N
414	VF6JE13AC00008139	83M0297023	\N	VF6JE13AC00008139	\N	1998	\N	\N	2013-02-06	\N	TA 4507	b-5	\N	\N	0	\N	\N	\N
451	9BWXTAEZ6VRE06709	6024556	\N	9BWXTAEZ6VRE06709	\N	1998	\N	\N	2013-02-07	\N	UU 1715	z-4	\N	\N	0	\N	\N	\N
428	VF3ZBAMRB17566943	10DYSH4022746	\N	VF3ZBAMRB17566943	\N	2006	\N	\N	2013-02-06	\N	ZK 9013	j-4	\N	\N	0	\N	\N	\N
422	1S9A1BBD9N2003978 	03978	\N	1S9A1BBD9N2003978	\N	1992	\N	\N	2013-02-06	\N	BXYR 20	b-1	\N	\N	0	\N	\N	\N
446	9BFYCE7V69BB20873	36065236	\N	9BFYCE7V69BB20873	\N	2008	\N	\N	2013-02-07	\N	BSCT 12	qr-2	\N	\N	0	\N	\N	\N
437	8145	83M0298666	\N	\N	\N	2000	\N	\N	2013-02-06	\N	TD 4986	b-1	\N	\N	0	\N	\N	\N
444	VF644ZME000000001	10649761	\N	VF644ZME000000001	\N	2008	\N	\N	2013-02-07	\N	WN 3446	r-1	\N	\N	0	\N	\N	\N
394	16833	5600457078	\N	\N	\N	1985	\N	\N	2013-02-06	2013-02-07	BT 6451	Bf-3	\N	\N	0	\N	\N	\N
449	VF640ACD00000942	83M0280522	\N	VF640ACD00000942	\N	1997	\N	\N	2013-02-07	\N	SV 4138	br-3	\N	\N	0	\N	\N	\N
442	3ALACYCS8CDBF7250	90697900881751	\N	3ALACYCS8CDBF7250	\N	2011	\N	\N	2013-02-07	\N	DRDT 64	rh-1	\N	\N	0	\N	\N	\N
438	15048675	3002376	\N	\N	\N	1996	\N	\N	2013-02-06	\N	NZ 5805	k-1	\N	\N	0	\N	\N	\N
447	41611510007048	\N	\N	\N	\N	1972	\N	\N	2013-02-07	\N	CGRW 26	rh-2	\N	\N	0	\N	\N	\N
450	VF640ACD000004941	83M0280518	\N	VF640ACD000004941	\N	1997	\N	\N	2013-02-07	\N	SV 4139	br-4	\N	\N	0	\N	\N	\N
445	VF640ACC000001516	10/25.5	\N	VF640ACC000001516	\N	1996	\N	\N	2013-02-07	\N	DVRJ 27	m-2	\N	\N	0	\N	\N	\N
452	9BM6931084B368445	37798410587716	\N	9BM6931084B368445	\N	2004	\N	\N	2013-02-07	\N	YD 3381	b-5	\N	\N	0	\N	\N	\N
453	9BWXTAEZ6VRSO6086	6023991	\N	9BWXTAEZ6VRSO6086	\N	1998	\N	\N	2013-02-07	\N	UU 1714	z-5	\N	\N	0	\N	\N	\N
454	9BA6931285B.413742	37798410624684	\N	9BA6931285B.41374	\N	2005	\N	\N	2013-02-07	\N	ZE 2648	Q-6	\N	\N	0	\N	\N	\N
455	JE16AC00000826	\N	\N	JE16AC00000826	\N	1994	\N	\N	2013-02-07	\N	UU 1760	B-6	\N	\N	0	\N	\N	\N
456	9BM6933867B518900	906973U0714824	\N	9BM6933867B518900	\N	2007	\N	\N	2013-02-07	\N	SW 9071	Z-6	\N	\N	0	\N	\N	\N
457	VF6JE16AC00000830	5600565125	\N	VF6JE16AC00000830	\N	1994	\N	\N	2013-02-07	\N	UU 1759	B-7	\N	\N	0	\N	\N	\N
458	9BM6933867B519154	906973U0715069	\N	9BM6933867B519154	\N	2007	\N	\N	2013-02-07	\N	SW 9070	Z-7	\N	\N	0	\N	\N	\N
459	KVNC23-403532	CD20-516076X	\N	\N	\N	1996	\N	\N	2013-02-07	\N	SW 8755	J-1	\N	\N	0	\N	\N	\N
460	JAATSFS25HW7100321	593911	\N	JAATSFS25HW710032	\N	1998	\N	\N	2013-02-07	\N	UX 4945	K-1	\N	\N	0	\N	\N	\N
461	2CFC3570145278139	3113434	\N	2CFC3570145278139	\N	2000	\N	\N	2013-02-07	\N	UX 4885	H-3	\N	\N	0	\N	\N	\N
478	7223	83M0227074	\N	\N	\N	1995	\N	\N	2013-02-08	2013-02-08	RR 9756	bx-2	\N	\N	0	\N	\N	\N
462	38008114405865	3521880502	\N	\N	\N	1978	\N	\N	2013-02-08	\N	DZHS 15	b-1	\N	\N	0	\N	\N	\N
524	VF644BLM000000115	10412027	\N	VF644BLM000000115	\N	2008	\N	\N	2013-02-12	\N	BGVF 54	B-6	\N	\N	0	\N	\N	\N
486	8385	83M0316624	\N	\N	\N	1998	\N	\N	2013-02-08	\N	TD 5441	b-1	\N	\N	0	\N	\N	\N
475	8AC9036625A92411	61198170023555	\N	8AC9036625A92411	\N	2005	\N	\N	2013-02-08	2013-02-08	XP 6286	r-22	\N	\N	0	\N	\N	\N
463	JM1CNUD22Z0735221	30014390T	\N	JM1CNUD22Z0735221	\N	2003	\N	\N	2013-02-08	\N	VU 9860	x-3	\N	\N	0	\N	\N	\N
505	VF645ACA000010127	\N	\N	VF645ACA000010127	\N	2006	\N	\N	2013-02-12	\N	LW 3187	B-2	\N	\N	0	\N	\N	\N
500	MMBJNK7502D000224	4G64AB6306	\N	MMBJNK7502D000224	\N	2002	\N	\N	2013-02-12	\N	VC 4945	r-2	\N	\N	0	\N	\N	\N
521	VF6JE13AC00009286	\N	\N	VF6JE13AC00009286	\N	2000	\N	\N	2013-02-12	\N	UP 8905	B-4	\N	\N	0	\N	\N	\N
494	3AASANBRSWS002812	469GM2U1096753	\N	3AASANBRSWS002812	\N	2000	\N	\N	2013-02-08	\N	HB 8210 	z-1	\N	\N	0	\N	\N	\N
464	ZCFC50A2105771839	885629	\N	ZCFC50A2105771839	\N	2009	\N	\N	2013-02-08	\N	CBBB 30	r-1	\N	\N	0	\N	\N	\N
476	8AC9036624A912773	61198170011701	\N	8AC9036624A912773	\N	2003	\N	\N	2013-02-08	\N	XK 5153	s-2	\N	\N	0	\N	\N	\N
487	VF645ACA000002492	83M0573597	\N	VF645ACA000002492	\N	2003	\N	\N	2013-02-08	\N	XE 8470	b-3	\N	\N	0	\N	\N	\N
465	8136	83M0296802	\N	\N	\N	1998	\N	\N	2013-02-08	\N	TD 4985	b-1	\N	\N	0	\N	\N	\N
516	A000037410	37410	\N	A000037410	\N	1991	\N	\N	2013-02-12	\N	KV 8820	r-2	\N	\N	0	\N	\N	\N
477	8GGTFSK948A171946	654186	\N	8GGTFSK948A171946	\N	2009	\N	\N	2013-02-08	\N	BXCI 42	r-1	\N	\N	0	\N	\N	\N
466	3ALDCYCS0CDBF7255	90697900875437	\N	3ALDCYCS0CDBF7255	\N	2011	\N	\N	2013-02-08	\N	DRDT 67	BF-1	\N	\N	0	\N	\N	\N
506	VF6J500A000007040	\N	\N	VF6J500A000007040	\N	1984	\N	\N	2013-02-12	\N	\N	RX-4	\N	\N	0	\N	\N	\N
488	MMBJNK7405D043975	4D56BY0626	\N	MMBJNK7405D043975	\N	2005	\N	\N	2013-02-08	\N	XV 8833	rx-1	\N	\N	0	\N	\N	\N
512	L40-02353	H-500317	\N	L40-02353	\N	1965	\N	\N	2013-02-12	\N	\N	J-3	\N	\N	0	\N	\N	\N
467	899TFRI638A173267	C24SE31028575	\N	899TFRI638A173267	\N	2009	\N	\N	2013-02-08	\N	BSVR 67	k-1	\N	\N	0	\N	\N	\N
499	JTFDE62680002152	3L5021451	\N	JTFDE62680002152	\N	2001	\N	\N	2013-02-12	2013-02-12	UF 1968	r-1	\N	\N	0	\N	\N	\N
495	VF644BLM000001206	11101156	\N	VF644BLM000001206	\N	2011	\N	\N	2013-02-08	\N	DSFK 69	b-1	\N	\N	0	\N	\N	\N
468	891	83M0190532	\N	\N	\N	1995	\N	\N	2013-02-08	\N	PU 7484	b-3	\N	\N	0	\N	\N	\N
479	7223	83M0227074	\N	\N	\N	1995	\N	\N	2013-02-08	\N	RR 9756	b-2	\N	\N	0	\N	\N	\N
489	ZFCB1H68002212783	4834033BE22	\N	ZFCB1H68002212783	\N	1997	\N	\N	2013-02-08	\N	TK 8961	h-3	\N	\N	0	\N	\N	\N
469	VF945ACA000010110	83M0745181	\N	VF945ACA000010110	\N	2007	\N	\N	2013-02-08	\N	LW 3184	b-2	\N	\N	0	\N	\N	\N
519	VF6JE16AC00000833	5600565125	\N	VF6JE16AC00000833	\N	1994	\N	\N	2013-02-12	\N	PZ 2896	B-3	\N	\N	0	\N	\N	\N
480	ZCFC50A2105770779	890329	\N	ZCFC50A2105770779	\N	2009	\N	\N	2013-02-08	\N	CBBB 24	r-1	\N	\N	0	\N	\N	\N
470	VWT4268	3835909	\N	VWT4268	\N	1951	\N	\N	2013-02-08	\N	HA 8957	b-33	\N	\N	0	\N	\N	\N
496	PF8W-0100725	4N40-BK6266	\N	PF8W-0100725	\N	1996	\N	\N	2013-02-08	\N	BZHT 12	r-1	\N	\N	0	\N	\N	\N
490	JN1CCUD22Z0001445	KA24817615	\N	JN1CCUD22Z0001445	\N	1998	\N	\N	2013-02-08	\N	TD 7924	x-3	\N	\N	0	\N	\N	\N
471	5000453366	83M0314523	\N	\N	\N	1999	\N	\N	2013-02-08	\N	TG 7782	b-3	\N	\N	0	\N	\N	\N
481	803640	10HKD33002470	\N	\N	\N	2000	\N	\N	2013-02-08	\N	TB 5857	r-2	\N	\N	0	\N	\N	\N
501	VF644ALM000001284	11067703	\N	VF644ALM000001284	\N	2011	\N	\N	2013-02-12	\N	DLSL 98	b-2	\N	\N	0	\N	\N	\N
472	VFG44ALH000000839	10806636	\N	Vfg44ALH000000839	\N	2009	\N	\N	2013-02-08	\N	CJKV 90	h-3	\N	\N	0	\N	\N	\N
482	VF645ACA000002489	83M0573662	\N	VF645ACA000002489	\N	2003	\N	\N	2013-02-08	\N	XE 8469	b-1	\N	\N	0	\N	\N	\N
473	VF645ACA000002506	83M0573954	\N	VF645ACA000002506	\N	2003	\N	\N	2013-02-08	\N	XE 8468	b-2	\N	\N	0	\N	\N	\N
491	1FDWF37F83EB27523	3EB27523	\N	1FDWF37F83EB27523	\N	2003	\N	\N	2013-02-08	\N	VV 8289	r-1	\N	\N	0	\N	\N	\N
497	VFGJE15AC00000822	5600565125	\N	VFGJE15AC00000822	\N	1987	\N	\N	2013-02-11	\N	FBZD 36	br-0	\N	\N	0	\N	\N	\N
483	5047	90698000881994	\N	\N	\N	2012	\N	\N	2013-02-08	\N	DRXX 17	z-1	\N	\N	0	\N	\N	\N
474	ZCF50A2105774174	904829	\N	ZCF50A2105774174	\N	2009	\N	\N	2013-02-08	\N	CBBB 25	r-2	\N	\N	0	\N	\N	\N
502	3ALACYCS2CDBH3685	\N	\N	3ALACYCS2CDBH3685	\N	2011	\N	\N	2013-02-12	\N	DRDT 61	B-1	\N	\N	0	\N	\N	\N
492	ZCFC50A2105773712	906432	\N	ZCFC50A2105773712	\N	2009	\N	\N	2013-02-08	\N	CBBB 23	r-4	\N	\N	0	\N	\N	\N
484	MMBJNK7406D023088	4D56CB6667	\N	MMBJNK7406D023088	\N	2007	\N	\N	2013-02-08	\N	ZU 9929	k-1	\N	\N	0	\N	\N	\N
498	8543	83M0350723	\N	\N	\N	1999	\N	\N	2013-02-12	\N	TV 4452	b-1	\N	\N	0	\N	\N	\N
513	998	83M0217365	\N	\N	\N	1995	\N	\N	2013-02-12	\N	SL 2882	q-1	\N	\N	0	\N	\N	\N
485	8GGTFSK988A164904	548912	\N	8GGTFSK988A164904	\N	2008	\N	\N	2013-02-08	\N	BFTC 85	k-4	\N	\N	0	\N	\N	\N
493	VF644AHM000001648	11188111	\N	VF644AHM000001648	\N	2012	\N	\N	2013-02-08	\N	DYLV 13	B-2	\N	\N	0	\N	\N	\N
517	3D7KU28C24G234362	\N	\N	3D7KU28C24G234362	\N	2004	\N	\N	2013-02-12	\N	YH 6584	rx-2	\N	\N	0	\N	\N	\N
503	VF6JE13AC00006450	\N	\N	VF6JE13AC00006450	\N	1993	\N	\N	2013-02-12	\N	\N	RH-1	\N	\N	0	\N	\N	\N
509	KMJFD27GPTU204921	\N	\N	KMJFD27GPTU204921	\N	1996	\N	\N	2013-02-12	\N	NL 4527	J-4	\N	\N	0	\N	\N	\N
504	WDB9034621P628198	\N	\N	WDB9034621P628198	\N	1996	\N	\N	2013-02-12	\N	\N	S-1	\N	\N	0	\N	\N	\N
523	VF647BC000000275	83M0540926	\N	VF647BC000000275	\N	2002	\N	\N	2013-02-12	\N	VU 6970	B-5	\N	\N	0	\N	\N	\N
514	VF6JE13AC00009239	83M0439817	\N	VF6JE13AC00009239	\N	2000	\N	\N	2013-02-12	\N	UP 8907	b-1	\N	\N	0	\N	\N	\N
520	JTB33UNG8Y0004506	2R22246809	\N	JTB33UNG8Y0004506	\N	2000	\N	\N	2013-02-12	\N	TD 8055	HX-3	\N	\N	0	\N	\N	\N
510	9533N82T5CR224011	\N	\N	9533N82T5CR224011	\N	2012	\N	\N	2013-02-12	\N	DPXR 89	Z-5	\N	\N	0	\N	\N	\N
518	3770KB63KFT0938	01071D0	\N	3770KB63KFT0938	\N	1981	\N	\N	2013-02-12	\N	GB 5844	h-3	\N	\N	0	\N	\N	\N
511	JAAWFRI12FP7100009	\N	\N	JAAWFRI12FP710000	\N	1985	\N	\N	2013-02-12	\N	KK 7177	J-5	\N	\N	0	\N	\N	\N
515	VFGJE13AC00009252	83M0441386	\N	VFGJE13AC00009252	\N	2000	\N	\N	2013-02-12	\N	UP 8906	bx-2	\N	\N	0	\N	\N	\N
525	9BFXNCFOWDB88	30727354	\N	9BFXNCFOWDB88	\N	2000	\N	\N	2013-02-12	\N	TD 8052	Z-6	\N	\N	0	\N	\N	\N
522	9BFXTNCF6WDB84177	30727368	\N	9BFXTNCF6WDB84177	\N	2000	\N	\N	2013-02-12	\N	TD 8053	Z-4	\N	\N	0	\N	\N	\N
526	7J010448	10DXFR61906	\N	7J010448	\N	2007	\N	\N	2013-02-12	\N	WZ 1881	K-1	\N	\N	0	\N	\N	\N
527	KMJWA3HAAU190975	D4BH9045984	\N	KMJWA3HAAU190975	\N	2010	\N	\N	2013-02-12	\N	CGTR 19	J-1	\N	\N	0	\N	\N	\N
529	00123	022320	\N	\N	\N	1993	\N	\N	2013-02-12	\N	SV 4133	b-1	\N	\N	0	\N	\N	\N
530	KFT0930	153739	\N	KFT0930	\N	1982	\N	\N	2013-02-12	\N	SV 4136	b-3	\N	\N	0	\N	\N	\N
531	BGGTFS6FHVA032104	484847	\N	BGGTFS6FHVA032104	\N	1997	\N	\N	2013-02-12	\N	PT 7240	r-1	\N	\N	0	\N	\N	\N
532	JMYHNP15W6A001021	4D56-LA2148	\N	JMYHNP15W6A001021	\N	2006	\N	\N	2013-02-12	\N	ZF 5985	jk-1	\N	\N	0	\N	\N	\N
533	VF843AC000007979	83M0612665	\N	VF843AC000007979	\N	2004	\N	\N	2013-02-12	\N	YB 1346	b-1	\N	\N	0	\N	\N	\N
534	9BM9580749B616453	906985U0794067	\N	9BM9580749B616453	\N	2009	\N	\N	2013-02-12	\N	CCGT 90	z-1	\N	\N	0	\N	\N	\N
535	VF6A7BCA0000288	83M0542807	\N	VF6A7BCA0000288	\N	2002	\N	\N	2013-02-12	\N	VU 6971	b-2	\N	\N	0	\N	\N	\N
536	VF645AC000007702	83M0675976	\N	VF645AC000007702	\N	2005	\N	\N	2013-02-12	\N	ZZ 9052	b-3	\N	\N	0	\N	\N	\N
593	93ZC4190178325350	6919	\N	93ZC4190178325350	\N	2007	\N	\N	2013-02-14	\N	WS 2857	rh-0	\N	\N	0	\N	\N	\N
595	VF644ALM000000225	10537899	\N	VF644ALM000000225	\N	2008	\N	\N	2013-02-14	\N	BPFX 67	B-2	\N	\N	0	\N	\N	\N
537	VF647CA000002380	83M0890133	\N	VF647CA000002380	\N	2006	\N	\N	2013-02-12	\N	WL 7135	b -4	\N	\N	0	\N	\N	\N
586	JN1CJUD22Z0744055	QD32221674	\N	JN1CJUD22Z0744055	\N	2005	\N	\N	2013-02-13	\N	WF 9595	k-2	\N	\N	0	\N	\N	\N
550	3NGCD13YX2K005153	K24E2389	\N	3NGCD13YX2K005153	\N	2010	\N	\N	2013-02-12	\N	UU 3157	r-1	\N	\N	0	\N	\N	\N
563	1FDJS34LXHHB11880	\N	\N	1FDJS34LXHHB11880	\N	1996	\N	\N	2013-02-13	\N	KY 1420	r-8	\N	\N	0	\N	\N	\N
538	WDF9046631E008217	61198170088958	\N	WDF9046631E008217	\N	2010	\N	\N	2013-02-12	\N	CKPP 51	r-4	\N	\N	0	\N	\N	\N
573	VF644ALM000000769	10764826	\N	VF644ALM000000769	\N	2009	\N	\N	2013-02-13	\N	CBBB 21	B-1	\N	\N	0	\N	\N	\N
551	VF65644ALM00000761	10738884	\N	VF65644ALM0000076	\N	2008	\N	\N	2013-02-12	\N	BZDZ 91	B-1	\N	\N	0	\N	\N	\N
539	VF642AEA000020061	83M0675395	\N	VF642AEA000020061	\N	2005	\N	\N	2013-02-12	\N	WG 8212	r-2	\N	\N	0	\N	\N	\N
580	5600565125	83M0173947	\N	5600565125	\N	1994	\N	\N	2013-02-13	\N	NY 4903	b-4	\N	\N	0	\N	\N	\N
564	1GNDT13Z9P2171926	\N	\N	1GNDT13Z9P2171926	\N	1996	\N	\N	2013-02-13	\N	KZ 8969	j-8	\N	\N	0	\N	\N	\N
552	\N	6A326413A-1067-8511	\N	\N	\N	1985	\N	\N	2013-02-12	\N	SH 50 82	bx-1	\N	\N	0	\N	\N	\N
540	VF645ACA000007824	83M0677850	\N	VF645ACA000007824	\N	2005	\N	\N	2013-02-12	\N	ZZ 9051	b-1	\N	\N	0	\N	\N	\N
590	6CSUD21008317	K24154537R	\N	6CSUD21008317	\N	1996	\N	\N	2013-02-14	\N	NT 2504	K-1	\N	\N	0	\N	\N	\N
553	VF6JE13AC00008517	\N	\N	VF6JE13AC00008517	\N	1999	\N	\N	2013-02-13	\N	UA 2239	b-8	\N	\N	0	\N	\N	\N
541	VF643ACA000007985	83M0612886	\N	VF643ACA000007985	\N	2004	\N	\N	2013-02-12	\N	YB 1339	b-2	\N	\N	0	\N	\N	\N
565	8530	83M0348539	\N	\N	\N	2000	\N	\N	2013-02-13	\N	UA 2238	b-9	\N	\N	0	\N	\N	\N
574	3N6PD23W5ZK899424	YD25368051T	\N	3N6PD23W5ZK899424	\N	2011	\N	\N	2013-02-13	\N	DDBP 25	K-1	\N	\N	0	\N	\N	\N
542	VF647BCA000002451	83M0694374	\N	VF647BCA000002451	\N	2006	\N	\N	2013-02-12	\N	WL 7136	b-3	\N	\N	0	\N	\N	\N
554	VF644ALM00000822	10799395	\N	VF644ALM00000822	\N	2011	\N	\N	2013-02-13	\N	CHRD 69	b-1	\N	\N	0	\N	\N	\N
581	8465	83M0339866	\N	\N	\N	1998	\N	\N	2013-02-13	\N	TV 4438	b-5	\N	\N	0	\N	\N	\N
543	VF64X4JP00000707	83M0170212	\N	VF64X4JP00000707	\N	1995	\N	\N	2013-02-12	\N	SL 3921	b-6	\N	\N	0	\N	\N	\N
566	KNHTP7355MS301325	HW58500	\N	KNHTP7355MS301325	\N	1996	\N	\N	2013-02-13	\N	KC 7887	j-9	\N	\N	0	\N	\N	\N
555	VF644ALM00000165	10427212	\N	VF644ALM00000165	\N	2011	\N	\N	2013-02-13	\N	BJVF 57	b-2	\N	\N	0	\N	\N	\N
544	VF64X4JP100000120	022239	\N	VF64X4JP100000120	\N	1993	\N	\N	2013-02-12	\N	SV 4135	b-7	\N	\N	0	\N	\N	\N
587	VF645ASA000010084	83M0714721	\N	VF645ASA000010084	\N	2006	\N	\N	2013-02-13	\N	WY  8503	b-2	\N	\N	0	\N	\N	\N
575	JMZUN8F127W614783	WLAT745404	\N	JMZUN8F127W614783	\N	2007	\N	\N	2013-02-13	\N	WV 9413	r-1	\N	\N	0	\N	\N	\N
567	8536	83M0350125	\N	\N	\N	2000	\N	\N	2013-02-13	\N	UA 2237	b-11	\N	\N	0	\N	\N	\N
556	4500016178	5143602	\N	\N	\N	1990	\N	\N	2013-02-13	\N	BVTB 37	m-3	\N	\N	0	\N	\N	\N
545	VF644ALM000001263	11060099	\N	VF644ALM000001263	\N	2011	\N	\N	2013-02-12	\N	BLSL 99	B-1	\N	\N	0	\N	\N	\N
528	VF6JE13AC00009225	83M0438005	\N	VF6JE13AC00009225	\N	2000	\N	\N	2013-02-12	2013-02-12	UP 8912	b-3	\N	\N	0	\N	\N	\N
597	WF0LMFE10BW970856	WLAT1321130	\N	WF0LMFE10BW970856	\N	2011	\N	\N	2013-02-14	\N	DRYH 13	K-1	\N	\N	0	\N	\N	\N
594	MMBJNKB40AD049882	4D56UCCC4300	\N	MMBJNKB40AD049882	\N	2011	\N	\N	2013-02-14	\N	CXJB 72	rx-0	\N	\N	0	\N	\N	\N
546	\N	3082722	\N	\N	\N	2008	\N	\N	2013-02-12	\N	BFKY 17	z-1	\N	\N	0	\N	\N	\N
576	\N	\N	\N	cbIl01	\N	2001	\N	\N	2013-02-13	\N	UT 8252	h-1	\N	\N	0	\N	\N	\N
557	VF645ACA000010174	83M0716327	\N	VF645ACA000010174	\N	2010	\N	\N	2013-02-13	\N	NW 6196	b-4	\N	\N	0	\N	\N	\N
547	\N	D4DDA437754	\N	\N	\N	2011	\N	\N	2013-02-12	\N	CLHG 82	r-3	\N	\N	0	\N	\N	\N
568	APU501143	PV4619	\N	APU501143	\N	1993	\N	\N	2013-02-13	\N	KL 7182	j-11	\N	\N	0	\N	\N	\N
582	TFR16HKLE9351	355969	\N	TFR16HKLE9351	\N	1997	\N	\N	2013-02-13	\N	KU 4863	k-1	\N	\N	0	\N	\N	\N
548	8467	83190340164	\N	\N	\N	1999	\N	\N	2013-02-12	\N	TV 4440	b-2	\N	\N	0	\N	\N	\N
558	8549	83M0350996	\N	\N	\N	2000	\N	\N	2013-02-13	\N	UA 2236	b-5	\N	\N	0	\N	\N	\N
569	\N	D4BH7461035	\N	\N	\N	2011	\N	\N	2013-02-13	\N	BDGP 19	k-1	\N	\N	0	\N	\N	\N
549	VF644BLM000000655	10783484	\N	VF644BLM000000655	\N	2009	\N	\N	2013-02-12	\N	CGJD 21	b-3	\N	\N	0	\N	\N	\N
559	3404	83M0255489	\N	\N	\N	1996	\N	\N	2013-02-13	\N	SS 2298	r-6	\N	\N	0	\N	\N	\N
591	VF645ACA000010095	83M0714860	\N	VF645ACA000010095	\N	2007	\N	\N	2013-02-14	\N	WY 8506	b-1	\N	\N	0	\N	\N	\N
577	KFT0827	04692K	\N	KFT0827	\N	1979	\N	\N	2013-02-13	\N	SZ 9892	b-1	\N	\N	0	\N	\N	\N
560	8538	83M0353312	\N	\N	\N	1999	\N	\N	2013-02-13	\N	TV 4451	b-7	\N	\N	0	\N	\N	\N
588	VF644ALM000000760	10738205	\N	VF644ALM000000760	\N	2008	\N	\N	2013-02-14	\N	BZDZ 79	B-1	\N	\N	0	\N	\N	\N
570	MNTCCUD40ZOO10402	YD25275445T	\N	MNTCCUD40ZOO10402	\N	2012	\N	\N	2013-02-13	\N	DGXZ 80	k-2	\N	\N	0	\N	\N	\N
561	1MA75599	\N	\N	\N	\N	2001	\N	\N	2013-02-13	\N	UT 6339	r-7	\N	\N	0	\N	\N	\N
583	MAITZ4BJL9206262	BJ84G17390	\N	MAITZ4BJL9206262	\N	2009	\N	\N	2013-02-13	\N	BBCF 14	r-1	\N	\N	0	\N	\N	\N
562	8517	83M0348375	\N	\N	\N	2000	\N	\N	2013-02-13	\N	UA 2239	b-8	\N	\N	0	\N	\N	\N
571	CBCQ03	\N	\N	cbcq03	\N	1993	\N	\N	2013-02-13	\N	GD 9920	b-3	\N	\N	0	\N	\N	\N
578	VF644ALM000000762	10739613	\N	VF644ALM000000762	\N	2008	\N	\N	2013-02-13	\N	BDDZ 90	b-2	\N	\N	0	\N	\N	\N
601	8402	83M0319020	\N	8402	\N	1992	\N	\N	2013-02-14	\N	FBFC 42	B-4	\N	\N	0	\N	\N	\N
572	VF644BLM000001184	11069746	\N	VF644BLM000001184	\N	2011	\N	\N	2013-02-13	\N	DLSP 17	B-2	\N	\N	0	\N	\N	\N
584	1176359	10TRJ10364703	\N	\N	\N	2011	\N	\N	2013-02-13	\N	CXJF 46	r-1	\N	\N	0	\N	\N	\N
579	L680302105	VD8566B	\N	L680302105	\N	1963	\N	\N	2013-02-13	\N	SZ 9893	B-3	\N	\N	0	\N	\N	\N
508	DRG11AV8W3461	7514492	\N	DRG11AV8W3461	\N	1974	\N	\N	2013-02-12	2013-02-14	FBFC 70	H-4	\N	\N	0	\N	\N	\N
592	8454	83M0336979	\N	\N	\N	1998	\N	\N	2013-02-14	\N	TV 4432	b-2	\N	\N	0	\N	\N	\N
585	8451	83M0336499	\N	\N	\N	1997	\N	\N	2013-02-13	\N	TG 7795	b-1	\N	\N	0	\N	\N	\N
599	VF6FN40A000045386	525267	\N	VF6FN40A000045386	\N	1991	\N	\N	2013-02-14	\N	FCFC 42	R-1	\N	\N	0	\N	\N	\N
598	VF6JE16AC00000880	83M0190034	\N	VF6JE16AC00000880	\N	1995	\N	\N	2013-02-14	\N	FCFG 55	B-3	\N	\N	0	\N	\N	\N
596	VF644BLM000001177	11069746	\N	VF644BLM000001177	\N	2011	\N	\N	2013-02-14	\N	DLSP 14	B-1	\N	\N	0	\N	\N	\N
600	9BM688133TB088001	37498010310319	\N	9BM688133TB088001	\N	1996	\N	\N	2013-02-14	\N	FBFC 64	B-3	\N	\N	0	\N	\N	\N
507	38008114412380	45397210504912	\N	38008114412380	\N	1979	\N	\N	2013-02-12	2013-02-14	DZBY 34	BX-4	\N	\N	0	\N	\N	\N
602	KMFFD27FPYU467200	D4BFY929494	\N	KMFFD27FPYU467200	\N	2001	\N	\N	2013-02-18	\N	TH 8858	R-1	\N	\N	0	\N	\N	\N
603	259	83M0283025	\N	\N	\N	1997	\N	\N	2013-02-18	\N	SL 2893	b-1	\N	\N	0	\N	\N	\N
604	VF647BCA000002453	83M0694590	\N	VF647BCA000002453	\N	2006	\N	\N	2013-02-18	\N	WL 7134	b-2	\N	\N	0	\N	\N	\N
605	18496	4325	\N	\N	\N	1987	\N	\N	2013-02-18	\N	GY 7540	b-3	\N	\N	0	\N	\N	\N
606	VF644BLM000000685	10792105	\N	VF644BLM000000685	\N	2009	\N	\N	2013-02-19	\N	CGCP 11	RX-1	\N	\N	0	\N	\N	\N
607	JTB33UNG8W0001849	2RZ1593903	\N	JTB33UNG8W0001849	\N	1998	\N	\N	2013-02-19	\N	SH 2328	R-1	\N	\N	0	\N	\N	\N
608	KFT0586	20125/1	\N	KFT0586	\N	1978	\N	\N	2013-02-19	\N	LL 6104	B-1	\N	\N	0	\N	\N	\N
609	VF647BCA000000284	83M0542550	\N	VF647BCA000000284	\N	2002	\N	\N	2013-02-19	\N	XE 8433	BX-1	\N	\N	0	\N	\N	\N
631	1FDXE45F52HA3232	\N	\N	1FDXE45F52HA3232	\N	2002	\N	\N	2013-02-19	\N	WN 2677	s-4	\N	\N	0	\N	\N	\N
623	VF6JS00A000004230	5772	\N	VF6JS00A000004230	\N	1989	\N	\N	2013-02-19	\N	CE 6438	bx-6	\N	\N	0	\N	\N	\N
641	cbchb3	\N	\N	cbchb3	\N	1975	\N	\N	2013-02-19	\N	CPTC 70	b-3	\N	\N	0	\N	\N	\N
611	VF6JE13AC00008945	83M0387854	\N	VF6JE13AC00008945	\N	2000	\N	\N	2013-02-19	\N	UB 2092	b-2	\N	\N	0	\N	\N	\N
660	0999	83M0217609	\N	0999	\N	1995	\N	\N	2013-02-19	\N	SL 2883	b-9	\N	\N	0	\N	\N	\N
624	VF6YF16C00001099	\N	\N	VF6YF16C00001099	\N	1996	\N	\N	2013-02-19	\N	PT 1040	b-6	\N	\N	0	\N	\N	\N
632	ZCFA1GG0002317193	615364	\N	ZCFA1GG0002317193	\N	2000	\N	\N	2013-02-19	\N	UG 6704	m-4	\N	\N	0	\N	\N	\N
612	VF647BCA000002133	83M0676827	\N	VF647BCA000002133	\N	2005	\N	\N	2013-02-19	\N	ZF 6295	b-3	\N	\N	0	\N	\N	\N
650	VF643ACA000007324	83M0541065	\N	VF643ACA000007324	\N	2002	\N	\N	2013-02-19	\N	VU 6421	b-2	\N	\N	0	\N	\N	\N
625	VF7232JL216093754	\N	\N	VF7232JL216093754	\N	2001	\N	\N	2013-02-19	\N	CCXL 48	rx-6	\N	\N	0	\N	\N	\N
613	VF643ACA000008043	83M0615702	\N	VF643ACA000008043	\N	2004	\N	\N	2013-02-19	\N	YD 1828	B-1	\N	\N	0	\N	\N	\N
642	7918	83M0271862	\N	7918	\N	1997	\N	\N	2013-02-19	\N	SP 8060	b-1	\N	\N	0	\N	\N	\N
633	21052	012221GK	\N	21052	\N	1989	\N	\N	2013-02-19	\N	CF 3631	QR-4	\N	\N	0	\N	\N	\N
614	VFGFN40A000037408	1393139	\N	VFGFN40A000037408	\N	1991	\N	\N	2013-02-19	\N	KY 4197	r-1	\N	\N	0	\N	\N	\N
626	VF644ALH000000836	10803194	\N	VF644ALH000000836	\N	2009	\N	\N	2013-02-19	\N	CCXJ 87	b-5	\N	\N	0	\N	\N	\N
656	9BM6950108B574155	90697UO759751	\N	9BM6950108B574155	\N	2008	\N	\N	2013-02-19	\N	BKSS 28	z-5	\N	\N	0	\N	\N	\N
615	VF647BCA000001021	83M0606364	\N	VF647BCA000001021	\N	2004	\N	\N	2013-02-19	\N	YD 1809	BR-1	\N	\N	0	\N	\N	\N
627	VF64X4JS200000504	1229	\N	VF64X4JS200000504	\N	1992	\N	\N	2013-02-19	\N	YN 4451	bx-5	\N	\N	0	\N	\N	\N
634	VF6JS00A000009634	FPTM180	\N	VF6JS00A000009634	\N	1993	\N	\N	2013-02-19	\N	LL 6189	b-8	\N	\N	0	\N	\N	\N
616	MMBGRKH80BF018086	4M41UCAV7707	\N	MMBGRKH80BF018086	\N	2011	\N	\N	2013-02-19	\N	DCRS 67	k-1	\N	\N	0	\N	\N	\N
643	9641	83M0142626	\N	9641	\N	1993	\N	\N	2013-02-19	\N	\N	B-3	\N	\N	0	\N	\N	\N
651	KFT0490	02898	\N	KFT0490	\N	1976	\N	\N	2013-02-19	\N	FBZD 21	bx-2	\N	\N	0	\N	\N	\N
628	VF644ALH000000850	10811463	\N	VF644ALH000000850	\N	2009	\N	\N	2013-02-19	\N	CCXJ 85	b-7	\N	\N	0	\N	\N	\N
617	VF622AXA000102949	83M0467626	\N	VF622AXA000102949	\N	2001	\N	\N	2013-02-19	\N	UY 1528	rx-1	\N	\N	0	\N	\N	\N
635	VF647BCA00000Z468	83M0695079	\N	VF647BCA00000Z468	\N	2006	\N	\N	2013-02-19	\N	WL 6880	bx-8	\N	\N	0	\N	\N	\N
618	VF645ACA000010261	83M0717217	\N	VF645ACA000010261	\N	2008	\N	\N	2013-02-19	\N	BSPX 79	br-1	\N	\N	0	\N	\N	\N
664	4500016298	DL30FM170D12F	\N	4500016298	\N	1973	\N	\N	2013-02-19	\N	FBZD 42	m-3	\N	\N	0	\N	\N	\N
644	CBCZ1	\N	\N	CBCZ1	\N	1984	\N	\N	2013-02-19	\N	BK 5530	Z-3	\N	\N	0	\N	\N	\N
661	KFT0648	04270	\N	KFT0648	\N	1979	\N	\N	2013-02-19	\N	FBZD 20	c-9	\N	\N	0	\N	\N	\N
657	VF6JE13AC00009273	83M0443235	\N	VF6JE13AC00009273	\N	2000	\N	\N	2013-02-19	\N	UY 3597	b-6	\N	\N	0	\N	\N	\N
619	VF644ALH000000831	10799401	\N	VF644ALH000000831	\N	2009	\N	\N	2013-02-19	\N	CCXS 86	r-1	\N	\N	0	\N	\N	\N
636	VF647BCA000002469	83M0695153	\N	VF647BCA000002469	\N	2006	\N	\N	2013-02-19	\N	WL 6882	b-3	\N	\N	0	\N	\N	\N
645	35311914627534	\N	\N	35311914627534	\N	1980	\N	\N	2013-02-19	\N	\N	b-2	\N	\N	0	\N	\N	\N
620	VFGJS00A000004216	5769	\N	VFGJS00A000004216	\N	1986	\N	\N	2013-02-19	\N	CE 6439	Bx-2	\N	\N	0	\N	\N	\N
652	38008114872130	35397210690827	\N	38008114872130	\N	1982	\N	\N	2013-02-19	\N	FBZD 41	b-3	\N	\N	0	\N	\N	\N
637	KFT1082	\N	\N	KFT1082	\N	1981	\N	\N	2013-02-19	\N	CE 9578	bx-3	\N	\N	0	\N	\N	\N
629	VF622AXA090000014	\N	\N	VF622AXA090000014	\N	1998	\N	\N	2013-02-19	2013-02-19	SP 9537	Bh-7	\N	\N	0	\N	\N	\N
621	VF640ACD000004937	83M0280199	\N	VF640ACD000004937	\N	1997	\N	\N	2013-02-19	\N	RZ 8299	b-2	\N	\N	0	\N	\N	\N
646	cbcr2	\N	\N	cbcr2	\N	1986	\N	\N	2013-02-19	\N	TL 7018	r-2	\N	\N	0	\N	\N	\N
622	1FDXE45F52HA32320	\N	\N	1FDXE45F52HA32320	\N	1992	\N	\N	2013-02-19	\N	VC 2653	r-6	\N	\N	0	\N	\N	\N
638	VF6JE13AC00008533	83M0348533	\N	VF6JE13AC00008533	\N	1999	\N	\N	2013-02-19	\N	TV 4443	B-1	\N	\N	0	\N	\N	\N
630	ZCFC65C0005597102	DC092838	\N	ZCFC65C0005597102	\N	2006	\N	\N	2013-02-19	\N	YW 1307	h-7	\N	\N	0	\N	\N	\N
667	cbvj1	\N	\N	cbvj1	\N	2006	\N	\N	2013-02-19	\N	WH 7384	j-1	\N	\N	0	\N	\N	\N
670	KMJFD37FP3K562482	D4BF3793015	\N	KMJFD37FP3K562482	\N	2003	\N	\N	2013-02-20	\N	UR 3560	x-1	\N	\N	0	\N	\N	\N
653	VF640AC000005596	83M0314311	\N	VF640AC000005596	\N	1998	\N	\N	2013-02-19	\N	TG 7781	bx-3	\N	\N	0	\N	\N	\N
647	VF644BLM000001169	11049167	\N	VF644BLM000001169	\N	2011	\N	\N	2013-02-19	\N	DRDT 57	b-1	\N	\N	0	\N	\N	\N
639	CBCHz1	\N	\N	CBCHz1	\N	2008	\N	\N	2013-02-19	\N	BKSS 33	z-1	\N	\N	0	\N	\N	\N
658	VF645ACA000010167	83M0716224	\N	VF645ACA000010167	\N	2007	\N	\N	2013-02-19	\N	MX 4336	b-7	\N	\N	0	\N	\N	\N
662	38018114440900	35397210519714	\N	38018114440900	\N	1979	\N	\N	2013-02-19	\N	FBZD 40	b-10	\N	\N	0	\N	\N	\N
640	CBCHB2	\N	\N	CBCHB2	\N	1993	\N	\N	2013-02-19	\N	SV 4132	b-2	\N	\N	0	\N	\N	\N
654	VF644AME000000002	10651701	\N	VF644AME000000002	\N	2009	\N	\N	2013-02-19	\N	BVDG 44	b-4	\N	\N	0	\N	\N	\N
648	38008114867665	35397210689705	\N	38008114867665	\N	1982	\N	\N	2013-02-19	\N	FBZD 56	B-1	\N	\N	0	\N	\N	\N
674	9BFVCE1N28BB04034	30828913	\N	9BFVCE1N28BB04034	\N	2008	\N	\N	2013-02-20	\N	BZGY 61	r-1	\N	\N	0	\N	\N	\N
898	KFT0684	\N	\N	KFT0684	\N	1979	\N	\N	2013-02-28	\N	HV 6267	bx-1	\N	\N	0	\N	\N	\N
665	SJNFAAJ10Z2368379	HR1612440C	\N	SJNFAAJ10Z2368379	\N	2011	\N	\N	2013-02-19	\N	DSRK 68	k-1	\N	\N	0	\N	\N	\N
659	VF644ALH000000824	10792539	\N	VF644ALH000000824	\N	2009	\N	\N	2013-02-19	\N	CGCH 10	b-8	\N	\N	0	\N	\N	\N
649	VF644ALM000000808	10466174	\N	VF644ALM000000808	\N	2009	\N	\N	2013-02-19	\N	CGJD 42	r-1	\N	\N	0	\N	\N	\N
655	3428	83M0256213	\N	3428	\N	1996	\N	\N	2013-02-19	\N	SP 8506	r-4	\N	\N	0	\N	\N	\N
668	cbpb1	\N	\N	cbpb1	\N	2006	\N	\N	2013-02-20	\N	CB 9261	B-1	\N	\N	0	\N	\N	\N
672	KFT1075	153799	\N	KFT1075	\N	1979	\N	\N	2013-02-20	\N	DYXP 39	b-2	\N	\N	0	\N	\N	\N
663	9BM6950108B573924	906973UO759567	\N	9BM6950108B573924	\N	2008	\N	\N	2013-02-19	\N	BKSS 27	z-10	\N	\N	0	\N	\N	\N
666	LZWCCAGA6C7000716	LAQUB40920952	\N	LZWCCAGA6C7000716	\N	2011	\N	\N	2013-02-19	\N	DHGP 19	k-2	\N	\N	0	\N	\N	\N
671	VF6JP1A1200015217	83M04008MD	\N	VF6JP1A1200015217	\N	1983	\N	\N	2013-02-20	\N	DYXP 38	bx-1	\N	\N	0	\N	\N	\N
676	9BM386014SB057332	376955102767Z3	\N	9BM386014SB057332	\N	1995	\N	\N	2013-02-20	\N	NR 7356	Z-2	\N	\N	0	\N	\N	\N
669	1GCEK14W7WZ219806	CWZ219806	\N	1GCEK14W7WZ219806	\N	1998	\N	\N	2013-02-20	\N	SR 1656	UR-1	\N	\N	0	\N	\N	\N
675	LTK23N3000003	6SD1702335	\N	LTK23N3000003	\N	1988	\N	\N	2013-02-20	\N	SJ 3393	Z-1	\N	\N	0	\N	\N	\N
673	\N	114680025	\N	\N	\N	1986	\N	\N	2013-02-20	\N	SW 9338	b-1	\N	\N	0	\N	\N	\N
677	9BM386014SB056792	37695510276339	\N	9BM386014SB056792	\N	1995	\N	\N	2013-02-20	\N	NR 7355	Z-3	\N	\N	0	\N	\N	\N
678	9GDP7H1J7VB731024	2FR01955	\N	9GDP7H1J7VB731024	\N	1997	\N	\N	2013-02-20	\N	UT 3703	Z-5	\N	\N	0	\N	\N	\N
679	VF6FN0A000037409	\N	\N	VF6FN0A000037409	\N	1991	\N	\N	2013-02-20	\N	KE 6367	X-1	\N	\N	0	\N	\N	\N
680	1FMYU04122KA70001	\N	\N	1FMYU04122KA70001	\N	\N	\N	\N	2013-02-20	\N	BPDF 69	X-2	\N	\N	0	\N	\N	\N
681	KMFFD37BPYU455376	D4BBY870773	\N	KMFFD37BPYU455376	\N	2000	\N	\N	2013-02-20	\N	BPDC 61	X-3	\N	\N	0	\N	\N	\N
682	KMCXLS7BP1U475292	D4BBV590290	\N	KMCXLS7BP1U475292	\N	2001	\N	\N	2013-02-20	\N	BPCW 52	X-4	\N	\N	0	\N	\N	\N
683	VF644ALH00000835	10802308	\N	VF644ALH00000835	\N	2009	\N	\N	2013-02-20	\N	CKGZ 75	B-1	\N	\N	0	\N	\N	\N
723	JACUBS17FM7107061	992238	\N	JACUBS17FM7107061	\N	1994	\N	\N	2013-02-21	\N	DS 2431	k-2	\N	\N	0	\N	\N	\N
697	VF644ALH000000834	10802229	\N	VF644ALH000000834	\N	2009	\N	\N	2013-02-20	\N	CKHJ 74	b-12	\N	\N	0	\N	\N	\N
684	VF7232JL216093833	\N	\N	VF7232JL216093833	\N	2001	\N	\N	2013-02-20	\N	BYSD 24	S-1	\N	\N	0	\N	\N	\N
728	9533N82T9CR215750	36326779	\N	9533N82T9CR215750	\N	2012	\N	\N	2013-02-21	\N	DPXR 86	z-2	\N	\N	0	\N	\N	\N
716	VF6JE13AC00009337	83M0448376	\N	VF6JE13AC00009337	\N	2000	\N	\N	2013-02-21	\N	UV 7444	b-2	\N	\N	0	\N	\N	\N
707	9EM9580749B616645	906985V0794293	\N	9EM9580749B616645	\N	2009	\N	\N	2013-02-20	\N	CBCZ 71	b-2	\N	\N	0	\N	\N	\N
685	VF644ALH000000845	10807571	\N	VF644ALH000000845	\N	2009	\N	\N	2013-02-20	\N	CFPX 25	B-2	\N	\N	0	\N	\N	\N
698	VF622ACA0A0013858	83M0352908	\N	VF622ACA0A0013858	\N	1999	\N	\N	2013-02-20	\N	TS 1031	bx-12	\N	\N	0	\N	\N	\N
732	VF6JE13AC00008148	83M0299774	\N	VF6JE13AC00008148	\N	1998	\N	\N	2013-02-21	\N	TD 4989	b-4	\N	\N	0	\N	\N	\N
686	ZCFC35701Y5277674	3118619	\N	ZCFC35701Y5277674	\N	2000	\N	\N	2013-02-20	\N	VZ 9308	R-2	\N	\N	0	\N	\N	\N
742	4S7AU2D98CC074667	73313780	\N	4S7AU2D98CC074667	\N	2012	\N	\N	2013-02-22	\N	FDRX 77	rx-14	\N	\N	0	\N	\N	\N
724	8GGTFS6FHWA067738	570814	\N	8GGTFS6FHWA067738	\N	1998	\N	\N	2013-02-21	\N	NF 7144	k-3	\N	\N	0	\N	\N	\N
699	4900072916	F6L5873136	\N	4900072916	\N	1981	\N	\N	2013-02-20	\N	BVDT 58	r-12	\N	\N	0	\N	\N	\N
687	VF645ACA000010163	83M0716182	\N	VF645ACA000010163	\N	2007	\N	\N	2013-02-20	\N	BGKV 74	B-4	\N	\N	0	\N	\N	\N
708	9BM6933868567313	906985V0749585	\N	9BM6933868567313	\N	2009	\N	\N	2013-02-20	\N	CBCL 47	z-1	\N	\N	0	\N	\N	\N
717	38108314815813	401910235460	\N	38108314815813	\N	1981	\N	\N	2013-02-21	\N	\N	b-3	\N	\N	0	\N	\N	\N
688	9BM6931285B426361	37798410634710	\N	9BM6931285B426361	\N	2005	\N	\N	2013-02-20	\N	ZE 9422	B-5	\N	\N	0	\N	\N	\N
700	4900159408	F6L6842202	\N	4900159408	\N	1984	\N	\N	2013-02-20	\N	BVDT 57	m-12	\N	\N	0	\N	\N	\N
739	KFT1161	771588	\N	KFT1161	\N	1982	\N	\N	2013-02-21	\N	DZHR 86	B-4	\N	\N	0	\N	\N	\N
709	KNAMA75121S084244	J3142637	\N	KNAMA75121S084244	\N	2001	\N	\N	2013-02-20	\N	WL 5809	x-1	\N	\N	0	\N	\N	\N
689	9BM9580767B513114	906985U0709827	\N	9BM9580767B513114	\N	2007	\N	\N	2013-02-20	\N	BBBS 31	q-5	\N	\N	0	\N	\N	\N
729	KFT0932	01010M9	\N	KFT0932	\N	1981	\N	\N	2013-02-21	\N	DYXP 63	bx-2	\N	\N	0	\N	\N	\N
701	VF644ALH000000820	10789560	\N	VF644ALH000000820	\N	2009	\N	\N	2013-02-20	\N	CCSX 30	b-14	\N	\N	0	\N	\N	\N
690	VF644ALM000000802	10792838	\N	VF644ALM000000802	\N	2009	\N	\N	2013-02-20	\N	CDKZ 87	b-6	\N	\N	0	\N	\N	\N
718	VF6JE13AC00007116	5600564367	\N	VF6JE13AC00007116	\N	1995	\N	\N	2013-02-21	\N	NK 8155	b-4	\N	\N	0	\N	\N	\N
736	VF6JE13AC000093	83M0445988	\N	VF6JE13AC000093	\N	2000	\N	\N	2013-02-21	\N	UT 8111	B-2	\N	\N	0	\N	\N	\N
702	GA042994310675040	\N	\N	GA042994310675040	\N	1988	\N	\N	2013-02-20	\N	PP 7132	bx-14	\N	\N	0	\N	\N	\N
691	VF6JS00A000004811	4062167	\N	VF6JS00A000004811	\N	1987	\N	\N	2013-02-20	\N	UR 2803	r-6	\N	\N	0	\N	\N	\N
710	VF6JE13AC00009280	83M0443002	\N	VF6JE13AC00009280	\N	2000	\N	\N	2013-02-20	\N	UT 8113	B-1	\N	\N	0	\N	\N	\N
725	8149 	83M0299772	\N	8149 	\N	1998	\N	\N	2013-02-21	\N	TD 5000	b-1	\N	\N	0	\N	\N	\N
692	VF622ACA0A0013838	83M0352700	\N	VF622ACA0A0013838	\N	1999	\N	\N	2013-02-20	\N	TN 4566	b-7	\N	\N	0	\N	\N	\N
703	3649510303025	1N06463	\N	3649510303025	\N	1995	\N	\N	2013-02-20	\N	XT 2404	s-14	\N	\N	0	\N	\N	\N
719	cbfbx2	833775	\N	cbfbx2	\N	1981	\N	\N	2013-02-21	\N	\N	bx-2	\N	\N	0	\N	\N	\N
711	KFT0935	MID062030G	\N	KFT0935	\N	1981	\N	\N	2013-02-20	\N	RC 1970	B-2	\N	\N	0	\N	\N	\N
693	4ENGAAA8161001778	O6R0945281	\N	4ENGAAA8161001778	\N	2007	\N	\N	2013-02-20	\N	BPCT 37	mx-7	\N	\N	0	\N	\N	\N
733	BAC9046635A926856	6119810026089	\N	BAC9046635A926856	\N	2005	\N	\N	2013-02-21	\N	YE 4012	R-1	\N	\N	0	\N	\N	\N
704	9BM6931084	B3680896	\N	B3680896	\N	2004	\N	\N	2013-02-20	\N	XB 8040	b-1	\N	\N	0	\N	\N	\N
694	VF644JP6000001039	\N	\N	VF644JP6000001039	\N	1996	\N	\N	2013-02-20	\N	PK 8716	b-11	\N	\N	0	\N	\N	\N
730	3ALACYCSXCDBF7251	90697900880959	\N	3ALACYCSXCDBF7251	\N	2011	\N	\N	2013-02-21	\N	DRDT 66	b-3	\N	\N	0	\N	\N	\N
720	1GBJG316881155975	\N	\N	1GBJG316881155975	\N	2008	\N	\N	2013-02-21	\N	FCFC 70	r-1	\N	\N	0	\N	\N	\N
712	3N0C00038F	3V001083	\N	3N0C00038F	\N	1974	\N	\N	2013-02-20	\N	RC 1972	B-3	\N	\N	0	\N	\N	\N
695	9BM6931084B368414	37798410587693	\N	9BM6931084B368414	\N	2004	\N	\N	2013-02-20	\N	XV 8054	r-11	\N	\N	0	\N	\N	\N
705	B030678	514253	\N	B030678	\N	2006	\N	\N	2013-02-20	\N	DBYW 23	s-1	\N	\N	0	\N	\N	\N
696	2221	\N	\N	2221	\N	1994	\N	\N	2013-02-20	\N	PE 2118	m-11	\N	\N	0	\N	\N	\N
726	ZCFC50A2105774412	904830	\N	ZCFC50A2105774412	\N	2009	\N	\N	2013-02-21	\N	CBBB 31	r-1	\N	\N	0	\N	\N	\N
713	35811610513020	\N	\N	35811610513020	\N	1976	\N	\N	2013-02-21	\N	\N	b-4	\N	\N	0	\N	\N	\N
721	35811610513232	\N	\N	35811610513232	\N	1976	\N	\N	2013-02-21	\N	CTZY 77	b-1	\N	\N	0	\N	\N	\N
714	35811610506873	35391310330812	\N	35811610506873	\N	1975	\N	\N	2013-02-21	\N	\N	bx-1	\N	\N	0	\N	\N	\N
745	WMANO8ZZ4BY267302	21819095712911	\N	WMANO8ZZ4BY267302	\N	2012	\N	\N	2013-02-22	\N	FBDY 75	m-8	\N	\N	0	\N	\N	\N
706	16BJV34WSJJ112878	\N	\N	16BJV34WSJJ112878	\N	1981	\N	\N	2013-02-20	2013-02-20	PZ 1375	ur-1	\N	\N	0	\N	\N	\N
744	3HAMKAAR6BL382941	1893716C1	\N	3HAMKAAR6BL382941	\N	2012	\N	\N	2013-02-22	\N	DSFT 18	r-12	\N	\N	0	\N	\N	\N
727	VF645ACA000010109	07755IMP	\N	VF645ACA000010109	\N	2007	\N	\N	2013-02-21	\N	LW 3181	b-2	\N	\N	0	\N	\N	\N
715	VF644BLM000000663	10786068	\N	VF644BLM000000663	\N	2009	\N	\N	2013-02-21	\N	CGCH 15	b-1	\N	\N	0	\N	\N	\N
734	LGWCA2178BA600531	D100340140	\N	LGWCA2178BA600531	\N	2011	\N	\N	2013-02-21	\N	CGYJ 71	K-1	\N	\N	0	\N	\N	\N
722	LJ16AA3C9C7090582	B4002175	\N	LJ16AA3C9C7090582	\N	2011	\N	\N	2013-02-21	\N	DGTS 83	k-1	\N	\N	0	\N	\N	\N
1782	RN106-11638	22R-4146832	\N	RN106-11638	\N	1996	\N	\N	2013-04-26	\N	PK 2962	K-1	\N	\N	0	\N	\N	\N
731	3N6CD13S6ZK015173	KA24884430M	\N	3N6CD13S6ZK015173	\N	2000	\N	\N	2013-02-21	\N	TX 8020	j-3	\N	\N	0	\N	\N	\N
743	VF6BA02A00000973237	\N	\N	VF6BA02A000009732	\N	1990	\N	\N	2013-02-22	\N	MZ 5800	m-22	\N	\N	0	\N	\N	\N
740	VF644BLM000000693	10795940	\N	VF644BLM000000693	\N	2009	\N	\N	2013-02-21	\N	CGJD 54	B-5	\N	\N	0	\N	\N	\N
735	\N	MID062030G	\N	\N	\N	1981	\N	\N	2013-02-21	\N	LL 2704	B-1	\N	\N	0	\N	\N	\N
737	L40-3-00087	HC500105	\N	L40-3-00087	\N	1962	\N	\N	2013-02-21	2013-02-21	LL 2703	BX-2	\N	\N	0	\N	\N	\N
738	VF6JE13A00006467	6467	\N	VF6JE13A00006467	\N	1993	\N	\N	2013-02-21	\N	LL 2727	B-3	\N	\N	0	\N	\N	\N
746	1FDXE4FS5BDA51310	\N	\N	1FDXE4FS5BDA51310	\N	2012	\N	\N	2013-02-22	\N	DVPV 69	S-1	\N	\N	0	\N	\N	\N
749	\N	5600564990	\N	\N	\N	1993	\N	\N	2013-02-22	\N	LA 2834	B-2	\N	\N	0	\N	\N	\N
747	4S7CT2D93BC074666	S73240963	\N	4S7CT2D93BC074666	\N	2012	\N	\N	2013-02-22	\N	DVPV 68	B-17	\N	\N	0	\N	\N	\N
741	PGF22013525	2453166	\N	PGF22013525	\N	1986	\N	\N	2013-02-21	\N	RF 5037	BX-5	\N	\N	0	\N	\N	\N
748	15293	004882	\N	15293	\N	1984	\N	\N	2013-02-22	\N	HC 2622	B-1	\N	\N	0	\N	\N	\N
925	PBO14001	A9015003600	\N	PBO14001	\N	2011	\N	\N	2013-03-04	\N	DKSB 63	r-2	\N	\N	0	\N	\N	\N
750	VF644BLM000000690	10795942	\N	VF644BLM000000690	\N	2009	\N	\N	2013-02-22	\N	CGJD 53	B-3	\N	\N	0	\N	\N	\N
751	8AC9046639E007154	61198170088126	\N	8AC9046639E007154	\N	2009	\N	\N	2013-02-22	\N	BSLY 55	R-1	\N	\N	0	\N	\N	\N
752	5828526453	5600564367	\N	5828526453	\N	1995	\N	\N	2013-02-22	\N	FBZD30	B-1	\N	\N	0	\N	\N	\N
753	KFT1080	FBZD31	\N	KFT1080	\N	1981	\N	\N	2013-02-22	\N	FBZD31	BX-2	\N	\N	0	\N	\N	\N
754	450016170	\N	\N	450016170	\N	1973	\N	\N	2013-02-22	\N	ZT 6771	bx-1	\N	\N	0	\N	\N	\N
755	817/58	\N	\N	817/58	\N	1956	\N	\N	2013-02-22	\N	\N	B-1	\N	\N	0	\N	\N	\N
756	9BM6950108B574586	906973U0760154	\N	9BM6950108B574586	\N	2008	\N	\N	2013-02-22	\N	BKSS 62	Z-1	\N	\N	0	\N	\N	\N
757	7925	83M0272520	\N	7925	\N	1997	\N	\N	2013-02-22	\N	ZP 8062	B-2	\N	\N	0	\N	\N	\N
758	8157	83M0300394	\N	8157	\N	1998	\N	\N	2013-02-22	\N	TD 4990	B-1	\N	\N	0	\N	\N	\N
803	VF622ACA000101867	83M0442588	\N	VF622ACA000101867	\N	2000	\N	\N	2013-02-25	\N	UU 9946	B-3	\N	\N	0	\N	\N	\N
772	4500016222	F8L413-V1762650	\N	4500016222	\N	1978	\N	\N	2013-02-25	\N	RC 1968	b-5	\N	\N	0	\N	\N	\N
791	VF644ALH00000819	10788670	\N	VF644ALH00000819	\N	2009	\N	\N	2013-02-25	\N	CGCG 99	bx-2	\N	\N	0	\N	\N	\N
759	BAC9036616A945982	61198770046093	\N	BAC9036616A945982	\N	2006	\N	\N	2013-02-22	\N	ZT 7120	R-3	\N	\N	0	\N	\N	\N
783	PGF22013539	Z20451273	\N	PGF22013539	\N	1986	\N	\N	2013-02-25	\N	UJ 2665	bx-3	\N	\N	0	\N	\N	\N
773	VF640ACD000005592	83M031402	\N	VF640ACD000005592	\N	1998	\N	\N	2013-02-25	\N	TD 5770	b-3	\N	\N	0	\N	\N	\N
760	VF6JE16AC00000831	12990052242	\N	VF6JE16AC00000831	\N	1994	\N	\N	2013-02-22	\N	PN 9339	B-1	\N	\N	0	\N	\N	\N
807	VF6JE13AC000007222	83M0227073	\N	VF6JE13AC00000722	\N	1995	\N	\N	2013-02-25	\N	RR 9752	bx-2	\N	\N	0	\N	\N	\N
798	VF643ACA000007990	83M0612230	\N	VF643ACA000007990	\N	2004	\N	\N	2013-02-25	\N	YV 1345	bx-5	\N	\N	0	\N	\N	\N
761	9BM6950108B574177	906973V0759774	\N	9BM6950108B574177	\N	2008	\N	\N	2013-02-22	\N	BKSS 29	Z-1	\N	\N	0	\N	\N	\N
792	VF6FN40A000037411	NR091763	\N	VF6FN40A000037411	\N	1990	\N	\N	2013-02-25	\N	RF 3546	r-3	\N	\N	0	\N	\N	\N
774	0014350	345256	\N	0014350	\N	1984	\N	\N	2013-02-25	\N	RC 1969	b-2	\N	\N	0	\N	\N	\N
816	VF643ACA000007975	83M0612231	\N	VF643ACA000007975	\N	2004	\N	\N	2013-02-26	\N	YD 1834	b-1	\N	\N	0	\N	\N	\N
762	VF644BLM000000698	10796671	\N	VF644BLM000000698	\N	2011	\N	\N	2013-02-22	\N	CGJD 55	b-2	\N	\N	0	\N	\N	\N
804	VF643ACA0000007951	83M0610354	\N	VF643ACA000000795	\N	2004	\N	\N	2013-02-25	\N	YB 1354	b-1	\N	\N	0	\N	\N	\N
775	74-1008-34D2HABVA	KD540S	\N	74-1008-34D2HABVA	\N	1972	\N	\N	2013-02-25	\N	RC 1973	bx-3	\N	\N	0	\N	\N	\N
763	cbpbx2	\N	\N	cbpbx2	\N	1981	\N	\N	2013-02-22	\N	RF 3543	bx-2	\N	\N	0	\N	\N	\N
784	KFT 1114	\N	\N	KFT 1114	\N	1981	\N	\N	2013-02-25	2013-02-25	HV 6256	bX-4	\N	\N	0	\N	\N	\N
764	36811610736135	362568-10-005030	\N	36811610736135	\N	1971	\N	\N	2013-02-22	\N	\N	b-4	\N	\N	0	\N	\N	\N
793	CAM07ENSI0100365	83M0107599	\N	CAM07ENSI0100365	\N	1993	\N	\N	2013-02-25	\N	RF 3542	bx-3	\N	\N	0	\N	\N	\N
776	2680-3-02209	PF2098	\N	2680-3-02209	\N	1963	\N	\N	2013-02-25	\N	RC 1966	bx-2	\N	\N	0	\N	\N	\N
799	KMFGA17LPWC114303	D4ALW042803	\N	KMFGA17LPWC114303	\N	1998	\N	\N	2013-02-25	\N	SR 2755	j-5	\N	\N	0	\N	\N	\N
765	7264	83M0226065	\N	7264	\N	1996	\N	\N	2013-02-22	\N	SL 3321	b-1	\N	\N	0	\N	\N	\N
818	1FDXE40F40F4WHB88944	\N	\N	1FDXE40F40F4WHB88	\N	1998	\N	\N	2013-02-26	\N	YP 5664	r-1	\N	\N	0	\N	\N	\N
785	74-1012-39	C70EV089729	\N	74-1012-39	\N	1977	\N	\N	2013-02-25	\N	DY 6305	b-4	\N	\N	0	\N	\N	\N
777	9BM6950108B574847	906973U0760238	\N	9BM6950108B574847	\N	2008	\N	\N	2013-02-25	\N	BK SS35	z-4	\N	\N	0	\N	\N	\N
766	312026-5513766	5515229	\N	312026-5513766	\N	1953	\N	\N	2013-02-22	\N	FCFG 44	bx-1	\N	\N	0	\N	\N	\N
808	VFGJE13AC00008505	83M0346057	\N	VFGJE13AC00008505	\N	1999	\N	\N	2013-02-25	\N	TV 4410	b-3	\N	\N	0	\N	\N	\N
794	VF610ACC000002936	86M0189673	\N	VF610ACC000002936	\N	1995	\N	\N	2013-02-25	\N	RF 3545	M-4	\N	\N	0	\N	\N	\N
767	7928	83M0273546	\N	7928	\N	1997	\N	\N	2013-02-22	\N	SP 8064	B-1	\N	\N	0	\N	\N	\N
786	PF 4179	\N	\N	PF 4179	\N	1966	\N	\N	2013-02-25	\N	HC 1003	bx-5	\N	\N	0	\N	\N	\N
778	VF6JE13ACD00006468	83M0125265	\N	VF6JE13ACD0000646	\N	1993	\N	\N	2013-02-25	\N	RC 1967	b-4	\N	\N	0	\N	\N	\N
768	35811610812080	35391310014754	\N	35811610812080	\N	1973	\N	\N	2013-02-22	\N	PW 2190	B-2	\N	\N	0	\N	\N	\N
811	VF6JF13AC0000127	83M0293761	\N	VF6JF13AC0000127	\N	1998	\N	\N	2013-02-25	\N	SZ 1868	b-1	\N	\N	0	\N	\N	\N
800	VF6JS00A000009812	83M0239919	\N	VF6JS00A000009812	\N	1996	\N	\N	2013-02-25	\N	RF 3550	b-6	\N	\N	0	\N	\N	\N
779	KFT 1116	\N	\N	KFT 1116	\N	1981	\N	\N	2013-02-25	\N	HC 1001	b-1	\N	\N	0	\N	\N	\N
769	KMJWWH7H6U702849	D4BH5200165                   	\N	KMJWWH7H6U702849	\N	2006	\N	\N	2013-02-25	\N	YX 4588	j-1	\N	\N	0	\N	\N	\N
805	VF6JS00A000009652	5600564306	\N	VF6JS00A000009652	\N	1993	\N	\N	2013-02-25	\N	NL 2403	r-1	\N	\N	0	\N	\N	\N
787	35391310726412	35811614955725	\N	35391310726412	\N	1983	\N	\N	2013-02-25	\N	CGYJ 99	b-5	\N	\N	0	\N	\N	\N
780	00121	0222590	\N	00121	\N	1993	\N	\N	2013-02-25	\N	SV 4131	b-2	\N	\N	0	\N	\N	\N
770	VF644A000000823	10790004	\N	VF644A000000823	\N	2009	\N	\N	2013-02-25	\N	CGCH 12	b-1	\N	\N	0	\N	\N	\N
814	VF643ACA000007939	83M0609471	\N	VF643ACA000007939	\N	2004	\N	\N	2013-02-25	\N	YD 1830	r-1	\N	\N	0	\N	\N	\N
771	VF652AFA000063416	Y914087	\N	VF652AFA000063416	\N	2004	\N	\N	2013-02-25	\N	YP 9012	r-1	\N	\N	0	\N	\N	\N
788	KFT1626	15036	\N	KFT1626	\N	1983	\N	\N	2013-02-25	\N	DYXP 65	b-6	\N	\N	0	\N	\N	\N
801	VF622ACA000106521	83M0541945	\N	VF622ACA000106521	\N	2002	\N	\N	2013-02-25	\N	VX 1642	BX-6	\N	\N	0	\N	\N	\N
781	9BM6950108B574328	90693U0759867	\N	9BM6950108B574328	\N	2008	\N	\N	2013-02-25	\N	BKSS 31	z-2	\N	\N	0	\N	\N	\N
796	VF645ACA00010038	83M0713528	\N	VF645ACA00010038	\N	2006	\N	\N	2013-02-25	\N	WY 8502	rx-4	\N	\N	0	\N	\N	\N
789	VF6BA03A000006869	04204FH	\N	VF6BA03A000006869	\N	1987	\N	\N	2013-02-25	\N	RF 3536	b-1	\N	\N	0	\N	\N	\N
782	VF644BLM000000146	10517860	\N	VF644BLM000000146	\N	2008	\N	\N	2013-02-25	\N	BRDJ 79	b-3	\N	\N	0	\N	\N	\N
809	ZCFC4970105108535	2240770	\N	ZCFC4970105108535	\N	1997	\N	\N	2013-02-25	\N	RA 4134	rh-3	\N	\N	0	\N	\N	\N
806	VF644ALM000000786	10787757	\N	VF644ALM000000786	\N	2009	\N	\N	2013-02-25	\N	CGJD 32	b-2	\N	\N	0	\N	\N	\N
797	VF622ACA000101868	83M044598	\N	VF622ACA000101868	\N	2000	\N	\N	2013-02-25	\N	US 4938	b-5	\N	\N	0	\N	\N	\N
790	VF622ACA0A0016211	83M0370347	\N	VF622ACA0A0016211	\N	1999	\N	\N	2013-02-25	\N	UA 2240	b-2	\N	\N	0	\N	\N	\N
365	VF6150A0000091082	\N	\N	VF6150A0000091082	\N	1976	\N	\N	2013-02-05	2013-02-27	SS 2292	BX-3	\N	\N	0	\N	\N	\N
817	13000	AB08116	\N	13000	\N	1998	\N	\N	2013-02-26	\N	RU 4477	j-2	\N	\N	0	\N	\N	\N
812	VFJE13AC00009330	83M0AA7783	\N	VFJE13AC00009330	\N	2000	\N	\N	2013-02-25	\N	VE 6243	b-3	\N	\N	0	\N	\N	\N
815	KFT0990	\N	\N	KFT0990	\N	1978	\N	\N	2013-02-25	\N	FBZD 35	b-1	\N	\N	0	\N	\N	\N
821	VF6JE13AC00009343	83M0449474	\N	VF6JE13AC00009343	\N	2000	\N	\N	2013-02-26	\N	VE 6240	b-1	\N	\N	0	\N	\N	\N
813	KMJWAH7HP9U145298	D4BH9005301	\N	KMJWAH7HP9U145298	\N	2009	\N	\N	2013-02-25	\N	CCWV 11	k-1	\N	\N	0	\N	\N	\N
819	VF643ACA000007322	83M0540924	\N	VF643ACA000007322	\N	2002	\N	\N	2013-02-26	\N	XB 9416	b-1	\N	\N	0	\N	\N	\N
820	VF644ALM000000216	10512149	\N	VF644ALM000000216	\N	2008	\N	\N	2013-02-26	\N	BPFX 79	b-2	\N	\N	0	\N	\N	\N
822	8GGTFR6FHSA009669	413112	\N	8GGTFR6FHSA009669	\N	1995	\N	\N	2013-02-26	\N	NG 7915	k-1	\N	\N	0	\N	\N	\N
823	VF6JF00A000009055	5600532138	\N	VF6JF00A000009055	\N	1990	\N	\N	2013-02-27	\N	TZ 4542	bx-1	\N	\N	0	\N	\N	\N
824	WDF63970513420552	64698251539877	\N	WDF63970513420552	\N	2009	\N	\N	2013-02-27	\N	BPZB 13	J-1	\N	\N	0	\N	\N	\N
825	VF6FN6A00003876	253011803000	\N	VF6FN6A00003876	\N	1994	\N	\N	2013-02-27	\N	CXGJ 53	r-1	\N	\N	0	\N	\N	\N
65	VF6JS00A000009056	\N	\N	VF6JS00A000009056	\N	1991	16000	\N	2013-01-25	2013-02-27	DYXP47-2	BR	\N	\N	0	\N	\N	\N
857	2GGG35JOL4109109	14022660	\N	2GGG35JOL4109109	\N	1990	\N	\N	2013-02-27	\N	XX 3080	s-1	\N	\N	0	\N	\N	\N
839	VF6JEISAC0000069	83M0148461	\N	VF6JEISAC0000069	\N	1993	\N	\N	2013-02-27	\N	SB 4648	b-1	\N	\N	0	\N	\N	\N
826	VF6JEI3AC00004849	MID50602123	\N	VF6JEI3AC00004849	\N	1992	\N	\N	2013-02-27	\N	DZHR 78	B-8	\N	\N	0	\N	\N	\N
849	JP1A12A-600762	5600457078	\N	JP1A12A-600762	\N	1985	\N	\N	2013-02-27	\N	DY 6305	BX-5	\N	\N	0	\N	\N	\N
840	VF644ALH000000851	10811462	\N	VF644ALH000000851	\N	2010	\N	\N	2013-02-27	\N	CJKV 91	bx-1	\N	\N	0	\N	\N	\N
827	38108514637691	40191910185805	\N	38108514637691	\N	1985	\N	\N	2013-02-27	\N	DZBY 29	Q-2	\N	\N	0	\N	\N	\N
864	8AC9036637A956306	61198170055680	\N	8AC9036637A956306	\N	2008	\N	\N	2013-02-27	\N	BCJG 24	r-1	\N	\N	0	\N	\N	\N
884	17128559	10DYER4040001	\N	17128559	\N	2004	\N	\N	2013-02-28	\N	VH 9843	R-1	\N	\N	0	\N	\N	\N
858	VF643ACA000007991	83M0613029	\N	VF643ACA000007991	\N	2004	\N	\N	2013-02-27	\N	YB1358	b-1	\N	\N	0	\N	\N	\N
828	60107118233551	\N	\N	60107118233551	\N	1986	\N	\N	2013-02-27	\N	DZBY 27	S-2	\N	\N	0	\N	\N	\N
850	35811614229137	35391310404272	\N	35811614229137	\N	2009	\N	\N	2013-02-27	\N	BZSC 77	B-6	\N	\N	0	\N	\N	\N
841	VF3232B2215541728	10HJT83004661	\N	VF3232B2215541728	\N	1999	\N	\N	2013-02-27	\N	TA 1479	r-1	\N	\N	0	\N	\N	\N
829	VFG52AF000011869	3110976	\N	VFG52AF000011869	\N	2001	\N	\N	2013-02-27	\N	UT 8109	RH-4	\N	\N	0	\N	\N	\N
887	RZH112-7000215	1RZ-0605078	\N	RZH112-7000215	\N	1994	\N	\N	2013-02-28	\N	BH 9996	r-1	\N	\N	0	\N	\N	\N
879	8AC9046639E014615	61198170093788	\N	8AC9046639E014615	\N	2009	\N	\N	2013-02-28	\N	BYHX 15	r-1	\N	\N	0	\N	\N	\N
842	VF644AHH000005772	11174146	\N	VF644AHH000005772	\N	2011	\N	\N	2013-02-27	\N	DXCO 98	b-2	\N	\N	0	\N	\N	\N
830	138001714418173	35395010506940	\N	138001714418173	\N	1980	\N	\N	2013-02-27	\N	CXGH 69	Q-5	\N	\N	0	\N	\N	\N
870	VF643ACA000007327	83M0541845	\N	VF643ACA000007327	\N	2006	\N	\N	2013-02-28	\N	XB 9417	b-2	\N	\N	0	\N	\N	\N
851	F60CC699349	K0-540A	\N	F60CC699349	\N	1969	\N	\N	2013-02-27	\N	DY 6304	BX-6	\N	\N	0	\N	\N	\N
865	KMJWWH7HP7U832026	D4BH7461994	\N	KMJWWH7HP7U832026	\N	2008	\N	\N	2013-02-27	\N	BJJG 23	j-1	\N	\N	0	\N	\N	\N
859	VF643ACA000007314	83M0539179	\N	VF643ACA000007314	\N	2004	\N	\N	2013-02-27	\N	XB 9383	b-2	\N	\N	0	\N	\N	\N
831	4900010818	5250517	\N	4900010818	\N	1975	\N	\N	2013-02-27	\N	DYBZ 26	M-5	\N	\N	0	\N	\N	\N
843	35811610849932	35391310015429	\N	35811610849932	\N	1973	\N	\N	2013-02-27	\N	SB 4649	h-2	\N	\N	0	\N	\N	\N
832	38008115124901	35397210792444	\N	38008115124901	\N	1984	\N	\N	2013-02-27	\N	DZBY 25	H-7	\N	\N	0	\N	\N	\N
852	3N6PD23V6ZK912634	YD25408906T	\N	3N6PD23V6ZK912634	\N	2012	\N	\N	2013-02-27	\N	DZTX 54	K-1	\N	\N	0	\N	\N	\N
844	KFT0838	136472	\N	KFT0838	\N	1979	\N	\N	2013-02-27	\N	DY 6306	b-3	\N	\N	0	\N	\N	\N
875	cboj-2	DYBH63233090	\N	cboj-2	\N	2010	\N	\N	2013-02-28	\N	WS 6057	j-2	\N	\N	0	\N	\N	\N
845	9MB6950108B575224	906973U0760586	\N	9MB6950108B575224	\N	2008	\N	\N	2013-02-27	\N	BKSS 36	Z-3	\N	\N	0	\N	\N	\N
834	VF644AHH000004991	11044427	\N	VF644AHH000004991	\N	2011	\N	\N	2013-02-27	\N	DLZC 61	B-1	\N	\N	0	\N	\N	\N
853	VF644ALM000000217	10512107	\N	VF644ALM000000217	\N	2008	\N	\N	2013-02-27	\N	BPFX 81	b-1	\N	\N	0	\N	\N	\N
866	7100220	391826	\N	7100220	\N	1990	\N	\N	2013-02-27	\N	GV 7332	k-1	\N	\N	0	\N	\N	\N
835	9533N82T4CR217597	36348380	\N	9533N82T4CR217597	\N	2012	\N	\N	2013-02-27	\N	DPXR 84	Z-4	\N	\N	0	\N	\N	\N
846	VFG43ACA000007987	83M0612928	\N	VFG43ACA000007987	\N	2004	\N	\N	2013-02-27	\N	YB 1353	B-4	\N	\N	0	\N	\N	\N
836	1025887	LB8142165	\N	1025887	\N	1979	\N	\N	2013-02-27	\N	DZBY 24	RX-6	\N	\N	0	\N	\N	\N
861	LEFYFCG259HN03534	8A076271	\N	LEFYFCG259HN03534	\N	2011	\N	\N	2013-02-27	\N	CSYF 32	t-2	\N	\N	0	\N	\N	\N
837	\N	2328331	\N	\N	\N	1998	\N	\N	2013-02-27	\N	SP 2696	h-6	\N	\N	0	\N	\N	\N
847	8GGTFRK826A151272	264380	\N	8GGTFRK826A151272	\N	2006	\N	\N	2013-02-27	\N	ZN 6912	R-4	\N	\N	0	\N	\N	\N
838	P92ML4X2LC46KKL	1101858	\N	P92ML4X2LC46KKL	\N	1986	\N	\N	2013-02-27	\N	DZBY 23	hx-6	\N	\N	0	\N	\N	\N
867	8388	83M0317255	\N	8388	\N	1998	\N	\N	2013-02-28	\N	TD 5444	b-1	\N	\N	0	\N	\N	\N
862	F65EDY	00988	\N	F65EDY	\N	1977	\N	\N	2013-02-27	\N	AX 8534	x-1	\N	\N	0	\N	\N	\N
848	VF644BLM000000670	10789256	\N	VF644BLM000000670	\N	2009	\N	\N	2013-02-27	\N	CGCH 14	B-5	\N	\N	0	\N	\N	\N
876	KFT-0931	01039-AO	\N	KFT-0931	\N	1981	\N	\N	2013-02-28	\N	RS 3540	bx-1	\N	\N	0	\N	\N	\N
856	WFOHXXGBVHRY68991	4CRRY68991	\N	WFOHXXGBVHRY68991	\N	1986	\N	\N	2013-02-27	\N	TT 5408	bx-1	\N	\N	0	\N	\N	\N
872	7257	83M0225262	\N	7257	\N	1996	\N	\N	2013-02-28	\N	SL 3318	b-1	\N	\N	0	\N	\N	\N
891	8187	83M0302075	\N	8187	\N	1998	\N	\N	2013-02-28	\N	TD 5049	b-1	\N	\N	0	\N	\N	\N
880	LSGSJ52N28Y004287	L01*7B070401	\N	LSGSJ52N28Y004287	\N	2009	\N	\N	2013-02-28	\N	BVJZ 27	k-1	\N	\N	0	\N	\N	\N
886	JAATFR16HW9102366	561821	\N	JAATFR16HW9102366	\N	1998	\N	\N	2013-02-28	\N	TE 6439	k-1	\N	\N	0	\N	\N	\N
885	VF6JE13AC00009331	83M0447852	\N	VF6JE13AC00009331	\N	2000	\N	\N	2013-02-28	\N	VE 6838	b-1	\N	\N	0	\N	\N	\N
873	KMJWWH7HP6U760026	D4BH6323090	\N	KMJWWH7HP6U760026	\N	2007	\N	\N	2013-02-28	\N	WS 6057	k-1	\N	\N	0	\N	\N	\N
877	8138	83M0296921	\N	8138	\N	1997	\N	\N	2013-02-28	\N	TA 4506	B-1	\N	\N	0	\N	\N	\N
869	VF644ALM000000215	10512148	\N	VF644ALM000000215	\N	2008	\N	\N	2013-02-28	\N	BPFX 66	b-5	\N	\N	0	\N	\N	\N
883	VF644ALM000000219	10517108	\N	VF644ALM000000219	\N	2008	\N	\N	2013-02-28	\N	BPFX 82	RB-1	\N	\N	0	\N	\N	\N
874	VFJE13AC00009342	83M0448618	\N	VFJE13AC00009342	\N	2000	\N	\N	2013-02-28	\N	VE 6244	b-2	\N	\N	0	\N	\N	\N
881	VF843ACA000007946	83M0610104	\N	VF843ACA000007946	\N	2004	\N	\N	2013-02-28	\N	YD 1823	b-2	\N	\N	0	\N	\N	\N
878	VF32900B5200360851	1GJ06306743	\N	VF32900B520036085	\N	1990	\N	\N	2013-02-28	\N	XU 1338	j-1	\N	\N	0	\N	\N	\N
889	VF644ALM000000218	10512108	\N	VF644ALM000000218	\N	2008	\N	\N	2013-02-28	\N	BPFX 80	b-2	\N	\N	0	\N	\N	\N
888	2937	1425100300	\N	2937	\N	1985	\N	\N	2013-02-28	\N	NL 2404	b-3	\N	\N	0	\N	\N	\N
890	\N	5543232	\N	\N	\N	1996	\N	\N	2013-02-28	\N	NH 8327	k-2	\N	\N	0	\N	\N	\N
892	ZCFC50AZ105771054	885628	\N	ZCFC50AZ105771054	\N	2008	\N	\N	2013-02-28	\N	DBDZ 98	r-1	\N	\N	0	\N	\N	\N
893	JTB210HBIY0034299	2R22054797	\N	JTB210HBIY0034299	\N	1999	\N	\N	2013-02-28	\N	TJ 6401	rx-1	\N	\N	0	\N	\N	\N
894	JNICPUD22Z0154829	YD85296570A	\N	JNICPUD22Z0154829	\N	2011	\N	\N	2013-02-28	\N	DBCL 72	k-1	\N	\N	0	\N	\N	\N
895	8137	83M0296512	\N	8137	\N	1997	\N	\N	2013-02-28	\N	TA 4505	b-1	\N	\N	0	\N	\N	\N
896	8GGTFR6FHVA036578	4989778	\N	8GGTFR6FHVA036578	\N	1997	\N	\N	2013-02-28	\N	PU 9423	k-1	\N	\N	0	\N	\N	\N
897	VF6JE13AC00008168	83M0301362	\N	VF6JE13AC00008168	\N	1998	\N	\N	2013-02-28	\N	TD 5037	b-1	\N	\N	0	\N	\N	\N
899	VF3232B2215922349	10HKD33003844	\N	VF3232B2215922349	\N	2001	\N	\N	2013-02-28	\N	UH 3977	r-1	\N	\N	0	\N	\N	\N
932	VF7232B5215374064	\N	\N	VF7232B5215374064	\N	1997	\N	\N	2013-03-04	\N	BBZJ 39	X-1	\N	\N	0	\N	\N	\N
913	VF6JS00A000004334	5600457060	\N	VF6JS00A000004334	\N	1986	\N	\N	2013-02-28	\N	NJ 3351	b-3	\N	\N	0	\N	\N	\N
900	3N6CD1359ZK019895	KA24084831A	\N	3N6CD1359ZK019895	\N	2003	\N	\N	2013-02-28	\N	VJ 7398	k-1	\N	\N	0	\N	\N	\N
924	7927	83M0272736	\N	7927	\N	1998	\N	\N	2013-03-04	\N	SP 8063	bx-1	\N	\N	0	\N	\N	\N
901	KMJWAH7HP9U143959	D4BH9004228	\N	KMJWAH7HP9U143959	\N	2009	\N	\N	2013-02-28	\N	CBHD 45	j-1	\N	\N	0	\N	\N	\N
914	VF6JS00A000007580	\N	\N	VF6JS00A000007580	\N	1988	\N	\N	2013-02-28	\N	NJ 3349	bx-3	\N	\N	0	\N	\N	\N
940	VF644ALM000000212	10488990	\N	VF644ALM000000212	\N	2008	\N	\N	2013-03-04	\N	BPFX 74	b-5	\N	\N	0	\N	\N	\N
933	7260	83M00225476	\N	7260	\N	1996	\N	\N	2013-03-04	\N	SL 3317	B-1	\N	\N	0	\N	\N	\N
915	KFT0815	153799	\N	KFT0815	\N	1974	\N	\N	2013-03-04	\N	NJ 3348	b-4	\N	\N	0	\N	\N	\N
903	VF6JE13C00007122	5600564	\N	VF6JE13C00007122	\N	1994	\N	\N	2013-02-28	\N	UR 8151	b-1	\N	\N	0	\N	\N	\N
916	3NOC00023F	3443350U0037102	\N	3NOC00023F	\N	1974	\N	\N	2013-03-04	\N	DYXD 32	bx-4	\N	\N	0	\N	\N	\N
904	VF6JE13AC00009271	83M0442125	\N	VF6JE13AC00009271	\N	2000	\N	\N	2013-02-28	\N	VE 6242	b-2	\N	\N	0	\N	\N	\N
934	VF643ACA000007952	\N	\N	VF643ACA000007952	\N	2004	\N	\N	2013-03-04	\N	YB 1355	BX-1	\N	\N	0	\N	\N	\N
926	VF644ALM000000796	10789305	\N	VF644ALM000000796	\N	2009	\N	\N	2013-03-04	\N	CGBS 72	b-1	\N	\N	0	\N	\N	\N
905	ABH475	3522033301	\N	ABH475	\N	1973	\N	\N	2013-02-28	\N	\N	b-3	\N	\N	0	\N	\N	\N
917	WDB4371111W160029	36695610984888	\N	WDB4371111W160029	\N	1990	\N	\N	2013-03-04	\N	DYXD 33	bx-5	\N	\N	0	\N	\N	\N
941	WD89036621R315374	\N	\N	WD89036621R315374	\N	2001	\N	\N	2013-03-04	\N	BWXF 52	j-6	\N	\N	0	\N	\N	\N
906	8AC9036617A960038	61198770059179	\N	8AC9036617A960038	\N	2008	\N	\N	2013-02-28	\N	BFLX 81	J-1	\N	\N	0	\N	\N	\N
918	3NOC00041F	\N	\N	3NOC00041F	\N	1974	\N	\N	2013-03-04	\N	DYXD 30	b-6	\N	\N	0	\N	\N	\N
907	8AC9046636A950085	61198170049953	\N	8AC9046636A950085	\N	2006	\N	\N	2013-02-28	\N	WS 5928	X-1	\N	\N	0	\N	\N	\N
927	VF644ALM000000198	10482290	\N	VF644ALM000000198	\N	2008	\N	\N	2013-03-04	\N	BPFX 72	b-5	\N	\N	0	\N	\N	\N
935	WDB67414415567840	\N	\N	WDB67414415567840	\N	1990	\N	\N	2013-03-04	\N	CBFR 22	r-1	\N	\N	0	\N	\N	\N
908	VF643ACA000007988	83M0613031	\N	VF643ACA000007988	\N	2004	\N	\N	2013-02-28	\N	YB 1344	b-1	\N	\N	0	\N	\N	\N
919	JMB0NV240SJ010279	4D56677523	\N	JMB0NV240SJ010279	\N	1995	\N	\N	2013-03-04	\N	DYXD 34	j-6	\N	\N	0	\N	\N	\N
942	KFT 1110	\N	\N	KFT 1110	\N	1978	\N	\N	2013-03-04	\N	VB 4471	b-6	\N	\N	0	\N	\N	\N
928	VF643ACA000007981	83M0612701	\N	VF643ACA000007981	\N	2004	\N	\N	2013-03-04	\N	YD 1819	b-4	\N	\N	0	\N	\N	\N
909	VF6JE13AC0008475	83M034258	\N	VF6JE13AC0008475	\N	1998	\N	\N	2013-02-28	\N	TV 4426	h-1	\N	\N	0	\N	\N	\N
920	ZCFC50A2105791981	988979	\N	ZCFC50A2105791981	\N	2010	\N	\N	2013-03-04	\N	CHRD 62	r-1	\N	\N	0	\N	\N	\N
936	VF72322B5215374504	\N	\N	VF72322B521537450	\N	2000	\N	\N	2013-03-04	\N	BBZJ 40	rx-1	\N	\N	0	\N	\N	\N
910	F170D12-F	4900028448	\N	F170D12-F	\N	1976	\N	\N	2013-02-28	\N	DYXD 31	m-1	\N	\N	0	\N	\N	\N
929	KMJWWH7HP70832247	D4BH7461039	\N	KMJWWH7HP70832247	\N	2008	\N	\N	2013-03-04	\N	BCJJ 61	j-1	\N	\N	0	\N	\N	\N
911	1FDKE30NXNH832198	\N	\N	1FDKE30NXNH832198	\N	1992	\N	\N	2013-02-28	\N	RD 1657	r-2	\N	\N	0	\N	\N	\N
921	VF6JGBAC00009311	83M0446593	\N	VF6JGBAC00009311	\N	1997	\N	\N	2013-03-04	\N	VE 6237	b-2	\N	\N	0	\N	\N	\N
912	VF644ALM000000202	10488215	\N	VF644ALM000000202	\N	2008	\N	\N	2013-02-28	\N	BPFX 76	b-2	\N	\N	0	\N	\N	\N
937	VF644ALM000000211	10488800	\N	VF644ALM000000211	\N	2008	\N	\N	2013-03-04	\N	BPFX 75	b-2	\N	\N	0	\N	\N	\N
922	KMJWA37HABU301179	DHBHA050680	\N	KMJWA37HABU301179	\N	2011	\N	\N	2013-03-04	\N	CLXL 52	jx-1	\N	\N	0	\N	\N	\N
930	VF3ZBAMNB17007307	10DYER4014131	\N	VF3ZBAMNB17007307	\N	2004	\N	\N	2013-03-04	\N	XE 5092	r-1	\N	\N	0	\N	\N	\N
943	VF644ALM000000213	10498201	\N	VF644ALM000000213	\N	2008	\N	\N	2013-03-04	\N	BPFX 73	b-7	\N	\N	0	\N	\N	\N
923	8GGTFS5778A168832	G277362	\N	8GGTFS5778A168832	\N	2011	\N	\N	2013-03-04	\N	BUZG 53	k-1	\N	\N	0	\N	\N	\N
938	cbsvttbx2	\N	\N	cbsvttbx2	\N	1969	\N	\N	2013-03-04	\N	RF 3551	bx-2	\N	\N	0	\N	\N	\N
931	3N6PD23YXZK899338	YD25364524T	\N	3N6PD23YXZK899338	\N	2011	\N	\N	2013-03-04	\N	DSXX 82	j-4	\N	\N	0	\N	\N	\N
944	WDB9036621R315927	\N	\N	WDB9036621R315927	\N	2010	\N	\N	2013-03-04	\N	BWXF 53	j-2	\N	\N	0	\N	\N	\N
939	206008861	205609611	\N	206008861	\N	1998	\N	\N	2013-03-04	\N	BBZJ 38	b-3	\N	\N	0	\N	\N	\N
945	JS3TA74V1C4100759	M16A-1621878	JS3TA74V1C4100759	JS3TA74V1C4100759	\N	2012	1020	\N	2013-03-05	\N	DRSC23	NHJ78	\N	\N	0	\N	\N	\N
949	51334911	513346505	232DF3123	51334912	\N	1983	123112	planos-163344_162493937233649_1241569058_n06.03.201312-21-49pm.jpg	2013-03-06	2013-03-06	SRSC10-4	M1	\N	\N	1	9128929hola	\N	\N
443	VF644ALM000000180	10463566	\N	VF644ALM000000180	\N	2008	\N	planos-carro-bomba-chile106.03.201311-43-34am.jpg	2013-02-07	2013-03-06	WN 3423	B-1	\N	\N	0	\N	\N	\N
946	345F546	FSDF435435	RWERFDS	435345DFDSF	\N	2005	1500	\N	2013-03-05	2013-03-05	YR1895-K	BG56	\N	\N	0	\N	\N	\N
947	\N	DF87S897SA98D7SA987D9AS87D	\N	DAS	\N	\N	\N	\N	2013-03-05	\N	\N	BJ78	\N	\N	0	\N	\N	\N
948	58357844DS	28728D8CV8	15ASD145A	1521214DSXD	\N	\N	441232	\N	2013-03-06	\N	VF5938-5	23FASCCX	\N	\N	0	\N	\N	\N
969	VF644ALM000000713	10730989	\N	VF644ALM000000713	\N	2008	\N	\N	2013-03-07	\N	BZDZ 85	B-2	\N	\N	0	\N	\N	\N
956	KFT0186 	5000344492	\N	KFT0186 	\N	1977	\N	\N	2013-03-07	\N	BJ 1634	UR	\N	\N	0	\N	\N	\N
950	VF643ACA000007961	83M0611110	\N	VF643ACA000007961	\N	2004	\N	\N	2013-03-07	\N	YD 1833	B-1	\N	\N	0	\N	\N	\N
967	1FDKE30F2SHB95924	\N	\N	1FDKE30F2SHB95924	\N	1996	\N	\N	2013-03-07	\N	ZK 4782	R-1	\N	\N	0	\N	\N	\N
960	VF644ALM000000823	10801393	\N	VF644ALM000000823	\N	2009	\N	\N	2013-03-07	\N	CHDK 45	B-2	\N	\N	0	\N	\N	\N
964	VF644ALM000000827	10807584	\N	VF644ALM000000827	\N	2009	\N	\N	2013-03-07	\N	CHDK 44	B-1	\N	\N	0	\N	\N	\N
951	KFT0671	576	\N	KFT0671	\N	1978	\N	\N	2013-03-07	\N	NF 1319	BX-1	\N	\N	0	\N	\N	\N
957	VF644AOM000001660	11196616	\N	VF644AOM000001660	\N	2012	\N	\N	2013-03-07	\N	DZXR 97	B-1	\N	\N	0	\N	\N	\N
952	WD3YEZA96D5721647	\N	\N	WD3YEZA96D5721647	\N	2013	\N	\N	2013-03-07	\N	FLPX 20	R-1	\N	\N	0	\N	\N	\N
974	VF644ALM000000812	10797092	\N	VF644ALM000000812	\N	2009	\N	\N	2013-03-07	\N	CHDK 36	B-1	\N	\N	0	\N	\N	\N
961	1005	5527771	\N	1005	\N	1993	\N	\N	2013-03-07	\N	KV 3801	R-1	\N	\N	0	\N	\N	\N
958	LGWDB2172CC616523	D111007362	\N	LGWDB2172CC616523	\N	2012	\N	\N	2013-03-07	\N	CSKX 19	K-1	\N	\N	0	\N	\N	\N
953	VF644ALM000000811	10796675	\N	VF644ALM000000811	\N	2009	\N	\N	2013-03-07	\N	CGJD 45	BR-2	\N	\N	0	\N	\N	\N
971	KFT1130	4900	\N	KFT1130	\N	1981	\N	\N	2013-03-07	\N	FBFC 44	B-5	\N	\N	0	\N	\N	\N
970	VF644ALM000000687	10726325	\N	VF644ALM000000687	\N	2008	\N	\N	2013-03-07	\N	BZDZ 82	B-3	\N	\N	0	\N	\N	\N
965	VF645ACA000002453	83M0572261	\N	VF645ACA000002453	\N	2003	\N	\N	2013-03-07	\N	XE 8505	BR-2	\N	\N	0	\N	\N	\N
954	VF6JE13AC00008492	83M0342183	\N	VF6JE13AC00008492	\N	1999	\N	\N	2013-03-07	\N	TV 4404	B-3	\N	\N	0	\N	\N	\N
962	3N6DD23T9ZK870887	KA24-461361A	\N	3N6DD23T9ZK870887	\N	2010	\N	\N	2013-03-07	\N	CKJG 46	SG-1	\N	\N	0	\N	\N	\N
968	VF644ALM000000813	10797369	\N	VF644ALM000000813	\N	2009	\N	\N	2013-03-07	\N	CGJD 46	B-1	\N	\N	0	\N	\N	\N
955	D3TB121WZ	05-TE-9425A	\N	D3TB121WZ	\N	1975	\N	\N	2013-03-07	\N	FBFC 63	BX-3	\N	\N	0	\N	\N	\N
959	VF645ACA000002356	83M0568716	\N	VF645ACA000002356	\N	2003	\N	\N	2013-03-07	\N	XE 8502	B-1	\N	\N	0	\N	\N	\N
966	L680-3-02080	343910-10-124111	\N	L680-3-02080	\N	1963	\N	\N	2013-03-07	\N	FBFC 59	B-2	\N	\N	0	\N	\N	\N
963	LA7CNR-16903	20987	\N	LA7CNR-16903	\N	1973	\N	\N	2013-03-07	\N	FCDY 30	BX-2	\N	\N	0	\N	\N	\N
973	1FV6GFBC4VL623745	45375053	\N	1FV6GFBC4VL623745	\N	1997	\N	\N	2013-03-07	\N	XR 3018	R-6	\N	\N	0	\N	\N	\N
972	VF645ACA000002470	83M0572570	\N	VF645ACA000002470	\N	2003	\N	\N	2013-03-07	\N	XE 8504	B-4	\N	\N	0	\N	\N	\N
976	VF644AGE000010377	11176186	\N	VF644AGE000010377	\N	2011	\N	\N	2013-03-07	\N	DYLY 68	R-1	\N	\N	0	\N	\N	\N
977	701209	20802	\N	701209	\N	1972	\N	\N	2013-03-07	\N	FBFC 65	BX-1	\N	\N	0	\N	\N	\N
91	453440	11042	\N	\N	\N	1971	16000	\N	2013-01-25	2013-03-07	FBFC43-8	BX-2	\N	\N	0	\N	\N	\N
975	VF6JE13AC00008497	85M0344978	\N	VF6JE13AC00008497	\N	1999	\N	\N	2013-03-07	2013-03-07	TV 4406	B-2	\N	\N	0	\N	\N	\N
978	VF645AC000002460	83M0572346	\N	VF645AC000002460	\N	2003	\N	\N	2013-03-07	\N	XE 8452	B-4	\N	\N	0	\N	\N	\N
979	VF644ALM00000814	10797177	\N	VF644ALM00000814	\N	2010	\N	\N	2013-03-07	\N	CHDK 37	BX-1	\N	\N	0	\N	\N	\N
980	144113	5000344178GD	\N	144113	\N	1984	\N	\N	2013-03-07	\N	LG 4245	B-1	\N	\N	0	\N	\N	\N
981	ER9805	31219140073253	\N	ER9805	\N	1953	\N	\N	2013-03-07	\N	ER 9806	B-11	\N	\N	0	\N	\N	\N
982	VF645ACA000002467	83M0572443	\N	VF645ACA000002467	\N	2003	\N	\N	2013-03-07	\N	XE 8453	B-13	\N	\N	0	\N	\N	\N
1033	011700	22707	\N	011700	\N	1982	\N	\N	2013-03-08	\N	BJ 6294	B-31	\N	\N	0	\N	\N	\N
74	KFT1152	5846	\N	\N	\N	1982	8000	\N	2013-01-25	2013-03-08	DZHR85-7	B-11	\N	\N	0	\N	\N	\N
983	7218	83M0227067	\N	7218	\N	1995	\N	\N	2013-03-07	\N	RR 9754	B-21	\N	\N	0	\N	\N	\N
998	VF645ACA000002479	83M0573064	\N	VF645ACA000002479	\N	2003	\N	\N	2013-03-07	\N	XE 8455	B-1	\N	\N	0	\N	\N	\N
1016	3N0N00026F	3V001067	\N	3N0N00026F	\N	1973	\N	\N	2013-03-08	\N	ET 4941	B-5	\N	\N	0	\N	\N	\N
984	420B	5600457060	\N	420B	\N	1986	\N	\N	2013-03-07	\N	ET 8030	B-12	\N	\N	0	\N	\N	\N
1023	VF644ALM000000669	10716997	\N	VF644ALM000000669	\N	2009	\N	\N	2013-03-08	\N	BYTP 58	B-1	\N	\N	0	\N	\N	\N
999	1FDHS34M7LHA13261	\N	\N	1FDHS34M7LHA13261	\N	1990	\N	\N	2013-03-07	\N	UG 4592	R-1	\N	\N	0	\N	\N	\N
985	CBLQ22	\N	\N	CBLQ22	\N	1957	\N	\N	2013-03-07	\N	CA 6947	Q-22	\N	\N	0	\N	\N	\N
1008	VF6JE13AC00008509	83M0346562	\N	VF6JE13AC00008509	\N	1999	\N	\N	2013-03-08	\N	TV 4414	B-13	\N	\N	0	\N	\N	\N
1042	515.0255.655	2698761-60	\N	515.0255.655	\N	1960	\N	\N	2013-03-08	\N	DA 7042	B-4	\N	\N	0	\N	\N	\N
1029	VF6JE13AC00008504	83M0345885	\N	VF6JE13AC00008504	\N	1999	\N	\N	2013-03-08	\N	TV 4409	B-11	\N	\N	0	\N	\N	\N
986	KFT1065	\N	\N	KFT1065	\N	1981	\N	\N	2013-03-07	\N	ER 9804	B-31	\N	\N	0	\N	\N	\N
1000	YH61V-0075342	3Y-0744645	\N	YH61V-0075342	\N	1989	\N	\N	2013-03-07	\N	FT 5222	J-5	\N	\N	0	\N	\N	\N
1017	L680302138	PF2096	\N	L680302138	\N	1963	\N	\N	2013-03-08	\N	ET 4939	B-6	\N	\N	0	\N	\N	\N
987	49048	7450417	\N	49048	\N	1992	\N	\N	2013-03-07	\N	RT 8232	R-51	\N	\N	0	\N	\N	\N
1009	VF644ALM000000819	10799155	\N	VF644ALM000000819	\N	2009	\N	\N	2013-03-08	\N	CHDK 40	B-14	\N	\N	0	\N	\N	\N
1040	6024172P324546	035A103T	\N	6024172P324546	\N	2003	\N	\N	2013-03-08	\N	FCDY 32	R-2	\N	\N	0	\N	\N	\N
1001	VF6JS00A000008557	011635DK	\N	VF6JS00A000008557	\N	1989	\N	\N	2013-03-07	\N	ED 6444	Z-0	\N	\N	0	\N	\N	\N
988	ZCFC50A2105791714	988978	\N	ZCFC50A2105791714	\N	2009	\N	\N	2013-03-07	\N	CHDK 35	R-52	\N	\N	0	\N	\N	\N
1024	8498	83M0345164	\N	8498	\N	1999	\N	\N	2013-03-08	\N	TV 4407	B-1	\N	\N	0	\N	\N	\N
989	\N	YD2526M653A	\N	\N	\N	2009	\N	\N	2013-03-07	\N	BVLG 96	K-1	\N	\N	0	\N	\N	\N
1010	8AC9046638A995358	61198170082094	\N	8AC9046638A995358	\N	2008	\N	\N	2013-03-08	\N	BLLF 72	R-1	\N	\N	0	\N	\N	\N
1002	L680-3-02083	PF2078	\N	L680-3-02083	\N	1963	\N	\N	2013-03-07	\N	KV 3696	B-0	\N	\N	0	\N	\N	\N
990	KMJRD37BP3K556745	D4BB3726135	\N	KMJRD37BP3K556745	\N	2003	\N	\N	2013-03-07	\N	VP 4361	K-2	\N	\N	0	\N	\N	\N
1018	1FDKE30L5FHB04723	73DU2U932202	\N	1FDKE30L5FHB04723	\N	1985	\N	\N	2013-03-08	\N	DZCC 30	R-10	\N	\N	0	\N	\N	\N
1034	YN85-0028501	2Y0691338	\N	YN85-0028501	\N	1992	\N	\N	2013-03-08	\N	DN 5762	J-3	\N	\N	0	\N	\N	\N
1003	ATB-235	8059522	\N	ATB-235	\N	1970	\N	\N	2013-03-07	\N	KV 3694	B-5	\N	\N	0	\N	\N	\N
991	VF644ALM000000740	10732322	\N	VF644ALM000000740	\N	2008	\N	\N	2013-03-07	\N	BZDZ 86	B-41	\N	\N	0	\N	\N	\N
1030	VF644ALM000000821	10799152	\N	VF644ALM000000821	\N	2009	\N	\N	2013-03-08	\N	CHDK 47	B-12	\N	\N	0	\N	\N	\N
1011	VF644ALM000000644	10716914	\N	VF644ALM000000644	\N	2008	\N	\N	2013-03-08	\N	BYTP 44	B-2	\N	\N	0	\N	\N	\N
992	CBLM42	\N	\N	CBLM42	\N	1980	\N	\N	2013-03-07	\N	XE 8453	M-42	\N	\N	0	\N	\N	\N
1004	AVH-429	\N	\N	AVH-429	\N	1970	\N	\N	2013-03-08	\N	KV 3693	B-3	\N	\N	0	\N	\N	\N
1025	YN85-0015107	2Y-0600355	\N	YN85-0015107	\N	1991	\N	\N	2013-03-08	\N	DE 9526	R-1	\N	\N	0	\N	\N	\N
1019	7180832	J2395271	\N	7180832	\N	2005	\N	\N	2013-03-08	\N	YP 8719	J-1	\N	\N	0	\N	\N	\N
993	VF644ALM000000731	10732321	\N	VF644ALM000000731	\N	2008	\N	\N	2013-03-07	\N	BZDZ 87	B-32	\N	\N	0	\N	\N	\N
1012	VF6JE13AC00008510	83M0346965	\N	VF6JE13AC00008510	\N	1999	\N	\N	2013-03-08	\N	TV 4415	B-1	\N	\N	0	\N	\N	\N
1005	KTF1132	153799	\N	KTF1132	\N	1980	\N	\N	2013-03-08	\N	KV 3695	RX-1	\N	\N	0	\N	\N	\N
994	VF644ALM000000646	10715783	\N	VF644ALM000000646	\N	2008	\N	\N	2013-03-07	\N	BYTP 48	BX-1	\N	\N	0	\N	\N	\N
1038	VF644ALM000000649	10720729	\N	VF644ALM000000649	\N	2008	\N	\N	2013-03-08	\N	BYTP 49	B-1	\N	\N	0	\N	\N	\N
1013	\N	2012611	\N	\N	\N	1982	\N	\N	2013-03-08	\N	HC 6618	B-4	\N	\N	0	\N	\N	\N
995	VF644ALM000000665	10719834	\N	VF644ALM000000665	\N	2008	\N	\N	2013-03-07	\N	BYTP 55	B-4	\N	\N	0	\N	\N	\N
1006	9BG138CSOYC419065	RL0005798	\N	9BG138CSOYC419065	\N	2000	\N	\N	2013-03-08	\N	TY 3820	J-1	\N	\N	0	\N	\N	\N
1035	0272782	\N	\N	0272782	\N	1984	\N	\N	2013-03-08	\N	\N	B-13	\N	\N	0	\N	\N	\N
1020	RZN1480002902	2RZ1631919	\N	RZN1480002902	\N	1998	\N	\N	2013-03-08	\N	SD 6940	K-1	\N	\N	0	\N	\N	\N
996	4900030449	5545378	\N	4900030449	\N	1976	\N	\N	2013-03-07	\N	LN 8666	BX-4	\N	\N	0	\N	\N	\N
1014	\N	8540532965	\N	\N	\N	1982	\N	\N	2013-03-08	\N	CXGJ 59	Z-20	\N	\N	0	\N	\N	\N
1026	158791600328C7D07	KVD42666	\N	158791600328C7D07	\N	1978	\N	\N	2013-03-08	\N	\N	B-2	\N	\N	0	\N	\N	\N
997	RZH113-0023181	2RZ1195650	\N	RZH113-0023181	\N	1997	\N	\N	2013-03-07	\N	PZ 5803	K-1	\N	\N	0	\N	\N	\N
1031	L680-3-01842	PF 2056	\N	L680-3-01842	\N	1963	\N	\N	2013-03-08	\N	CG 1929	B-21	\N	\N	0	\N	\N	\N
1007	TLF16-14530	5688464	\N	TLF16-14530	\N	1977	\N	\N	2013-03-08	\N	DZHR 99	B-12	\N	\N	0	\N	\N	\N
1021	KMFZAD7HP8U410285	D4BH8015927	\N	KMFZAD7HP8U410285	\N	2009	\N	\N	2013-03-08	\N	BYCC 95	R-1	\N	\N	0	\N	\N	\N
1044	JALFTR32M57000039	6HE1406217	\N	JALFTR32M57000039	\N	2006	\N	\N	2013-03-08	\N	ZK 5570	Q-2	\N	\N	0	\N	\N	\N
1015	N0C00052F	ED6016864	\N	N0C00052F	\N	1971	\N	\N	2013-03-08	\N	ET 4937	B-41	\N	\N	0	\N	\N	\N
1027	VF644ALM000000661	10717304	\N	VF644ALM000000661	\N	2009	\N	\N	2013-03-08	\N	BYTP 52	B-1	\N	\N	0	\N	\N	\N
1041	CF685F1879	582A-P46	\N	CF685F1879	\N	1982	\N	\N	2013-03-08	\N	FCFC 48	BX-1	\N	\N	0	\N	\N	\N
1022	4BJLGC120M001169	KA24043109M	\N	4BJLGC120M001169	\N	1994	\N	\N	2013-03-08	\N	LD 8951	RX-1	\N	\N	0	\N	\N	\N
1032	8GGTFR6FHSA000913	376430	\N	8GGTFR6FHSA000913	\N	1995	\N	\N	2013-03-08	\N	LV 5359	J-2	\N	\N	0	\N	\N	\N
1039	JTB21LHH731033214	5L5301179	\N	JTB21LHH731033214	\N	2004	\N	\N	2013-03-08	\N	VG 1419	R-1	\N	\N	0	\N	\N	\N
1028	CH38118314751540	40290610219843	\N	CH38118314751540	\N	1981	\N	\N	2013-03-08	\N	\N	B-11	\N	\N	0	\N	\N	\N
1036	1FMDU34X3NUE10897	NUE10897	\N	1FMDU34X3NUE10897	\N	1992	\N	\N	2013-03-08	\N	KJ 8308	K-1	\N	\N	0	\N	\N	\N
1047	VF644ALM000000818	10799153	\N	VF644ALM000000818	\N	2009	\N	\N	2013-03-11	\N	CHDK 41	H-1	\N	\N	0	\N	\N	\N
1043	20322	2JK136CA	\N	20322	\N	1983	\N	\N	2013-03-08	\N	GF 7547	J-3	\N	\N	0	\N	\N	\N
1046	VF643ACA000008030	83M0614791	\N	VF643ACA000008030	\N	2004	\N	\N	2013-03-11	\N	YV 2934	B-1	\N	\N	0	\N	\N	\N
1037	\N	D080975190	\N	\N	\N	2009	\N	\N	2013-03-08	\N	CBHT 61	K-1	\N	\N	0	\N	\N	\N
1045	8506	83M0346265	\N	8506	\N	1999	\N	\N	2013-03-08	\N	TV 4411	BX-1	\N	\N	0	\N	\N	\N
1048	VF652AFA000011866	3109725	\N	VF652AFA000011866	\N	2001	\N	\N	2013-03-11	\N	VT 8110	R-2	\N	\N	0	\N	\N	\N
1049	WDF63960313436543	64698251576251	\N	WDF63960313436543	\N	2009	\N	\N	2013-03-11	\N	BZXG 72	RX-2	\N	\N	0	\N	\N	\N
1050	VF644ALM000000666	10719247	\N	VF644ALM000000666	\N	2008	\N	\N	2013-03-11	\N	BYTP 56	B-4	\N	\N	0	\N	\N	\N
1051	ZCF80C8009001136	394710	\N	ZCF80C8009001136	\N	1990	\N	\N	2013-03-11	\N	XX 3907	B-3	\N	\N	0	\N	\N	\N
1052	LA9F2CTT98HFWUG07	E09882	\N	LA9F2CTT98HFWUG07	\N	2009	\N	\N	2013-03-11	\N	BHTV 58	SG-1	\N	\N	0	\N	\N	\N
1053	MNTCCUD40Z0012841	YD25342445T	\N	MNTCCUD40Z0012841	\N	2012	\N	\N	2013-03-12	\N	DXJP 67	K-1	\N	\N	0	\N	\N	\N
1054	JHK7406D017821	4D56CB1391	\N	JHK7406D017821	\N	2005	\N	\N	2013-03-12	\N	ZK 1687	K-2	\N	\N	0	\N	\N	\N
1055	7039102	JT531924	\N	7039102	\N	2004	\N	\N	2013-03-12	\N	YB 1187	R-1	\N	\N	0	\N	\N	\N
1056	VF645ACA000010169	83M0716343	\N	VF645ACA000010169	\N	2007	\N	\N	2013-03-12	\N	NW 6197	B-1	\N	\N	0	\N	\N	\N
1057	8457	83M0338643	\N	8457	\N	1998	\N	\N	2013-03-12	\N	TV 4435	B-2	\N	\N	0	\N	\N	\N
1058	JTFDL626640008954	2RZ3260502	\N	JTFDL626640008954	\N	2005	\N	\N	2013-03-12	\N	YS 5558	R-2	\N	\N	0	\N	\N	\N
1072	AGB-95	11794	\N	AGB-95	\N	1968	\N	\N	2013-03-12	\N	FP 6124	B-12	\N	\N	0	\N	\N	\N
1091	VF644BLM000000672	10789269	\N	VF644BLM000000672	\N	2009	\N	\N	2013-03-12	\N	CGJD 36	B-2	\N	\N	0	\N	\N	\N
1059	VF645ACA000010159	83M0716163	\N	VF645ACA000010159	\N	2007	\N	\N	2013-03-12	\N	NW 6198	B-3	\N	\N	0	\N	\N	\N
1101	9BM384024SB081028	276945-10-301998	\N	9BM384024SB081028	\N	1996	\N	\N	2013-03-12	\N	PC 5331	Z-4	\N	\N	0	\N	\N	\N
1073	8GGTFSF491A097167	736951	\N	8GGTFSF491A097167	\N	2001	\N	\N	2013-03-12	\N	TH 7311	K-1	\N	\N	0	\N	\N	\N
1060	F6L714	4508631	\N	F6L714	\N	1967	\N	\N	2013-03-12	\N	\N	M-3	\N	\N	0	\N	\N	\N
833	SKFDM3B6FT108224	9106552023A85HH	\N	SKFDM3B6FT108224	\N	1985	\N	\N	2013-02-27	2013-03-12	DZBY 28	BR	\N	\N	0	\N	\N	\N
1083	KMHNM81XP5U174071	J3895063	\N	KMHNM81XP5U174071	\N	2005	\N	\N	2013-03-12	\N	YD 9163	K-100	\N	\N	0	\N	\N	\N
1061	5598	83M0314697	\N	5598	\N	1998	\N	\N	2013-03-12	\N	TG 7779	B-4	\N	\N	0	\N	\N	\N
1074	TFR10HDL6221	2982659	\N	TFR10HDL6221	\N	1992	\N	\N	2013-03-12	\N	FT 5148	K-2	\N	\N	0	\N	\N	\N
1092	8GGTFRC164A135008	C22NE25094248	\N	8GGTFRC164A135008	\N	2004	\N	\N	2013-03-12	\N	XG 7848	K-1	\N	\N	0	\N	\N	\N
1113	8362	83M0316171	\N	8362	\N	1998	\N	\N	2013-03-13	\N	TD 5451	B-1	\N	\N	0	\N	\N	\N
1062	VSC45CK00013153	83M0716042	\N	VSC45CK00013153	\N	2007	\N	\N	2013-03-12	\N	NW 6199	B-5	\N	\N	0	\N	\N	\N
1084	54945784	CH-4500016209	\N	54945784	\N	1973	\N	\N	2013-03-12	\N	XW 2674	B-2	\N	\N	0	\N	\N	\N
1075	VF64X4JP30000078	5600564804	\N	VF64X4JP30000078	\N	1994	\N	\N	2013-03-12	\N	NP 8320	B-2	\N	\N	0	\N	\N	\N
1102	\N	3041	\N	\N	\N	1958	\N	\N	2013-03-12	\N	BJ 6216	\N	\N	\N	0	\N	\N	\N
1063	VF643ACA000008008	83M0613728	\N	VF643ACA000008008	\N	2005	\N	\N	2013-03-12	\N	YH 1685	B-6	\N	\N	0	\N	\N	\N
1097	SKFDLR3CGDT104690	LT7416582	\N	SKFDLR3CGDT104690	\N	1983	\N	\N	2013-03-12	\N	\N	M-2	\N	\N	0	\N	\N	\N
1093	VF643ACA000007335	83M0542549	\N	VF643ACA000007335	\N	2002	\N	\N	2013-03-12	\N	VU 6972	B-1	\N	\N	0	\N	\N	\N
1076	VF643ACA00007932	83M0609302	\N	VF643ACA00007932	\N	2004	\N	\N	2013-03-12	\N	YB 1188	BX-1	\N	\N	0	\N	\N	\N
1064	ZCFC50A2105772567	890330	\N	ZCFC50A2105772567	\N	2009	\N	\N	2013-03-12	\N	BZDZ 97	R-6	\N	\N	0	\N	\N	\N
1085	9BM695014-VB134049	377964-10-366954	\N	9BM695014-VB13404	\N	1998	\N	\N	2013-03-12	\N	RY 1672	Z-1	\N	\N	0	\N	\N	\N
1065	ZCFA1MM1402577811	815001	\N	ZCFA1MM1402577811	\N	2011	\N	\N	2013-03-12	\N	DSFK 64	M-6	\N	\N	0	\N	\N	\N
1106	VF6JE13AC0007228	83M0223216	\N	VF6JE13AC0007228	\N	1996	\N	\N	2013-03-13	\N	RR 9749	B-1	\N	\N	0	\N	\N	\N
1077	8AC9046637A959938	61198170059122	\N	8AC9046637A959938	\N	2008	\N	\N	2013-03-12	\N	BCCT 53	R-1	\N	\N	0	\N	\N	\N
1066	VF6J500A000009133	60212D	\N	VF6J500A000009133	\N	1990	\N	\N	2013-03-12	\N	FCFG 51	B-7	\N	\N	0	\N	\N	\N
1086	KMJFD37BPXU405268	D4BBW595952	\N	KMJFD37BPXU405268	\N	1998	\N	\N	2013-03-12	\N	SX 1793	J-2	\N	\N	0	\N	\N	\N
1121	11449	23061	\N	11449	\N	1982	\N	\N	2013-03-13	\N	HG 7002	BF-1	\N	\N	0	\N	\N	\N
1078	KMJWA37JABU370040	D4CBB839616	\N	KMJWA37JABU370040	\N	2011	\N	\N	2013-03-12	\N	DHHX 25	J-1	\N	\N	0	\N	\N	\N
1067	VF64ACA0000002475	83M0572833	\N	VF64ACA0000002475	\N	2003	\N	\N	2013-03-12	\N	XE 8459	BX-1	\N	\N	0	\N	\N	\N
1094	VF643ACA000007321	83MO54540759	\N	VF643ACA000007321	\N	2002	\N	\N	2013-03-12	\N	VU 6969	R-1	\N	\N	0	\N	\N	\N
1098	35805114257833	35390910422540	\N	35805114257833	\N	1977	\N	\N	2013-03-12	\N	ZR 3308	B-3	\N	\N	0	\N	\N	\N
1079	KFT1094	\N	\N	KFT1094	\N	1981	\N	\N	2013-03-12	\N	CCVY 60	B-1	\N	\N	0	\N	\N	\N
1068	VF644ALM000000817	10797962	\N	VF644ALM000000817	\N	2009	\N	\N	2013-03-12	\N	CHDK 39	B-14	\N	\N	0	\N	\N	\N
1087	5594	83M0313865	\N	5594	\N	1998	\N	\N	2013-03-12	\N	TD 5772	BX-1	\N	\N	0	\N	\N	\N
1103	VF644BLM000000725	10811492	\N	VF644BLM000000725	\N	2009	\N	\N	2013-03-13	\N	CJKV 70	BF-1	\N	\N	0	\N	\N	\N
1069	LA7CN65994	332871402	\N	LA7CN65994	\N	1973	\N	\N	2013-03-12	\N	NJ 2731	B-11	\N	\N	0	\N	\N	\N
1110	LGWEF3A5X9B082781	SGG1502	\N	LGWEF3A5X9B082781	\N	2009	\N	\N	2013-03-13	\N	BWRH 59	K-1	\N	\N	0	\N	\N	\N
1080	VF6JE13AC00009341	83M0449000	\N	VF6JE13AC00009341	\N	2000	\N	\N	2013-03-12	\N	UZ 2257	B-1	\N	\N	0	\N	\N	\N
1088	146	\N	\N	146	\N	1992	\N	\N	2013-03-12	\N	\N	B-1	\N	\N	0	\N	\N	\N
1070	14287	2261	\N	14287	\N	1983	\N	\N	2013-03-12	\N	FCFG 60	B-21	\N	\N	0	\N	\N	\N
1095	VF644BLM00000722	10811465	\N	VF644BLM00000722	\N	2009	\N	\N	2013-03-12	\N	CJKB 68	BX-1	\N	\N	0	\N	\N	\N
1081	1GCEG25Z9SF198601	CSF198601	\N	1GCEG25Z9SF198601	\N	1995	\N	\N	2013-03-12	\N	NH 4225	R-1	\N	\N	0	\N	\N	\N
1071	ABH0313	52010042	\N	ABH0313	\N	1971	\N	\N	2013-03-12	\N	ER 9805	B-32	\N	\N	0	\N	\N	\N
1099	16625	\N	\N	16625	\N	1985	\N	\N	2013-03-12	\N	BJ 6216	BX-3	\N	\N	0	\N	\N	\N
1089	SB080685	10302580	\N	SB080685	\N	1996	\N	\N	2013-03-12	\N	NY 9525	Z-1	\N	\N	0	\N	\N	\N
1107	ZCFC50A2105791713	988981	\N	ZCFC50A2105791713	\N	2009	\N	\N	2013-03-13	\N	CHRD 59	R-1	\N	\N	0	\N	\N	\N
1096	VF6JE13AC00009248	83M0440851	\N	VF6JE13AC00009248	\N	2000	\N	\N	2013-03-12	\N	UZ 2263	B-2	\N	\N	0	\N	\N	\N
1104	8GGTFRC192A115400	C22NE25062766	\N	8GGTFRC192A115400	\N	2002	\N	\N	2013-03-13	\N	VE 8798	K-1	\N	\N	0	\N	\N	\N
1082	JAATFS25HW7100361	595975	\N	JAATFS25HW7100361	\N	1998	\N	\N	2013-03-12	\N	SN 8229	K-1	\N	\N	0	\N	\N	\N
1120	VF645ACA000002514	83M0574167	\N	VF645ACA000002514	\N	2003	\N	\N	2013-03-13	\N	XE 8456	B-1	\N	\N	0	\N	\N	\N
1118	VFG45ACA000002507	83M0574125	\N	VFG45ACA000002507	\N	2003	\N	\N	2013-03-13	\N	XE 8471	B-2	\N	\N	0	\N	\N	\N
1114	VF644BLM00000714	10806855	\N	VF644BLM00000714	\N	2009	\N	\N	2013-03-13	\N	CJKV 81	B-2	\N	\N	0	\N	\N	\N
1090	663249	D4BH5091137	\N	663249	\N	2006	\N	\N	2013-03-12	\N	YS 6752	K-1	\N	\N	0	\N	\N	\N
1100	0A000007634	5600406216	\N	0A000007634	\N	1989	\N	\N	2013-03-12	\N	DD 1877	B-4	\N	\N	0	\N	\N	\N
1111	VF64X4JP100000475	475	\N	VF64X4JP100000475	\N	1993	\N	\N	2013-03-13	\N	LC 8436	BX-2	\N	\N	0	\N	\N	\N
1108	91404175-B	09126863-A	\N	91404175-B	\N	1973	\N	\N	2013-03-13	\N	CG 3175	BX-1	\N	\N	0	\N	\N	\N
1116	VF644BLM000000713	1805132	\N	VF644BLM000000713	\N	2009	\N	\N	2013-03-13	\N	CJKV 82	BX-1	\N	\N	0	\N	\N	\N
1105	95014-VB-133752	377964-10-367187	\N	95014-VB-133752	\N	1998	\N	\N	2013-03-13	\N	RY 1673	Z-1	\N	\N	0	\N	\N	\N
1112	1GCF625M3X1138259	\N	\N	1GCF625M3X1138259	\N	1999	\N	\N	2013-03-13	\N	TT 8880	R-1	\N	\N	0	\N	\N	\N
1109	8GGTFR6FHTA024974	464638	\N	8GGTFR6FHTA024974	\N	1996	\N	\N	2013-03-13	\N	PF 9971	RX-1	\N	\N	0	\N	\N	\N
1122	2CFC35701Y5266172	3064799	\N	2CFC35701Y5266172	\N	2002	\N	\N	2013-03-13	\N	VA 3297	R-1	\N	\N	0	\N	\N	\N
1119	\N	83M0280133	\N	\N	\N	1997	\N	\N	2013-03-13	\N	SP 7335	B-1	\N	\N	0	\N	\N	\N
1117	LTA1222B7B2008078	840576	\N	LTA1222B7B2008078	\N	2011	\N	\N	2013-03-13	\N	DFDJ 79	J-2	\N	\N	0	\N	\N	\N
1115	DS151RG3223	YD258U5011	\N	DS151RG3223	\N	1988	\N	\N	2013-03-13	\N	XZ 7030	R-2	\N	\N	0	\N	\N	\N
1123	9BM695014VB130924	377964-10-363610	\N	9BM695014VB130924	\N	1997	\N	\N	2013-03-13	\N	RY 1677	Z-1	\N	\N	0	\N	\N	\N
1124	8GGTFSD534A137047	6VD1208250	\N	8GGTFSD534A137047	\N	2004	\N	\N	2013-03-13	\N	XX 9685	J-1	\N	\N	0	\N	\N	\N
1125	20991	560.053.2099	\N	20991	\N	1991	\N	\N	2013-03-13	\N	KB 4315	B-1	\N	\N	0	\N	\N	\N
1126	3UTL720M-001683	M8Z-3G0248	\N	3UTL720M-001683	\N	1994	\N	\N	2013-03-13	\N	KZ 1389	J-1	\N	\N	0	\N	\N	\N
1127	VF644BLM00000699	10797372	\N	VF644BLM00000699	\N	2009	\N	\N	2013-03-13	\N	CGJD 22	BX-1	\N	\N	0	\N	\N	\N
1128	FG337C-460040	4D33AZF4398	\N	FG337C-460040	\N	1995	\N	\N	2013-03-13	\N	DSWC 13	R-1	\N	\N	0	\N	\N	\N
1129	9BM384045RB030414	366-376-907-10-243052	\N	9BM384045RB030414	\N	1995	\N	\N	2013-03-13	\N	\N	Z-1	\N	\N	0	\N	\N	\N
1130	VF644BLM000000723	10811471	\N	VF644BLM000000723	\N	2010	\N	\N	2013-03-13	\N	CJKV 87	CF-1	\N	\N	0	\N	\N	\N
1131	CBLCB-1	\N	\N	CBLCB-1	\N	1988	\N	\N	2013-03-13	\N	UN 1665	B-1	\N	\N	0	\N	\N	\N
1132	RS133RF1271	\N	\N	RS133RF1271	\N	1988	\N	\N	2013-03-13	\N	SK  9305	CR-1	\N	\N	0	\N	\N	\N
1178	VF645ACA000002539	83M0574792	\N	VF645ACA000002539	\N	2003	\N	\N	2013-03-14	\N	XE 8476	B-1	\N	\N	0	\N	\N	\N
1133	9BWN172S78R816145	G1T104635	\N	9BWN172S78R816145	\N	2008	\N	\N	2013-03-13	\N	BDXG 30	Z-1	\N	\N	0	\N	\N	\N
1144	1017	83M0219851	\N	1017	\N	1995	\N	\N	2013-03-13	\N	SL 2884	B-1	\N	\N	0	\N	\N	\N
1156	JALFVR32M77000004	6HE1408015	\N	JALFVR32M77000004	\N	2007	\N	\N	2013-03-13	\N	WT 7707	Z-6	\N	\N	0	\N	\N	\N
1134	3N6CD13Y4-2K950194	KA24237917A	\N	3N6CD13Y4-2K95019	\N	2005	\N	\N	2013-03-13	\N	YL 8743	K-1	\N	\N	0	\N	\N	\N
1182	MPATF586HCT100050	BD4692	\N	MPATF586HCT100050	\N	2011	\N	\N	2013-03-14	\N	DJVH 53	RX-1	\N	\N	0	\N	\N	\N
1165	3N6CD1359ZK014137	KA24E2389	\N	3N6CD1359ZK014137	\N	2000	\N	\N	2013-03-14	\N	TS 8157	J-2	\N	\N	0	\N	\N	\N
1145	VF647BCA000000296	83M0546100	\N	VF647BCA000000296	\N	2002	\N	\N	2013-03-13	\N	XA 2765	R-1	\N	\N	0	\N	\N	\N
1135	8GGTFSK968A169910	623655	\N	8GGTFSK968A169910	\N	2008	\N	\N	2013-03-13	\N	BKRD 27	K-100	\N	\N	0	\N	\N	\N
1172	TFR16HDLEB1517	236026	\N	TFR16HDLEB1517	\N	1993	\N	\N	2013-03-14	\N	CH 5594	K-1	\N	\N	0	\N	\N	\N
1157	JN1CPUD22Z0151146	YD25280882A	\N	JN1CPUD22Z0151146	\N	2010	\N	\N	2013-03-13	\N	CLXH 89	K-1	\N	\N	0	\N	\N	\N
1146	VF644BLM000000718	10809831	\N	VF644BLM000000718	\N	2009	\N	\N	2013-03-13	\N	CJKV 78	B-2	\N	\N	0	\N	\N	\N
1166	VF6JP1A1200018495	\N	\N	VF6JP1A1200018495	\N	1987	\N	\N	2013-03-14	\N	GY 7541	1-2	\N	\N	0	\N	\N	\N
1147	\N	MIT247473	\N	\N	\N	2007	\N	\N	2013-03-13	\N	WH 4700	H-2	\N	\N	0	\N	\N	\N
1158	\N	848	\N	\N	\N	1975	\N	\N	2013-03-13	\N	BJ 7442	B-6	\N	\N	0	\N	\N	\N
1136	KFT0814	04685-J-9	\N	KFT0814	\N	1981	\N	\N	2013-03-13	2013-03-13	RF 3537	B-5	\N	\N	0	\N	\N	\N
1148	CBLAM-2	\N	\N	CBLAM-2	\N	1979	\N	\N	2013-03-13	\N	CLDJ 29	M-2	\N	\N	0	\N	\N	\N
1137	JNICPGD2270005419	YD25203709A	\N	JNICPGD2270005419	\N	2006	\N	\N	2013-03-13	\N	WE 7215	J-5	\N	\N	0	\N	\N	\N
1179	ZCFC50A2105791983	995774	\N	ZCFC50A2105791983	\N	2009	\N	\N	2013-03-14	\N	CHRD 61	R-1	\N	\N	0	\N	\N	\N
1186	002608	344178	\N	002608	\N	1983	\N	\N	2013-03-14	\N	BJ 7669	CF-4	\N	\N	0	\N	\N	\N
1159	9BM3840245B079700	37694510300258	\N	9BM3840245B079700	\N	1996	\N	\N	2013-03-13	\N	PB 8158	Z-2	\N	\N	0	\N	\N	\N
1138	VF6JP100000145	5600532114	\N	VF6JP100000145	\N	1993	\N	\N	2013-03-13	\N	LR 2581	B-2	\N	\N	0	\N	\N	\N
1149	LJWPBDCIC6000875	B4022804	\N	LJWPBDCIC6000875	\N	2011	\N	\N	2013-03-13	\N	DHVG 26	HX-2	\N	\N	0	\N	\N	\N
1173	VF6FN60A000004982	98482909	\N	VF6FN60A000004982	\N	1995	\N	\N	2013-03-14	\N	VD 6892	R-1	\N	\N	0	\N	\N	\N
1167	VF6JE13AC00009281	83M0443355	\N	VF6JE13AC00009281	\N	2000	\N	\N	2013-03-14	\N	UZ 2262	1-1	\N	\N	0	\N	\N	\N
1139	VF645ACA000002515	83M0574325	\N	VF645ACA000002515	\N	2003	\N	\N	2013-03-13	\N	XE 8473	R-2	\N	\N	0	\N	\N	\N
1150	VF645ACA000002499	83M0573716	\N	VF645ACA000002499	\N	2003	\N	\N	2013-03-13	\N	XE 8474	B-3	\N	\N	0	\N	\N	\N
1160	VF644BLM000000754	10811495	\N	VF644BLM000000754	\N	2009	\N	\N	2013-03-14	\N	CJKV 72 	CF-1	\N	\N	0	\N	\N	\N
1140	SS133R3D144	ZA50146U51824N	\N	SS133R3D144	\N	1986	\N	\N	2013-03-13	\N	TV 1710	R-1	\N	\N	0	\N	\N	\N
1188	\N	3E24-70692	\N	\N	\N	1972	\N	\N	2013-03-15	\N	GE 3141	B-31	\N	\N	0	\N	\N	\N
1183	VF644BLM000000729	10811830	\N	VF644BLM000000729	\N	2009	\N	\N	2013-03-14	\N	CJKV 71	B-2	\N	\N	0	\N	\N	\N
1174	\N	G4CSR310704	\N	\N	\N	1994	\N	\N	2013-03-14	\N	CH 5602	T-2	\N	\N	0	\N	\N	\N
1151	9BM38840245B078827	37694510300404	\N	9BM38840245B07882	\N	1996	\N	\N	2013-03-13	\N	PU 1142	Z-3	\N	\N	0	\N	\N	\N
1141	VF644BLM000000716	10809664	\N	VF644BLM000000716	\N	2009	\N	\N	2013-03-13	\N	CJKV 84	B-4	\N	\N	0	\N	\N	\N
1168	MA1TZ4BJLA2F47967	BJ4AF60200	\N	MA1TZ4BJLA2F47967	\N	2010	\N	\N	2013-03-14	\N	CWTB 38	TR-1	\N	\N	0	\N	\N	\N
1161	SS237R3D823	6CTA8321104152	\N	SS237R3D823	\N	1996	\N	\N	2013-03-14	\N	BDXJ 37	BH-2	\N	\N	0	\N	\N	\N
1142	9BM384024SB080498	376945-10-301450	\N	9BM384024SB080498	\N	1996	\N	\N	2013-03-13	\N	PA 3219	Z-0	\N	\N	0	\N	\N	\N
1152	KFT1095	833775-1482	\N	KFT1095	\N	1981	\N	\N	2013-03-13	\N	CG 9287	B-4	\N	\N	0	\N	\N	\N
1180	9BM695014VB133620	377964-10-367023	\N	9BM695014VB133620	\N	1998	\N	\N	2013-03-14	\N	RY 1676	Z-1	\N	\N	0	\N	\N	\N
1143	KFT0656	4366	\N	KFT0656	\N	1979	\N	\N	2013-03-13	\N	BJ 7663	B-3	\N	\N	0	\N	\N	\N
1175	\N	83M0446617	\N	\N	\N	2000	\N	\N	2013-03-14	\N	UZ 2260	B-11	\N	\N	0	\N	\N	\N
1162	SS237R3D818	6CTA8321102410	\N	SS237R3D818	\N	1996	\N	\N	2013-03-14	\N	BDXJ 35	CR-1	\N	\N	0	\N	\N	\N
1153	9BM695014VB133748	37796410367182	\N	9BM695014VB133748	\N	1998	\N	\N	2013-03-13	\N	RY 1671	Z-4	\N	\N	0	\N	\N	\N
218	CL02724	\N	\N	\N	\N	1981	\N	\N	2013-01-31	2013-03-13	CYPX 72	MX-0	\N	\N	0	\N	\N	\N
1169	9BM3840RB030256	3660111101SS	\N	9BM3840RB030256	\N	1995	\N	\N	2013-03-14	\N	DZBY 17	Z-1	\N	\N	0	\N	\N	\N
1154	KFT1640	2004	\N	KFT1640	\N	1985	\N	\N	2013-03-13	\N	BJ 8475	B-5	\N	\N	0	\N	\N	\N
1163	SS135R3D565	XE50123U5453JIT	\N	SS135R3D565	\N	1996	\N	\N	2013-03-14	\N	BDXJ 36	CR-2	\N	\N	0	\N	\N	\N
1193	3801818114775670	353972-10-620523	\N	3801818114775670	\N	1981	\N	\N	2013-03-15	\N	HA 7829	B-21	\N	\N	0	\N	\N	\N
1191	7259	83M0225678	\N	7259	\N	1996	\N	\N	2013-03-15	\N	SL 3316	BX-1	\N	\N	0	\N	\N	\N
1155	18473	5600457337	\N	18473	\N	1987	\N	\N	2013-03-13	\N	CZ 1768	BX-6	\N	\N	0	\N	\N	\N
1170	VF644BLM000000715	10809700	\N	VF644BLM000000715	\N	2009	\N	\N	2013-03-14	\N	CJKV 67	B-1	\N	\N	0	\N	\N	\N
1164	3NGCD1352K014175	KA248596650M	\N	3NGCD1352K014175	\N	2000	\N	\N	2013-03-14	\N	TS 8156	J-1	\N	\N	0	\N	\N	\N
1176	9BM695014VB130443	37796410363125	\N	9BM695014VB130443	\N	1998	\N	\N	2013-03-14	\N	RY 1670	Z-1	\N	\N	0	\N	\N	\N
1181	606203	F0215V16	\N	606203	\N	1966	\N	\N	2013-03-14	\N	NH 4261	BX-1	\N	\N	0	\N	\N	\N
1171	VF645ACA000002531	10809700	\N	VF645ACA000002531	\N	2003	\N	\N	2013-03-14	\N	XE 8475	B-2	\N	\N	0	\N	\N	\N
236	VF622AXA000100784	83M0406984	\N	VF622AXA000100784	\N	2001	\N	\N	2013-01-31	2013-03-15	UY 2082	H-18	\N	\N	0	\N	\N	\N
1177	CA02E1CX300138	\N	\N	CA02E1CX300138	\N	1983	\N	\N	2013-03-14	\N	\N	B-2	\N	\N	0	\N	\N	\N
1184	LA-7-CNG-20743	334-74-699	\N	LA-7-CNG-20743	\N	1973	\N	\N	2013-03-14	\N	CG 3174	BX-2	\N	\N	0	\N	\N	\N
1189	833775	M1A06020301	\N	833775	\N	1985	\N	\N	2013-03-15	\N	DZHR 97	B-32	\N	\N	0	\N	\N	\N
1196	KMJFD37GP2K528562	64CS2889713	\N	KMJFD37GP2K528562	\N	2002	\N	\N	2013-03-15	\N	VG 4481	J-31	\N	\N	0	\N	\N	\N
1187	4S7CT2B94BC073917	73186480	\N	4S7CT2B94BC073917	\N	2011	\N	\N	2013-03-15	2013-03-15	DSLG 88	B-18	\N	\N	0	\N	\N	\N
1185	\N	025-D	\N	\N	\N	1950	\N	\N	2013-03-14	\N	NH 4260	GALLITO	\N	\N	0	\N	\N	\N
1195	8GGTFSF462A116372	829155	\N	8GGTFSF462A116372	\N	2002	\N	\N	2013-03-15	\N	VF 7608	J-21	\N	\N	0	\N	\N	\N
1194	\N	437T115947	\N	\N	\N	1969	\N	\N	2013-03-15	\N	GE 3140	RELIQUIA	\N	\N	0	\N	\N	\N
1192	VF645ACA000002471	83M0572600	\N	VF645ACA000002471	\N	2003	\N	\N	2013-03-15	\N	XE 8458	B-1	\N	\N	0	\N	\N	\N
1190	KMFZAD7HP84414820	D4B48020161	\N	KMFZAD7HP84414820	\N	2008	\N	\N	2013-03-15	\N	BRHZ 58	R-31	\N	\N	0	\N	\N	\N
1197	KMJWA37KACU495067	D4BC067334	\N	KMJWA37KACU495067	\N	2013	\N	\N	2013-03-15	\N	FDBG 22	K-1	\N	\N	0	\N	\N	\N
1198	VF644AGE000010447	11182582	\N	VF644AGE000010447	\N	2012	\N	\N	2013-03-15	\N	DYLY 69	R-31	\N	\N	0	\N	\N	\N
1200	\N	348717	\N	\N	\N	1981	\N	\N	2013-03-15	\N	CX 7405	J-4	\N	\N	0	\N	\N	\N
1199	VF6JE13AC00009323	83M0446835	\N	VF6JE13AC00009323	\N	2000	\N	\N	2013-03-15	\N	UZ 2264	UB-4	\N	\N	0	\N	\N	\N
1201	SS133R3D/141	ZA50146U514200L	\N	SS133R3D/141	\N	1988	\N	\N	2013-03-15	\N	UN 1525	B-1	\N	\N	0	\N	\N	\N
1202	VF644BLM000000719	10810915	\N	VF644BLM000000719	\N	2009	\N	\N	2013-03-15	\N	CJKV 77	CF-1	\N	\N	0	\N	\N	\N
1203	VF644BLM000000671	10789103	\N	VF644BLM000000671	\N	2009	\N	\N	2013-03-15	\N	CGJD 34	B-2	\N	\N	0	\N	\N	\N
1204	SS133RF3349	V8640514758M	\N	SS133RF3349	\N	1986	\N	\N	2013-03-15	\N	TY 2539	UCR-2	\N	\N	0	\N	\N	\N
1205	VF644BLM000000673	10789273	\N	VF644BLM000000673	\N	2009	\N	\N	2013-03-15	\N	CGJD 35	UB-3	\N	\N	0	\N	\N	\N
1236	VF6FN60A000004981	32238282468777	\N	VF6FN60A000004981	\N	1995	\N	\N	2013-03-19	\N	RH 7721 	R-1	\N	\N	0	\N	\N	\N
1230	3N6CD13S7ZK850408	KA24211912A	\N	3N6CD13S7ZK850408	\N	2005	\N	\N	2013-03-19	\N	XZ 7360	U-CJ1	\N	\N	0	\N	\N	\N
1206	9BM384024SB081026	376945-10-302000	\N	9BM384024SB081026	\N	1996	\N	\N	2013-03-15	\N	NY  3994	UZ-3	\N	\N	0	\N	\N	\N
1219	9BM384024SB080848	376945-10-302345	\N	9BM384024SB080848	\N	1996	\N	\N	2013-03-15	\N	NY 3863	U-33	\N	\N	0	\N	\N	\N
1243	KFT0440	5162	\N	KFT0440	\N	1981	\N	\N	2013-03-19	\N	\N	BX-4	\N	\N	0	\N	\N	\N
1207	4900013329	\N	\N	4900013329	\N	1974	\N	\N	2013-03-15	\N	UW 6957	UM-3	\N	\N	0	\N	\N	\N
1265	VF644ALM000000803	10792864	\N	VF644ALM000000803	\N	2009	\N	\N	2013-03-19	\N	CHRD 67	U-51	\N	\N	0	\N	\N	\N
1237	VF6JS00A000004592	\N	\N	VF6JS00A000004592	\N	1987	\N	\N	2013-03-19	\N	LS 3577	RX-1	\N	\N	0	\N	\N	\N
1220	VF647BCA000003043	83M0715179	\N	VF647BCA000003043	\N	2007	\N	\N	2013-03-15	\N	UW 3087	U-41	\N	\N	0	\N	\N	\N
1208	W24BE7S138584	3330941	\N	W24BE7S138584	\N	1980	\N	\N	2013-03-15	\N	UW 6958	UK-3	\N	\N	0	\N	\N	\N
1231	VF6JE13AC00009235	83M0439880	\N	VF6JE13AC00009235	\N	2000	\N	\N	2013-03-19	\N	UZ 2265	B-1	\N	\N	0	\N	\N	\N
1257	VF644ALM000000780	10785466	\N	VF644ALM000000780	\N	2009	\N	\N	2013-03-19	\N	CGHS 23	U-11	\N	\N	0	\N	\N	\N
1209	7183526	JT544932	\N	7183526	\N	2005	\N	\N	2013-03-15	\N	YL 8771	T-1	\N	\N	0	\N	\N	\N
1253	VF6JE13AC00009269	83M0442124	\N	VF6JE13AC00009269	\N	2000	\N	\N	2013-03-19	\N	UP 8915	B-1	\N	\N	0	\N	\N	\N
1221	781014315	16149	\N	781014315	\N	1981	\N	\N	2013-03-15	\N	WZ 3018	U-42	\N	\N	0	\N	\N	\N
1244	VF64X4JP600001119	83M0237722	\N	VF64X4JP600001119	\N	1996	\N	\N	2013-03-19	\N	SL 3322 	B-4	\N	\N	0	\N	\N	\N
1210	INICPUD22Z0152858	YD25289428A	\N	INICPUD22Z0152858	\N	2011	\N	\N	2013-03-15	\N	CWSZ 70	CJ-1	\N	\N	0	\N	\N	\N
1232	9BM695014VB130436	377964-10-363116	\N	9BM695014VB130436	\N	1998	\N	\N	2013-03-19	\N	RY 1678	Z-1	\N	\N	0	\N	\N	\N
1238	VF644ALM000000792	10789267	\N	VF644ALM000000792	\N	2009	\N	\N	2013-03-19	\N	CGJD 28 	B-2	\N	\N	0	\N	\N	\N
1222	380948	81 S 38165	\N	380948	\N	1976	\N	\N	2013-03-15	\N	LL 2201	U-43	\N	\N	0	\N	\N	\N
1211	VF643ACA000007943	83M0609675	\N	VF643ACA000007943	\N	2004	\N	\N	2013-03-15	\N	YA 9995	U-11	\N	\N	0	\N	\N	\N
1249	9BM384045RB030411	376907102432169	\N	9BM384045RB030411	\N	1995	\N	\N	2013-03-19	\N	XZ 7044	Z-1	\N	\N	0	\N	\N	\N
1223	\N	MBM157275-D	\N	\N	\N	1980	\N	\N	2013-03-15	\N	CG 8127	U-13	\N	\N	0	\N	\N	\N
1212	VF644ALM000000801	10791768	\N	VF644ALM000000801	\N	2010	\N	\N	2013-03-15	\N	CHRD 66	U-12	\N	\N	0	\N	\N	\N
1233	8AC9046637A959916	61198170058959	\N	8AC9046637A959916	\N	2008	\N	\N	2013-03-19	\N	BBVV 45	R-1	\N	\N	0	\N	\N	\N
1262	WJMD1NBSM04103470	7780103	\N	WJMD1NBSM04103470	\N	1990	\N	\N	2013-03-19	\N	ZV 3342	U-32	\N	\N	0	\N	\N	\N
1213	VF6FN40A000031490	524366	\N	VF6FN40A000031490	\N	1990	\N	\N	2013-03-15	\N	DR 9556	CR-1	\N	\N	0	\N	\N	\N
1224	KFT0194	4555	\N	KFT0194	\N	1975	\N	\N	2013-03-19	\N	FX 6040	U-12	\N	\N	0	\N	\N	\N
1239	8AC9046636A934298	61198170035222	\N	8AC9046636A934298	\N	2006	\N	\N	2013-03-19	\N	ZS 7658 	R-2	\N	\N	0	\N	\N	\N
1214	VF6JS00A000009557	5600532534	\N	VF6JS00A000009557	\N	1992	\N	\N	2013-03-15	\N	CH 4607	U-21	\N	\N	0	\N	\N	\N
1234	MPATFS86HCT100063	BD4717	\N	MPATFS86HCT100063	\N	2011	\N	\N	2013-03-19	\N	DJTG 52	K-1	\N	\N	0	\N	\N	\N
1225	16921	10969	\N	16921	\N	1985	\N	\N	2013-03-19	\N	GY 7542	U-13	\N	\N	0	\N	\N	\N
1245	9BM384024SB082147	37694510303099	\N	9BM384024SB082147	\N	1996	\N	\N	2013-03-19	\N	PL 1484 	Z-2	\N	\N	0	\N	\N	\N
1215	VF647BCA000003032	83M0714933	\N	VF647BCA000003032	\N	2006	\N	\N	2013-03-15	\N	WY 8509	U-22	\N	\N	0	\N	\N	\N
1254	\N	22395	\N	\N	\N	1993	\N	\N	2013-03-19	\N	SV 4134	BX-1	\N	\N	0	\N	\N	\N
1240	0000018	44636590799311	\N	0000018	\N	1980	\N	\N	2013-03-19	\N	VS 4071 	M-2	\N	\N	0	\N	\N	\N
1216	LR312J-2556436	8DC8	\N	LR312J-2556436	\N	1988	\N	\N	2013-03-15	\N	\N	U-23	\N	\N	0	\N	\N	\N
1226	1FTJW35H9TEB27615	27615	\N	1FTJW35H9TEB27615	\N	1996	\N	\N	2013-03-19	\N	PC 9738	U-11	\N	\N	0	\N	\N	\N
795	VPE100328	01741FB	\N	VPE100328	\N	1984	\N	\N	2013-02-25	2013-03-19	RF 3547	Q-4	\N	\N	0	\N	\N	\N
1217	VF647BCA000002536	83M0698154	\N	VF647BCA000002536	\N	2006	\N	\N	2013-03-15	\N	WH 8709	U-31	\N	\N	0	\N	\N	\N
1250	9BM384024SB082154	376945-10-303095	\N	9BM384024SB082154	\N	1996	\N	\N	2013-03-19	\N	NN 3815	Z-1	\N	\N	0	\N	\N	\N
1227	VF645ACA000002540	83M0574799	\N	VF645ACA000002540	\N	2003	\N	\N	2013-03-19	\N	XE 8477	U-22	\N	\N	0	\N	\N	\N
1260	VF640AEB000000925	83M0362331	\N	VF640AEB000000925	\N	1999	\N	\N	2013-03-19	\N	TV 3728	CR-2	\N	\N	0	\N	\N	\N
1218	VF6JP1A1200020815	MIDSO60212B-010245FK	\N	VF6JP1A1200020815	\N	1989	\N	\N	2013-03-15	\N	DA 5605	U-32	\N	\N	0	\N	\N	\N
1246	KMJFD27FP3K562625	D4BF3793764	\N	KMJFD27FP3K562625	\N	2005	\N	\N	2013-03-19	\N	YD 8054 	K-1	\N	\N	0	\N	\N	\N
1235	VF6JE13AC00009340	83M0448530	\N	VF6JE13AC00009340	\N	2000	\N	\N	2013-03-19	\N	UZ 2258 	B-1	\N	\N	0	\N	\N	\N
1228	3D7LT2EL3AG172030	57949573	\N	3D7LT2EL3AG172030	\N	2011	\N	\N	2013-03-19	\N	CPPW 22	U-21	\N	\N	0	\N	\N	\N
1258	300000687	83M0169943	\N	300000687	\N	1994	\N	\N	2013-03-19	\N	SL 3920	U-12	\N	\N	0	\N	\N	\N
1251	VF6JE13AC00008476	83M0341748	\N	VF6JE13AC00008476	\N	1998	\N	\N	2013-03-19	\N	TV 4427	B-2	\N	\N	0	\N	\N	\N
1229	9BM384024SB082146	376945-10-303101	\N	9BM384024SB082146	\N	1996	\N	\N	2013-03-19	\N	PA 7946	U-23	\N	\N	0	\N	\N	\N
1241	VF644ALM000000809	10795946	\N	VF644ALM000000809	\N	2009	\N	\N	2013-03-19	\N	CGJD 43 	B-3	\N	\N	0	\N	\N	\N
1247	MHYDN71V87J100062	G16AID111032	\N	MHYDN71V87J100062	\N	2006	\N	\N	2013-03-19	\N	ZV 4015 	K-2	\N	\N	0	\N	\N	\N
1255	8889	2418	\N	8889	\N	1997	\N	\N	2013-03-19	\N	SL 3919	R-1	\N	\N	0	\N	\N	\N
1242	9635	83M0142823	\N	9635	\N	1993	\N	\N	2013-03-19	\N	LL 2184 	H-3	\N	\N	0	\N	\N	\N
1267	VF640ACD000004943	83M0280532	\N	VF640ACD000004943	\N	1997	\N	\N	2013-03-19	\N	SP 7337	U-61	\N	\N	0	\N	\N	\N
1264	VF644BLM000000717	10809832	\N	VF644BLM000000717	\N	2009	\N	\N	2013-03-19	\N	CJKV 66	U-42	\N	\N	0	\N	\N	\N
1252	VF645ACA000002555 	83M0575330	\N	VF645ACA000002555	\N	2003	\N	\N	2013-03-19	\N	XE 8451	RB-1	\N	\N	0	\N	\N	\N
1248	VF645AQK502547	83M0574957	\N	VF645AQK502547	\N	2003	\N	\N	2013-03-19	\N	XE 8436	B-1	\N	\N	0	\N	\N	\N
1261	VF643ACA000007960	83M0611035	\N	VF643ACA000007960	\N	2004	\N	\N	2013-03-19	\N	YD 1810	U-31	\N	\N	0	\N	\N	\N
1259	VF644ALM000000791	10789255	\N	VF644ALM000000791	\N	2009	\N	\N	2013-03-19	\N	CGHS 22	U-21	\N	\N	0	\N	\N	\N
1256	KMJWWH7H950668365	D4BH5102648	\N	KMJWWH7H950668365	\N	2005	\N	\N	2013-03-19	\N	YV 3938	K-1	\N	\N	0	\N	\N	\N
1266	VF64X4JP600001117	\N	\N	VF64X4JP600001117	\N	1997	\N	\N	2013-03-19	\N	CVHV 24	U-52	\N	\N	0	\N	\N	\N
1263	VF6JE16ACD0001094	83M0239077	\N	VF6JE16ACD0001094	\N	1996	\N	\N	2013-03-19	\N	SL 3327	U-41	\N	\N	0	\N	\N	\N
1268	VF644BLM000000720	10811085	\N	VF644BLM000000720	\N	2009	\N	\N	2013-03-19	\N	CJKV 85	U-62	\N	\N	0	\N	\N	\N
1269	VF644ALM000000804	10794147	\N	VF644ALM000000804	\N	1997	\N	\N	2013-03-19	\N	CHRD 68	U-71	\N	\N	0	\N	\N	\N
1270	VS12217A3M88T0176	9H00171	\N	VS12217A3M88T0176	\N	1992	\N	\N	2013-03-19	\N	MY 4475	U-72	\N	\N	0	\N	\N	\N
1271	ZCFC4970OT5104615	2216283	\N	ZCFC4970OT5104615	\N	1997	\N	\N	2013-03-19	\N	PN 9464	CR-8	\N	\N	0	\N	\N	\N
1272	VF6JS00A000005017	06686DH	\N	VF6JS00A000005017	\N	1987	\N	\N	2013-03-19	\N	GY 7045	U-91	\N	\N	0	\N	\N	\N
1273	5160072010	\N	\N	5160072010	\N	1958	\N	\N	2013-03-19	\N	CX 7395	U-92	\N	\N	0	\N	\N	\N
1274	VF645ACA000007868	83M0678597	\N	VF645ACA000007868	\N	2005	\N	\N	2013-03-19	\N	WG 6505	U-101	\N	\N	0	\N	\N	\N
1275	CA000000595	5600532104	\N	CA000000595	\N	1990	\N	\N	2013-03-19	\N	DR 9555	U-102	\N	\N	0	\N	\N	\N
1276	YB1E6A4A1MB463645	TD61F9356011	\N	YB1E6A4A1MB463645	\N	1991	\N	\N	2013-03-19	\N	RW 7002	U-74	\N	\N	0	\N	\N	\N
1320	VF645ACA000003251	83M0608445	\N	VF645ACA000003251	\N	2004	\N	\N	2013-03-21	\N	YD 1821	U-72	\N	\N	0	\N	\N	\N
1315	VF6JE13AC00008942	83M0387721	\N	VF6JE13AC00008942	\N	2000	\N	\N	2013-03-21	\N	UB 2095	U-52	\N	\N	0	\N	\N	\N
1303	VF645ACA000003255	83M0608621	\N	VF645ACA000003255	\N	2004	\N	\N	2013-03-21	\N	YD 1826	U-12	\N	\N	0	\N	\N	\N
1290	VF6JE15AC00000664	5600564960	\N	VF6JE15AC00000664	\N	1993	\N	\N	2013-03-20	\N	LN 2270	U-161	\N	\N	0	\N	\N	\N
1277	VF622AXA000102144	83M0446022	\N	VF622AXA000102144	\N	2001	\N	\N	2013-03-19	\N	UY 2081	U-112	\N	\N	0	\N	\N	\N
1309	0468	83M0315379	\N	0468	\N	1998	\N	\N	2013-03-21	\N	TE 5082	U-31	\N	\N	0	\N	\N	\N
1278	VF647BCA000003112	83M0446022	\N	VF647BCA000003112	\N	2007	\N	\N	2013-03-20	\N	UW 3085	U-121	\N	\N	0	\N	\N	\N
1291	9MB386015RB030608	5600564960	\N	9MB386015RB030608	\N	1995	\N	\N	2013-03-20	\N	PU 1316	U-163	\N	\N	0	\N	\N	\N
1304	1K9AF4281GN058019	\N	\N	1K9AF4281GN058019	\N	1986	\N	\N	2013-03-21	\N	BSJH 66	U-11	\N	\N	0	\N	\N	\N
1279	VF64XAJP300000709	83M0171896	\N	VF64XAJP300000709	\N	1994	\N	\N	2013-03-20	\N	SL 3922	U-122	\N	\N	0	\N	\N	\N
1327	9BM384024SB082151	376945E13	\N	9BM384024SB082151	\N	1996	\N	\N	2013-03-21	\N	PA 3225	Z-1	\N	\N	0	\N	\N	\N
1294	JMZUN8F127W623768	WLAT766993	\N	JMZUN8F127W623768	\N	2007	\N	\N	2013-03-21	2013-03-21	XW 6194	CJ-1	\N	\N	0	\N	\N	\N
1280	VF64CE4000005253	83M0309966	\N	VF64CE4000005253	\N	1998	\N	\N	2013-03-20	\N	TD 5768	CR-12	\N	\N	0	\N	\N	\N
1324	9BM384024SB079451	37694510300544	\N	9BM384024SB079451	\N	1996	\N	\N	2013-03-21	\N	PD 8498	U-73	\N	\N	0	\N	\N	\N
1316	4701	6369	\N	4701	\N	1987	\N	\N	2013-03-21	\N	GY 7539	U-53	\N	\N	0	\N	\N	\N
1281	VF6JS00A000009541	\N	\N	VF6JS00A000009541	\N	1992	\N	\N	2013-03-20	\N	LN 2081	U-131	\N	\N	0	\N	\N	\N
1305	9533782T6AR012510	36149829	\N	9533782T6AR012510	\N	2010	\N	\N	2013-03-21	\N	CHTK 88	U-13	\N	\N	0	\N	\N	\N
1298	JTB31BUE0V7000136	3B1522055	\N	JTB31BUE0V7000136	\N	1997	\N	\N	2013-03-21	\N	RJ 3268	CRU	\N	\N	0	\N	\N	\N
1292	3ALACYCS1CDBJ9914	90697900885000	\N	3ALACYCS1CDBJ9914	\N	2011	\N	\N	2013-03-20	\N	DSFK 73	U-81	\N	\N	0	\N	\N	\N
1282	VF647BCA000002135	83M0676992	\N	VF647BCA000002135	\N	2005	\N	\N	2013-03-20	\N	WC 2856	U-132	\N	\N	0	\N	\N	\N
1310	4S7CT2D98CC075149	73333440	\N	4S7CT2D98CC075149	\N	2012	\N	\N	2013-03-21	\N	DYRH 67	U-32	\N	\N	0	\N	\N	\N
1293	3ALACYCSXCDBJ9913	90697900884978	\N	3ALACYCSXCDBJ9913	\N	2011	\N	\N	2013-03-20	\N	DSFK 67	U-111	\N	\N	0	\N	\N	\N
1283	9BM38015RB029182	376955-10-241930	\N	9BM38015RB029182	\N	1995	\N	\N	2013-03-20	\N	PU 1318	U-133	\N	\N	0	\N	\N	\N
1321	VF6JE13AC99998936	83M0386888	\N	VF6JE13AC99998936	\N	2000	\N	\N	2013-03-21	\N	UH 8434	U-81	\N	\N	0	\N	\N	\N
1299	LS4BD3D6BF600451	A5BAA070069	\N	LS4BD3D6BF600451	\N	2011	\N	\N	2013-03-21	\N	DCDH 11	CPR	\N	\N	0	\N	\N	\N
1284	VF645ACA000003139	83M0603039	\N	VF645ACA000003139	\N	2004	\N	\N	2013-03-20	\N	YH 2574	U-141	\N	\N	0	\N	\N	\N
1332	8364	83M0316905	\N	8364	\N	1998	\N	\N	2013-03-21	\N	TD 5453	BX-2	\N	\N	0	\N	\N	\N
1311	TJW35F8TEA92211	TNV73C8DAAA	\N	TJW35F8TEA92211	\N	1996	\N	\N	2013-03-21	\N	RT 8236	U-33	\N	\N	0	\N	\N	\N
1285	033	\N	\N	033	\N	1982	\N	\N	2013-03-20	\N	UW 6499	U-142	\N	\N	0	\N	\N	\N
1330	4566	012505KK	\N	4566	\N	1986	\N	\N	2013-03-21	\N	BJ 8743	B-2	\N	\N	0	\N	\N	\N
1300	904663BE041791	61198170118195	\N	904663BE041791	\N	2011	\N	\N	2013-03-21	\N	CZYD 97	CPM	\N	\N	0	\N	\N	\N
1295	JMZUN1F127W615077	WLAT746026	\N	JMZUN1F127W615077	\N	2007	\N	\N	2013-03-21	\N	WX 6189	CJ-2	\N	\N	0	\N	\N	\N
1286	CL3000087	07918D	\N	CL3000087	\N	1980	\N	\N	2013-03-20	\N	BWRY 96	U-143	\N	\N	0	\N	\N	\N
1317	1001	83M0220673	\N	1001	\N	1996	\N	\N	2013-03-21	\N	SL 2891	U-61	\N	\N	0	\N	\N	\N
1306	1F94042269H140675	94042269H140675	\N	1F94042269H140675	\N	2009	\N	\N	2013-03-21	2013-03-21	CKTT 81	U-21	\N	\N	0	\N	\N	\N
1287	VF645ACA000003148	83M0602391	\N	VF645ACA000003148	\N	2004	\N	\N	2013-03-20	\N	YH 2573	U-151	\N	\N	0	\N	\N	\N
1296	JMZUN1F127W614401	WLAT744113	\N	JMZUN1F127W614401	\N	2007	\N	\N	2013-03-21	\N	XW 6191	CJ-3	\N	\N	0	\N	\N	\N
1301	KMJWWH7HPU828476	D4BH7457119	\N	KMJWWH7HPU828476	\N	2008	\N	\N	2013-03-21	\N	BHBG 84	T-1	\N	\N	0	\N	\N	\N
1288	VF6GJP1A120002083	20830	\N	VF6GJP1A120002083	\N	1989	\N	\N	2013-03-20	\N	DD 2574	U-152	\N	\N	0	\N	\N	\N
1312	VF640ACE500007373	83M0420516	\N	VF640ACE500007373	\N	2000	\N	\N	2013-03-21	\N	US 4963	U-41	\N	\N	0	\N	\N	\N
1297	JTB31UNE8Y0008191	2RZ-2320137	\N	JTB31UNE8Y0008191	\N	2001	\N	\N	2013-03-21	\N	UJ 3396	TS	\N	\N	0	\N	\N	\N
1322	VF644ALH000000842	10807570	\N	VF644ALH000000842	\N	2009	\N	\N	2013-03-21	\N	CJKV 94	U-82	\N	\N	0	\N	\N	\N
1289	9BM386015RB030610	376955-10-243135	\N	9BM386015RB030610	\N	1995	\N	\N	2013-03-20	\N	PU 1317	U-153	\N	\N	0	\N	\N	\N
1307	VF640BCA00001938	83M0475011	\N	VF640BCA00001938	\N	2001	\N	\N	2013-03-21	\N	VC 7299	U-22	\N	\N	0	\N	\N	\N
1325	VF6FN40A000051783	51783	\N	VF6FN40A000051783	\N	1994	\N	\N	2013-03-21	\N	NN 3512	U-63	\N	\N	0	\N	\N	\N
1302	KMJWWH7HP7U830796	D4BH7459358	\N	KMJWWH7HP7U830796	\N	2008	\N	\N	2013-03-21	\N	BHBG 85	T-2	\N	\N	0	\N	\N	\N
1318	VF644ALH00000837	10805121	\N	VF644ALH00000837	\N	2009	\N	\N	2013-03-21	\N	CJKV 95	U-62	\N	\N	0	\N	\N	\N
1313	VF644ALH000000840	10806635	\N	VF644ALH000000840	\N	2009	\N	\N	2013-03-21	\N	CJKV 93	U-42	\N	\N	0	\N	\N	\N
1328	7CSUD21009562	KA24187817	\N	7CSUD21009562	\N	1997	\N	\N	2013-03-21	\N	RN 1262	R-1	\N	\N	0	\N	\N	\N
1308	5600564736	83M0144762	\N	5600564736	\N	1993	\N	\N	2013-03-21	\N	NN 3511	U-23	\N	\N	0	\N	\N	\N
1323	VF6JD00A000007634	5800406216	\N	VF6JD00A000007634	\N	1989	\N	\N	2013-03-21	\N	DD 1877	42-A	\N	\N	0	\N	\N	\N
1314	VF647BCA000002149	83M0678463	\N	VF647BCA000002149	\N	2005	\N	\N	2013-03-21	\N	WC 2843	U-51	\N	\N	0	\N	\N	\N
1335	MPATFR77HBT100875	948830	\N	MPATFR77HBT100875	\N	2011	\N	\N	2013-03-21	\N	CYDT 42	J-1	\N	\N	0	\N	\N	\N
19	VF6JPIA1200015301	344178KD	\N	VF6JPIA1200015301	\N	1984	1000	\N	2012-11-29	2013-03-21	DYXP55-3	BX1	\N	\N	0	BFJPIA1200015301	\N	\N
1319	20990	MDS060212B	\N	20990	\N	1991	\N	\N	2013-03-21	\N	KJ 1165	U-71	\N	\N	0	\N	\N	\N
26	JPZB16003633	50034391-ED	\N	JPZB16003633	\N	1984	16000	\N	2013-01-23	2013-03-21	DYXP 61	R-1	\N	\N	0	\N	\N	\N
1331	VF6JE13AC00008390	83M0317501	\N	VF6JE13AC00008390	\N	1998	\N	\N	2013-03-21	\N	YV 2935	B-1	\N	\N	0	\N	\N	\N
1326	VF6JE13AC00009357	83M0449763	\N	VF6JE13AC00009357	\N	2000	\N	\N	2013-03-21	\N	UZ 2259	B-1	\N	\N	0	\N	\N	\N
1329	15294	344178	\N	15294	\N	1984	\N	\N	2013-03-21	\N	CG 5070	BX-2	\N	\N	0	\N	\N	\N
1334	KFT0847	2012671	\N	KFT0847	\N	1980	\N	\N	2013-03-21	\N	FC 9355	B-4	\N	\N	0	\N	\N	\N
1333	VF643ACA000008011	83M0613872	\N	VF643ACA000008011	\N	2004	\N	\N	2013-03-21	\N	YH 2572	B-2	\N	\N	0	\N	\N	\N
1336	VF647BCA00000465	83M0694959	\N	VF647BCA00000465	\N	2006	\N	\N	2013-03-21	\N	WH 7904	B-1	\N	\N	0	\N	\N	\N
1337	C3049529	HD3449259	\N	C3049529	\N	1950	\N	\N	2013-03-21	\N	FCFG 50	RELIQUIA	\N	\N	0	\N	\N	\N
1338	VF6JP1000000600	021586	\N	VF6JP1000000600	\N	1993	\N	\N	2013-03-21	\N	SV 4130	B-2	\N	\N	0	\N	\N	\N
1339	VF643ACA000007330	83M0541857	\N	VF643ACA000007330	\N	2002	\N	\N	2013-03-21	\N	VU 6419 	B-3	\N	\N	0	\N	\N	\N
1340	L680302066	ED6022742	\N	L680302066	\N	1964	\N	\N	2013-03-21	\N	FCFG 45	B-4	\N	\N	0	\N	\N	\N
1341	9BFNXXLM3KDB17021	DCL4971-89	\N	9BFNXXLM3KDB17021	\N	1990	\N	\N	2013-03-21	\N	DF 2365	Z-3	\N	\N	0	\N	\N	\N
1343	KFT0796	13250	\N	KFT0796	\N	1979	\N	\N	2013-03-21	\N	LN 9248	B-5	\N	\N	0	\N	\N	\N
1344	8358	83M0315508	\N	8358	\N	1998	\N	\N	2013-03-21	\N	TD 5773	B-1	\N	\N	0	\N	\N	\N
1345	VH64AEA000009534	83M0535652	\N	VH64AEA000009534	\N	2002	\N	\N	2013-03-21	\N	VX 9224	BK-2	\N	\N	0	\N	\N	\N
1398	866TFR60HT	469293	\N	866TFR60HT	\N	1997	\N	\N	2013-03-28	\N	PH 1197	J-3	\N	\N	0	\N	\N	\N
1357	VF6JE13AC00008944	83M0387458	\N	VF6JE13AC00008944	\N	2000	\N	\N	2013-03-26	\N	UB 2097	B-2	\N	\N	0	\N	\N	\N
1391	KMJWA37HABU309851	D4BHA056303	\N	KMJWA37HABU309851	\N	2011	\N	\N	2013-03-27	\N	CXZF 30	RH-2	\N	\N	0	\N	\N	\N
1346	1FV3GFBC5YHG42558	HG42558	\N	1FV3GFBC5YHG42558	\N	2000	\N	\N	2013-03-21	\N	BYCV 20	KR-2	\N	\N	0	\N	\N	\N
1387	ZCFA1MM1402556992	SA09673186	\N	ZCFA1MM1402556992	\N	2011	\N	\N	2013-03-26	\N	DWZS 24	R-7	\N	\N	0	\N	\N	\N
1358	VF643ACA000007972	83M0611886	\N	VF643ACA000007972	\N	2004	\N	\N	2013-03-26	\N	YD 1825	B-1	\N	\N	0	\N	\N	\N
1347	KMFFD27GPSU164478	G4C55-640697	\N	KMFFD27GPSU164478	\N	1996	\N	\N	2013-03-21	\N	NB 7224	M-0	\N	\N	0	\N	\N	\N
1342	824	83M0172823	\N	824	\N	1994	\N	\N	2013-03-21	2013-03-21	NP 2601	BR-0	\N	\N	0	\N	\N	\N
1375	VF6JS00A000009814	83M0241192	\N	VF6JS00A000009814	\N	1996	\N	\N	2013-03-26	\N	RG 2855	R-4	\N	\N	0	\N	\N	\N
1382	VF6JS00A000002944	5600457060	\N	VF6JS00A000002944	\N	1983	\N	\N	2013-03-26	\N	DDKB 72	BX-5	\N	\N	0	\N	\N	\N
1359	8AFDR12A38J147494	\N	\N	8AFDR12A38J147494	\N	2009	\N	\N	2013-03-26	\N	BVPT 61	K-1	\N	\N	0	\N	\N	\N
1348	7749000	J2302916	\N	7749000	\N	2001	\N	\N	2013-03-21	\N	UD 9816	KR-0	\N	\N	0	\N	\N	\N
1368	VF61500A000009643	5600564306	\N	VF61500A000009643	\N	1993	\N	\N	2013-03-26	\N	LL 7649	B-1	\N	\N	0	\N	\N	\N
1349	L5880-00151	P-37722	\N	L5880-00151	\N	1964	\N	\N	2013-03-21	\N	LS 7040	Q-0	\N	\N	0	\N	\N	\N
1394	VF1V4X20000664091	\N	\N	VF1V4X20000664091	\N	1988	\N	\N	2013-03-27	\N	\N	R-5	\N	\N	0	\N	\N	\N
1360	VF645ACA000007940	83M0679421	\N	VF645ACA000007940	\N	2005	\N	\N	2013-03-26	\N	WC 2842	B-2	\N	\N	0	\N	\N	\N
1376	340102604577	35293010059224	\N	340102604577	\N	1969	\N	\N	2013-03-26	\N	EU 3925	Z-4	\N	\N	0	\N	\N	\N
1350	VF645ACA00007617	83M0675414	\N	VF645ACA00007617	\N	2005	\N	\N	2013-03-25	\N	WC 2854	B-2	\N	\N	0	\N	\N	\N
1369	VF622ACA0A0009023	83M0314776	\N	VF622ACA0A0009023	\N	1998	\N	\N	2013-03-26	\N	TG 7784	H-1	\N	\N	0	\N	\N	\N
1361	8448	83M0335823	\N	8448	\N	1998	\N	\N	2013-03-26	\N	TG 7792	B-1	\N	\N	0	\N	\N	\N
1351	KMFRD27APWU360198	431327	\N	KMFRD27APWU360198	\N	1998	\N	\N	2013-03-25	\N	SU 7823	RH-2	\N	\N	0	\N	\N	\N
1400	VF640BCA000000323	83M0293177	\N	VF640BCA000000323	\N	1997	\N	\N	2013-03-28	\N	SH 5653	F-9	\N	\N	0	\N	\N	\N
1383	VF645ACA000008379	83M0685253	\N	VF645ACA000008379	\N	2005	\N	\N	2013-03-26	\N	WK 6316	H-6	\N	\N	0	\N	\N	\N
1377	8AC9046636A934931	61198170035580	\N	8AC9046636A934931	\N	2006	\N	\N	2013-03-26	\N	ZV 7345	X-4	\N	\N	0	\N	\N	\N
1352	7224	83M0223313	\N	7224	\N	1995	\N	\N	2013-03-25	\N	RR 9751	H-3	\N	\N	0	\N	\N	\N
1362	VF3231A3216139642	10CULD3030421	\N	VF3231A3216139642	\N	2002	\N	\N	2013-03-26	\N	US 1558	R-1	\N	\N	0	\N	\N	\N
1370	VF640ACA00002162	5600532360	\N	VF640ACA00002162	\N	1992	\N	\N	2013-03-26	\N	LJ 4162	M-2	\N	\N	0	\N	\N	\N
1353	93ZC4190188328768	1018608	\N	93ZC4190188328768	\N	2007	\N	\N	2013-03-25	\N	BKDW 16	RH-3	\N	\N	0	\N	\N	\N
1388	32205310602333	35299410059065	\N	32205310602333	\N	1969	\N	\N	2013-03-26	\N	EU 3929	Q-8	\N	\N	0	\N	\N	\N
1363	FPB4-8	440	\N	FPB4-8	\N	1980	\N	\N	2013-03-26	\N	BF 6729	B-3	\N	\N	0	\N	\N	\N
1354	VF6JE13AC000089410	83M0387084	\N	VF6JE13AC00008941	\N	1999	\N	\N	2013-03-25	\N	\N	F-1	\N	\N	0	\N	\N	\N
1392	TER10HDL-5322	945087	\N	TER10HDL-5322	\N	1991	\N	\N	2013-03-27	\N	DK 6755	J-2	\N	\N	0	\N	\N	\N
1371	VF6JP140000015404	798	\N	VF6JP140000015404	\N	1985	\N	\N	2013-03-26	\N	EU 3920	Q-2	\N	\N	0	\N	\N	\N
132	KFT0829	153799	\N	KFT0829	\N	1982	16000	\N	2013-01-28	2013-03-25	FCDV60-6	KB-3	\N	\N	0	\N	\N	\N
1364	570HM2U2200935	1HTWCAZR2DJ255566	\N	1HTWCAZR2DJ255566	\N	2013	\N	\N	2013-03-26	\N	FPLV 46	Z-2	\N	\N	0	\N	\N	\N
133	\N	044754	\N	\N	\N	1981	16000	\N	2013-01-28	2013-03-25	FCDV61-4	KB2	\N	\N	0	\N	\N	\N
1378	WDB67601315373571	36696210886189	\N	WDB67601315373571	\N	1989	\N	\N	2013-03-26	\N	UW 8267	M-5	\N	\N	0	\N	\N	\N
1384	1FTJW35F4TEA92190	TNV73C8DAAA	\N	1FTJW35F4TEA92190	\N	1996	\N	\N	2013-03-26	\N	RT 8235	K-6	\N	\N	0	\N	\N	\N
1372	JTB33UNG8W001940	2RZ1602488	\N	JTB33UNG8W001940	\N	1998	\N	\N	2013-03-26	\N	SG 2927	RH-2	\N	\N	0	\N	\N	\N
1355	VF644ALM000000800	10791222	\N	VF644ALM000000800	\N	2009	\N	\N	2013-03-25	\N	CGJD 29	KB-1	\N	\N	0	\N	\N	\N
1365	1HTWCAZR3DJ255561	570HM002200934	\N	1HTWCAZR3DJ255561	\N	2013	19958	\N	2013-03-26	\N	FPLV 45	Z-2	\N	\N	0	\N	\N	\N
1405	KFT0681	\N	\N	KFT0681	\N	1979	\N	\N	2013-03-28	\N	HV 6261	B-2	\N	\N	0	\N	\N	\N
1393	VF6JE13AC00009359	83M0449984	\N	VF6JE13AC00009359	\N	2000	\N	\N	2013-03-27	2013-03-27	VE 6241	B-2	\N	\N	0	\N	\N	\N
1356	11702	5000301669	\N	11702	\N	1983	\N	\N	2013-03-26	\N	BJ 6501	BX-2	\N	\N	0	\N	\N	\N
1389	WF0AXXXGCAARI61434	826922-1	\N	WF0AXXXGCAARI6143	\N	1994	\N	\N	2013-03-27	\N	DBLC 59	K-1	\N	\N	0	\N	\N	\N
1379	JSAOSJ50000171178	J13A478360	\N	JSAOSJ50000171178	\N	1989	\N	\N	2013-03-26	\N	BGBV 85	K-5	\N	\N	0	\N	\N	\N
1373	VF60ACE500007228	83M039871A	\N	VF60ACE500007228	\N	2000	\N	\N	2013-03-26	\N	UL 6204	R-3	\N	\N	0	\N	\N	\N
1395	JT172AEB500052330	\N	\N	JT172AEB500052330	\N	1998	\N	\N	2013-03-27	\N	DBLC 58	JX-5	\N	\N	0	\N	\N	\N
1366	1HTWCAZR5DJ255559	570HM2U2200762	\N	1HTWCAZR5DJ255559	\N	2013	19958	\N	2013-03-26	\N	FPLZ 46	Z-1	\N	\N	0	\N	\N	\N
1385	VF645ACA000008671	83M0690122	\N	VF645ACA000008671	\N	2006	\N	\N	2013-03-26	\N	WK 6311	B-7	\N	\N	0	\N	\N	\N
1380	WFOHXXGBVHNK78343	\N	\N	WFOHXXGBVHNK78343	\N	1991	\N	\N	2013-03-26	\N	BGBV 84	LT-5	\N	\N	0	\N	\N	\N
1374	VF6JN1A1200014501	10317	\N	VF6JN1A1200014501	\N	1989	\N	\N	2013-03-26	\N	HT 2061	B-4	\N	\N	0	\N	\N	\N
1399	VF6JS00A000009690	5600564603	\N	VF6JS00A000009690	\N	1994	\N	\N	2013-03-28	\N	NE 3769	H-9	\N	\N	0	\N	\N	\N
1390	KMJWA37KACU502015	D4CBC083751	\N	KMJWA37KACU502015	\N	2013	\N	\N	2013-03-27	\N	\N	J-1	\N	\N	0	\N	\N	\N
1381	VF644ALM000000787	10787758	\N	VF644ALM000000787	\N	2009	\N	\N	2013-03-26	\N	CGCG 98	B-5	\N	\N	0	\N	\N	\N
1386	32203210602328	35294910002883	\N	32203210602328	\N	1969	\N	\N	2013-03-26	\N	EU 3928	BX-7	\N	\N	0	\N	\N	\N
1396	WF0CUO4162KB11728	\N	\N	WF0CUO4162KB11728	\N	2002	\N	\N	2013-03-28	\N	\N	J-5	\N	\N	0	\N	\N	\N
1402	KFT0488	\N	\N	KFT0488	\N	1978	\N	\N	2013-03-28	\N	EU 3931	BX-10	\N	\N	0	\N	\N	\N
1397	\N	440	\N	\N	\N	\N	\N	\N	2013-03-28	\N	UB 4471	B-3	\N	\N	0	\N	\N	\N
1404	VF6JE13AC0000836	83M0315718	\N	VF6JE13AC0000836	\N	1998	\N	\N	2013-03-28	\N	TD 5449	B-1	\N	\N	0	\N	\N	\N
1401	VF6JE13AC00009229	83M0438793	\N	VF6JE13AC00009229	\N	2001	\N	\N	2013-03-28	\N	UP 8916	B-10	\N	\N	0	\N	\N	\N
1406	MMBJNKB408D01463	4D56UCAU9696	\N	MMBJNKB408D01463	\N	2008	\N	\N	2013-03-28	\N	BGLK 10	K-1	\N	\N	0	\N	\N	\N
1403	KMJWWH7HP7V770789	D4BH6348740	\N	KMJWWH7HP7V770789	\N	2007	\N	\N	2013-03-28	\N	WS 7378	K-1	\N	\N	0	\N	\N	\N
1407	NA18275	3G972519	\N	NA18275	\N	1972	\N	\N	2013-03-28	\N	NB 7211	BX-2	\N	\N	0	\N	\N	\N
1408	866TFSJ781A16802	6276568	\N	866TFSJ781A16802	\N	2010	\N	\N	2013-03-28	\N	BZRV 15	R-1	\N	\N	0	\N	\N	\N
1409	VF6JE13AC00008386	83M0317035	\N	VF6JE13AC00008386	\N	1998	\N	\N	2013-03-28	\N	TD 5442	BK-1	\N	\N	0	\N	\N	\N
1410	AP28204300344178MD	004220	\N	AP28204300344178M	\N	1985	\N	\N	2013-03-28	\N	KR 1699	B-2	\N	\N	0	\N	\N	\N
1411	LA7C-18292	352936-10-120185	\N	LA7C-18292	\N	1973	\N	\N	2013-03-28	\N	KR 1698	B-3	\N	\N	0	\N	\N	\N
1412	VF645ACA000007719	83M0676403	\N	VF645ACA000007719	\N	2006	\N	\N	2013-03-28	\N	WC 2851	BX-2	\N	\N	0	\N	\N	\N
1413	9BFL2VJGOTDB28108	30604162	\N	9BFL2VJGOTDB28108	\N	2011	\N	\N	2013-03-28	\N	RC 3863	BX-3	\N	\N	0	\N	\N	\N
1414	KMJWAH7HP8U055589	D4BH7551966	\N	KMJWAH7HP8U055589	\N	2008	\N	\N	2013-03-28	\N	BRPT 19	M-1	\N	\N	0	\N	\N	\N
9	RG11346752405	RG11346752405	\N	RG11346752405	\N	1977	1000	\N	2012-11-27	2013-04-01	DYXD20	R1	\N	\N	0	RG11346752405	\N	\N
1448	VF640ACD000004938	83M0280378	\N	VF640ACD000004938	\N	1997	\N	\N	2013-04-02	\N	SZ 1872	B-1	\N	\N	0	\N	\N	\N
1438	TLD440112133	4BAIF536916	\N	TLD440112133	\N	1980	\N	\N	2013-04-02	\N	YE 2431	B-2	\N	\N	0	\N	\N	\N
1415	KMFFD27APWU387639	D4BAV539460	\N	KMFFD27APWU387639	\N	1998	\N	\N	2013-03-28	\N	ST 7264	K-2	\N	\N	0	\N	\N	\N
1668	V34-11457	19625705R 	\N	V34-11457	\N	1980	\N	\N	2013-04-22	2013-04-30	RA  5378	J-1	\N	\N	0	\N	\N	\N
1454	VF643ACA000007945	83M0609798	\N	VF643ACA000007945	\N	2004	\N	\N	2013-04-02	\N	YB 1340	B-2	\N	\N	0	\N	\N	\N
1429	SDEG13A00BD707186	XC22S58U5272BG	\N	SDEG13A00BD707186	\N	1982	\N	\N	2013-04-01	\N	BZRD 85	RH-1	\N	\N	0	\N	\N	\N
1416	15086	344178	\N	15086	\N	1984	\N	\N	2013-03-28	\N	BF 9697	B-1	\N	\N	0	\N	\N	\N
1474	VF6JE13AC00009249	83M0441093	\N	VF6JE13AC00009249	\N	2000	\N	\N	2013-04-02	\N	UV 7443	B-2	\N	\N	0	\N	\N	\N
1460	VF645ACA000007805	83M0677430	\N	VF645ACA000007805	\N	2005	\N	\N	2013-04-02	\N	WC 2844	B-4	\N	\N	0	\N	\N	\N
1439	FK116D57931	277927	\N	FK116D57931	\N	1989	\N	\N	2013-04-02	\N	YE 2430	B-3	\N	\N	0	\N	\N	\N
1430	1FV6HFBC1WH944952	45592625	\N	1FV6HFBC1WH944952	\N	1998	\N	\N	2013-04-01	\N	ZJ 6014	R-1	\N	\N	0	\N	\N	\N
1417	8365	83M0316694	\N	8365	\N	1998	\N	\N	2013-03-28	\N	TD 5774	B-2	\N	\N	0	\N	\N	\N
1449	ZI69680	5000204889	\N	ZI69680	\N	1982	\N	\N	2013-04-02	\N	FBFC 58	B-2	\N	\N	0	\N	\N	\N
1418	V3411464	1962854	\N	V3411464	\N	1980	\N	\N	2013-03-28	\N	NA 2358	K-1	\N	\N	0	\N	\N	\N
1472	PF20035023	A20892164	\N	PF20035023	\N	1982	\N	\N	2013-04-02	\N	ZT 3543	J-1	\N	\N	0	\N	\N	\N
1431	VF645ACA000008537	83M0687603	\N	VF645ACA000008537	\N	2006	\N	\N	2013-04-01	\N	WE 6739	B-1	\N	\N	0	\N	\N	\N
1419	\N	M-GPF 22	\N	\N	\N	1982	\N	\N	2013-03-28	\N	VX 5985	R-1	\N	\N	0	\N	\N	\N
1455	998511	20797	\N	998511	\N	1975	\N	\N	2013-04-02	\N	FC 6755	B-3	\N	\N	0	\N	\N	\N
1440	D2TU.3010-B	FD6-022980	\N	D2TU.3010-B	\N	1973	\N	\N	2013-04-02	\N	DZCC 40	B-4	\N	\N	0	\N	\N	\N
1420	VF64ACA000008530	83M0687482	\N	VF64ACA000008530	\N	2006	\N	\N	2013-03-28	\N	WE 6744	B-1	\N	\N	0	\N	\N	\N
1432	KMFFD27GPJK492947	G4CS1719277	\N	KMFFD27GPJK492947	\N	2002	\N	\N	2013-04-01	\N	UX 8472	J-0	\N	\N	0	\N	\N	\N
1450	VF645ACA000008312	83M0684560	\N	VF645ACA000008312	\N	2005	\N	\N	2013-04-02	\N	WK 6313	B-3	\N	\N	0	\N	\N	\N
1421	\N	5000204889	\N	\N	\N	1983	\N	\N	2013-03-28	\N	EF 6610	F-1	\N	\N	0	\N	\N	\N
1465	KMJWA37HABU295844	D4BHA047160	\N	KMJWA37HABU295844	\N	2011	\N	\N	2013-04-02	\N	CWDC	J-0	\N	\N	0	\N	\N	\N
1441	R3892Y27C7TA3010J	4TA7505D	\N	R3892Y27C7TA3010J	\N	1975	\N	\N	2013-04-02	\N	DZCC 41	BX-1	\N	\N	0	\N	\N	\N
1433	8366	83M0316853	\N	8366	\N	1998	\N	\N	2013-04-02	\N	TD 5440	B-1	\N	\N	0	\N	\N	\N
1422	8140	83M0297112	\N	8140	\N	1997	\N	\N	2013-03-28	\N	TA 4508	B-2	\N	\N	0	\N	\N	\N
1469	L680-3-02135	PF2096	\N	L680-3-02135	\N	1963	\N	\N	2013-04-02	\N	FC 4534	B-4	\N	\N	0	\N	\N	\N
1423	\N	4691446	\N	\N	\N	1992	\N	\N	2013-03-28	\N	DR 4073	J-2	\N	\N	0	\N	\N	\N
58	JP1A120014335	002294	\N	JP1A120014335	\N	1984	16000	\N	2013-01-25	2013-04-02	DYXP40-5	B-2	\N	\N	0	\N	\N	\N
1461	11849	579726	\N	11849	\N	1982	\N	\N	2013-04-02	\N	EC 1925	BKF-0	\N	\N	0	\N	\N	\N
1434	TDL46021866	KTLD46	\N	TDL46021866	\N	1982	\N	\N	2013-04-02	\N	SD 7702	B-11	\N	\N	0	\N	\N	\N
1424	KFT1157	BM1365771219	\N	KFT1157	\N	1982	\N	\N	2013-03-28	\N	EU 3939	B-3	\N	\N	0	\N	\N	\N
1442	LS680-3-00133	P27083	\N	LS680-3-00133	\N	1963	\N	\N	2013-04-02	\N	FC 9356	BX-4	\N	\N	0	\N	\N	\N
1456	8143	83M0297253	\N	8143	\N	1997	\N	\N	2013-04-02	\N	TA 4511	B-4	\N	\N	0	\N	\N	\N
1425	1GCFG25M1X1147025	\N	\N	1GCFG25M1X1147025	\N	1999	\N	\N	2013-03-28	\N	TT 3861	R-0	\N	\N	0	\N	\N	\N
1435	YN1060019204	4Y0397620	\N	YN1060019204	\N	1994	\N	\N	2013-04-02	\N	LL 8109	M-0	\N	\N	0	\N	\N	\N
1443	\N	4BAIF535089	\N	\N	\N	1980	\N	\N	2013-04-02	\N	RZ 4707	J-4	\N	\N	0	\N	\N	\N
1426	CA07C1CL300376/44	0789KD	\N	CA07C1CL300376/44	\N	1984	\N	\N	2013-04-01	\N	BZRD 86	Z-2	\N	\N	0	\N	\N	\N
1451	8394	83M0684551 	\N	8394	\N	2006	\N	\N	2013-04-02	\N	WK 6312	B-1	\N	\N	0	\N	\N	\N
1436	15088	3760	\N	15088	\N	1984	\N	\N	2013-04-02	\N	EF 7858	BF-1	\N	\N	0	\N	\N	\N
1427	KFT1466	630488	\N	KFT1466	\N	1984	\N	\N	2013-04-01	\N	ND 1380	B-2	\N	\N	0	\N	\N	\N
1444	\N	62030G201251NE 	\N	\N	\N	1981	\N	\N	2013-04-02	\N	BJ 6290	R-1	\N	\N	0	\N	\N	\N
1479	3N6CD13S4ZK021568	KA24187414A	\N	3N6CD13S4ZK021568	\N	2004	\N	\N	2013-04-02	\N	XV 2805	K-1	\N	\N	0	\N	\N	\N
1428	VF6J500A000009647	83M0143420	\N	VF6J500A000009647	\N	1993	\N	\N	2013-04-01	\N	LU 4516	H-2	\N	\N	0	\N	\N	\N
1452	\N	\N	\N	83M0318241	\N	1998	\N	\N	2013-04-02	\N	TD 5758	B-3	\N	\N	0	\N	\N	\N
1445	RN85-5137158	22R4111896	\N	RN85-5137158	\N	1995	\N	\N	2013-04-02	\N	NC 6044	H-1	\N	\N	0	\N	\N	\N
1457	ZCFC49701W5188612	2577305	\N	ZCFC49701W5188612	\N	1999	\N	\N	2013-04-02	\N	TX 3656	R-1	\N	\N	0	\N	\N	\N
1437	8481	83M0341491	\N	8481	\N	1998	\N	\N	2013-04-02	\N	TB 4428	B-1	\N	\N	0	\N	\N	\N
1466	VF644ALM000000793	10789281	\N	VF644ALM000000793	\N	2009	\N	\N	2013-04-02	\N	CGJD 41	B-1	\N	\N	0	\N	\N	\N
1462	9BFL2UJG2TD	30602875	\N	9BFL2UJG2TD	\N	1997	\N	\N	2013-04-02	\N	PT 3256	B-0	\N	\N	0	\N	\N	\N
1453	VF644BHM000002015	11207206	\N	VF644BHM000002015	\N	2012	\N	\N	2013-04-02	\N	FBSJ 66	B-1	\N	\N	0	\N	\N	\N
1446	ZCFD4079105943330	\N	\N	ZCFD4079105943330	\N	1998	\N	\N	2013-04-02	\N	\N	RX-5	\N	\N	0	\N	\N	\N
1478	93ZC4190188328751	1018587	\N	93ZC4190188328751	\N	2007	\N	\N	2013-04-02	\N	BBGC 29	H-2	\N	\N	0	\N	\N	\N
1447	\N	440	\N	\N	\N	1988	\N	\N	2013-04-02	\N	UB 4471	B-3	\N	\N	0	\N	\N	\N
1476	VF645ACA000007710	83M0676225	\N	VF645ACA000007710	\N	2005	\N	\N	2013-04-02	\N	WC 2852	B-4	\N	\N	0	\N	\N	\N
1470	3PTSW30LS1MA75620	1MA75620	\N	3PTSW30LS1MA75620	\N	2001	\N	\N	2013-04-02	\N	UT 6327	R-1	\N	\N	0	\N	\N	\N
1458	890	560056125	\N	890	\N	1995	\N	\N	2013-04-02	\N	RE 7016	BKM-2	\N	\N	0	\N	\N	\N
1463	KFT0486	2157275	\N	KFT0486	\N	1977	\N	\N	2013-04-02	\N	EC 1926	B-1	\N	\N	0	\N	\N	\N
1473	VF6JE13AC0008407	83M0319553	\N	VF6JE13AC0008407	\N	1998	\N	\N	2013-04-02	\N	TD 5767	B-1	\N	\N	0	\N	\N	\N
1467	5600532114	00124	\N	5600532114	\N	1993	\N	\N	2013-04-02	\N	PB 9511	B-2	\N	\N	0	\N	\N	\N
1459	VF6JE113A00006469	83M0125044	\N	VF6JE113A00006469	\N	1992	\N	\N	2013-04-02	\N	LU 3665	BKP-3	\N	\N	0	\N	\N	\N
1471	21080	1JO1236CN	\N	21080	\N	1981	\N	\N	2013-04-02	\N	CS 9548	Z-1	\N	\N	0	\N	\N	\N
1464	3N1CD1352ZK007898	KA24683829M	\N	3N1CD1352ZK007898	\N	1998	\N	\N	2013-04-02	\N	SK 9870	U-ATACK	\N	\N	0	\N	\N	\N
1468	8470	83M0340327	\N	8470	\N	1998	\N	\N	2013-04-02	\N	TV 4423	B-3	\N	\N	0	\N	\N	\N
1475	VF644BHM000002009	11203439	\N	VF644BHM000002009	\N	2012	\N	\N	2013-04-02	\N	DZXR 99	B-3	\N	\N	0	\N	\N	\N
1480	VF645ACA000007752	83M0676636	\N	VF645ACA000007752	\N	2005	\N	\N	2013-04-02	\N	WC 2847	B-1	\N	\N	0	\N	\N	\N
1477	6763	\N	\N	6763	\N	1980	\N	\N	2013-04-02	\N	BYCV 48	R-1	\N	\N	0	\N	\N	\N
1481	7740	83M0223214	\N	7740	\N	1996	\N	\N	2013-04-02	\N	SL 3312	BR-2	\N	\N	0	\N	\N	\N
1482	8183	83M0301838	\N	8183	\N	1998	\N	\N	2013-04-03	\N	TD 5055	B-1	\N	\N	0	\N	\N	\N
1483	VF645ACA000008513	83M0687326	\N	VF645ACA000008513	\N	2005	\N	\N	2013-04-03	\N	WE 6745	B-1	\N	\N	0	\N	\N	\N
1485	\N	JRZ036SY72	\N	\N	\N	1993	\N	\N	2013-04-03	\N	DU 9592	K-1	\N	\N	0	\N	\N	\N
1484	KFT1142	155799	\N	KFT1142	\N	1981	\N	\N	2013-04-03	\N	EC 9763	R-1	\N	\N	0	\N	\N	\N
1486	9BM384024SB080644	37694510301451	\N	9BM384024SB080644	\N	1996	\N	\N	2013-04-03	\N	CH 7136	C-2	\N	\N	0	\N	\N	\N
1488	\N	3F0297407	\N	\N	\N	1991	\N	\N	2013-04-03	\N	DK 9233	K-1	\N	\N	0	\N	\N	\N
1487	\N	5600457078	\N	\N	\N	1986	\N	\N	2013-04-03	2013-04-03	CX 7637	UF-1	\N	\N	0	\N	\N	\N
1489	\N	4509	\N	\N	\N	1976	\N	\N	2013-04-03	\N	BJ 1636	U-21	\N	\N	0	\N	\N	\N
1490	\N	2006	\N	\N	\N	1990	\N	\N	2013-04-03	\N	TY 3091	U-11	\N	\N	0	\N	\N	\N
1491	\N	2058	\N	\N	\N	1993	\N	\N	2013-04-03	\N	TY 3092	U-21	\N	\N	0	\N	\N	\N
1492	\N	83M0313999	\N	\N	\N	1998	\N	\N	2013-04-03	\N	TG 7780	U-32	\N	\N	0	\N	\N	\N
1493	VF644BLM000000712	10805130	\N	VF644BLM000000712	\N	2010	\N	\N	2013-04-03	\N	CJKV 83	U-33	\N	\N	0	\N	\N	\N
1531	86814	C60CUA	\N	86814	\N	1967	\N	\N	2013-04-04	\N	AH 3113	B-3	\N	\N	0	\N	\N	\N
1508	VF6JE13AC0008514	83M0348358	\N	VF6JE13AC0008514	\N	1999	\N	\N	2013-04-03	\N	UD 8094	B-1	\N	\N	0	\N	\N	\N
1494	CBLB-X	\N	\N	CBLB-X	\N	1981	\N	\N	2013-04-03	\N	HV 6253	U-BX	\N	\N	0	\N	\N	\N
1523	1FDH534M4MHA10447	\N	\N	1FDH534M4MHA10447	\N	1991	\N	\N	2013-04-04	2013-04-04	DK 3412	R-1	\N	\N	0	\N	\N	\N
1495	\N	929303	\N	\N	\N	1991	\N	\N	2013-04-03	\N	DK 9197	U-CJ	\N	\N	0	\N	\N	\N
1545	9080	16436522	\N	9080	\N	1972	\N	\N	2013-04-09	\N	NF 3350	B-5	\N	\N	0	\N	\N	\N
1509	JLICPUD227008778	YD25235019A	\N	JLICPUD227008778	\N	2002	\N	\N	2013-04-04	\N	BBTD 12	K-0	\N	\N	0	\N	\N	\N
1519	KMFFD27APVU310402	277525	\N	KMFFD27APVU310402	\N	1995	\N	\N	2013-04-04	\N	RK 1209	RX-1	\N	\N	0	\N	\N	\N
1496	VF645ACA000007774	83M0676997	\N	VF645ACA000007774	\N	2005	\N	\N	2013-04-03	\N	WC 2846	B-1	\N	\N	0	\N	\N	\N
55	VF6JE13AC00007088	\N	\N	VF6JE13AC00007088	\N	1996	16000	\N	2013-01-25	2013-04-08	DZCC 25	B-1	\N	\N	0	\N	\N	\N
1538	\N	70950600101289	\N	\N	\N	1979	\N	\N	2013-04-05	\N	BF 6730	BX-1	\N	\N	0	\N	\N	\N
1525	VF6JE13AC00008393	83M0318082	\N	VF6JE13AC00008393	\N	1998	\N	\N	2013-04-04	\N	TD 5777	B-2	\N	\N	0	\N	\N	\N
1510	VF645ACA000007736	83M0676549	\N	VF645ACA000007736	\N	2005	\N	\N	2013-04-04	\N	WC 2849	B-1	\N	\N	0	\N	\N	\N
1497	TLD46/0314597	4BC2	\N	TLD46/0314597	\N	1984	\N	\N	2013-04-03	\N	SU 7054	BX-1	\N	\N	0	\N	\N	\N
1520	8AC9046639E006208	6119820	\N	8AC9046639E006208	\N	2009	\N	\N	2013-04-04	\N	BHCX 22	R-1	\N	\N	0	\N	\N	\N
1532	SSR37RAD	6CTA83	\N	SSR37RAD	\N	1994	\N	\N	2013-04-04	\N	DBDJ 10	B-2	\N	\N	0	\N	\N	\N
1498	100422	ONCP-32-102008	\N	100422	\N	1972	\N	\N	2013-04-03	\N	WH 8840	Z-1	\N	\N	0	\N	\N	\N
1511	VF6JE13AC00008468	83M0340299	\N	VF6JE13AC00008468	\N	1999	\N	\N	2013-04-04	\N	TV 4421	B-1	\N	\N	0	\N	\N	\N
1526	OM75PB001921	\N	\N	OM75PB001921	\N	1982	\N	\N	2013-04-04	\N	MY 4568	CF-1	\N	\N	0	\N	\N	\N
1499	JMYJN913VWA000822	4G63XL9309	\N	JMYJN913VWA000822	\N	1999	\N	\N	2013-04-03	\N	TA 6090	R-1	\N	\N	0	\N	\N	\N
1512	JNICHGD2207362200	TD27722501	\N	JNICHGD2207362200	\N	2004	\N	\N	2013-04-04	\N	XC 7945	K-1	\N	\N	0	\N	\N	\N
1500	KMJWWH7SPXU077042	G4CSW504609	\N	KMJWWH7SPXU077042	\N	2000	\N	\N	2013-04-03	\N	TJ 8379	J-1	\N	\N	0	\N	\N	\N
1518	VF6JE13AC00008361	83M0315912	\N	VF6JE13AC00008361	\N	1998	\N	\N	2013-04-04	2013-04-04	TD 5450	B-1	\N	\N	0	\N	\N	\N
1533	VF6JE13AC00009310	83M0446588	\N	VF6JE13AC00009310	\N	2000	\N	\N	2013-04-04	\N	UZ 2266	B-4	\N	\N	0	\N	\N	\N
1501	93YLB01056J649476	K4MK740Q060821	\N	93YLB01056J649476	\N	2006	\N	\N	2013-04-03	\N	ZV 6767	K-1	\N	\N	0	\N	\N	\N
1513	JACUBS17FM107569	121245	\N	JACUBS17FM107569	\N	1992	\N	\N	2013-04-04	\N	DT 1944	J-1	\N	\N	0	\N	\N	\N
1527	14335	2031	\N	14335	\N	1988	\N	\N	2013-04-04	\N	AH 3330	B-1	\N	\N	0	\N	\N	\N
1521	CD45ANN00005	\N	\N	CD45ANN00005	\N	1995	\N	\N	2013-04-04	\N	DKYW 19	Z-1	\N	\N	0	\N	\N	\N
1502	7258	83M0225355	\N	7258	\N	1996	\N	\N	2013-04-03	\N	SL 3315	H-1	\N	\N	0	\N	\N	\N
1514	WRPCO10035	9B6783N	\N	WRPCO10035	\N	1994	\N	\N	2013-04-04	\N	LK 7127	Z-2	\N	\N	0	\N	\N	\N
1539	002429100	5600532102	\N	002429100	\N	1991	\N	\N	2013-04-05	\N	DZ 4512	B-1	\N	\N	0	\N	\N	\N
1503	8AC9046639E014007	61198170093761	\N	8AC9046639E014007	\N	2004	\N	\N	2013-04-03	\N	BYHX 21	R-2	\N	\N	0	\N	\N	\N
1554	1456L33CC62	V85KUD-642666	\N	1456L33CC62	\N	1968	\N	\N	2013-04-11	\N	CA 6944	BX-1	\N	\N	0	\N	\N	\N
1522	JN1CHGD22Z0743107	TD27780512	\N	JN1CHGD22Z0743107	\N	2006	\N	\N	2013-04-04	\N	ZT 3619	K-1	\N	\N	0	\N	\N	\N
1515	KAB-97344	9BFXXXLM8	\N	KAB-97344	\N	1989	\N	\N	2013-04-04	\N	BU 8635	Z-3	\N	\N	0	\N	\N	\N
1504	VFGJE13AC00008947	83M0388246	\N	VFGJE13AC00008947	\N	2000	\N	\N	2013-04-03	\N	UB 2091	F-2	\N	\N	0	\N	\N	\N
1542	VF644ALM000000214	10494251	\N	VF644ALM000000214	\N	2008	\N	\N	2013-04-08	\N	BPFX 78	B-4	\N	\N	0	\N	\N	\N
1528	9BM695014VB133744	377964-10-367179	\N	9BM695014VB133744	\N	1998	\N	\N	2013-04-04	\N	RY 1674	Z-1	\N	\N	0	\N	\N	\N
1505	6453	83M0124723	\N	6453	\N	1992	\N	\N	2013-04-03	\N	SS 2297	B-3	\N	\N	0	\N	\N	\N
1534	SS237R4D929	6CTA84	\N	SS237R4D929	\N	1992	\N	\N	2013-04-04	\N	DBDJ 11	RH-4	\N	\N	0	\N	\N	\N
1516	KAG417340188	694824	\N	KAG417340188	\N	1981	\N	\N	2013-04-04	\N	PB 9524	J-3	\N	\N	0	\N	\N	\N
1506	\N	0816042	\N	\N	\N	1982	\N	\N	2013-04-03	\N	VP 5656	J-3	\N	\N	0	\N	\N	\N
1549	VF6JE13AC00007261	83M0225836	\N	VF6JE13AC00007261	\N	1996	\N	\N	2013-04-09	\N	SL 3319	B-1	\N	\N	0	\N	\N	\N
1546	3TL52V524150046	J20A163616	\N	3TL52V524150046	\N	2001	\N	\N	2013-04-09	\N	UR 8330	J-4	\N	\N	0	\N	\N	\N
1507	7106596	878793	\N	7106596	\N	1990	\N	\N	2013-04-03	\N	HE 4815	J-2	\N	\N	0	\N	\N	\N
1529	VF647BCA000003098	83M0716341	\N	VF647BCA000003098	\N	2008	\N	\N	2013-04-04	\N	BPFX 70	CF-2	\N	\N	0	\N	\N	\N
1524	22883	79726	\N	22883	\N	1982	\N	\N	2013-04-04	\N	BJ 6291	B-1	\N	\N	0	\N	\N	\N
1517	1FTJS34LXXHHC2140	7614	\N	1FTJS34LXXHHC2140	\N	1987	\N	\N	2013-04-04	\N	KK 6785	R-1	\N	\N	0	\N	\N	\N
1553	VF6JE13AC00001010	83M0218440	\N	VF6JE13AC00001010	\N	1995	\N	\N	2013-04-11	\N	SK 3507	B-1	\N	\N	0	\N	\N	\N
1535	VF6CA06C1CF100635	DLP893	\N	VF6CA06C1CF100635	\N	1983	\N	\N	2013-04-05	\N	CCVF 44	H-4	\N	\N	0	\N	\N	\N
1543	VF64ACA000007930	83M0609289	\N	VF64ACA000007930	\N	2008	\N	\N	2013-04-08	\N	YD 1822	B-2	\N	\N	0	\N	\N	\N
1547	\N	493191	\N	\N	\N	1997	\N	\N	2013-04-09	\N	PV 3464	J-1	\N	\N	0	\N	\N	\N
1530	SS237R4D923	SCTA83	\N	SS237R4D923	\N	1988	\N	\N	2013-04-04	\N	UP 5134	CR-2	\N	\N	0	\N	\N	\N
1540	VF644AL0000007840	10786530	\N	VF644AL0000007840	\N	2009	\N	\N	2013-04-05	2013-04-05	CGCP 10	BK-1	\N	\N	0	\N	\N	\N
1552	KMJWAH7HP8U056873	D4BH8001211	\N	KMJWAH7HP8U056873	\N	2008	\N	\N	2013-04-09	\N	BPRW 59	J-1	\N	\N	0	\N	\N	\N
1536	02314	H20647535	\N	02314	\N	1965	\N	\N	2013-04-05	\N	AH 3110	U-41	\N	\N	0	\N	\N	\N
1544	KMJFD27APWU36637	D4BAV453483	\N	KMJFD27APWU36637	\N	1998	\N	\N	2013-04-08	\N	RP 6612	K-1	\N	\N	0	\N	\N	\N
1541	VF6434CA000007940	83M0609624	\N	VF6434CA000007940	\N	2004	\N	\N	2013-04-05	\N	YB 1349	BK-2	\N	\N	0	\N	\N	\N
1537	1FTFE24Y9SHB42181	\N	\N	1FTFE24Y9SHB42181	\N	1995	\N	\N	2013-04-05	\N	NF 3722	R-1	\N	\N	0	\N	\N	\N
1550	KFT0655	4369	\N	KFT0655	\N	1978	\N	\N	2013-04-09	\N	RF 3549	BX-1	\N	\N	0	\N	\N	\N
802	VF644ALM000000222	10525145	\N	VF644ALM000000222	\N	2008	\N	\N	2013-02-25	2013-04-09	BPFX 84	B-7	\N	\N	0	\N	\N	\N
854	KMJWAH7HP9U110979	D4BH8070862	\N	KMJWAH7HP9U110979	\N	2009	\N	\N	2013-02-27	2013-04-09	BPZB 64	J-1	\N	\N	0	\N	\N	\N
1548	10DXAG4013965	60182143	\N	10DXAG4013965	\N	1999	\N	\N	2013-04-09	\N	TG 2161	J-5	\N	\N	0	\N	\N	\N
1551	KMFFD27BPXU405216	D4BBW595960	\N	KMFFD27BPXU405216	\N	1999	\N	\N	2013-04-09	\N	SX 1139	K-1	\N	\N	0	\N	\N	\N
1555	VF6JE13AC00008443	83M0335047	\N	VF6JE13AC00008443	\N	1998	\N	\N	2013-04-11	\N	TG 7788	B-2	\N	\N	0	\N	\N	\N
167	201	3620158	\N	201	\N	1977	16000	\N	2013-01-29	2013-04-11	FCFG69-5	BX-2	\N	\N	0	\N	\N	\N
192	4SCT2D9XCCO74665	8849CM3	\N	4SCT2D9XCCO74665	\N	2012	\N	\N	2013-01-30	2013-04-11	DVDJ 69	Q-2	\N	\N	0	\N	\N	\N
193	4S7CT2D95CCO74668	S73241182	\N	4S7CT2D95CCO74668	\N	2012	\N	\N	2013-01-30	2013-04-11	DVDJ 70	Q-6	\N	\N	0	\N	\N	\N
1556	J2408580	7192611	\N	J2408580	\N	2005	\N	\N	2013-04-11	\N	YR 2577	R-1	\N	\N	0	\N	\N	\N
1557	RS003717	5543992	\N	RS003717	\N	1996	\N	\N	2013-04-11	\N	NH 8328	R-2	\N	\N	0	\N	\N	\N
1558	L4002358	H500337	\N	L4002358	\N	1965	\N	\N	2013-04-11	\N	FCFG 51	J-1	\N	\N	0	\N	\N	\N
1559	2GCGC24M7C1213468	GM14057057	\N	2GCGC24M7C1213468	\N	1982	\N	\N	2013-04-11	\N	FCFG 52	J-2	\N	\N	0	\N	\N	\N
1560	KMJWWH74P7UO	D4H7461220	\N	KMJWWH74P7UO	\N	2005	\N	\N	2013-04-11	\N	BFCX 77	JX-2	\N	\N	0	\N	\N	\N
1561	JNITAZR50Z0012792	V633393413	\N	JNITAZR50Z0012792	\N	2001	\N	\N	2013-04-11	\N	UA 5543	K-2	\N	\N	0	\N	\N	\N
1593	5059463	1959143	\N	5059463	\N	1996	\N	\N	2013-04-11	\N	PG 4415	X-1	\N	\N	0	\N	\N	\N
1599	12587	AB01468	\N	12587	\N	1998	\N	\N	2013-04-12	\N	SF 8600	R-2	\N	\N	0	\N	\N	\N
1574	VF644ALM000000221	10518059	\N	VF644ALM000000221	\N	2008	\N	\N	2013-04-11	\N	BPFX 83	B-3	\N	\N	0	\N	\N	\N
1611	KFT0839	04703K9	\N	KFT0839	\N	1980	\N	\N	2013-04-12	\N	EC 8412	B-3	\N	\N	0	\N	\N	\N
1585	VF3231A3215690711	10CULC6002086	\N	VF3231A3215690711	\N	1999	\N	\N	2013-04-11	\N	SF 8521	J-2	\N	\N	0	\N	\N	\N
1606	\N	1769275	\N	\N	\N	1994	\N	\N	2013-04-12	\N	LJ 2503	J-3	\N	\N	0	\N	\N	\N
1594	VF7232JL21609953	\N	\N	VF7232JL21609953	\N	2001	\N	\N	2013-04-11	\N	CDRL 69	LT-1	\N	\N	0	\N	\N	\N
1575	KMJWAH7HP8U07689	D4BH8020633	\N	KMJWAH7HP8U07689	\N	2008	\N	\N	2013-04-11	\N	BPRW 77	J-1	\N	\N	0	\N	\N	\N
1562	LEFYCG29CHNO852	B9124464	\N	LEFYCG29CHNO852	\N	2012	\N	\N	2013-04-11	2013-04-11	DRXY 54	JX-2	\N	\N	0	\N	\N	\N
1586	VF622AXA0P0000162	83M0385448	\N	VF622AXA0P0000162	\N	2000	\N	\N	2013-04-11	\N	UB 2090	H-1	\N	\N	0	\N	\N	\N
1563	VF6JE13AC00008188	83M0301899	\N	VF6JE13AC00008188	\N	1998	\N	\N	2013-04-11	\N	TD 5050	B-1	\N	\N	0	\N	\N	\N
1576	VF645ACA000002474	5600666972	\N	VF645ACA000002474	\N	2004	\N	\N	2013-04-11	\N	XE 8503	B-1	\N	\N	0	\N	\N	\N
1620	KFT0936	13250	\N	KFT0936	\N	1980	\N	\N	2013-04-16	\N	EU 3923	B-4	\N	\N	0	\N	\N	\N
1600	RN85-5124397	22R4000576	\N	RN85-5124397	\N	1995	\N	\N	2013-04-12	\N	NA 7580	J-3	\N	\N	0	\N	\N	\N
1564	1HTMNAAM32H412382	H412382	\N	1HTMNAAM32H412382	\N	2002	\N	\N	2013-04-11	\N	BCZB 11	R-1	\N	\N	0	\N	\N	\N
1595	KMHJM81P9U05546	\N	\N	KMHJM81P9U05546	\N	2009	\N	\N	2013-04-11	\N	BZTZ 39	K-0	\N	\N	0	\N	\N	\N
1577	VF6JE16ACA0000879	5600565125	\N	VF6JE16ACA0000879	\N	1995	\N	\N	2013-04-11	\N	FBZD 22	BX-1	\N	\N	0	\N	\N	\N
1565	VF643ACA000007948	83M0610341	\N	VF643ACA000007948	\N	2004	\N	\N	2013-04-11	\N	YD 1832	B-2	\N	\N	0	\N	\N	\N
1587	10247	2548899	\N	10247	\N	1998	\N	\N	2013-04-11	\N	TE 5080	HX-1	\N	\N	0	\N	\N	\N
1615	VF644ALM000000686	10726324	\N	VF644ALM000000686	\N	2008	\N	\N	2013-04-12	\N	BZDZ 96	B-2	\N	\N	0	\N	\N	\N
1607	VF6JE13AC00008185	\N	\N	VF6JE13AC00008185	\N	1998	\N	\N	2013-04-12	\N	TD 5047	B-3	\N	\N	0	\N	\N	\N
1566	JMYJNP13VXA001894	4G63AP1685	\N	JMYJNP13VXA001894	\N	2000	\N	\N	2013-04-11	\N	TR 1437	J-2	\N	\N	0	\N	\N	\N
1578	1FDHS34L3GHA2660	D8TE-AB26604	\N	1FDHS34L3GHA2660	\N	1986	\N	\N	2013-04-11	\N	DU 3474	RH-1	\N	\N	0	\N	\N	\N
1596	KMJWA37JACU445688	D4CBB959069	\N	KMJWA37JACU445688	\N	2012	\N	\N	2013-04-12	\N	DFHD 52	K-1	\N	\N	0	\N	\N	\N
1588	522495	04183-E-H	\N	522495	\N	1987	\N	\N	2013-04-11	\N	RF 3539	BR	\N	\N	0	\N	\N	\N
1567	VF644ALM000000201	10488214	\N	VF644ALM000000201	\N	2008	\N	\N	2013-04-11	\N	BPFX 77	B-3	\N	\N	0	\N	\N	\N
1579	8AC903662CE053569	61198170129834	\N	8AC903662CE053569	\N	2012	\N	\N	2013-04-11	\N	DLRJ 63	R-1	\N	\N	0	\N	\N	\N
1601	KFT0167	\N	\N	KFT0167	\N	1974	\N	\N	2013-04-12	\N	GN 4723	BX-4	\N	\N	0	\N	\N	\N
1568	38503614453604	40291110146166	\N	38503614453604	\N	1979	\N	\N	2013-04-11	\N	FBZD 51	R-3	\N	\N	0	\N	\N	\N
1612	\N	WVX02794	\N	\N	\N	2011	\N	\N	2013-04-12	\N	TE 7377	K-1	\N	\N	0	\N	\N	\N
1589	KPACAIETSCP1258	67196010502122	\N	KPACAIETSCP1258	\N	2012	\N	\N	2013-04-11	\N	DXRK 84	K-1	\N	\N	0	\N	\N	\N
1580	9BM688133TB88191	374980-10-310319	\N	9BM688133TB88191	\N	2011	\N	\N	2013-04-11	\N	FBZD 43	B-2	\N	\N	0	\N	\N	\N
1569	AVH403	3520160601	\N	AVH403	\N	1973	\N	\N	2013-04-11	\N	FBZD 34	B-4	\N	\N	0	\N	\N	\N
175	KFT1151	\N	\N	KFT1151	\N	1982	16000	\N	2013-01-29	2013-04-12	FCFG54-7	B-6	\N	\N	0	\N	\N	\N
1597	1GCDS9C9388112256	CB8112256	\N	1GCDS9C9388112256	\N	2012	\N	\N	2013-04-12	\N	DPYC 12	K-1	\N	\N	0	\N	\N	\N
1570	3HAMKAAR0DL184309	466HM2N8010843	\N	3HAMKAAR0DL184309	\N	2013	\N	\N	2013-04-11	\N	FGRG 14	T-1	\N	\N	0	\N	\N	\N
1581	14337	5000344178	\N	14337	\N	1983	\N	\N	2013-04-11	\N	BH 9524	BX-2	\N	\N	0	\N	\N	\N
871	CBNB-1	83M0269923\t	\N	CBNB-1	\N	1996	\N	\N	2013-02-28	2013-04-11	SP 8058	B-1	\N	\N	0	\N	\N	\N
1590	8GGTFRK817A1590	446520	\N	8GGTFRK817A1590	\N	2007	\N	\N	2013-04-11	\N	UW 7360	K-2	\N	\N	0	\N	\N	\N
1571	\N	TD42010078T	\N	\N	\N	1997	\N	\N	2013-04-11	\N	PT 2890	B-1	\N	\N	0	\N	\N	\N
1618	VF643ACA000007334	83M0542412	\N	VF643ACA000007334	\N	2002	\N	\N	2013-04-16	\N	VU 6422	H-1	\N	\N	0	\N	\N	\N
810	YV1745886L2243425	\N	\N	YV1745886L2243425	\N	1990	\N	\N	2013-02-25	2013-04-12	DDBR 58	K-2	\N	\N	0	\N	\N	\N
1572	\N	D4BF1136559	\N	\N	\N	2002	\N	\N	2013-04-11	\N	UP 2972	J-2	\N	\N	0	\N	\N	\N
1582	KMJWA37KACU494212	D4CBC066549	\N	KMJWA37KACU494212	\N	2013	\N	\N	2013-04-11	\N	CBGY 84	J-1	\N	\N	0	\N	\N	\N
1573	\N	402717	\N	\N	\N	1987	\N	\N	2013-04-11	\N	TS 7344	K-1	\N	\N	0	\N	\N	\N
1608	9033200005	\N	\N	9033200005	\N	2011	\N	\N	2013-04-12	\N	DFWV 41	R-3	\N	\N	0	\N	\N	\N
1602	\N	ICW9425A	\N	\N	\N	1950	\N	\N	2013-04-12	\N	FCFG 42	JX-4	\N	\N	0	\N	\N	\N
1591	8AC9036728A97729	61198170071375	\N	8AC9036728A97729	\N	2008	\N	\N	2013-04-11	\N	BFCX 69	J-1	\N	\N	0	\N	\N	\N
1583	VF6JP1200014514	2884	\N	VF6JP1200014514	\N	1985	\N	\N	2013-04-11	\N	UB 4470	B-2	\N	\N	0	\N	\N	\N
1584	\N	F121973	\N	\N	\N	1968	\N	\N	2013-04-11	\N	HA 7819	Z-2	\N	\N	0	\N	\N	\N
1598	VF3YCAMFC11991698	10TRJ10469890	\N	VF3YCAMFC11991698	\N	2012	\N	\N	2013-04-12	\N	DFHD 48	R-1	\N	\N	0	\N	\N	\N
1592	9BM3840787B49285	924919U0592435	\N	9BM3840787B49285	\N	2008	\N	\N	2013-04-11	\N	BBZF 95	J-2	\N	\N	0	\N	\N	\N
1616	\N	04271	\N	\N	\N	1979	\N	\N	2013-04-12	\N	ND 1383	BX-2	\N	\N	0	\N	\N	\N
1613	VF643ACA000007984	83M0612073	\N	VF643ACA000007984	\N	2004	\N	\N	2013-04-12	\N	YD 1829	B-1	\N	\N	0	\N	\N	\N
1603	L4002324	H500322	\N	L4002324	\N	1965	\N	\N	2013-04-12	\N	FCFG 43	JX-1	\N	\N	0	\N	\N	\N
1609	VF644BHM000002064	11226345	\N	VF644BHM000002064	\N	2012	\N	\N	2013-04-12	\N	FCJT 99	B-6	\N	\N	0	\N	\N	\N
1625	1800162201	404113059489	\N	1800162201	\N	1978	\N	\N	2013-04-16	\N	FBFC 68	BX-1	\N	\N	0	\N	\N	\N
1622	KMJWH7HP7U798010	D4BH7408541	\N	KMJWH7HP7U798010	\N	2007	\N	\N	2013-04-16	\N	PW 1691	K-1	\N	\N	0	\N	\N	\N
1614	FD6022130	\N	\N	FD6022130	\N	1969	\N	\N	2013-04-12	\N	ND 1384	BX-1	\N	\N	0	\N	\N	\N
1604	\N	984008	\N	\N	\N	1989	\N	\N	2013-04-12	\N	DK 7197	J-6	\N	\N	0	\N	\N	\N
1610	1128	83M0241108	\N	1128	\N	1996	\N	\N	2013-04-12	\N	PP 6609	B-2	\N	\N	0	\N	\N	\N
1605	\N	989601	\N	\N	\N	1994	\N	\N	2013-04-12	\N	DS 4656	JX-3	\N	\N	0	\N	\N	\N
1619	32203210602	352-6 	\N	32203210602	\N	1969	\N	\N	2013-04-16	\N	EU 3927	F-1	\N	\N	0	\N	\N	\N
1617	VF643ACA000007323	83M0540925	\N	VF643ACA000007323	\N	2002	\N	\N	2013-04-16	\N	VU 6420	BQ-2	\N	\N	0	\N	\N	\N
1621	32203210602368	35234910002916	\N	32203210602368	\N	1969	\N	\N	2013-04-16	\N	EU 3924	B-0	\N	\N	0	\N	\N	\N
1624	4632	MIDR60212D	\N	4632	\N	1987	\N	\N	2013-04-16	\N	BRRK 98	BKF-3	\N	\N	0	\N	\N	\N
1623	31491	7450306	\N	31491	\N	1990	\N	\N	2013-04-16	\N	CF 8809	R-2	\N	\N	0	\N	\N	\N
1626	JTFDE626400058708	3L5085854	\N	JTFDE626400058708	\N	2001	\N	\N	2013-04-16	\N	UN 2409	K-1	\N	\N	0	\N	\N	\N
1627	VFGJP1A1200015295	A600687	\N	VFGJP1A1200015295	\N	1984	\N	\N	2013-04-16	\N	ST 2353	BKF-1	\N	\N	0	\N	\N	\N
1628	LG81-07448	P-5878	\N	LG81-07448	\N	1968	\N	\N	2013-04-16	\N	LS 7402	B-2	\N	\N	0	\N	\N	\N
1629	VFGJE13AC00009244	83M0440748	\N	VFGJE13AC00009244	\N	2000	\N	\N	2013-04-16	\N	UT 8114	BR-3	\N	\N	0	\N	\N	\N
1630	KMFFD27FPYU439484	D4BFX789437	\N	KMFFD27FPYU439484	\N	2000	\N	\N	2013-04-16	\N	TV 8082	R-3	\N	\N	0	\N	\N	\N
1631	10990	28306FC	\N	10990	\N	1983	\N	\N	2013-04-16	\N	LS 7405	B-3	\N	\N	0	\N	\N	\N
1632	7267	83MO3226587	\N	7267	\N	1995	\N	\N	2013-04-16	\N	RR 9751	B-1	\N	\N	0	\N	\N	\N
1634	\N	23107	\N	\N	\N	1981	\N	\N	2013-04-16	\N	FC 3394	BX-2	\N	\N	0	\N	\N	\N
1633	VF645ACA000008363 	83M0684876	\N	VF645ACA000008363	\N	2006	\N	\N	2013-04-16	\N	WK 6315	B-2	\N	\N	0	\N	\N	\N
1635	VF6JE13AC00008933 	83M0386114	\N	VF6JE13AC00008933	\N	2000	\N	\N	2013-04-16	\N	UB 2096	B-4	\N	\N	0	\N	\N	\N
430	VF6JEL6AC00001018	83M0220012	\N	VF6JEL6AC00001018	\N	1995	\N	\N	2013-02-06	2013-04-17	SL 2885	B-6	\N	\N	0	\N	\N	\N
1367	1HTWCAZR1DJ255560	570HM2U2200763	\N	1HTWCAZR1DJ255560	\N	2013	19958	\N	2013-03-26	2013-04-16	FPLS 47	Z-2	\N	\N	0	\N	\N	\N
1655	416080H139745	V345917243	\N	416080H139745	\N	1971	\N	\N	2013-04-18	\N	EC 4433	Z-1	\N	\N	0	\N	\N	\N
431	1P9CT02J8HA040283	PBV18234	\N	1P9CT02J8HA040283	\N	1987	\N	\N	2013-02-06	2013-04-17	DJDY 46	B-7	\N	\N	0	\N	\N	\N
1636	32203210602336	35294910002910	\N	32203210602336	\N	1969	\N	\N	2013-04-17	\N	EU 3926	BX-1	\N	\N	0	\N	\N	\N
1683	VF6JE13AC00008469	83M0340301	\N	VF6JE13AC00008469	\N	1998	\N	\N	2013-04-22	\N	TV 4422	B-1	\N	\N	0	\N	\N	\N
17	VF6JS00A000002939	003462	3462	VF6JS00A000002939	\N	1985	1000	\N	2012-11-28	2013-04-18	DYXP53-7	B2	\N	\N	0	VF6JS00A000002939	\N	\N
1647	72001	7197	\N	72001	\N	2001	\N	\N	2013-04-17	\N	UG 9805	H-0	\N	\N	0	\N	\N	\N
1637	VF6JE13AC00008387	83M0317162	\N	VF6JE13AC00008387	\N	1998	\N	\N	2013-04-17	\N	TD 5443	B-2	\N	\N	0	\N	\N	\N
433	VF645ACA000010158	83M0716157	\N	VF645ACA000010158	\N	2007	\N	\N	2013-02-06	2013-04-17	MX 4340	B-1	\N	\N	0	\N	\N	\N
1665	VF6JE13AC00008410	83M0318843 	\N	VF6JE13AC00008410	\N	1998	\N	\N	2013-04-22	\N	TD 5762	B-1	\N	\N	0	\N	\N	\N
1656	V3411141	494925	\N	V3411141	\N	1980	\N	\N	2013-04-18	\N	FCDY 36	R-1	\N	\N	0	\N	\N	\N
435	VF622AXAOP0000043	83M0300673	\N	VF622AXAOP0000043	\N	2000	\N	\N	2013-02-06	2013-04-17	TE 5085	H-3	\N	\N	0	\N	\N	\N
1638	FL68001888	PF5695 	\N	FL68001888	\N	1964	\N	\N	2013-04-17	\N	RG 5552	B-0	\N	\N	0	\N	\N	\N
1648	3220331062041	2121881102	\N	3220331062041	\N	1969	\N	\N	2013-04-17	\N	FCDY 31	BX-0	\N	\N	0	\N	\N	\N
12	VF6JS00A000009075	12866	12866	VF6JS00A000009075	\N	1991	1000	\N	2012-11-28	2013-04-17	DYXD 23	BX-7	\N	\N	0	MIDR060212V	\N	\N
1639	LGWCA2172BA600458	D100235227	\N	LGWCA2172BA600458	\N	2010	\N	\N	2013-04-17	\N	CGXK 15	K-1	\N	\N	0	\N	\N	\N
1680	F35L0E46449	BBEA-8425-B	\N	F35L0E46449	\N	1960	\N	\N	2013-04-22	\N	UB 4469	BR-1	\N	\N	0	\N	\N	\N
1676	\N	58144000	\N	\N	\N	2013	\N	\N	2013-04-22	\N	FFZP 43	R-1	\N	\N	0	\N	\N	\N
432	ZCFA1MM1302531096	518526	\N	ZCFA1MM1302531096	\N	2009	\N	\N	2013-02-06	2013-04-17	BYTP 60	M-0	\N	\N	0	\N	\N	\N
1660	MHYDN71B4AJ303103	G16AID169208	\N	MHYDN71B4AJ303103	\N	2010	\N	\N	2013-04-18	\N	CGGV 16	K-1	\N	\N	0	\N	\N	\N
1657	VF644AHM000001658	11194842	\N	VF644AHM000001658	\N	2012	\N	\N	2013-04-18	\N	DZXR 96	BXR-1	\N	\N	0	\N	\N	\N
1649	4S7CT2B90BC074482	73229790	\N	4S7CT2B90BC074482	\N	2012	\N	\N	2013-04-17	\N	DRDT 58	Q-2	\N	\N	0	\N	\N	\N
1641	FE6-030100B	\N	\N	FE6-030100B	\N	1970	\N	\N	2013-04-17	\N	PN 8628	B-2	\N	\N	0	\N	\N	\N
1643	1FDKE30M9MHA07269	\N	\N	1FDKE30M9MHA07269	\N	1989	\N	\N	2013-04-17	\N	SL 5812	X-3	\N	\N	0	\N	\N	\N
1640	VF6A5ACA000007806	83M0677446	\N	VF6A5ACA000007806	\N	2005	\N	\N	2013-04-17	2013-04-17	WC 2841	B-1	\N	\N	0	\N	\N	\N
1644	JN1CPGD22U0077726	YD25242849A	\N	JN1CPGD22U0077726	\N	2008	\N	\N	2013-04-17	\N	BHZY 24	K-1	\N	\N	0	\N	\N	\N
1650	VF6JE13AC00008154	83M0300278 	\N	VF6JE13AC00008154	\N	1998	\N	\N	2013-04-17	\N	TD 4995	B-5	\N	\N	0	\N	\N	\N
1642	3HAMMAAN4DL248536	466HM2U2200729	\N	3HAMMAAN4DL248536	\N	2013	\N	\N	2013-04-17	\N	FJHJ 77	R-4	\N	\N	0	\N	\N	\N
1661	30905213130731	\N	\N	30905213130731	\N	1973	\N	\N	2013-04-18	\N	BBFZ 77	R-2	\N	\N	0	\N	\N	\N
427	4S7CT2D97CC074669	211030-01	\N	4S7CT2D97CC074669	\N	2012	\N	\N	2013-02-06	2013-04-17	DSFK 72	R-4	\N	\N	0	\N	\N	\N
1645	KMJHG17PPCC055718	D4DDC508556	\N	KMJHG17PPCC055718	\N	2012	\N	\N	2013-04-17	\N	DVCC 75	J-1	\N	\N	0	\N	\N	\N
429	VF3ZCRMNC17402473	10DZ304011338	\N	VF3ZCRMNC17402473	\N	2004	\N	\N	2013-02-06	2013-04-17	XY 2256	S-5	\N	\N	0	\N	\N	\N
1685	CBPICHR-1	\N	\N	CBPICHR-1	\N	1988	\N	\N	2013-04-22	\N	DZ S590	R-1	\N	\N	0	\N	\N	\N
1651	8GGFFSGIAXA072185	572528 	\N	8GGFFSGIAXA072185	\N	1999	\N	\N	2013-04-17	\N	TH 2040	H-5	\N	\N	0	\N	\N	\N
1662	VF645ACA000007737	83M0676565	\N	VF645ACA000007737	\N	2005	16000	\N	2013-04-18	\N	WC 2848	B-4	\N	\N	0	\N	\N	\N
1646	VF323B5215542951	10FZ710226644 	\N	VF323B5215542951	\N	1998	\N	\N	2013-04-17	\N	SV 6023	LT-1	\N	\N	0	\N	\N	\N
1674	KFT0221	5066	\N	KFT0221	\N	1976	\N	\N	2013-04-22	\N	EG 8684	RH-7	\N	\N	0	\N	\N	\N
1652	VF6JE13AE40008446	83M0335585 	\N	VF6JE13AE40008446	\N	1999	\N	\N	2013-04-18	\N	TG 7791	B-1	\N	\N	0	\N	\N	\N
1681	\N	21879B 	\N	\N	\N	1975	\N	\N	2013-04-22	\N	CU 6486	K-1	\N	\N	0	\N	\N	\N
1659	KMFFD27GPYU446223	G4CSX595657	\N	KMFFD27GPYU446223	\N	2000	\N	\N	2013-04-18	\N	TS 9789	R-1	\N	\N	0	\N	\N	\N
1677	KMJWWH7HP6U745634	D4BH6293398	\N	KMJWWH7HP6U745634	\N	2006	\N	\N	2013-04-22	\N	WK 9042	J-1	\N	\N	0	\N	\N	\N
1663	VF640ACD000004940	83M0280460	\N	VF640ACD000004940	\N	1997	\N	\N	2013-04-18	\N	SZ 1871	H-5	\N	\N	0	\N	\N	\N
1653	1151	\N	\N	1151	\N	1962	\N	\N	2013-04-18	\N	FCDY 37	B-2	\N	\N	0	\N	\N	\N
1654	YN67-00078	4Y0062772	\N	YN67-00078	\N	1987	\N	\N	2013-04-18	\N	EC 4454	K-1	\N	\N	0	\N	\N	\N
1664	7100622	107135	\N	7100622	\N	1992	\N	\N	2013-04-19	\N	DT 2614	K-1	\N	\N	0	\N	\N	\N
1687	KFT0660	0866	\N	KFT0660	\N	1979	\N	\N	2013-04-22	\N	EC 1014	B-8	\N	\N	0	\N	\N	\N
1684	VF3ZBAMMB17832884	10DYTR3038383	\N	VF3ZBAMMB17832884	\N	2007	\N	\N	2013-04-22	\N	RW 7714	J-1	\N	\N	0	\N	\N	\N
1658	1002	83M0221901	\N	1002	\N	1968	\N	\N	2013-04-18	2013-04-18	SL 2892	B-1	\N	\N	0	\N	\N	\N
1673	32203210602350	352949-10-002913	\N	32203210602350	\N	1969	\N	\N	2013-04-22	2013-04-22	EU 3932	B-6	\N	\N	0	\N	\N	\N
1678	VF644BLM000000137	10503168	\N	VF644BLM000000137	\N	2008	\N	\N	2013-04-22	\N	BPFX 72	B-1	\N	\N	0	\N	\N	\N
1682	CBPR-1	\N	\N	CBPR-1	\N	2013	\N	\N	2013-04-22	\N	FFZP 44	R-1	\N	\N	0	\N	\N	\N
1675	3N6PD23W7ZK909435	YD25401445T	\N	3N6PD23W7ZK909435	\N	2012	\N	\N	2013-04-22	\N	\N	J-1	\N	\N	0	\N	\N	\N
1679	LB80S38160	\N	\N	LB80S38160	\N	1973	\N	\N	2013-04-22	\N	\N	BX-1	\N	\N	0	\N	\N	\N
1689	VF6JP1A12000184	5000204889	\N	VF6JP1A12000184	\N	1987	\N	\N	2013-04-22	\N	BBFZ 97	B-1	\N	\N	0	\N	\N	\N
1688	\N	83M0687672	\N	\N	\N	2006	\N	\N	2013-04-22	\N	WE 6741	B-1	\N	\N	0	\N	\N	\N
1686	VF644ALM000000785	10787756	\N	VF644ALM000000785	\N	2009	\N	\N	2013-04-22	\N	CGCH 11	B-7	\N	\N	0	\N	\N	\N
1691	JDR420342289	6BF129017	\N	JDR420342289	\N	1985	\N	\N	2013-04-22	\N	YX 3009	B-3	\N	\N	0	\N	\N	\N
1690	VF645ACA0000085	83M0687711	\N	VF645ACA0000085	\N	2005	\N	\N	2013-04-22	\N	WE 6742	B-2	\N	\N	0	\N	\N	\N
1692	JDR4203422969	6BF1	\N	JDR4203422969	\N	1985	\N	\N	2013-04-22	\N	UN 2184	B-4	\N	\N	0	\N	\N	\N
1693	FF174A30040	EH700153248	\N	FF174A30040	\N	1984	\N	\N	2013-04-22	\N	BBFZ 93	M-4	\N	\N	0	\N	\N	\N
1694	FG160401218	PF017273	\N	FG160401218	\N	1986	\N	\N	2013-04-22	\N	SR 4313	CR-4	\N	\N	0	\N	\N	\N
1695	VF6JS00A000008959	\N	\N	VF6JS00A000008959	\N	1991	\N	\N	2013-04-22	\N	FBFC 38	B-1	\N	\N	0	\N	\N	\N
1696	VF644ALM000000805	10794409	\N	VF644ALM000000805	\N	2009	\N	\N	2013-04-22	\N	CHRD 65	B-11	\N	\N	0	\N	\N	\N
1697	9041	83M0314979	\N	9041	\N	1998	\N	\N	2013-04-22	\N	TG 7785	B-3	\N	\N	0	\N	\N	\N
1672	1FTJW35HXSEA63213	63213 	\N	1FTJW35HXSEA63213	\N	1995	\N	\N	2013-04-22	2013-04-30	NL 6485	Z-3	\N	\N	0	\N	\N	\N
1698	9059	12826 EL	\N	9059	\N	1990	\N	\N	2013-04-22	\N	KA 1978	B-4	\N	\N	0	\N	\N	\N
1699	ZCFB1JM9302556439	RA06660942	\N	ZCFB1JM9302556439	\N	2011	\N	\N	2013-04-22	\N	DWZS 25	B-5	\N	\N	0	\N	\N	\N
1700	823	525163	\N	823	\N	1994	\N	\N	2013-04-22	\N	ND 1386	B-6	\N	\N	0	\N	\N	\N
1701	1014	83M0219304	\N	1014	\N	1995	\N	\N	2013-04-22	\N	PD 2290	B-8	\N	\N	0	\N	\N	\N
1713	3N6DD23T5ZK876315	KA24-488987A	\N	3N6DD23T5ZK876315	\N	2010	\N	\N	2013-04-23	\N	CXRX 58	K-01	\N	\N	0	\N	\N	\N
1723	94025-4	526081	\N	94025-4	\N	1994	\N	\N	2013-04-23	\N	ND 1385	RH-5	\N	\N	0	\N	\N	\N
1702	VF645ACA000007709	83M0676199	\N	VF645ACA000007709	\N	2005	\N	\N	2013-04-23	\N	WC 2853	B-9	\N	\N	0	\N	\N	\N
1714	\N	13061	\N	\N	\N	1993	\N	\N	2013-04-23	\N	KJ 4779	K-1	\N	\N	0	\N	\N	\N
1751	WVM05610016652	6149615112361	\N	WVM05610016652	\N	1985	12800	\N	2013-04-25	\N	DXBK 77	BX-2	\N	\N	0	\N	\N	\N
1732	VF3232B2215272324	10HJR73003273	\N	VF3232B2215272324	\N	1997	\N	\N	2013-04-24	\N	PA 8773	RX-3	\N	\N	0	\N	\N	\N
1703	9062	012833EL	\N	9062	\N	1990	\N	\N	2013-04-23	\N	KA 1979	BR-0	\N	\N	0	\N	\N	\N
1739	F.60.IK.400290 	\N	\N	F.60.IK.400290 	\N	1963	\N	\N	2013-04-24	\N	\N	BX-1	\N	\N	0	\N	\N	\N
1715	KMFFD27GPVU284979	G4CST029327	\N	KMFFD27GPVU284979	\N	1997	\N	\N	2013-04-23	\N	PX 7788	LT-0	\N	\N	0	\N	\N	\N
1704	VF6JE13C00009045	83M0401395	\N	VF6JE13C00009045	\N	2000	\N	\N	2013-04-23	\N	UB 9595	F-1	\N	\N	0	\N	\N	\N
1724	ZFA250000A16455483	984515	\N	ZFA250000A1645548	\N	2009	\N	\N	2013-04-23	\N	CSFZ 58	X-4	\N	\N	0	\N	\N	\N
1754	81401	83M0297539	\N	81401	\N	1997	\N	\N	2013-04-25	\N	TA 4509	BR-1	\N	\N	0	\N	\N	\N
1716	4115	CCR 1801	\N	4115	\N	1987	\N	\N	2013-04-23	\N	ND 1381	Q-2	\N	\N	0	\N	\N	\N
1705	1108	83M0236961	\N	1108	\N	1996	\N	\N	2013-04-23	\N	PU 5330	F-7	\N	\N	0	\N	\N	\N
1733	VF6JE13AC00008473	83M01340752	\N	VF6JE13AC00008473	\N	1998	\N	\N	2013-04-24	\N	TV 4424	B-3	\N	\N	0	\N	\N	\N
1725	3AM68514550036129	39090051257557	\N	3AM68514550036129	\N	1996	\N	\N	2013-04-23	\N	PG 9112	Z-0	\N	\N	0	\N	\N	\N
1706	9153	50195EM	\N	9153	\N	1991	\N	\N	2013-04-23	\N	KA 1980	H-0	\N	\N	0	\N	\N	\N
1717	1HTSLAAAM 8YH314261	314261	\N	1HTSLAAAM 8YH3142	\N	2000	\N	\N	2013-04-23	\N	BKDT 54	R-3	\N	\N	0	\N	\N	\N
1748	3N1CCUD21Z0400137	KA24803916	\N	3N1CCUD21Z0400137	\N	2011	\N	\N	2013-04-25	\N	NT 5809	G-2	\N	\N	0	\N	\N	\N
1740	JMYHNP15W1A001397 	4D56KH1764	\N	JMYHNP15W1A001397	\N	2002	\N	\N	2013-04-24	\N	US 2575	J-1	\N	\N	0	\N	\N	\N
1726	1HTWCAZR5DJ255562	202200937	\N	1HTWCAZR5DJ255562	\N	2013	\N	\N	2013-04-23	\N	DZGB 67	Z-2	\N	\N	0	\N	\N	\N
1734	VF6JE13AC00008177	83M0301517	\N	VF6JE13AC00008177	\N	1998	\N	\N	2013-04-24	\N	TD 5044	B-4	\N	\N	0	\N	\N	\N
1708	3ALACYDJ5CDBP2055	9069800885060	\N	3ALACYDJ5CDBP2055	\N	2012	\N	\N	2013-04-23	\N	FCFD 19	H-8	\N	\N	0	\N	\N	\N
1761	8169	83M0301364	\N	8169	\N	1998	\N	\N	2013-04-25	\N	TD 5038	B-1	\N	\N	0	\N	\N	\N
1741	\N	0024967D 	\N	\N	\N	1995	\N	\N	2013-04-24	\N	XX 5903	B-1	\N	\N	0	\N	\N	\N
1727	43575	43575	\N	43575	\N	1976	\N	\N	2013-04-23	\N	ND 1388	Z-8	\N	\N	0	\N	\N	\N
1718	VF64AEB000000924	83M0362173	\N	VF64AEB000000924	\N	1999	\N	\N	2013-04-23	2013-04-23	TV 3726	BR-5	\N	\N	0	\N	\N	\N
1707	VF622AXA000101939	83M0440459	\N	VF622AXA000101939	\N	2001	\N	\N	2013-04-23	2013-04-23	UY 2080	H-4	\N	\N	0	\N	\N	\N
1752	VF644BLM000000160	10528765	\N	VF644BLM000000160	\N	2008	\N	\N	2013-04-25	\N	BRDJ 93	B-1	\N	\N	0	\N	\N	\N
1735	8AJFR226964504455	2KD9471016	\N	8AJFR226964504455	\N	2006	\N	\N	2013-04-24	\N	YT 3142	K-1	\N	\N	0	\N	\N	\N
1719	1FDWE35FX3HB96184	\N	\N	1FDWE35FX3HB96184	\N	2003	\N	\N	2013-04-23	\N	DDFB 26	RH-9	\N	\N	0	\N	\N	\N
1709	VF6JE13AC00008928	83M0386407	\N	VF6JE13AC00008928	\N	2000	\N	\N	2013-04-23	\N	UB 2093	H-9	\N	\N	0	\N	\N	\N
1728	VF6JE16AC00000909	5600565125	\N	VF6JE16AC00000909	\N	1995	\N	\N	2013-04-24	\N	TJ 1466	B-1	\N	\N	0	\N	\N	\N
1710	71340	231254	\N	71340	\N	1995	\N	\N	2013-04-23	\N	LE 6823	J-6	\N	\N	0	\N	\N	\N
1720	1FDWE35F13HB96185	\N	\N	1FDWE35F13HB96185	\N	2003	\N	\N	2013-04-23	\N	DDFB 25	RH-6	\N	\N	0	\N	\N	\N
1749	VF6JEL6AC00001011	83M0218586	\N	VF6JEL6AC00001011	\N	1995	\N	\N	2013-04-25	\N	SK 3508	B-1	\N	\N	0	\N	\N	\N
1742	\N	5600534367	\N	\N	\N	1992	\N	\N	2013-04-24	\N	XX 5904	B-2	\N	\N	0	\N	\N	\N
1711	KMJFD27GPTU232871	G4CSS860437	\N	KMJFD27GPTU232871	\N	1996	\N	\N	2013-04-23	\N	NR 8585	J-9	\N	\N	0	\N	\N	\N
1736	VF644BLM000000203 	10568237	\N	VF644BLM000000203	\N	2008	\N	\N	2013-04-24	\N	BTHK 12	B-1	\N	\N	0	\N	\N	\N
1721	VF644ALM000000797	10789988	\N	VF644ALM000000797	\N	2009	\N	\N	2013-04-23	\N	CGBS 71	RH-2	\N	\N	0	\N	\N	\N
1729	VF644BLM000000164	10531099	\N	VF644BLM000000164	\N	2008	\N	\N	2013-04-24	\N	BRDJ 83	BR-1	\N	\N	0	\N	\N	\N
1712	3N6DD23T2ZK876952	KA24-486871A	\N	3N6DD23T2ZK876952	\N	2010	\N	\N	2013-04-23	\N	CXRX 59	K-02	\N	\N	0	\N	\N	\N
1755	\N	4663683	\N	\N	\N	1987	\N	\N	2013-04-25	\N	BN 6829	S-1	\N	\N	0	\N	\N	\N
1743	\N	83M0690210 	\N	\N	\N	2006	\N	\N	2013-04-24	\N	WE 6743	B-3	\N	\N	0	\N	\N	\N
1730	VF6JS00A000009073	012852	\N	VF6JS00A000009073	\N	1990	\N	\N	2013-04-24	\N	FD 6728	H-2	\N	\N	0	\N	\N	\N
1722	1GDJR34W8JJ502109	\N	\N	1GDJR34W8JJ502109	\N	1987	\N	\N	2013-04-23	\N	TP 9597	RH-4	\N	\N	0	\N	\N	\N
1737	VF6JE13AC00008180 	83M0301610 	\N	VF6JE13AC00008180	\N	1998	\N	\N	2013-04-24	\N	TD 5052	B-2	\N	\N	0	\N	\N	\N
1753	CBCHBX-1	\N	\N	CBCHBX-1	\N	1982	\N	\N	2013-04-25	\N	\N	BX-1	\N	\N	0	\N	\N	\N
1744	\N	3U001093 	\N	\N	\N	1972	\N	\N	2013-04-25	\N	FU 3555	B-4	\N	\N	0	\N	\N	\N
1750	VF644BLM000000678	10789611	\N	VF644BLM000000678	\N	2009	\N	\N	2013-04-25	\N	CGJD 24	B-2	\N	\N	0	\N	\N	\N
1731	KMJWVH7HP7U819595	D4BH7442469	\N	KMJWVH7HP7U819595	\N	2007	\N	\N	2013-04-24	\N	BBGV 15	AR-3	\N	\N	0	\N	\N	\N
1758	VF644BLM000000157	10527258	\N	VF644BLM000000157	\N	2008	\N	\N	2013-04-25	\N	BRDJ 82	B-2	\N	\N	0	\N	\N	\N
1738	1GNGK26K0SJ455383 	NSJ455383 	\N	1GNGK26K0SJ455383	\N	1996	\N	\N	2013-04-24	\N	LT 9891	R-1	\N	\N	0	\N	\N	\N
1766	KFT1156	\N	\N	KFT1156	\N	1981	\N	\N	2013-04-25	\N	GC 8056	B-5	\N	\N	0	\N	\N	\N
1759	CB100677	14095LA	\N	CB100677	\N	1984	\N	\N	2013-04-25	\N	CXGJ 52	B-3	\N	\N	0	\N	\N	\N
1745	012758T	CWG108813	\N	012758T	\N	1998	\N	\N	2013-04-25	\N	RZ 7881	R-4	\N	\N	0	\N	\N	\N
610	\N	5600457078	\N	\N	\N	1985	\N	\N	2013-02-19	2013-04-25	LG 3929	BF-2	\N	\N	0	\N	\N	\N
1746	\N	20809	\N	\N	\N	1975	\N	\N	2013-04-25	\N	XX 5433	B-6	\N	\N	0	\N	\N	\N
1756	6863250077	292936469	\N	6863250077	\N	1962	\N	\N	2013-04-25	\N	FCFC 57	B-1	\N	\N	0	\N	\N	\N
1763	VF644BLM000000674	10789289	\N	VF644BLM000000674	\N	2009	\N	\N	2013-04-25	\N	CGJD 27	B-2	\N	\N	0	\N	\N	\N
1747	483-0137-1	56009425-F	\N	483-0137-1	\N	1960	\N	\N	2013-04-25	\N	XX 5902	B-5	\N	\N	0	\N	\N	\N
1762	8GGTFRK867A162339	505970	\N	8GGTFRK867A162339	\N	2007	\N	\N	2013-04-25	\N	KW 4671	J-1	\N	\N	0	\N	\N	\N
1760	8GGTFSK937A156059	406911	\N	8GGTFSK937A156059	\N	2007	\N	\N	2013-04-25	\N	WB 4231	K-1	\N	\N	0	\N	\N	\N
166	ZI169680	500344178	\N	ZI169680	\N	1984	16000	\N	2013-01-29	2013-04-25	FCFG 68	BX-2	\N	\N	0	\N	\N	\N
1757	KFT0103	MID062030D	\N	KFT0103	\N	1976	\N	\N	2013-04-25	\N	TJ 1467	BX-1	\N	\N	0	\N	\N	\N
1765	LA7CNA-18304	5G1072554	\N	LA7CNA-18304	\N	1973	\N	\N	2013-04-25	\N	GC 8055	B-4	\N	\N	0	\N	\N	\N
1764	8940	\N	\N	8940	\N	1999	\N	\N	2013-04-25	\N	UB 9591	R-3	\N	\N	0	\N	\N	\N
1767	8GGTFSD5X4A137059	6VD1208234	\N	8GGTFSD5X4A137059	\N	2004	\N	\N	2013-04-25	\N	XX 9694	J-5	\N	\N	0	\N	\N	\N
1768	KFT1064	\N	\N	KFT1064	\N	1981	\N	\N	2013-04-25	\N	153799	R-1	\N	\N	0	\N	\N	\N
1769	VF6JE13AC00008474	83M0341330	\N	VF6JE13AC00008474	\N	1998	\N	\N	2013-04-25	\N	TV 4425	B-1	\N	\N	0	\N	\N	\N
1770	VF644BLM000000156	10527257	\N	VF644BLM000000156	\N	2008	\N	\N	2013-04-25	\N	BRDJ 81	B-2	\N	\N	0	\N	\N	\N
1771	SS13SRC/307	TV8540150	\N	SS13SRC/307	\N	1988	\N	\N	2013-04-25	\N	XU 5628	B-4	\N	\N	0	\N	\N	\N
1772	00098	MID50602123	\N	00098	\N	1993	\N	\N	2013-04-25	\N	SB 2189	B-5	\N	\N	0	\N	\N	\N
1773	4702	MIDR060212D	\N	4702	\N	1987	\N	\N	2013-04-25	\N	SB 2190	H-3	\N	\N	0	\N	\N	\N
1774	8AJFR22G64505091	2KD7015133	\N	8AJFR22G64505091	\N	2006	\N	\N	2013-04-25	\N	YE 3538	K-1	\N	\N	0	\N	\N	\N
1775	VF644BLM000000205	10568248	\N	VF644BLM000000205	\N	2008	\N	\N	2013-04-26	\N	BTHK 13	B-1	\N	\N	0	\N	\N	\N
1823	YN55-0059874	1Y0174364 	\N	YN55-0059874	\N	1987	\N	\N	2013-05-02	\N	GC 7385	K-1	\N	\N	0	\N	\N	\N
1821	VF6JE13AC00008129	83M0294009	\N	VF6JE13AC00008129	\N	1997	\N	\N	2013-05-02	\N	SZ 1869	B-2	\N	\N	0	\N	\N	\N
1793	8AJFR226684530594	\N	\N	8AJFR226684530594	\N	2009	\N	\N	2013-04-30	\N	BDHJ 27	K-1	\N	\N	0	\N	\N	\N
1776	7263	83M0225851	\N	7263	\N	1996	\N	\N	2013-04-26	\N	SL 3220	BX-1	\N	\N	0	\N	\N	\N
1789	VF6JE13AC00008405	83M0319362	\N	VF6JE13AC00008405	\N	1998	\N	\N	2013-04-29	\N	TD 5765	B-2	\N	\N	0	\N	\N	\N
1777	9BFV2UHGX5BB61260	30209651	\N	9BFV2UHGX5BB61260	\N	2006	\N	\N	2013-04-26	\N	XE 5907	Z-1	\N	\N	0	\N	\N	\N
1802	KAJWWH7HPTU782274	\N	\N	KAJWWH7HPTU782274	\N	2007	\N	\N	2013-04-30	\N	WW 5959	J-2	\N	\N	0	\N	\N	\N
1814	VF644BLM000000171	10534265	\N	VF644BLM000000171	\N	2008	\N	\N	2013-05-02	\N	BRDJ 91	B-2	\N	\N	0	\N	\N	\N
1790	VF644BLM000000730	10812719	\N	VF644BLM000000730	\N	2009	\N	\N	2013-04-29	\N	CJKV 76	BX-2	\N	\N	0	\N	\N	\N
1778	353950-10-506940 	\N	\N	353950-10-506940 	\N	1978	\N	\N	2013-04-26	\N	CXGH 70	B-2	\N	\N	0	\N	\N	\N
1794	843225	027713 	\N	843225	\N	1998	\N	\N	2013-04-30	\N	RZ 7467	J-1	\N	\N	0	\N	\N	\N
1779	34966300000000	\N	\N	34966300000000	\N	1976	\N	\N	2013-04-26	\N	CXGJ 60	Z-3	\N	\N	0	\N	\N	\N
1809	KMJFD27GPYU444531	G4CSX591389	\N	KMJFD27GPYU444531	\N	2000	\N	\N	2013-04-30	\N	TS 2618	K-1	\N	\N	0	\N	\N	\N
1795	25429921G	\N	\N	25429921G	\N	1969	\N	\N	2013-04-30	\N	\N	BX-2	\N	\N	0	\N	\N	\N
1780	VF6JS00A000009695	83M0170124\t	\N	VF6JS00A000009695	\N	1994	\N	\N	2013-04-26	\N	CXGJ 62	BX-2	\N	\N	0	\N	\N	\N
1803	KFT0850	81798	\N	KFT0850	\N	1978	\N	\N	2013-04-30	\N	DYXP 34	BX-3	\N	\N	0	\N	\N	\N
1818	KFT1141	MID062030E	\N	KFT1141	\N	1981	\N	\N	2013-05-02	\N	FCDV 74	B-5	\N	\N	0	\N	\N	\N
1666	07MCA	C75EVC57314	\N	07MCA	\N	1969	\N	\N	2013-04-22	2013-04-30	BF 6728	Z-2	\N	\N	0	\N	\N	\N
1781	KFT0102	MID062030D	\N	KFT0102	\N	1976	\N	\N	2013-04-26	\N	FCDV 77	B-3	\N	\N	0	\N	\N	\N
1796	VF644BM000000197	10566778	\N	VF644BM000000197	\N	2008	\N	\N	2013-04-30	\N	BTHK 10	B-1	\N	\N	0	\N	\N	\N
1667	341034-10-014458	341912-10-013203 	\N	341034-10-014458	\N	1972	\N	\N	2013-04-22	2013-04-30	EN 4707	Z-1	\N	\N	0	\N	\N	\N
1669	V34-11474	19628505R 	\N	V34-11474	\N	1980	\N	\N	2013-04-22	2013-04-30	RA 5379	J-2	\N	\N	0	\N	\N	\N
1670	VHE24-510348	Z20897888	\N	VHE24-510348	\N	1995	\N	\N	2013-04-22	2013-04-30	LV 4554	K-1	\N	\N	0	\N	\N	\N
1671	ACP12UNA00996	4G32-HR7250 	\N	ACP12UNA00996	\N	1992	\N	\N	2013-04-22	2013-04-30	LA 4523	RX-1	\N	\N	0	\N	\N	\N
1783	VF643ACA000007332	83M0542153	\N	VF643ACA000007332	\N	2003	\N	\N	2013-04-29	\N	VU 6708	B-1	\N	\N	0	\N	\N	\N
8	VF6JE13AC00007123	83MO193571	\N	VF6JE13AC00007123	\N	1995	1000	\N	2012-11-27	2013-04-29	DZHR77-6	B3	\N	\N	0	VF6JE13AC00007123	\N	\N
1829	15300	004160MB	\N	15300	\N	1985	\N	\N	2013-05-02	\N	GC 2901	B-1	\N	\N	0	\N	\N	\N
1810	VF6JE13AC00008516	83M0347640	\N	VF6JE13AC00008516	\N	1998	\N	\N	2013-04-30	\N	TV 4417	R-1	\N	\N	0	\N	\N	\N
1804	VF6JE13AC00008359	83M0315629	\N	VF6JE13AC00008359	\N	1998	\N	\N	2013-04-30	\N	TD 5448	B-4	\N	\N	0	\N	\N	\N
78	VF6JP1A1200015298	004223	\N	VF6JP1A1200015298	\N	1984	16000	\N	2013-01-25	2013-04-29	DZHS 16	BF-4	\N	\N	0	\N	\N	\N
1797	8AJFR22G784530202	2KD7585343	\N	8AJFR22G784530202	\N	2009	\N	\N	2013-04-30	\N	BKFB 69	K-1	\N	\N	0	\N	\N	\N
161	KFT0179	\N	\N	KFT0179	\N	1970	16000	\N	2013-01-29	2013-04-30	FCFG 62	B-2	\N	\N	0	\N	\N	\N
1784	VF644BLM000000172	10534266	\N	VF644BLM000000172	\N	2008	\N	\N	2013-04-29	\N	BRDJ 92	B-2	\N	\N	0	\N	\N	\N
1825	16624	J696303000	\N	16624	\N	1985	\N	\N	2013-05-02	\N	PN 8627	B-2	\N	\N	0	\N	\N	\N
1815	E0415A	SNF700BVFE7387	\N	E0415A	\N	1980	\N	\N	2013-05-02	\N	HU 9380	BX-2	\N	\N	0	\N	\N	\N
1785	CBFZ-2	\N	\N	\N	\N	1994	\N	\N	2013-04-29	\N	CVJP 27	Z-2	\N	\N	0	\N	\N	\N
1791	VF645ACA000010097	83M0714926	\N	VF645ACA000010097	\N	2006	\N	\N	2013-04-30	\N	WY 8507	B-1	\N	\N	0	\N	\N	\N
1786	\N	153799	\N	\N	\N	1980	\N	\N	2013-04-29	\N	PN 8629	B-5	\N	\N	0	\N	\N	\N
1805	KFT0196	\N	\N	KFT0196	\N	1976	\N	\N	2013-04-30	\N	GN 4718	B-5	\N	\N	0	\N	\N	\N
1798	VF644BHM000002001	11202096	\N	VF644BHM000002001	\N	2012	\N	\N	2013-04-30	\N	FJGJ 73	BX-2	\N	\N	0	\N	\N	\N
1822	VF644BLM000000207	10569313	\N	VF644BLM000000207	\N	2008	\N	\N	2013-05-02	\N	BTHJ 98	R-1	\N	\N	0	\N	\N	\N
1787	KTF1155	05827	\N	KTF1155	\N	1981	\N	\N	2013-04-29	\N	FCDV 76	B-1	\N	\N	0	\N	\N	\N
1792	9BM345305KB839533	34495510987195 	\N	9BM345305KB839533	\N	1989	\N	\N	2013-04-30	\N	GC 9306	Z-1	\N	\N	0	\N	\N	\N
1811	7981	799T1970239	\N	7981	\N	1950	\N	\N	2013-05-02	\N	HU 9382	RELIQUIA	\N	\N	0	\N	\N	\N
882	VF6JE13A000006470	83M0125516	\N	VF6JE13A000006470	\N	1994	\N	\N	2013-02-28	2013-04-30	XZ 8152	BX-1	\N	\N	0	\N	\N	\N
1788	10HJT83001408	15409027	\N	10HJT83001408	\N	1997	\N	\N	2013-04-29	\N	RN 8456	R-1	\N	\N	0	\N	\N	\N
147	VF6JE13AC00007266	83MO226151	\N	VF6JE13AC00007266	\N	1997	16000	\N	2013-01-29	2013-05-02	FCDV75-4	B-3	\N	\N	0	\N	\N	\N
1799	VF644BLM000000155	10527256	\N	VF644BLM000000155	\N	2008	\N	\N	2013-04-30	\N	BRDJ 80	B-1	\N	\N	0	\N	\N	\N
1806	KFT0491	2908	\N	KFT0491	\N	1978	\N	\N	2013-04-30	\N	FCFG 66	B-1	\N	\N	0	\N	\N	\N
1819	TLD440116158	4BAIF536899	\N	TLD440116158	\N	1980	\N	\N	2013-05-02	\N	FCDY 35	BX-5	\N	\N	0	\N	\N	\N
1800	2LAD-8-15482	ENF377-65-30	\N	2LAD-8-15482	\N	1950	\N	\N	2013-04-30	\N	DZBY 10	RELIQUIA	\N	\N	0	\N	\N	\N
1812	3N6DD23T62K877604	KA24493018A	\N	3N6DD23T62K877604	\N	2011	\N	\N	2013-05-02	\N	CPSS 16	K-1	\N	\N	0	\N	\N	\N
1801	11203868	\N	\N	11203868	\N	2009	\N	\N	2013-04-30	\N	BWZD 27	J-1	\N	\N	0	\N	\N	\N
1816	E0415B	SNF700BVFE7388	\N	E0415B	\N	1980	\N	\N	2013-05-02	\N	HU 9379	B-4	\N	\N	0	\N	\N	\N
1807	VF644BLM000000676	10789301	\N	VF644BLM000000676	\N	2009	\N	\N	2013-04-30	\N	CGJD 26	BX-1	\N	\N	0	\N	\N	\N
1813	XE50123US542890P	R3C/312	\N	XE50123US542890P	\N	1988	\N	\N	2013-05-02	\N	FCDY 42	R-1	\N	\N	0	\N	\N	\N
1808	2134101	\N	\N	2134101	\N	1955	\N	\N	2013-04-30	\N	FCFC 59	J-1	\N	\N	0	\N	\N	\N
1826	L78003046	P007308	\N	L78003046	\N	1970	\N	\N	2013-05-02	\N	\N	B-3	\N	\N	0	\N	\N	\N
1820	KFT0670	83375500858	\N	KFT0670	\N	1979	\N	\N	2013-05-02	\N	FX 7293	B-6	\N	\N	0	\N	\N	\N
1817	\N	167546	\N	\N	\N	1996	\N	\N	2013-05-02	\N	GC 7059	J-4	\N	\N	0	\N	\N	\N
1824	VF644BLM000000192	10563081	\N	VF644BLM000000192	\N	2008	\N	\N	2013-05-02	\N	BTHJ 99	B-1	\N	\N	0	\N	\N	\N
1828	VF644BLM000000728	10812320	\N	VF644BLM000000728	\N	2009	\N	\N	2013-05-02	\N	CJKV 75	BX-1	\N	\N	0	\N	\N	\N
1831	RN85-5147588	22R4142423	\N	RN85-5147588	\N	1996	\N	\N	2013-05-02	\N	LT 9888	K-1	\N	\N	0	\N	\N	\N
1830	YHG1L-0074272	3Y-0732153	\N	YHG1L-0074272	\N	1989	\N	\N	2013-05-02	\N	GC 2933	R-1	\N	\N	0	\N	\N	\N
1827	CBLSBX1	\N	\N	CBLSBX1	\N	1959	\N	\N	2013-05-02	\N	\N	BX-1	\N	\N	0	\N	\N	\N
1832	VF6JE13AC00008167	83M0301361	\N	VF6JE13AC00008167	\N	1998	\N	\N	2013-05-03	\N	TD 5036	B-1	\N	\N	0	\N	\N	\N
1833	VF644BLM000000186	10555488	\N	VF644BLM000000186	\N	2008	\N	\N	2013-05-03	\N	BRDJ 97	BX-1	\N	\N	0	\N	\N	\N
1834	VF647BCA000000274	83M0540865	\N	VF647BCA000000274	\N	2002	\N	\N	2013-05-03	\N	VU 6709	B-1	\N	\N	0	\N	\N	\N
1835	BFYTNFT6PDB03024	30421000	\N	BFYTNFT6PDB03024	\N	1993	\N	\N	2013-05-03	\N	KT 8616	Z-1	\N	\N	0	\N	\N	\N
1836	VF6JE13AC00000665	5600564960	\N	VF6JE13AC00000665	\N	1993	\N	\N	2013-05-03	\N	SK 8557	B-2	\N	\N	0	\N	\N	\N
1837	3N6CD13Y9ZK005287	KA24047268A	\N	3N6CD13Y9ZK005287	\N	2002	\N	\N	2013-05-03	\N	VE 6511	G-2	\N	\N	0	\N	\N	\N
1838	VF644BLM000000166	10531121	\N	VF644BLM000000166	\N	2008	\N	\N	2013-05-03	\N	BRDJ 86	B-3	\N	\N	0	\N	\N	\N
1839	VF6FN60A000010442	2564544	\N	VF6FN60A000010442	\N	1998	\N	\N	2013-05-03	\N	TE 5077	R-3	\N	\N	0	\N	\N	\N
1849	VF6JE13AC00008450	83M0336311	\N	VF6JE13AC00008450	\N	1998	\N	\N	2013-05-06	\N	TG 7794	B-2	\N	\N	0	\N	\N	\N
1840	JTB21UHB1V0025248	2RZ1365994	\N	JTB21UHB1V0025248	\N	1998	\N	\N	2013-05-03	\N	RB 8874	RX-3	\N	\N	0	\N	\N	\N
1841	KFT0955	9194-A	\N	KFT0955	\N	1980	\N	\N	2013-05-03	\N	SG 2274	B-4	\N	\N	0	\N	\N	\N
1850	VF644BLM000000161	10528766	\N	VF644BLM000000161	\N	2008	\N	\N	2013-05-06	\N	BRDJ 85	H-2	\N	\N	0	\N	\N	\N
1851	CM87B10946	FE6-020483B	\N	CM87B10946	\N	1989	\N	\N	2013-05-06	\N	FCFC 56	M-2	\N	\N	0	\N	\N	\N
1852	KMJWWH7HP6U733759	D4BH6266551	\N	KMJWWH7HP6U733759	\N	2006	\N	\N	2013-05-06	\N	ZS 1296	J-2	\N	\N	0	\N	\N	\N
1853	VF6JE13AC00008483	83M031933	\N	VF6JE13AC00008483	\N	1998	\N	\N	2013-05-06	\N	TV 4430	B-3	\N	\N	0	\N	\N	\N
1843	CETA5015AJ	F805UA88899	\N	CETA5015AJ	\N	1967	\N	\N	2013-05-03	2013-05-03	SK 8556	Z-4	\N	\N	0	\N	\N	\N
1854	IFDHS34M8LHB78848	415049	\N	IFDHS34M8LHB78848	\N	1990	\N	\N	2013-05-06	\N	UL 9560	S-3	\N	\N	0	\N	\N	\N
1842	XLRAE45CE0L157792	2-95764	\N	XLRAE45CE0L157792	\N	1999	\N	\N	2013-05-03	2013-05-03	CJDJ 11	BX-4	\N	\N	0	\N	\N	\N
1855	1HTSLAAM2YH696433	820484C4	\N	1HTSLAAM2YH696433	\N	2000	\N	\N	2013-05-06	\N	FCZG 94	R-5	\N	\N	0	\N	\N	\N
79	VF6JS00A000007633	010076JJ	\N	VF6JS00A000007633	\N	1989	23000	\N	2013-01-25	2013-05-07	DZHR89-K	BR-1	\N	\N	0	\N	\N	\N
1844	BC683PLA36957	1J07036CN	\N	BC683PLA36957	\N	1986	\N	\N	2013-05-03	2013-05-03	HU 8280	Z-5	\N	\N	0	\N	\N	\N
1845	2754	2754	\N	2754	\N	1982	\N	\N	2013-05-03	\N	BJ 7741	B-6	\N	\N	0	\N	\N	\N
589	VF6JE13AC00008466	83M0339923	\N	VF6JE13AC00008466	\N	1998	\N	\N	2013-02-14	2013-05-07	TV 4439	B-10	\N	\N	0	\N	\N	\N
1846	10307443	\N	\N	10307443	\N	1970	\N	\N	2013-05-03	\N	GC 8746	B-7	\N	\N	0	\N	\N	\N
1856	F66EVY	989	\N	F66EVY	\N	1977	\N	\N	2013-05-08	\N	SJ 1146	X-2	\N	\N	0	\N	\N	\N
1847	LJ16AA332A7012142	A3016158	\N	LJ16AA332A7012142	\N	2011	\N	\N	2013-05-03	\N	CSRZ 12	K-1	\N	\N	0	\N	\N	\N
1857	\N	TD42010078T 	\N	\N	\N	1997	\N	\N	2013-05-08	\N	PT 2890	Z-1	\N	\N	0	\N	\N	\N
1848	VF643ACA000008002	83M0613536	\N	VF643ACA000008002	\N	2004	\N	\N	2013-05-06	\N	YH 2570	B-1	\N	\N	0	\N	\N	\N
\.


--
-- Data for Name: vehiculo_documento; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY vehiculo_documento (vehiculo_documento_id, numero_orden_compra, fecha_orden_compra, documento_orden_compra, numero_declaracion_ingreso, fecha_declaracion_ingreso, documento_declaracion_ingreso, factura_comercial, bill_of_lading, packing_list, acta_recepcion, solicitud_extension_iva, fecha_solicitud_extension_iva, resolucion_extension_iva, fecha_resolucion_extension_iva, valor_compra, proveedor, agente_aduana, manual_usuario, manual_mantencion, certificado_homologacion, vehiculo_id, cuerpo_id, compannia_id) FROM stdin;
2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	116	423
72	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	72	143	\N
41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	41	198	630
18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	18	131	697
13	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	13	3	\N
3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	3	197	626
42	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	42	66	1383
4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	197	919
20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	20	131	1159
5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5	142	200
6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	142	204
7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7	197	920
118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	118	124	447
22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	22	80	1096
43	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43	66	1380
23	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	23	80	1486
10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10	142	201
101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	101	7	250
11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	11	142	198
24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	24	149	372
44	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	44	66	1383
73	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	73	144	355
45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	45	66	1381
25	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	25	222	332
46	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	46	290	879
15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	15	65	992
27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	27	74	1009
102	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	102	7	846
47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	47	66	1378
16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	16	139	311
28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	28	172	381
29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29	8	253
48	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	48	66	1383
30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	30	208	944
31	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	31	279	\N
32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32	626	1446
33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	33	170	\N
34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	34	170	\N
49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	49	27	1168
35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	35	170	286
36	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	36	170	290
37	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	37	198	\N
38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	38	198	\N
39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	39	198	924
50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	50	227	1180
40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	40	198	629
51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	51	256	\N
75	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	75	154	1289
119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	119	124	\N
54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	54	116	424
76	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	76	272	959
77	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	77	149	\N
56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	56	3	487
57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	57	3	1434
59	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	59	145	1497
60	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	60	145	361
61	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	61	145	\N
103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	103	34	1297
62	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	62	291	582
63	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	63	291	\N
80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	80	129	1160
64	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	64	291	881
66	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	66	224	1356
67	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	67	224	1320
81	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	81	88	394
68	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	68	224	1321
69	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	69	290	879
70	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	70	144	354
82	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	82	270	956
71	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	71	144	352
104	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	104	50	1453
83	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	83	270	774
84	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	84	270	1405
85	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	85	270	956
105	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	105	274	1229
86	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	86	164	1017
87	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	87	164	1017
120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	120	124	442
88	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	88	127	453
106	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	106	183	977
89	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	89	244	838
90	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	90	295	518
107	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	107	120	\N
93	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	93	4	\N
94	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	94	122	438
108	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	108	83	848
95	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	95	122	1221
96	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	96	234	948
129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	129	72	1008
97	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	97	174	257
98	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	98	144	\N
109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	109	202	1403
121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	121	124	443
99	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	99	169	376
100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100	273	\N
110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	110	211	1082
111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	111	211	1072
122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	122	124	\N
112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	112	211	1081
113	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	113	211	1080
114	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	114	211	1083
123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	123	159	605
115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	115	211	1078
130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	130	171	\N
117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	117	124	442
124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	124	159	981
125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	125	159	605
131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	131	288	1491
126	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	126	147	323
127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	127	147	1277
141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	141	268	953
128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	128	98	1451
139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	139	268	817
134	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	134	268	665
135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	135	268	\N
142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	142	171	\N
138	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	138	268	954
137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	137	268	817
136	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	136	268	1363
140	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	140	268	665
143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	143	200	1043
144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	144	161	1318
145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	145	161	738
146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	146	255	843
148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	148	251	585
191	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	191	142	202
252	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	252	170	288
149	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	149	248	1346
150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	150	89	\N
229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	229	220	330
151	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	151	150	813
152	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	152	37	815
153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	153	37	1253
154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	154	86	391
194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	194	142	202
155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	155	86	392
156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	156	121	650
157	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	157	121	650
195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	195	142	199
158	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	158	121	436
159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	159	128	672
230	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	230	170	282
160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	160	138	308
196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	196	142	199
162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	162	41	534
163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	163	181	1147
197	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	197	142	201
164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	164	265	931
74	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	74	85	221
26	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26	131	1159
132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	132	134	1169
133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	133	134	1169
9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9	99	682
58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	58	185	1148
55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	55	76	705
192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	192	142	198
193	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	193	142	202
12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	12	148	1432
17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	17	237	1199
8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8	249	1326
78	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	78	249	1327
52	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	52	253	227
161	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	161	250	584
53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	53	253	1309
147	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	147	255	601
79	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	79	74	1009
165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	165	621	1482
266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	266	170	287
198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	198	142	201
168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	168	31	519
231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	231	170	283
169	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	169	238	1205
199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	199	142	203
170	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	170	607	270
171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	171	607	\N
172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	172	607	\N
173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	173	32	596
174	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	174	82	1007
200	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	200	142	203
176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	176	32	1492
253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	253	170	288
177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	177	132	1137
201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	201	142	204
178	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	178	612	797
179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	179	142	207
232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	232	170	285
180	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	180	142	199
181	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	181	139	\N
202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	202	142	204
182	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	182	139	318
183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	183	131	1159
184	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	184	142	197
203	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	203	142	204
185	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	185	142	197
186	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	186	142	197
187	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	187	142	198
204	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	204	142	205
188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	188	142	200
189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	189	142	200
233	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	233	170	286
190	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	190	142	200
205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	205	142	205
234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	234	170	288
206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	206	142	198
207	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	207	142	206
254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254	170	286
208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	208	142	206
235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	235	170	282
209	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	209	142	207
210	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	210	142	207
211	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	211	142	197
212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	212	142	197
213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	213	142	198
214	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	214	142	199
237	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	237	170	300
215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	215	220	326
216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	216	220	326
255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	255	170	301
217	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	217	220	326
238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	238	170	299
219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	219	220	326
220	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	220	220	326
239	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	239	170	299
221	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	221	220	327
222	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	222	220	327
267	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	267	170	292
223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	223	220	327
240	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	240	170	298
224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	224	220	328
225	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	225	220	329
256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	256	170	293
226	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	226	220	329
241	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	241	170	298
227	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	227	220	329
228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	228	220	330
242	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	242	170	296
243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	243	170	292
257	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257	170	283
244	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	244	170	298
245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	245	170	295
280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	280	170	302
246	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	246	170	294
258	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	258	170	282
247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	247	170	289
248	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	248	170	289
268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	268	170	293
249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	249	170	290
259	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	259	170	283
250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	250	170	289
251	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	251	170	288
275	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	275	170	304
260	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	260	170	282
269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	269	170	294
261	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	261	170	283
262	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	262	170	282
263	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	263	170	283
270	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	270	170	296
264	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	264	170	285
265	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	265	170	286
276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	276	170	305
271	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	271	170	297
272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	272	170	299
283	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	283	222	331
277	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	277	170	296
274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	274	170	303
281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	281	170	302
278	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	278	170	303
279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	279	170	304
286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	286	222	332
282	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	282	222	331
285	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	285	222	331
284	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	284	222	331
287	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	287	222	332
288	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	288	222	\N
289	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	289	222	333
290	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	290	222	333
291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	291	222	334
292	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	292	222	1368
348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	348	224	1020
293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	293	222	1369
294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	294	607	261
381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	381	140	342
295	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	295	607	261
349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	349	221	335
296	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	296	607	261
297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	297	607	262
298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	298	607	262
350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	350	221	335
299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	299	607	264
300	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	300	607	264
301	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	301	607	265
351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	351	221	335
302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	302	607	265
303	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	303	607	265
382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	382	140	342
304	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	304	607	265
352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	352	221	335
305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	305	607	266
306	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	306	607	266
307	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	307	607	267
353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	353	221	335
308	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	308	607	267
309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	309	607	267
414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	414	144	356
310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	310	607	268
354	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	354	221	336
311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	311	607	268
312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	312	607	268
383	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	383	139	311
313	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	313	607	269
355	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	355	221	336
314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	314	607	269
315	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	315	607	269
316	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	316	607	270
356	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	356	221	336
317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	317	607	270
318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	318	607	271
357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	357	221	\N
319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	319	607	271
320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	320	607	272
402	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	402	141	346
321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	321	607	272
358	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	358	139	311
322	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	322	607	261
323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	323	607	262
384	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	384	224	1320
324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	324	607	264
359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	359	139	312
325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	325	138	306
326	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	326	138	307
327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	327	138	306
167	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	167	77	1042
175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	175	82	1041
166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	166	243	855
360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	360	139	314
328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	328	138	306
329	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	329	138	306
361	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	361	139	\N
330	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	330	138	307
331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	331	138	307
332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	332	138	307
362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	362	139	316
333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	333	138	307
334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	334	138	308
385	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	385	224	1020
335	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	335	138	308
363	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	363	139	317
336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	336	138	308
337	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	337	138	309
338	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	338	138	309
364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	364	139	311
339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	339	138	309
340	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	340	138	309
341	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	341	138	310
342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	342	138	310
343	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	343	138	310
386	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	386	224	1321
344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	344	138	310
345	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	345	138	\N
366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	366	139	313
346	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	346	224	1320
347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	347	224	1320
403	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	403	141	343
367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	367	139	314
368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	368	139	311
369	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	369	139	317
370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	370	139	314
388	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	388	224	1355
371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	371	139	317
372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	372	139	311
373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	373	139	313
389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	389	224	1356
374	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	374	139	315
375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	375	139	316
404	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	404	141	343
376	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	376	139	312
390	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	390	224	1357
377	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	377	139	313
391	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	391	224	1357
378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	378	139	311
379	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	379	139	312
415	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	415	144	356
380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	380	140	342
405	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	405	143	348
392	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	392	224	1354
387	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	387	224	1354
395	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	395	136	340
406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	406	143	350
396	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	396	136	340
365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	365	139	313
426	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	426	148	368
397	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	397	136	341
407	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	407	143	351
398	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	398	136	339
399	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	399	141	343
416	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	416	145	357
400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	400	141	345
408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	408	143	349
401	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	401	141	345
409	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	409	143	350
422	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	422	146	362
410	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	410	143	348
417	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	417	145	358
411	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	411	144	352
412	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	412	144	354
413	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	413	144	355
418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	418	145	360
423	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	423	146	362
419	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	419	145	357
420	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	420	145	358
421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	421	146	362
424	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	424	146	363
425	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	425	146	1510
428	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	428	148	368
394	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	394	136	339
436	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	436	149	373
437	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	437	149	371
438	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	438	149	371
393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	393	136	339
492	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	492	174	259
439	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	439	136	339
440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	440	136	\N
441	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	441	149	371
524	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	524	11	1328
442	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	442	173	382
493	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	493	9	1291
444	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	444	1	479
478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	478	9	1291
445	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	445	1	480
446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	446	1	480
447	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	447	1	480
494	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	494	13	468
448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	448	1	481
449	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	449	1	481
525	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	525	11	1328
450	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	450	1	482
495	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	495	13	468
451	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	451	1	482
452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	452	1	483
453	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	453	1	483
496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	496	13	468
454	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	454	1	484
455	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	455	1	484
497	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	497	171	\N
456	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	456	1	484
457	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	457	1	485
545	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	545	16	472
458	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	458	1	485
498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	498	14	469
459	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	459	1	479
460	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	460	1	479
526	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	526	11	461
461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	461	1	481
462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	462	173	382
463	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	463	8	255
464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	464	171	193
500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	500	14	470
465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	465	171	193
527	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	527	11	461
466	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	466	171	193
499	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	499	14	469
467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	467	171	193
468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	468	171	378
469	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	469	171	377
501	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	501	14	470
470	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	470	8	255
471	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	471	8	255
528	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	528	16	472
472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	472	8	255
502	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	502	144	352
473	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	473	8	254
474	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	474	8	254
557	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	557	20	507
503	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	503	144	352
475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	475	8	254
476	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	476	8	254
504	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	504	144	352
477	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	477	8	253
529	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	529	213	869
479	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	479	9	1291
505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	505	144	353
480	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	480	9	256
481	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	481	9	1291
482	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	482	9	256
506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	506	144	355
483	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	483	9	256
484	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	484	174	257
485	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	485	174	259
486	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	486	174	257
487	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	487	9	\N
488	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	488	174	257
530	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	530	213	1002
489	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	489	174	258
490	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	490	174	258
491	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	491	174	257
509	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	509	144	355
432	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	432	148	\N
430	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	430	148	370
431	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	431	148	1432
433	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	433	148	365
435	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	435	148	367
546	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	546	16	472
510	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	510	144	356
531	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	531	213	869
511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	511	144	356
512	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	512	144	354
513	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	513	11	461
532	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	532	213	869
514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	514	11	461
515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	515	11	462
569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	569	20	504
516	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	516	11	462
533	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	533	216	194
517	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	517	11	462
518	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	518	11	463
547	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	547	16	666
519	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	519	11	463
534	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	534	216	194
520	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	520	11	463
521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	521	11	464
522	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	522	11	464
535	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	535	216	229
523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	523	11	465
558	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	558	20	508
536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	536	216	230
548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	548	18	502
537	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	537	216	231
538	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	538	216	231
539	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	539	216	229
549	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	549	18	1135
540	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	540	214	750
541	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	541	214	1206
565	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	565	20	512
542	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	542	214	1207
550	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	550	18	501
543	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	543	214	1208
544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	544	214	1209
559	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	559	20	509
551	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	551	625	1483
552	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	552	19	503
553	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	553	20	511
560	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	560	20	510
554	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	554	20	504
555	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	555	20	505
556	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	556	20	506
561	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	561	20	510
566	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	566	20	512
562	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	562	20	511
563	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	563	20	511
564	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	564	20	511
567	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	567	20	514
570	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	570	20	505
568	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	568	20	514
572	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	572	295	516
571	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	571	20	506
573	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	573	295	515
574	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	574	295	515
575	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	575	31	519
576	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	576	31	519
577	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	577	31	519
578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	578	31	520
579	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	579	31	521
580	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	580	31	521
581	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	581	31	\N
582	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	582	31	519
668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	668	3	487
583	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	583	605	1037
635	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	635	219	930
584	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	584	33	603
585	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	585	33	603
586	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	586	33	900
636	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	636	219	929
587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	587	33	900
588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	588	35	753
688	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	688	2	493
637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	637	219	929
590	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	590	35	753
591	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	591	36	1061
669	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	669	3	487
592	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	592	36	1031
593	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	593	36	\N
594	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	594	36	\N
638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	638	287	1016
595	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	595	37	670
596	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	596	37	815
597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	597	37	815
639	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	639	287	1016
598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	598	37	1253
599	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	599	37	815
273	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	273	170	302
507	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	507	144	355
600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	600	295	517
640	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	640	287	1366
601	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	601	295	518
508	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	508	144	355
602	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	602	223	852
670	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	670	3	487
603	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	603	223	852
641	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	641	287	1367
604	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	604	223	850
605	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	605	223	561
606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	606	212	627
642	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	642	277	696
607	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	607	212	627
608	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	608	212	627
700	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	700	2	497
609	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	609	212	627
643	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	643	281	1306
611	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	611	212	922
671	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	671	3	487
612	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	612	212	1433
644	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	644	281	1306
613	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	613	217	417
614	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	614	217	417
615	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	615	218	752
645	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	645	281	1305
616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	616	212	627
617	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	617	219	754
689	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	689	2	493
618	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	618	219	754
646	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	646	281	1305
619	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	619	219	754
620	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	620	219	928
672	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	672	3	1434
621	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	621	219	928
647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	647	281	710
622	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	622	219	927
623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	623	219	927
624	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	624	219	927
648	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	648	211	777
625	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	625	219	927
626	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	626	219	632
627	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	627	219	632
649	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	649	211	777
628	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	628	219	728
673	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	673	298	692
650	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	650	211	1078
629	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	629	219	728
651	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	651	211	1078
630	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	630	219	728
631	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	631	219	926
632	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	632	219	926
652	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	652	211	1079
633	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	633	219	926
634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	634	219	930
674	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	674	298	692
653	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	653	211	1079
654	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	654	211	1077
690	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	690	2	494
655	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	655	211	1077
675	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	675	2	490
656	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	656	211	1080
657	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	657	211	1081
658	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	658	211	1082
676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	676	2	491
659	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	659	211	1072
660	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	660	211	1083
661	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	661	211	1083
677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	677	2	490
662	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	662	211	1084
663	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	663	211	1084
691	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	691	2	494
664	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	664	211	1079
678	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	678	2	493
665	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	665	211	777
666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	666	211	1078
667	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	667	211	777
701	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	701	2	499
679	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	679	2	490
692	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	692	2	495
680	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	680	2	491
681	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	681	2	490
682	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	682	2	492
693	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	693	2	495
683	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	683	2	490
684	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	684	2	490
707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	707	612	1242
685	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	685	2	491
694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	694	2	496
686	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	686	2	491
687	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	687	2	492
702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	702	2	499
695	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	695	2	496
696	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	696	2	496
703	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	703	2	499
697	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	697	2	497
698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	698	2	497
699	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	699	2	497
708	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	708	612	797
704	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	704	612	797
705	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	705	612	797
712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	712	282	1361
709	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	709	612	797
706	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	706	612	797
710	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	710	282	712
715	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	715	150	583
711	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	711	282	1360
713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	713	282	1362
714	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	714	282	712
716	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	716	150	813
717	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	717	150	886
718	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	718	150	885
719	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	719	150	813
720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	720	150	583
721	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	721	152	1322
722	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	722	172	379
723	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	723	172	380
724	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	724	172	381
832	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	832	224	1357
725	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	725	172	379
779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	779	208	945
726	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	726	172	379
727	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	727	172	380
812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	812	75	868
728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	728	172	380
780	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	780	208	656
729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	729	172	380
730	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	730	172	381
731	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	731	172	381
781	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	781	208	656
732	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	732	172	1134
733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	733	154	723
734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	734	154	723
782	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	782	208	942
735	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	735	154	723
736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	736	154	979
813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	813	75	704
783	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	783	208	942
738	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	738	154	598
739	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	739	154	1289
740	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	740	154	1290
814	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	814	72	1008
741	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	741	154	1290
784	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	784	208	941
737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	737	154	979
742	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	742	170	297
743	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	743	170	305
785	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	785	208	941
744	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	744	170	295
745	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	745	170	290
746	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	746	170	282
786	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	786	208	943
747	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	747	170	300
748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	748	156	734
815	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	815	72	1008
749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	749	156	1344
787	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	787	208	943
750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	750	156	1345
751	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	751	156	734
752	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	752	159	981
788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	788	208	944
753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	753	159	605
754	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	754	160	737
755	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	755	160	737
789	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	789	113	762
756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	756	160	737
757	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	757	160	1271
816	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	816	74	1009
758	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	758	162	609
790	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	790	113	804
759	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	759	164	1311
760	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	760	164	1017
761	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	761	164	1017
791	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	791	113	804
762	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	762	164	1310
763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	763	164	1310
834	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	834	224	1320
764	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	764	164	1312
792	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	792	113	1047
765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	765	166	1015
766	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	766	166	1015
817	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	817	78	195
767	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	767	204	764
793	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	793	113	1047
768	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	768	204	644
769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	769	206	766
770	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	770	206	766
794	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	794	113	1048
771	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	771	206	766
772	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	772	206	1353
773	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	773	206	1351
774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	774	206	1350
775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	775	206	1351
818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	818	78	195
776	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	776	206	1350
796	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	796	113	1048
777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	777	206	1352
778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	778	206	1352
797	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	797	113	1049
845	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	845	177	1274
798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	798	113	1049
819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	819	78	195
799	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	799	113	1049
800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	800	113	1050
835	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	835	224	1354
801	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	801	113	1050
820	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	820	78	196
803	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	803	113	1047
804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	804	114	763
821	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	821	79	681
805	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	805	114	763
806	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	806	114	988
807	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	807	114	988
822	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	822	79	681
808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	808	114	642
809	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	809	114	642
836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	836	224	1356
823	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	823	78	195
811	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	811	75	868
824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	824	74	1009
857	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	857	99	682
825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	825	74	1009
65	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	65	224	\N
837	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	837	224	1356
826	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	826	224	1489
827	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	827	224	1020
846	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	846	177	1275
828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	828	224	1020
838	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	838	224	1356
829	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	829	224	1354
830	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	830	224	1355
831	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	831	224	1355
853	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	853	99	682
839	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	839	177	726
847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	847	177	1275
840	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	840	177	726
841	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	841	177	726
842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	842	177	1273
848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	848	177	1276
843	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	843	177	1273
844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	844	177	1274
849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	849	177	1276
850	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	850	177	1281
851	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	851	177	1281
854	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	854	99	682
802	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	802	113	1303
852	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	852	177	726
858	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	858	100	736
856	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	856	99	682
859	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	859	100	1359
861	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	861	100	1359
862	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	862	100	736
864	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	864	100	736
865	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	865	100	736
866	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	866	100	736
867	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	867	101	1011
869	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	869	101	1069
870	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	870	104	1490
924	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	924	81	1013
872	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	872	105	615
873	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	873	105	615
925	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	925	81	1032
874	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	874	105	808
875	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	875	105	808
876	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	876	105	615
926	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	926	81	1013
877	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	877	107	685
878	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	878	107	685
879	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	879	107	685
927	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	927	82	1040
880	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	880	107	685
881	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	881	107	842
928	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	928	82	1039
883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	883	106	1010
884	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	884	106	1010
885	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	885	179	687
929	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	929	82	1007
886	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	886	179	687
887	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	887	179	687
888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	888	179	1438
930	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	930	82	1007
889	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	889	179	618
890	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	890	179	618
891	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	891	111	689
931	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	931	82	1039
892	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	892	111	689
893	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	893	111	689
894	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	894	111	689
932	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	932	83	691
895	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	895	110	688
896	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	896	110	688
897	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	897	617	1012
933	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	933	83	691
898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	898	617	1012
899	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	899	617	1012
900	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	900	617	1012
934	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	934	82	1007
901	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	901	617	1012
903	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	903	115	939
935	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	935	83	691
904	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	904	115	643
905	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	905	115	1457
906	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	906	80	690
936	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	936	83	691
907	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	907	80	690
908	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	908	80	690
937	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	937	82	\N
909	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	909	80	690
910	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	910	80	690
911	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	911	80	1092
938	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	938	83	662
912	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	912	80	1092
913	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	913	80	1093
914	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	914	80	1093
939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	939	83	847
915	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	915	80	1095
916	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	916	80	1095
917	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	917	80	1096
940	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	940	82	1040
918	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	918	80	1486
919	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	919	80	1486
920	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	920	81	1013
941	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	941	83	821
921	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	921	81	1032
922	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	922	81	1013
923	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	923	81	1013
942	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	942	83	821
943	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	943	83	849
944	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	944	83	662
945	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	945	86	389
948	3241324121	28/02/2013	\N	1412341	27/02/2013	\N	\N	\N	\N	\N	\N	26/02/2013	\N	28/02/2013	12341234	PROVEEDOR 1	1341FADS	\N	\N	\N	949	139	313
946	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	946	86	389
947	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	947	86	389
443	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	443	1	479
980	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	981	94	408
969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	970	89	398
949	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	950	103	683
950	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	951	103	683
951	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	952	103	683
970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	971	89	400
952	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	953	90	388
953	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	954	90	1454
954	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	955	90	1454
955	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	956	90	\N
971	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	972	89	399
956	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	957	90	387
957	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	958	90	387
981	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	982	94	408
958	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	959	87	393
972	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	973	89	401
959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	960	87	1509
960	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	961	87	393
961	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	962	87	393
973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	974	92	404
962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	963	87	1509
963	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	964	88	394
964	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	965	88	395
982	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	983	94	409
965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	966	88	395
966	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	967	88	394
967	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	968	89	396
975	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	976	92	404
968	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	969	89	397
988	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	989	94	408
976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	977	92	404
983	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	984	94	408
974	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	975	92	404
91	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	91	92	405
977	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	978	93	407
978	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	979	93	406
984	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	985	94	409
979	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	980	93	406
989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	990	94	409
985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	986	94	410
986	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	987	94	412
993	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	994	296	416
987	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	988	94	412
990	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	991	94	411
991	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	992	94	411
997	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	998	97	418
992	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	993	94	410
994	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	995	97	421
996	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	997	97	418
995	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	996	97	421
998	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	999	97	418
999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1000	97	982
1000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1001	97	\N
1001	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1002	97	\N
1002	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1003	97	982
1003	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1004	97	420
1004	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1005	97	418
1005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1006	97	418
1006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1007	85	221
1007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1008	85	1213
1008	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1009	85	1213
1009	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1010	85	1213
1010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1011	116	423
1011	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1012	116	422
1012	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1013	116	425
1013	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1014	116	\N
871	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	871	104	684
882	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	882	106	1010
1014	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1015	116	425
1071	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1072	128	454
1015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1016	116	426
1016	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1017	116	1091
1017	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1018	116	\N
1018	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1019	116	422
1072	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1073	128	454
1019	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1020	116	422
1020	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1021	297	427
1021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1022	297	427
1073	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1074	128	672
1022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1023	297	427
1023	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1024	117	428
1104	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1105	42	702
1024	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1025	117	428
1074	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1075	38	857
1025	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1026	608	1348
1026	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1027	608	525
1027	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1028	608	525
1075	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1076	38	801
1028	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1029	118	431
1029	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1030	118	431
1135	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1136	49	1212
1030	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1031	118	432
1076	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1077	38	801
1031	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1032	118	432
1032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1033	118	524
1105	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1106	42	702
1033	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1034	118	524
1077	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1078	38	801
1034	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1035	118	431
1035	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1036	118	431
1036	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1037	121	435
1078	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1079	38	801
1037	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1038	121	435
1038	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1039	121	435
1124	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1125	46	590
1039	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1040	121	436
1079	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1080	39	698
1040	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1041	121	435
1041	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1042	121	1512
1106	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1107	42	702
1042	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1043	121	650
1080	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1081	39	698
1043	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1044	123	440
1044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1045	123	439
1045	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1046	123	439
1081	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1082	39	698
1046	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1047	123	439
1047	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1048	123	440
1048	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1049	123	440
1049	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1050	125	\N
1050	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1051	125	\N
1082	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1083	39	698
1051	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1052	125	441
1052	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1053	32	1033
1107	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1108	42	702
1053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1054	32	976
1083	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1084	39	1485
1054	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1055	32	1033
1055	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1056	32	1033
1056	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1057	32	976
1084	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1085	39	698
1057	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1058	32	976
1058	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1059	32	596
1059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1060	32	596
1085	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1086	39	1485
1060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1061	32	1034
1061	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1062	32	975
1108	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1109	42	702
1062	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1063	32	595
1086	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1087	40	700
1063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1064	32	595
1064	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1065	32	595
1065	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1066	32	1492
1087	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1088	40	700
1066	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1067	128	454
1067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1068	128	454
1125	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1126	46	590
1068	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1069	128	454
1088	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1089	40	700
1069	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1070	128	672
1070	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1071	128	1358
1109	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1110	43	714
1089	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1090	40	700
1090	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1091	40	1227
1110	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1111	43	970
1091	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1092	41	701
1092	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1093	41	701
218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	218	220	326
1093	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1094	41	701
1111	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1112	43	714
1094	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1095	41	701
1095	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1096	41	865
833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	833	224	\N
1126	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1127	46	590
1096	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1097	41	865
1112	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1113	43	714
1097	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1098	41	866
1098	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1099	41	866
1099	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1100	41	534
1113	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1114	43	970
1100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1101	41	534
1101	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1102	41	701
1136	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1137	49	1212
1102	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1103	42	702
1114	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1115	43	970
1103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1104	42	702
1127	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1128	46	590
1115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1116	44	715
1116	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1117	44	1411
1117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1118	44	1411
1128	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1129	46	590
1118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1119	44	715
1119	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1120	45	787
1120	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1121	45	787
1129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1130	47	591
1121	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1122	45	787
1122	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1123	45	787
1137	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1138	49	1067
1123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1124	45	787
1130	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1131	48	721
1131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1132	48	721
1132	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1133	48	721
1138	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1139	49	1067
1133	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1134	48	721
1134	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1135	49	722
1143	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1144	51	733
1139	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1140	49	722
1144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1145	51	733
1140	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1141	49	1211
1141	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1142	49	\N
1142	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1143	49	1210
1147	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1148	51	1056
1145	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1146	51	1056
1146	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1147	51	1056
1151	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1152	51	1058
1148	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1149	51	1056
1150	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1151	51	1057
1149	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1150	51	1057
1152	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1153	51	1058
1153	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1154	51	1059
1154	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1155	51	1060
1155	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1156	51	1060
1156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1157	51	733
1157	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1158	51	1060
1158	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1159	53	1062
1278	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1279	68	1109
1159	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1160	53	740
1213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1214	59	677
1160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1161	53	1062
1161	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1162	53	740
1246	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1247	64	651
1162	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1163	53	1062
1214	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1215	59	677
1163	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1164	53	740
1164	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1165	53	1062
1165	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1166	54	235
1215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1216	59	677
1166	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1167	54	235
1167	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1168	54	235
1266	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1267	68	1103
1168	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1169	55	743
1216	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1217	59	638
1169	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1170	55	743
1170	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1171	55	1223
1247	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1248	65	992
1171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1172	55	743
1217	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1218	59	638
1172	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1173	55	743
1173	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1174	55	1223
1174	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1175	56	619
1218	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1219	59	638
1175	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1176	56	619
1176	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1177	56	912
1177	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1178	58	756
1219	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1220	59	679
1178	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1179	58	756
1179	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1180	58	756
1248	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1249	65	992
1180	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1181	58	756
1220	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1221	59	679
1181	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1182	58	756
1182	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1183	58	1430
1183	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1184	58	1430
1221	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1222	59	679
1184	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1185	58	756
1185	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1186	60	935
236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	236	170	301
1222	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1223	59	678
1186	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1187	170	301
1249	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1250	67	770
1187	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1188	127	453
1223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1224	61	233
1188	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1189	127	453
1189	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1190	127	453
1190	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1191	127	451
1224	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1225	61	233
1191	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1192	127	451
1192	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1193	127	452
1193	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1194	127	\N
1267	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1268	68	1103
1194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1195	127	452
1225	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1226	61	233
1195	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1196	127	453
1196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1197	127	451
1250	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1251	67	995
1197	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1198	127	453
1226	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1227	61	234
1198	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1199	60	935
1199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1200	60	935
1200	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1201	60	760
1227	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1228	61	234
1201	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1202	60	760
1202	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1203	60	937
1203	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1204	60	937
1228	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1229	61	234
1204	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1205	60	936
1205	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1206	60	936
1251	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1252	67	770
1206	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1207	60	936
1229	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1230	61	233
1207	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1208	60	936
1208	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1209	59	678
1209	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1210	59	678
1230	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1231	610	794
1210	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1211	59	678
1211	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1212	59	678
1212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1213	59	678
1231	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1232	610	794
1252	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1253	63	771
1232	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1233	610	794
1233	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1234	610	794
795	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	795	113	1048
1268	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1269	68	1104
1234	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1235	64	767
1253	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1254	63	771
1235	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1236	64	767
1236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1237	64	767
1237	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1238	64	651
1254	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1255	63	771
1238	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1239	64	651
1239	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1240	64	651
1279	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1280	68	1109
1240	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1241	64	652
1255	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1256	63	771
1241	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1242	64	652
1242	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1243	64	940
1269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1270	68	1104
1243	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1244	64	940
1256	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1257	68	778
1244	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1245	64	651
1245	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1246	64	767
1257	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1258	68	778
1258	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1259	68	1099
1270	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1271	68	1105
1259	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1260	68	1099
1260	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1261	68	1100
1290	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1291	68	1507
1261	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1262	68	1100
1271	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1272	68	1106
1262	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1263	68	1101
1263	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1264	68	1101
1280	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1281	68	1112
1264	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1265	68	1102
1272	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1273	68	1106
1265	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1266	68	1102
1273	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1274	68	1107
1286	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1287	68	1343
1274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1275	68	1107
1281	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1282	68	1112
1275	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1276	68	1104
1276	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1277	68	1108
1277	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1278	68	1109
1282	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1283	68	1112
1287	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1288	68	1343
1283	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1284	68	1111
1284	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1285	68	1111
1285	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1286	68	1111
1288	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1289	68	1343
1289	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1290	68	1507
1292	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1293	68	1108
1291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1292	68	1105
1294	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1295	70	\N
1293	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1294	70	782
1295	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1296	70	\N
1296	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1297	70	\N
1297	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1298	70	\N
1298	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1299	70	\N
1299	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1300	70	\N
1300	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1301	70	\N
1301	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1302	70	\N
1302	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1303	70	782
1410	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1411	25	877
1303	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1304	70	782
1358	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1359	21	786
1304	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1305	70	782
1391	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1392	101	1068
1359	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1360	21	874
1305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1306	70	1235
1306	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1307	70	1235
1307	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1308	70	1235
1360	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1361	21	786
1308	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1309	70	1236
1309	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1310	70	1236
1310	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1311	70	1236
1361	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1362	21	786
1311	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1312	70	1237
1312	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1313	70	1237
1313	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1314	70	1240
1362	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1363	21	1232
1314	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1315	70	1240
1315	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1316	70	1240
1411	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1412	25	876
1316	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1317	70	1239
1363	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1364	30	1170
1317	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1318	70	1239
1318	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1319	70	1238
1319	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1320	70	1238
1364	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1365	25	876
1320	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1321	70	1241
1321	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1322	70	1241
1322	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1323	70	\N
1323	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1324	70	1238
1365	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1366	189	611
1324	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1325	70	1239
1325	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1326	71	784
1392	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1393	101	1068
1326	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1327	71	784
1327	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1328	71	784
1328	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1329	71	1220
1329	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1330	71	1220
1367	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1368	22	1119
1330	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1331	129	478
19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	19	131	1159
1331	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1332	131	1158
1412	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1413	25	877
1332	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1333	131	1158
1333	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1334	131	\N
1368	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1369	22	1119
1334	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1335	131	1159
1335	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1336	132	1137
1336	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1337	132	\N
1393	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1394	101	1069
1337	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1338	132	1138
1369	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1370	22	1120
1338	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1339	132	1139
1339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1340	132	1162
1340	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1341	132	1139
1370	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1371	22	1120
1342	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1343	133	1167
1371	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1372	22	1120
1343	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1344	133	1163
1344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1345	133	1164
1394	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1395	101	1069
1345	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1346	133	1164
1346	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1347	133	\N
1372	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1373	22	1121
1341	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1342	133	1165
1347	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1348	133	\N
1348	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1349	133	\N
1349	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1350	26	538
1350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1351	26	538
1373	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1374	22	1122
1351	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1352	26	851
1352	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1353	26	851
1423	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1424	29	974
1353	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1354	26	539
1374	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1375	22	1122
1354	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1355	134	707
1355	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1356	30	1170
1395	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1396	101	1069
1356	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1357	30	1170
1375	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1376	22	1122
1357	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1358	30	1114
1376	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1377	22	1122
1396	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1397	101	\N
1377	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1378	22	1123
1378	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1379	22	1123
1397	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1398	101	\N
1379	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1380	22	1123
1380	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1381	22	1123
1413	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1414	25	572
1381	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1382	22	1123
1398	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1399	22	1131
1382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1383	22	1128
1383	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1384	22	1128
1384	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1385	22	1129
1399	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1400	22	1131
1385	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1386	22	1129
1386	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1387	22	1129
1387	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1388	22	1130
1400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1401	22	1132
1388	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1389	101	1011
1389	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1390	101	1011
1414	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1415	25	876
1390	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1391	101	1068
1401	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1402	22	1132
1402	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1403	22	1119
1424	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1425	29	\N
1403	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1404	23	1115
1415	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1416	28	713
1404	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1405	23	1445
1405	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1406	23	1115
1406	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1407	23	1445
1416	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1417	28	713
1407	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1408	23	1115
1408	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1409	25	572
1431	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1432	606	\N
1409	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1410	25	876
1425	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1426	606	1127
1417	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1418	28	713
1418	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1419	28	713
1419	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1420	29	973
1426	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1427	606	1127
1420	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1421	29	973
1421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1422	29	972
1438	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1439	182	888
1422	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1423	29	972
1427	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1428	606	1127
1432	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1433	181	720
1428	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1429	606	1126
1429	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1430	606	1126
1436	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1437	182	588
1430	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1431	606	1126
1433	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1434	181	720
1434	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1435	181	\N
1435	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1436	181	720
1437	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1438	182	889
1439	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1440	182	890
1440	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1441	182	588
1441	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1442	182	890
1442	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1443	182	890
1443	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1444	182	588
1444	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1445	182	588
1445	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1446	101	1069
1446	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1447	101	\N
1537	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1538	229	991
1447	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1448	183	978
1504	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1505	195	1177
1448	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1449	183	977
1449	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1450	183	597
1450	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1451	185	732
1505	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1506	195	1177
1451	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1452	185	1149
1452	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1453	184	727
1453	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1454	184	1152
1506	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1507	195	1176
1454	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1455	184	1153
1455	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1456	184	1465
1538	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1539	229	991
1456	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1457	187	735
1507	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1508	225	748
1457	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1458	187	1171
1458	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1459	187	1172
1508	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1509	23	\N
1459	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1460	187	1173
1460	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1461	187	\N
1461	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1462	187	\N
1462	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1463	187	735
1463	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1464	187	\N
1464	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1465	187	\N
1465	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1466	188	610
1509	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1510	180	987
1466	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1467	188	1174
1467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1468	188	1175
1468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1469	188	\N
1567	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1568	98	1450
1469	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1470	188	610
1510	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1511	226	933
1470	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1471	188	610
1471	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1472	188	610
1556	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1557	77	1042
1472	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1473	189	611
1511	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1512	226	933
1473	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1474	189	901
1474	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1475	189	904
1475	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1476	189	902
1512	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1513	226	933
1476	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1477	189	611
1477	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1478	189	901
1539	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1540	229	991
1478	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1479	189	611
1513	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1514	226	1337
1479	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1480	190	612
1480	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1481	190	905
1481	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1482	191	739
1514	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1515	226	932
1482	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1483	192	1150
1483	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1484	192	1150
1484	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1485	192	1150
1515	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1516	226	932
1485	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1486	57	1437
1540	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1541	229	990
1516	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1517	226	933
1486	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1487	57	749
1487	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1488	57	749
1488	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1489	57	1437
1557	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1558	77	969
1489	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1490	50	729
1490	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1491	50	1452
1541	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1542	76	1342
1491	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1492	50	1453
1518	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1519	227	1180
1492	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1493	50	1453
1493	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1494	50	\N
1494	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1495	50	\N
1495	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1496	194	744
1496	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1497	194	744
1519	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1520	227	1180
1497	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1498	194	744
1498	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1499	194	744
1517	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1518	227	1180
1499	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1500	194	744
1500	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1501	194	744
1542	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1543	76	1340
1501	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1502	195	745
1520	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1521	227	1180
1502	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1503	195	1176
1503	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1504	195	1176
1521	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1522	227	1180
1543	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1544	76	705
1523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1524	228	761
1558	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1559	77	1042
1522	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1523	228	761
1544	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1545	76	1427
1524	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1525	228	761
1525	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1526	47	591
1526	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1527	47	591
1545	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1546	76	1342
1527	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1528	47	591
1528	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1529	47	891
1568	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1569	98	1451
1529	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1530	47	891
1546	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1547	76	705
1530	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1531	47	819
1531	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1532	47	891
1532	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1533	47	\N
1533	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1534	47	\N
1534	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1535	47	\N
1535	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1536	47	\N
1559	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1560	77	1042
1536	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1537	47	591
1547	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1548	76	1427
1548	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1549	73	709
1560	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1561	77	1042
1549	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1550	73	709
1550	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1551	73	709
1575	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1576	109	686
1551	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1552	73	709
1569	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1570	100	736
1552	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1553	77	969
1553	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1554	77	969
1561	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1562	78	196
1554	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1555	77	1042
1555	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1556	77	969
1562	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1563	98	724
1570	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1571	179	687
1563	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1564	98	724
1564	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1565	98	1449
1565	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1566	98	1449
1571	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1572	107	842
1566	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1567	98	1450
1576	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1577	109	686
1572	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1573	106	1010
1580	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1581	109	1006
1573	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1574	108	913
1577	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1578	109	686
1574	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1575	109	686
1578	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1579	109	686
1579	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1580	109	1006
1581	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1582	110	688
1583	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1584	110	631
1582	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1583	110	631
1584	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1585	110	631
1585	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1586	113	762
1586	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1587	113	762
1587	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1588	113	\N
1588	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1589	113	762
1589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1590	113	804
1590	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1591	113	762
1591	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1592	113	804
1645	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1646	148	\N
1592	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1593	113	762
1593	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1594	113	762
1594	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1595	113	\N
1646	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1647	148	\N
1595	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1596	115	939
1596	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1597	114	763
810	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	810	114	988
1647	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1648	148	\N
1597	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1598	115	939
1598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1599	115	643
1678	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1679	293	788
1599	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1600	115	1457
1648	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1649	148	366
1600	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1601	82	1039
1601	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1602	82	1039
1602	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1603	82	1007
1649	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1650	148	368
1603	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1604	82	1041
1604	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1605	82	1038
1605	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1606	82	1038
1650	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1651	148	369
1606	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1607	82	1038
1607	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1608	82	1038
1679	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1680	293	788
1608	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1609	83	821
1651	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1652	193	613
1609	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1610	229	990
1610	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1611	229	653
1611	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1612	229	991
1652	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1653	193	906
1612	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1613	231	796
1613	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1614	231	796
1614	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1615	231	993
1653	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1654	193	613
1615	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1616	231	993
1616	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1617	234	660
1680	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1681	104	684
1617	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1618	234	946
1654	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1655	193	613
1618	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1619	234	946
1619	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1620	234	948
1620	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1621	234	\N
1621	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1622	234	946
1655	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1656	193	613
1622	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1623	234	660
1623	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1624	234	947
1698	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1699	236	1192
1624	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1625	234	946
1656	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1657	193	613
1625	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1626	232	278
1626	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1627	232	278
1681	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1682	106	1010
1627	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1628	232	279
1628	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1629	232	280
1629	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1630	232	280
1682	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1683	108	620
1630	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1631	232	280
1631	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1632	233	1186
1632	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1633	233	1187
1658	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1659	237	775
1633	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1634	233	1187
1726	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1727	236	1195
1634	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1635	233	1347
1366	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1367	233	1187
1657	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1658	237	775
1635	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1636	235	1133
1636	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1637	235	1189
1637	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1638	235	\N
1683	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1684	108	620
1638	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1639	235	1133
1659	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1660	237	775
1640	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1641	175	1204
1660	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1661	237	1199
1639	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1640	175	773
1641	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1642	41	534
427	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	427	148	368
429	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	429	148	369
1699	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1700	236	1193
1642	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1643	148	367
1661	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1662	237	1201
1643	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1644	148	366
1644	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1645	148	365
1684	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1685	108	620
1662	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1663	237	1202
1663	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1664	218	752
1664	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1665	230	769
1685	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1686	237	1285
1667	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1668	230	769
1668	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1669	230	1184
1669	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1670	230	769
1670	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1671	230	769
1671	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1672	230	1513
1710	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1711	236	1196
1686	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1687	237	1286
1673	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1674	237	1285
1700	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1701	236	1195
1672	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1673	237	1203
1687	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1688	176	776
1674	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1675	72	1008
1675	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1676	73	709
1676	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1677	293	788
1688	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1689	239	800
1677	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1678	293	788
1701	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1702	236	1196
1689	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1690	239	967
1690	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1691	239	1254
1702	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1703	236	\N
1691	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1692	239	968
1692	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1693	239	968
1711	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1712	236	\N
1693	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1694	239	968
1703	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1704	236	772
1694	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1695	236	772
1695	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1696	236	1198
1696	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1697	236	1190
1704	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1705	236	1194
1697	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1698	236	1065
1705	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1706	236	\N
1712	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1713	236	\N
1713	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1714	236	\N
1707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1708	236	1195
1706	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1707	236	1065
1714	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1715	236	\N
1708	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1709	236	1196
1709	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1710	236	1193
1718	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1719	236	1196
1715	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1716	236	1191
1716	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1717	236	1190
1722	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1723	236	1192
1719	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1720	236	1193
1717	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1718	236	1192
1720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1721	236	1191
1725	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1726	236	1191
1721	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1722	236	1065
1723	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1724	236	1065
1724	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1725	236	\N
1727	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1728	240	695
1728	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1729	240	695
1729	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1730	240	858
1730	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1731	240	859
1731	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1732	240	859
1732	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1733	240	859
1733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1734	240	530
1734	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1735	240	695
1735	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1736	241	824
1789	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1790	251	844
1736	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1737	241	1259
1737	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1738	241	824
1821	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1822	256	731
1738	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1739	241	824
1739	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1740	241	824
1665	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1666	230	1184
1740	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1741	242	825
1666	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1667	230	769
1741	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1742	242	1214
1742	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1743	242	1215
1743	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1744	242	1216
1790	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1791	250	719
1744	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1745	242	1216
1745	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1746	242	\N
1746	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1747	242	\N
1747	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1748	242	1214
1822	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1823	257	830
1748	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1749	247	827
1791	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1792	250	719
1749	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1750	247	1256
610	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	610	212	922
1750	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1751	212	922
1751	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1752	619	1113
1792	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1793	250	719
1752	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1753	619	1113
1753	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1754	243	853
1754	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1755	243	853
1793	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1794	250	719
1755	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1756	243	853
1756	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1757	243	853
1823	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1824	257	830
1757	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1758	243	855
1794	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1795	250	584
1758	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1759	243	854
1759	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1760	244	826
1760	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1761	244	826
1795	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1796	252	725
1761	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1762	244	826
1762	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1763	244	838
1763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1764	244	839
1796	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1797	252	725
1764	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1765	244	841
1765	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1766	244	840
1824	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1825	257	1323
1766	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1767	244	840
1797	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1798	35	1094
1767	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1768	245	570
1768	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1769	245	570
1769	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1770	245	803
1798	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1799	253	228
1770	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1771	245	875
1771	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1772	245	802
1799	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1800	253	\N
1772	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1773	245	716
1773	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1774	245	570
1851	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1852	263	915
1774	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1775	248	578
1800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1801	253	228
1775	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1776	248	578
1776	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1777	248	578
1825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1826	257	1324
1777	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1778	248	878
1801	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1802	253	1309
1778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1779	248	1346
1779	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1780	248	878
1780	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1781	248	1346
1802	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1803	253	227
1781	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1782	248	578
1782	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1783	249	828
1783	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1784	249	1325
1803	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1804	253	236
1784	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1785	249	1325
1785	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1786	249	1418
1826	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1827	257	830
1786	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1787	251	585
1804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1805	253	238
1787	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1788	251	585
1788	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1789	251	844
1805	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1806	254	680
1806	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1807	254	680
1827	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1828	258	831
1807	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1808	254	680
1808	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1809	254	680
1809	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1810	254	680
1810	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1811	255	\N
1828	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1829	258	831
1811	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1812	255	829
1812	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1813	255	829
1852	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1853	263	916
1813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1814	255	837
1829	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1830	258	831
1814	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1815	255	837
1815	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1816	255	997
1816	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1817	255	997
1830	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1831	258	831
1817	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1818	255	843
1818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1819	255	843
1842	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1843	262	1053
1819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1820	255	1395
1831	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1832	261	833
1820	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1821	256	1004
1832	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1833	261	833
1841	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1842	262	1053
1833	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1834	262	747
1853	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1854	263	916
1834	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1835	262	747
1843	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1844	262	1054
1835	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1836	262	1051
1836	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1837	262	1051
1837	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1838	262	1052
1844	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1845	262	1055
1838	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1839	262	1052
1839	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1840	262	1052
1840	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1841	262	1053
1845	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1846	262	1496
1854	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1855	83	848
1846	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1847	262	747
589	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	589	20	513
1847	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1848	263	624
1848	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1849	263	915
1849	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1850	263	915
1855	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1856	100	1359
1850	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1851	263	915
1856	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1857	179	687
\.


--
-- Data for Name: vehiculo_fotografia; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY vehiculo_fotografia (vehiculo_fotografia_id, imagen, categoria_id, vehiculo_id) FROM stdin;
1	foto-frontal-Frontal28.11.201212-48-58pm.	2	3
2	foto-lateral-Lateral28.11.201212-48-58pm.	3	3
3	foto-trasera-Trasera28.11.201212-48-58pm.	4	3
4	foto-frontal-Frontal28.11.201212-59-24pm.jpg	2	4
5	foto-lateral-Lateral28.11.201212-59-24pm.jpg	3	4
6	foto-frontal-Frontal28.11.20121-02-05pm.jpg	2	5
7	foto-lateral-Lateral28.11.20121-02-05pm.jpg	3	5
8	foto-trasera-Trasera28.11.20121-02-05pm.jpg	4	5
9	foto-frontal-Frontal28.11.20121-05-22pm.jpg	2	6
10	foto-lateral-Lateral28.11.20121-05-22pm.jpg	3	6
11	foto-trasera-Trasera28.11.20121-05-22pm.jpg	4	6
14	foto-trasera-Trasera28.11.20121-08-51pm.jpg	4	7
24	foto-frontal-Frontal28.11.20121-24-24pm.jpg	2	10
25	foto-lateral-Lateral28.11.20121-24-24pm.jpg	3	10
26	foto-trasera-Trasera28.11.20121-24-24pm.jpg	4	10
27	foto-frontal-Frontal28.11.20121-26-45pm.jpg	2	11
28	foto-lateral-Lateral28.11.20121-26-45pm.jpg	3	11
29	foto-trasera-Trasera28.11.20121-26-45pm.jpg	4	11
30	foto-frontal-Frontal28.11.20121-34-39pm.jpg	2	12
31	foto-lateral-Lateral28.11.20121-34-39pm.jpg	3	12
32	foto-frontal-Frontal28.11.20125-51-54pm.jpg	2	15
33	foto-lateral-Lateral28.11.20125-51-54pm.jpg	3	15
34	foto-trasera-Trasera28.11.20125-51-54pm.jpg	4	15
36	foto-lateral-Lateral28.11.20126-06-21pm.jpg	3	16
39	foto-frontal-Frontal29.11.20129-36-46am.jpg	2	19
40	foto-lateral-Lateral29.11.20129-36-46am.jpg	3	19
41	foto-trasera-Trasera29.11.20129-36-46am.jpg	4	19
42	foto-frontal-FR23.01.20139-10-45am.jpg	2	20
43	foto-lateral-LAT23.01.20139-10-45am.jpg	3	20
44	foto-trasera-TR23.01.20139-10-45am.jpg	4	20
48	foto-frontal-FR23.01.20139-51-33am.jpg	2	22
49	foto-lateral-LA23.01.20139-51-33am.jpg	3	22
50	foto-trasera-TR23.01.20139-51-33am.jpg	4	22
52	foto-frontal-bafa628f3bf04c93df0de1943fa1ad5120.02.20135-29-17pm.jpg	2	706
53	foto-frontal-FR21.02.20132-45-20pm.jpg	2	739
54	foto-lateral-LA21.02.20132-45-20pm.jpg	3	739
55	foto-trasera-TR21.02.20132-45-20pm.jpg	4	739
56	foto-frontal-FR21.02.20132-48-32pm.jpg	2	740
57	foto-lateral-LA21.02.20132-48-32pm.jpg	3	740
58	foto-trasera-TR21.02.20132-48-32pm.jpg	4	740
59	foto-frontal-FR21.02.20132-51-27pm.jpg	2	741
60	foto-lateral-LA21.02.20132-51-27pm.jpg	3	741
61	foto-trasera-TR21.02.20132-51-27pm.jpg	4	741
62	foto-frontal-FR21.02.20132-53-50pm.jpg	2	737
63	foto-lateral-LA21.02.20132-53-50pm.jpg	3	737
64	foto-trasera-TR21.02.20132-53-50pm.jpg	4	737
65	foto-frontal-01-web-bomberos-home05.03.20136-19-16pm.jpg	2	947
66	foto-lateral-02-web-bomberos-noticia05.03.20136-19-16pm.jpg	3	947
67	foto-trasera-03-web-bomberos-noticia-detalle05.03.20136-19-16pm.jpg	4	947
68	foto-frontal-0106.03.201311-11-08am.jpg	2	443
69	foto-lateral-0206.03.201311-11-08am.jpg	3	443
70	foto-frontal-carro-bomberos-1-cia-mariquina06.03.201312-21-49pm.jpg	2	949
71	foto-lateral-carro-bomba-chile106.03.201312-21-49pm.jpg	3	949
72	foto-trasera-39538_gallery06.03.201312-21-49pm.jpg	4	949
73	foto-frontal-fr07.03.201310-30-33am.jpg	2	950
74	foto-lateral-la07.03.201310-30-33am.jpg	3	950
75	foto-trasera-tr07.03.201310-30-33am.jpg	4	950
76	foto-frontal-fr07.03.201311-39-40am.jpg	2	953
77	foto-lateral-la07.03.201311-39-40am.jpg	3	953
78	foto-trasera-tr07.03.201311-39-40am.jpg	4	953
79	foto-frontal-fr07.03.201311-42-26am.jpg	2	954
80	foto-lateral-la07.03.201311-42-26am.jpg	3	954
81	foto-trasera-tr07.03.201311-42-26am.jpg	4	954
82	foto-frontal-fr07.03.201312-01-28pm.jpg	2	955
83	foto-lateral-la07.03.201312-01-28pm.jpg	3	955
84	foto-trasera-tr07.03.201312-01-28pm.jpg	4	955
85	foto-frontal-fr07.03.201312-09-19pm.jpg	2	956
86	foto-lateral-la07.03.201312-09-19pm.jpg	3	956
87	foto-trasera-tr07.03.201312-09-19pm.jpg	4	956
88	foto-frontal-fr07.03.201312-34-01pm.jpg	2	959
89	foto-lateral-la07.03.201312-34-01pm.jpg	3	959
90	foto-trasera-tr07.03.201312-34-01pm.jpg	4	959
91	foto-frontal-FR07.03.201312-39-40pm.jpg	2	960
92	foto-lateral-LA07.03.201312-39-40pm.jpg	3	960
93	foto-trasera-TR07.03.201312-39-40pm.jpg	4	960
94	foto-frontal-FR07.03.20131-00-20pm.jpg	2	961
95	foto-lateral-LA07.03.20131-00-20pm.jpg	3	961
96	foto-trasera-TR07.03.20131-00-20pm.jpg	4	961
97	foto-frontal-FR07.03.20132-06-59pm.jpg	2	962
98	foto-lateral-LA07.03.20132-06-59pm.jpg	3	962
99	foto-trasera-TR07.03.20132-06-59pm.jpg	4	962
100	foto-frontal-FR07.03.20133-01-31pm.jpg	2	964
101	foto-lateral-LA07.03.20133-01-31pm.jpg	3	964
102	foto-trasera-TR07.03.20133-01-31pm.jpg	4	964
103	foto-frontal-FR07.03.20133-07-12pm.jpg	2	965
104	foto-lateral-LA07.03.20133-07-12pm.jpg	3	965
105	foto-trasera-TR07.03.20133-07-12pm.jpg	4	965
106	foto-frontal-FRT07.03.20133-26-31pm.jpg	2	966
107	foto-lateral-LA07.03.20133-26-31pm.jpg	3	966
108	foto-trasera-TR07.03.20133-26-31pm.jpg	4	966
109	foto-frontal-FR07.03.20133-42-38pm.jpg	2	967
110	foto-lateral-LA07.03.20133-42-38pm.jpg	3	967
111	foto-trasera-TR07.03.20133-42-38pm.jpg	4	967
112	foto-frontal-fr07.03.20133-49-35pm.jpg	2	968
113	foto-lateral-le07.03.20133-49-35pm.jpg	3	968
114	foto-trasera-tr07.03.20133-49-35pm.jpg	4	968
115	foto-frontal-fr07.03.20133-59-25pm.jpg	2	970
116	foto-frontal-front07.03.20134-02-02pm.jpg	2	971
117	foto-lateral-lat07.03.20134-02-02pm.jpg	3	971
118	foto-frontal-fr07.03.20134-06-30pm.jpg	2	972
119	foto-frontal-FRONT07.03.20134-11-04pm.jpg	2	973
120	foto-lateral-LAT07.03.20134-11-04pm.jpg	3	973
121	foto-frontal-FR07.03.20134-18-36pm.jpg	2	974
122	foto-lateral-LA07.03.20134-18-36pm.jpg	3	974
123	foto-trasera-TR07.03.20134-18-36pm.jpg	4	974
124	foto-frontal-FR07.03.20134-24-12pm.jpg	2	975
125	foto-lateral-L07.03.20134-24-12pm.jpg	3	975
126	foto-trasera-TR07.03.20134-24-12pm.jpg	4	975
127	foto-frontal-FR07.03.20134-41-51pm.jpg	2	977
128	foto-lateral-L07.03.20134-41-51pm.jpg	3	977
129	foto-trasera-TR07.03.20134-41-51pm.jpg	4	977
131	foto-lateral-LADO07.03.20134-50-13pm.jpg	3	978
132	foto-frontal-fr07.03.20135-12-20pm.jpg	2	981
133	foto-frontal-fr07.03.20135-18-16pm.jpg	2	982
134	foto-lateral-la07.03.20135-18-16pm.jpg	3	982
135	foto-trasera-tr07.03.20135-18-16pm.jpg	4	982
136	foto-frontal-fr07.03.20135-21-30pm.jpg	2	983
138	foto-trasera-tr07.03.20135-21-30pm.jpg	4	983
139	foto-frontal-fr07.03.20135-24-39pm.jpg	2	984
140	foto-frontal-fr07.03.20135-36-46pm.jpg	2	985
141	foto-lateral-la07.03.20135-36-46pm.jpg	3	985
142	foto-frontal-fr07.03.20135-39-27pm.jpg	2	986
143	foto-frontal-frt07.03.20135-41-48pm.jpg	2	987
144	foto-frontal-front07.03.20135-44-26pm.jpg	2	988
145	foto-frontal-79ccebb9e95c52631528df5311b6538407.03.20135-50-01pm.jpg	2	990
146	foto-frontal-fr07.03.20135-52-25pm.jpg	2	991
147	foto-frontal-frt07.03.20136-04-01pm.jpg	2	992
148	foto-frontal-frente07.03.20136-12-00pm.jpg	2	994
149	foto-lateral-lado07.03.20136-12-00pm.jpg	3	994
150	foto-frontal-fr07.03.20136-17-15pm.jpg	2	995
151	foto-lateral-l07.03.20136-17-15pm.jpg	3	995
152	foto-trasera-tr07.03.20136-17-15pm.jpg	4	995
153	foto-frontal-fr07.03.20136-20-46pm.jpg	2	996
154	foto-lateral-l07.03.20136-20-46pm.jpg	3	996
155	foto-trasera-t07.03.20136-20-46pm.jpg	4	996
156	foto-frontal-fr07.03.20136-25-36pm.jpg	2	997
157	foto-lateral-l07.03.20136-25-36pm.jpg	3	997
158	foto-trasera-tr07.03.20136-25-36pm.jpg	4	997
159	foto-frontal-fr07.03.20136-28-00pm.jpg	2	998
160	foto-lateral-l07.03.20136-28-00pm.jpg	3	998
161	foto-trasera-tr07.03.20136-28-00pm.jpg	4	998
162	foto-frontal-fr07.03.20136-31-12pm.jpg	2	999
163	foto-lateral-l07.03.20136-31-12pm.jpg	3	999
164	foto-trasera-tr07.03.20136-31-12pm.jpg	4	999
165	foto-frontal-fr07.03.20136-33-42pm.jpg	2	1000
166	foto-lateral-la07.03.20136-33-42pm.jpg	3	1000
167	foto-trasera-tr07.03.20136-33-42pm.jpg	4	1000
168	foto-frontal-fr07.03.20136-36-19pm.jpg	2	1001
169	foto-lateral-lt07.03.20136-36-19pm.jpg	3	1001
170	foto-trasera-tr07.03.20136-36-19pm.jpg	4	1001
171	foto-frontal-fr07.03.20136-38-41pm.jpg	2	1002
172	foto-lateral-la07.03.20136-38-41pm.jpg	3	1002
173	foto-trasera-tr07.03.20136-38-41pm.jpg	4	1002
174	foto-frontal-fr07.03.20136-41-34pm.jpg	2	1003
175	foto-lateral-l07.03.20136-41-34pm.jpg	3	1003
176	foto-trasera-tr07.03.20136-41-34pm.jpg	4	1003
177	foto-frontal-fr08.03.20139-14-53am.jpg	2	1004
178	foto-lateral-la08.03.20139-14-53am.jpg	3	1004
179	foto-frontal-fr08.03.20139-19-56am.jpg	2	1005
180	foto-lateral-la08.03.20139-19-56am.jpg	3	1005
181	foto-trasera-tr08.03.20139-19-56am.jpg	4	1005
182	foto-frontal-fr08.03.20139-28-12am.jpg	2	1006
183	foto-lateral-la08.03.20139-28-12am.jpg	3	1006
184	foto-trasera-tr08.03.20139-28-12am.jpg	4	1006
185	foto-frontal-FR08.03.20139-49-19am.JPG	2	1007
186	foto-lateral-LA08.03.20139-49-19am.jpg	3	1007
187	foto-trasera-TR08.03.20139-49-19am.jpg	4	1007
188	foto-frontal-FR08.03.20139-50-57am.jpg	2	74
189	foto-lateral-LA08.03.20139-50-57am.jpg	3	74
190	foto-trasera-TR08.03.20139-50-57am.jpg	4	74
191	foto-frontal-FR08.03.20139-58-48am.jpg	2	1008
192	foto-lateral-LA08.03.20139-58-48am.jpg	3	1008
193	foto-trasera-TR08.03.20139-58-48am.jpg	4	1008
194	foto-frontal-FR08.03.201310-03-14am.jpg	2	1009
195	foto-lateral-LA08.03.201310-03-14am.jpg	3	1009
196	foto-trasera-TR08.03.201310-03-14am.jpg	4	1009
197	foto-frontal-FR08.03.201310-07-45am.jpg	2	1010
198	foto-lateral-L08.03.201310-07-45am.jpg	3	1010
199	foto-trasera-TR08.03.201310-07-45am.jpg	4	1010
200	foto-frontal-fr08.03.201310-53-18am.jpg	2	1015
201	foto-lateral-la08.03.201310-53-18am.jpg	3	1015
202	foto-trasera-tr08.03.201310-53-18am.jpg	4	1015
203	foto-frontal-fr08.03.201310-58-55am.jpg	2	1016
204	foto-lateral-la08.03.201310-58-55am.jpg	3	1016
205	foto-trasera-tr08.03.201310-58-55am.jpg	4	1016
206	foto-frontal-fr08.03.201311-01-58am.jpg	2	1017
207	foto-lateral-la08.03.201311-01-58am.jpg	3	1017
208	foto-trasera-tr08.03.201311-01-58am.jpg	4	1017
209	foto-frontal-fr08.03.201311-06-58am.jpg	2	1018
210	foto-lateral-l08.03.201311-06-58am.jpg	3	1018
211	foto-trasera-tr08.03.201311-06-58am.jpg	4	1018
212	foto-frontal-fr08.03.201311-29-10am.jpg	2	1021
213	foto-lateral-l08.03.201311-29-10am.jpg	3	1021
214	foto-trasera-tr08.03.201311-29-10am.jpg	4	1021
215	foto-frontal-fr08.03.201311-37-42am.jpg	2	1024
216	foto-lateral-la08.03.201311-37-42am.jpg	3	1024
217	foto-trasera-tr08.03.201311-37-42am.jpg	4	1024
218	foto-frontal-fr08.03.201311-40-31am.jpg	2	1025
219	foto-lateral-la08.03.201311-40-31am.jpg	3	1025
220	foto-frontal-fr08.03.201311-54-27am.jpg	2	1026
221	foto-lateral-la08.03.201311-54-27am.jpg	3	1026
222	foto-trasera-tr08.03.201311-54-27am.jpg	4	1026
223	foto-frontal-fr08.03.201311-59-27am.jpg	2	1027
224	foto-lateral-la08.03.201311-59-27am.jpg	3	1027
225	foto-trasera-tr08.03.201311-59-27am.jpg	4	1027
226	foto-frontal-fr08.03.201312-02-23pm.jpg	2	1028
227	foto-lateral-la08.03.201312-02-23pm.jpg	3	1028
228	foto-trasera-tr08.03.201312-02-23pm.jpg	4	1028
229	foto-frontal-FR08.03.201312-25-58pm.jpg	2	1029
230	foto-lateral-LA08.03.201312-25-58pm.jpg	3	1029
231	foto-trasera-TR08.03.201312-25-58pm.jpg	4	1029
232	foto-frontal-FR08.03.201312-30-57pm.jpg	2	1030
233	foto-lateral-LA08.03.201312-30-57pm.jpg	3	1030
234	foto-trasera-TR08.03.201312-30-57pm.jpg	4	1030
235	foto-frontal-FR08.03.201312-37-35pm.jpg	2	1031
236	foto-lateral-LA08.03.201312-37-35pm.jpg	3	1031
237	foto-trasera-TR08.03.201312-37-35pm.jpg	4	1031
238	foto-frontal-FR08.03.201312-45-12pm.jpg	2	1032
239	foto-lateral-LA08.03.201312-45-12pm.jpg	3	1032
240	foto-trasera-TR08.03.201312-45-12pm.jpg	4	1032
241	foto-frontal-FR08.03.201312-51-55pm.jpg	2	1033
242	foto-lateral-LA08.03.201312-51-55pm.jpg	3	1033
243	foto-trasera-TR08.03.201312-51-55pm.jpg	4	1033
244	foto-frontal-FR08.03.201312-55-14pm.jpg	2	1034
245	foto-lateral-LA08.03.201312-55-14pm.jpg	3	1034
246	foto-trasera-TR08.03.201312-55-14pm.jpg	4	1034
247	foto-frontal-FR08.03.20131-03-28pm.jpg	2	1035
248	foto-lateral-LA08.03.20131-03-28pm.jpg	3	1035
249	foto-trasera-TR08.03.20131-03-28pm.jpg	4	1035
250	foto-frontal-FR08.03.20131-07-52pm.jpg	2	1036
251	foto-lateral-LA08.03.20131-07-52pm.jpg	3	1036
252	foto-trasera-TR08.03.20131-07-52pm.jpg	4	1036
253	foto-frontal-fr08.03.20134-49-14pm.jpg	2	1037
254	foto-lateral-la08.03.20134-49-14pm.jpg	3	1037
255	foto-frontal-cam08.03.20134-52-27pm.jpg	2	1038
256	foto-frontal-fr08.03.20135-09-45pm.jpg	2	1039
257	foto-lateral-lado08.03.20135-09-45pm.jpg	3	1039
258	foto-trasera-tr08.03.20135-09-45pm.jpg	4	1039
259	foto-frontal-fr08.03.20135-32-27pm.jpg	2	1040
260	foto-lateral-la08.03.20135-32-27pm.jpg	3	1040
261	foto-trasera-tr08.03.20135-32-27pm.jpg	4	1040
262	foto-frontal-carro08.03.20135-41-34pm.jpg	2	1041
263	foto-frontal-fr08.03.20135-46-23pm.jpg	2	1042
264	foto-frontal-fren08.03.20135-50-55pm.jpg	2	1043
265	foto-frontal-FR08.03.20136-26-54pm.jpg	2	1044
266	foto-lateral-LA08.03.20136-26-54pm.jpg	3	1044
267	foto-trasera-TR08.03.20136-26-54pm.jpg	4	1044
268	foto-frontal-FR08.03.20136-32-04pm.jpg	2	1045
269	foto-lateral-LA08.03.20136-32-04pm.jpg	3	1045
270	foto-trasera-TR08.03.20136-32-04pm.jpg	4	1045
271	foto-frontal-fr11.03.20137-57-19am.jpg	2	1046
272	foto-lateral-la11.03.20137-57-19am.jpg	3	1046
273	foto-trasera-tr11.03.20137-57-19am.jpg	4	1046
274	foto-frontal-fr11.03.20137-59-46am.jpg	2	1047
275	foto-lateral-la11.03.20137-59-46am.jpg	3	1047
276	foto-trasera-tr11.03.20137-59-46am.jpg	4	1047
277	foto-frontal-fr11.03.20138-03-15am.jpg	2	1048
279	foto-trasera-tr11.03.20138-03-15am.jpg	4	1048
280	foto-frontal-fr11.03.20138-06-02am.jpg	2	1049
281	foto-frontal-fr11.03.20138-14-15am.jpg	2	1050
282	foto-lateral-la11.03.20138-14-15am.jpg	3	1050
283	foto-trasera-tr11.03.20138-14-15am.jpg	4	1050
284	foto-frontal-fr11.03.20139-33-00am.jpg	2	1051
285	foto-lateral-la11.03.20139-33-00am.jpg	3	1051
286	foto-trasera-tr11.03.20139-33-00am.jpg	4	1051
287	foto-frontal-FR11.03.20139-48-34am.jpg	2	1052
288	foto-lateral-LA11.03.20139-48-34am.jpg	3	1052
289	foto-trasera-TR11.03.20139-48-34am.jpg	4	1052
290	foto-frontal-fr12.03.20139-24-26am.jpg	2	1054
291	foto-lateral-la12.03.20139-24-26am.jpg	3	1054
292	foto-trasera-tr12.03.20139-24-26am.jpg	4	1054
293	foto-frontal-fr12.03.20139-49-35am.jpg	2	1056
294	foto-lateral-la12.03.20139-49-35am.jpg	3	1056
295	foto-trasera-tr12.03.20139-49-35am.jpg	4	1056
296	foto-frontal-fr12.03.20139-53-17am.jpg	2	1057
297	foto-lateral-la12.03.20139-53-17am.jpg	3	1057
298	foto-trasera-tr12.03.20139-53-17am.jpg	4	1057
299	foto-frontal-FR12.03.201310-00-43am.jpg	2	1059
301	foto-trasera-TR12.03.201310-00-43am.jpg	4	1059
302	foto-frontal-fr12.03.201310-23-54am.jpg	2	1060
303	foto-lateral-la12.03.201310-23-54am.jpg	3	1060
304	foto-frontal-fr12.03.201310-26-33am.jpg	2	1061
305	foto-lateral-la12.03.201310-26-33am.jpg	3	1061
306	foto-trasera-tr12.03.201310-26-33am.jpg	4	1061
307	foto-frontal-fr12.03.201310-29-29am.jpg	2	1062
308	foto-lateral-la12.03.201310-29-29am.jpg	3	1062
309	foto-trasera-tr12.03.201310-29-29am.jpg	4	1062
310	foto-frontal-fr12.03.201310-32-04am.jpg	2	1063
311	foto-lateral-la12.03.201310-32-04am.jpg	3	1063
312	foto-trasera-tr12.03.201310-32-04am.jpg	4	1063
313	foto-frontal-FR12.03.201310-45-07am.jpg	2	1066
314	foto-lateral-LA12.03.201310-45-07am.jpg	3	1066
315	foto-trasera-TR12.03.201310-45-07am.jpg	4	1066
316	foto-frontal-fr12.03.201312-25-44pm.jpg	2	1068
317	foto-lateral-la12.03.201312-25-44pm.jpg	3	1068
319	foto-lateral-lat12.03.20131-37-17pm.jpg	3	1069
320	foto-trasera-tras12.03.20131-37-17pm.jpg	4	1069
321	foto-frontal-fr12.03.20131-39-46pm.jpg	2	1070
322	foto-lateral-la12.03.20131-39-46pm.jpg	3	1070
323	foto-trasera-tr12.03.20131-39-46pm.jpg	4	1070
324	foto-frontal-fr12.03.20131-42-35pm.jpg	2	1071
325	foto-lateral-la12.03.20131-42-35pm.jpg	3	1071
326	foto-trasera-tr12.03.20131-42-35pm.jpg	4	1071
327	foto-frontal-fr12.03.20131-45-01pm.jpg	2	1072
328	foto-frontal-fr12.03.20131-51-00pm.jpg	2	1073
329	foto-lateral-la12.03.20131-51-00pm.jpg	3	1073
330	foto-trasera-tr12.03.20131-51-00pm.jpg	4	1073
331	foto-frontal-fr12.03.20132-04-21pm.jpg	2	1075
332	foto-lateral-la12.03.20132-04-21pm.jpg	3	1075
333	foto-trasera-tr12.03.20132-04-21pm.jpg	4	1075
334	foto-frontal-fr12.03.20132-11-31pm.jpg	2	1076
335	foto-lateral-la12.03.20132-11-31pm.jpg	3	1076
336	foto-trasera-tr12.03.20132-11-31pm.jpg	4	1076
337	foto-frontal-fr12.03.20132-14-08pm.jpg	2	1077
338	foto-lateral-la12.03.20132-14-08pm.jpg	3	1077
339	foto-trasera-tr12.03.20132-14-08pm.jpg	4	1077
340	foto-frontal-fr12.03.20132-17-55pm.jpg	2	1078
341	foto-lateral-la12.03.20132-17-55pm.jpg	3	1078
342	foto-trasera-tr12.03.20132-17-55pm.jpg	4	1078
343	foto-frontal-fr12.03.20132-20-59pm.jpg	2	1079
344	foto-lateral-la12.03.20132-20-59pm.jpg	3	1079
345	foto-trasera-tr12.03.20132-20-59pm.jpg	4	1079
346	foto-frontal-fr12.03.20132-27-29pm.jpg	2	1080
347	foto-lateral-la12.03.20132-27-29pm.jpg	3	1080
348	foto-trasera-tr12.03.20132-27-29pm.jpg	4	1080
349	foto-frontal-fr12.03.20132-35-42pm.jpg	2	1081
350	foto-lateral-la12.03.20132-35-42pm.jpg	3	1081
351	foto-trasera-tr12.03.20132-35-42pm.jpg	4	1081
352	foto-frontal-fr12.03.20132-38-38pm.jpg	2	1082
353	foto-lateral-la12.03.20132-38-38pm.jpg	3	1082
354	foto-trasera-tr12.03.20132-38-38pm.jpg	4	1082
355	foto-frontal-fr12.03.20132-41-54pm.jpg	2	1083
356	foto-lateral-la12.03.20132-41-54pm.jpg	3	1083
357	foto-trasera-tr12.03.20132-41-54pm.jpg	4	1083
358	foto-frontal-fr12.03.20132-45-44pm.jpg	2	1084
359	foto-lateral-la12.03.20132-45-44pm.jpg	3	1084
360	foto-trasera-tr12.03.20132-45-44pm.jpg	4	1084
361	foto-frontal-fr12.03.20133-02-01pm.jpg	2	1085
362	foto-lateral-la12.03.20133-02-01pm.jpg	3	1085
363	foto-frontal-fr12.03.20133-05-50pm.jpg	2	1086
364	foto-lateral-la12.03.20133-05-50pm.jpg	3	1086
365	foto-trasera-tr12.03.20133-05-50pm.jpg	4	1086
366	foto-frontal-fr12.03.20133-26-05pm.jpg	2	1087
367	foto-lateral-la12.03.20133-26-05pm.jpg	3	1087
368	foto-trasera-tr12.03.20133-26-05pm.jpg	4	1087
369	foto-frontal-fr12.03.20133-39-29pm.jpg	2	1088
370	foto-lateral-la12.03.20133-39-29pm.jpg	3	1088
371	foto-trasera-tr12.03.20133-39-29pm.jpg	4	1088
372	foto-frontal-FR12.03.20133-42-49pm.jpg	2	1089
373	foto-lateral-LA12.03.20133-42-49pm.jpg	3	1089
374	foto-trasera-TR12.03.20133-42-49pm.jpg	4	1089
375	foto-frontal-fr12.03.20133-45-16pm.jpg	2	1090
376	foto-lateral-la12.03.20133-45-16pm.jpg	3	1090
377	foto-trasera-tr12.03.20133-45-16pm.jpg	4	1090
378	foto-frontal-fr12.03.20134-00-26pm.jpg	2	1091
379	foto-lateral-la12.03.20134-00-26pm.jpg	3	1091
380	foto-trasera-tr12.03.20134-00-26pm.jpg	4	1091
381	foto-frontal-fr12.03.20134-20-00pm.jpg	2	1092
382	foto-lateral-la12.03.20134-20-00pm.jpg	3	1092
383	foto-trasera-tr12.03.20134-20-00pm.jpg	4	1092
384	foto-frontal-fr12.03.20134-23-36pm.jpg	2	1093
385	foto-lateral-la12.03.20134-23-36pm.jpg	3	1093
386	foto-trasera-tr12.03.20134-23-36pm.jpg	4	1093
387	foto-frontal-fr12.03.20134-31-23pm.jpg	2	1094
388	foto-lateral-la12.03.20134-31-23pm.jpg	3	1094
389	foto-trasera-tr12.03.20134-31-23pm.jpg	4	1094
390	foto-frontal-fr12.03.20134-34-06pm.jpg	2	1095
391	foto-lateral-la12.03.20134-34-06pm.jpg	3	1095
392	foto-trasera-tr12.03.20134-34-06pm.jpg	4	1095
393	foto-frontal-fr12.03.20134-37-14pm.jpg	2	1096
394	foto-lateral-la12.03.20134-37-14pm.jpg	3	1096
395	foto-trasera-tr12.03.20134-37-14pm.jpg	4	1096
396	foto-frontal-FR12.03.20134-53-14pm.jpg	2	833
397	foto-lateral-LA12.03.20134-53-14pm.jpg	3	833
398	foto-trasera-TR12.03.20134-53-14pm.jpg	4	833
399	foto-frontal-fr12.03.20134-56-52pm.jpg	2	1097
400	foto-lateral-la12.03.20134-56-52pm.jpg	3	1097
401	foto-trasera-tr12.03.20134-56-52pm.jpg	4	1097
402	foto-frontal-fr12.03.20135-19-38pm.jpg	2	1098
403	foto-lateral-la12.03.20135-19-38pm.jpg	3	1098
404	foto-trasera-tr12.03.20135-19-38pm.jpg	4	1098
405	foto-frontal-fr12.03.20135-22-53pm.jpg	2	1099
407	foto-trasera-tr12.03.20135-22-53pm.jpg	4	1099
408	foto-frontal-fr12.03.20135-28-46pm.jpg	2	1100
409	foto-lateral-la12.03.20135-28-46pm.jpg	3	1100
410	foto-trasera-tr12.03.20135-28-46pm.jpg	4	1100
411	foto-frontal-fr12.03.20135-32-02pm.jpg	2	1101
412	foto-lateral-la12.03.20135-32-02pm.jpg	3	1101
413	foto-trasera-tr12.03.20135-32-02pm.jpg	4	1101
414	foto-frontal-fr12.03.20135-34-39pm.jpg	2	1102
415	foto-lateral-la12.03.20135-34-39pm.jpg	3	1102
416	foto-frontal-fr13.03.20138-13-17am.jpg	2	1103
417	foto-lateral-la13.03.20138-13-17am.jpg	3	1103
418	foto-trasera-tr13.03.20138-13-17am.jpg	4	1103
419	foto-frontal-fr13.03.20138-16-39am.jpg	2	1104
420	foto-lateral-la13.03.20138-16-39am.jpg	3	1104
421	foto-trasera-tr13.03.20138-16-39am.jpg	4	1104
422	foto-frontal-fr13.03.20138-22-31am.jpg	2	1105
423	foto-lateral-la13.03.20138-22-31am.jpg	3	1105
424	foto-trasera-tr13.03.20138-22-31am.jpg	4	1105
425	foto-frontal-fr13.03.20138-25-17am.jpg	2	1106
426	foto-lateral-la13.03.20138-25-17am.jpg	3	1106
427	foto-trasera-tr13.03.20138-25-17am.jpg	4	1106
428	foto-frontal-fr13.03.20138-27-26am.jpg	2	1107
429	foto-lateral-la13.03.20138-27-26am.jpg	3	1107
430	foto-trasera-tr13.03.20138-27-26am.jpg	4	1107
431	foto-frontal-fr13.03.20138-30-15am.jpg	2	1108
432	foto-lateral-la13.03.20138-30-15am.jpg	3	1108
433	foto-trasera-tr13.03.20138-30-15am.jpg	4	1108
434	foto-frontal-fr13.03.20138-32-40am.jpg	2	1109
435	foto-lateral-la13.03.20138-32-40am.jpg	3	1109
436	foto-trasera-tr13.03.20138-32-40am.jpg	4	1109
438	foto-lateral-la13.03.20138-55-37am.jpg	3	1111
439	foto-trasera-tr13.03.20138-55-37am.jpg	4	1111
440	foto-frontal-fr13.03.20139-08-58am.jpg	2	1113
441	foto-lateral-la13.03.20139-08-58am.jpg	3	1113
442	foto-trasera-tr13.03.20139-08-58am.jpg	4	1113
443	foto-frontal-fr13.03.20139-11-47am.jpg	2	1114
444	foto-lateral-la13.03.20139-11-47am.jpg	3	1114
445	foto-trasera-tr13.03.20139-11-47am.jpg	4	1114
446	foto-frontal-fr13.03.20139-28-35am.jpg	2	1116
448	foto-trasera-tr13.03.20139-28-35am.jpg	4	1116
449	foto-frontal-fr13.03.20139-31-04am.jpg	2	1117
450	foto-lateral-la13.03.20139-31-04am.jpg	3	1117
451	foto-frontal-fr13.03.20139-36-37am.jpg	2	1118
452	foto-lateral-la13.03.20139-36-37am.jpg	3	1118
453	foto-trasera-tr13.03.20139-36-37am.jpg	4	1118
454	foto-frontal-FR13.03.20139-47-52am.jpg	2	1120
455	foto-lateral-LA13.03.20139-47-52am.jpg	3	1120
456	foto-trasera-TR13.03.20139-47-52am.jpg	4	1120
457	foto-frontal-FR13.03.20139-49-53am.jpg	2	1121
458	foto-lateral-LA13.03.20139-49-53am.jpg	3	1121
459	foto-trasera-TR13.03.20139-49-53am.jpg	4	1121
460	foto-frontal-fr13.03.20139-52-17am.jpg	2	1122
461	foto-lateral-la13.03.20139-52-17am.jpg	3	1122
462	foto-trasera-tr13.03.20139-52-17am.jpg	4	1122
463	foto-frontal-fr13.03.20139-54-53am.jpg	2	1123
464	foto-lateral-la13.03.20139-54-53am.jpg	3	1123
465	foto-trasera-tr13.03.20139-54-53am.jpg	4	1123
466	foto-frontal-fr13.03.20139-57-36am.jpg	2	1124
467	foto-lateral-la13.03.20139-57-36am.jpg	3	1124
468	foto-trasera-tr13.03.20139-57-36am.jpg	4	1124
469	foto-frontal-fr13.03.201310-15-12am.jpg	2	1125
470	foto-lateral-la13.03.201310-15-12am.jpg	3	1125
471	foto-trasera-tr13.03.201310-15-12am.jpg	4	1125
472	foto-frontal-fr13.03.201310-17-37am.jpg	2	1126
473	foto-lateral-la13.03.201310-17-37am.jpg	3	1126
474	foto-trasera-tr13.03.201310-17-37am.jpg	4	1126
475	foto-frontal-fr13.03.201310-20-11am.jpg	2	1127
476	foto-lateral-la13.03.201310-20-11am.jpg	3	1127
477	foto-trasera-tr13.03.201310-20-11am.jpg	4	1127
478	foto-frontal-fr13.03.201310-24-24am.jpg	2	1128
479	foto-lateral-la13.03.201310-24-24am.jpg	3	1128
480	foto-trasera-tr13.03.201310-24-24am.jpg	4	1128
481	foto-frontal-fr13.03.201310-28-08am.jpg	2	1129
482	foto-lateral-la13.03.201310-28-08am.jpg	3	1129
483	foto-trasera-tr13.03.201310-28-08am.jpg	4	1129
484	foto-frontal-fr13.03.201310-48-47am.jpg	2	1130
485	foto-lateral-la13.03.201310-48-47am.jpg	3	1130
486	foto-trasera-tr13.03.201310-48-47am.jpg	4	1130
487	foto-frontal-FR13.03.201311-08-46am.jpg	2	1131
488	foto-lateral-LA13.03.201311-08-46am.jpg	3	1131
489	foto-trasera-TR13.03.201311-08-46am.jpg	4	1131
490	foto-frontal-FR13.03.201311-11-19am.jpg	2	1132
491	foto-lateral-LA13.03.201311-11-19am.jpg	3	1132
492	foto-trasera-TR13.03.201311-11-19am.jpg	4	1132
493	foto-frontal-FR13.03.201311-16-40am.jpg	2	1133
494	foto-lateral-LA13.03.201311-16-40am.jpg	3	1133
495	foto-trasera-TR13.03.201311-16-40am.jpg	4	1133
496	foto-frontal-FR13.03.201311-20-15am.jpg	2	1134
497	foto-lateral-LA13.03.201311-20-15am.jpg	3	1134
498	foto-trasera-TR13.03.201311-20-15am.jpg	4	1134
499	foto-frontal-FR13.03.201311-30-32am.jpg	2	1135
500	foto-lateral-LA13.03.201311-30-32am.jpg	3	1135
501	foto-trasera-TR13.03.201311-30-32am.jpg	4	1135
502	foto-frontal-FR13.03.20132-05-45pm.jpg	2	1137
503	foto-lateral-LA13.03.20132-05-45pm.jpg	3	1137
504	foto-trasera-TR13.03.20132-05-45pm.jpg	4	1137
505	foto-frontal-FR13.03.20132-09-26pm.jpg	2	1138
506	foto-lateral-LA13.03.20132-09-26pm.jpg	3	1138
507	foto-trasera-TR13.03.20132-09-26pm.jpg	4	1138
508	foto-frontal-FR13.03.20132-12-07pm.jpg	2	1139
509	foto-lateral-LA13.03.20132-12-07pm.jpg	3	1139
510	foto-trasera-TR13.03.20132-12-07pm.jpg	4	1139
511	foto-frontal-FR13.03.20132-14-53pm.jpg	2	1140
512	foto-lateral-LA13.03.20132-14-53pm.jpg	3	1140
513	foto-trasera-TR13.03.20132-14-53pm.jpg	4	1140
514	foto-frontal-FR13.03.20132-17-58pm.jpg	2	1141
515	foto-lateral-LA13.03.20132-17-58pm.jpg	3	1141
516	foto-frontal-fr13.03.20132-30-39pm.jpg	2	1143
517	foto-lateral-la13.03.20132-30-39pm.jpg	3	1143
518	foto-trasera-tr13.03.20132-30-39pm.jpg	4	1143
519	foto-frontal-fr13.03.20132-49-46pm.jpg	2	218
520	foto-lateral-la13.03.20132-49-46pm.jpg	3	218
521	foto-trasera-tr13.03.20132-49-46pm.jpg	4	218
522	foto-frontal-fr13.03.20134-04-11pm.jpg	2	1144
523	foto-lateral-la13.03.20134-04-11pm.jpg	3	1144
524	foto-trasera-tr13.03.20134-04-11pm.jpg	4	1144
525	foto-frontal-fr13.03.20134-08-14pm.jpg	2	1145
526	foto-lateral-la13.03.20134-08-14pm.jpg	3	1145
527	foto-trasera-tr13.03.20134-08-14pm.jpg	4	1145
528	foto-frontal-fr13.03.20134-11-37pm.jpg	2	1146
529	foto-lateral-la13.03.20134-11-37pm.jpg	3	1146
530	foto-trasera-tr13.03.20134-11-37pm.jpg	4	1146
531	foto-frontal-fr13.03.20134-18-59pm.jpg	2	1147
532	foto-lateral-la13.03.20134-18-59pm.jpg	3	1147
533	foto-trasera-tr13.03.20134-18-59pm.jpg	4	1147
534	foto-frontal-fr13.03.20134-23-00pm.jpg	2	1148
535	foto-lateral-la13.03.20134-23-00pm.jpg	3	1148
536	foto-trasera-tr13.03.20134-23-00pm.jpg	4	1148
537	foto-frontal-fr13.03.20134-26-56pm.jpg	2	1149
538	foto-lateral-la13.03.20134-26-56pm.jpg	3	1149
539	foto-trasera-tr13.03.20134-26-56pm.jpg	4	1149
540	foto-frontal-fr13.03.20134-36-23pm.jpg	2	1150
541	foto-lateral-la13.03.20134-36-23pm.jpg	3	1150
542	foto-trasera-tr13.03.20134-36-23pm.jpg	4	1150
544	foto-lateral-la13.03.20134-41-50pm.jpg	3	1151
545	foto-frontal-fr13.03.20134-45-13pm.jpg	2	1152
546	foto-lateral-la13.03.20134-45-13pm.jpg	3	1152
547	foto-trasera-tr13.03.20134-45-13pm.jpg	4	1152
548	foto-frontal-fr13.03.20134-52-25pm.jpg	2	1153
549	foto-lateral-la13.03.20134-52-25pm.jpg	3	1153
550	foto-trasera-tr13.03.20134-52-25pm.jpg	4	1153
551	foto-frontal-fr13.03.20134-58-38pm.jpg	2	1154
552	foto-lateral-la13.03.20134-58-38pm.jpg	3	1154
553	foto-trasera-tr13.03.20134-58-38pm.jpg	4	1154
554	foto-frontal-fr13.03.20135-04-27pm.jpg	2	1155
556	foto-trasera-tr13.03.20135-04-27pm.jpg	4	1155
557	foto-frontal-fr13.03.20135-10-54pm.jpg	2	1156
558	foto-lateral-la13.03.20135-10-54pm.jpg	3	1156
559	foto-trasera-tr13.03.20135-10-54pm.jpg	4	1156
560	foto-frontal-fr13.03.20135-13-25pm.jpg	2	1157
561	foto-lateral-la13.03.20135-13-25pm.jpg	3	1157
562	foto-trasera-tr13.03.20135-13-25pm.jpg	4	1157
564	foto-lateral-la13.03.20135-22-08pm.jpg	3	1158
565	foto-trasera-tr13.03.20135-22-08pm.jpg	4	1158
566	foto-frontal-fr13.03.20135-37-07pm.jpg	2	1159
567	foto-lateral-la13.03.20135-37-07pm.jpg	3	1159
568	foto-trasera-tr13.03.20135-37-07pm.jpg	4	1159
569	foto-frontal-fr14.03.20137-46-26am.jpg	2	1160
570	foto-lateral-la14.03.20137-46-26am.jpg	3	1160
571	foto-trasera-tr14.03.20137-46-26am.jpg	4	1160
572	foto-frontal-fr14.03.20137-57-35am.jpg	2	1161
573	foto-lateral-la14.03.20137-57-35am.jpg	3	1161
574	foto-trasera-tr14.03.20137-57-35am.jpg	4	1161
575	foto-frontal-fr14.03.20138-02-06am.jpg	2	1162
577	foto-trasera-tr14.03.20138-02-06am.jpg	4	1162
579	foto-lateral-la14.03.20138-05-38am.jpg	3	1163
580	foto-trasera-tr14.03.20138-05-38am.jpg	4	1163
582	foto-lateral-la14.03.20138-08-14am.jpg	3	1164
583	foto-frontal-fr14.03.20138-10-14am.jpg	2	1165
584	foto-frontal-fr14.03.20138-25-18am.jpg	2	1166
585	foto-lateral-la14.03.20138-25-18am.jpg	3	1166
586	foto-trasera-tr14.03.20138-25-18am.jpg	4	1166
587	foto-frontal-fr14.03.20138-32-59am.jpg	2	1167
588	foto-lateral-la14.03.20138-32-59am.jpg	3	1167
589	foto-trasera-tr14.03.20138-32-59am.jpg	4	1167
590	foto-frontal-fr14.03.20138-41-09am.jpg	2	1168
591	foto-lateral-la14.03.20138-41-09am.jpg	3	1168
592	foto-trasera-tr14.03.20138-41-09am.jpg	4	1168
594	foto-lateral-LA14.03.20138-59-19am.jpg	3	1169
595	foto-frontal-FR14.03.20139-03-38am.jpg	2	1170
596	foto-lateral-LA14.03.20139-03-38am.jpg	3	1170
597	foto-trasera-TR14.03.20139-03-38am.jpg	4	1170
598	foto-frontal-FR14.03.20139-07-05am.jpg	2	1171
599	foto-lateral-LA14.03.20139-07-05am.jpg	3	1171
600	foto-trasera-TR14.03.20139-07-05am.jpg	4	1171
601	foto-frontal-FR14.03.20139-09-58am.jpg	2	1172
602	foto-frontal-FR14.03.20139-24-32am.jpg	2	1173
603	foto-lateral-LA14.03.20139-24-32am.jpg	3	1173
604	foto-trasera-TR14.03.20139-24-32am.jpg	4	1173
605	foto-frontal-fr14.03.201310-27-49am.jpg	2	1175
606	foto-lateral-la14.03.201310-27-49am.jpg	3	1175
607	foto-trasera-tr14.03.201310-27-49am.jpg	4	1175
608	foto-frontal-fr14.03.201310-33-26am.jpg	2	1177
609	foto-lateral-la14.03.201310-33-26am.jpg	3	1177
610	foto-frontal-fr14.03.201311-02-27am.jpg	2	1178
611	foto-lateral-la14.03.201311-02-27am.jpg	3	1178
612	foto-trasera-tr14.03.201311-02-27am.jpg	4	1178
613	foto-frontal-fr14.03.201311-35-57am.jpg	2	1179
614	foto-lateral-la14.03.201311-35-57am.jpg	3	1179
615	foto-trasera-tr14.03.201311-35-57am.jpg	4	1179
616	foto-frontal-fr14.03.201311-39-38am.jpg	2	1180
617	foto-lateral-la14.03.201311-39-38am.jpg	3	1180
618	foto-trasera-tr14.03.201311-39-38am.jpg	4	1180
619	foto-frontal-fr14.03.201311-56-26am.jpg	2	1181
620	foto-lateral-la14.03.201311-56-26am.jpg	3	1181
621	foto-trasera-tr14.03.201311-56-26am.jpg	4	1181
622	foto-frontal-fr14.03.201311-59-19am.jpg	2	1182
623	foto-lateral-la14.03.201311-59-19am.jpg	3	1182
624	foto-trasera-tr14.03.201311-59-19am.jpg	4	1182
625	foto-frontal-fr14.03.201312-07-25pm.jpg	2	1183
626	foto-lateral-la14.03.201312-07-25pm.jpg	3	1183
627	foto-trasera-tr14.03.201312-07-25pm.jpg	4	1183
628	foto-frontal-fr14.03.201312-10-36pm.jpg	2	1184
629	foto-lateral-la14.03.201312-10-36pm.jpg	3	1184
630	foto-trasera-tr14.03.201312-10-36pm.jpg	4	1184
631	foto-frontal-fr14.03.201312-14-56pm.jpg	2	1185
632	foto-lateral-la14.03.201312-14-56pm.jpg	3	1185
633	foto-trasera-tr14.03.201312-14-56pm.jpg	4	1185
634	foto-frontal-fr14.03.201312-49-46pm.jpg	2	1186
635	foto-lateral-la14.03.201312-49-46pm.jpg	3	1186
636	foto-frontal-fr15.03.20139-02-07am.jpg	2	236
637	foto-lateral-la15.03.20139-02-07am.jpg	3	236
638	foto-trasera-tr15.03.20139-02-07am.jpg	4	236
640	foto-lateral-LA15.03.20139-37-49am.jpg	3	1187
641	foto-trasera-TR15.03.20139-37-49am.jpg	4	1187
642	foto-frontal-FR15.03.20139-39-54am.jpg	2	1187
644	foto-lateral-la15.03.201310-10-59am.jpg	3	1188
645	foto-frontal-fr15.03.201310-23-45am.jpg	2	1189
646	foto-lateral-la15.03.201310-23-45am.jpg	3	1189
647	foto-trasera-tr15.03.201310-23-45am.jpg	4	1189
649	foto-lateral-la15.03.201310-26-24am.jpg	3	1190
650	foto-frontal-fr15.03.201310-29-21am.jpg	2	1191
652	foto-trasera-tr15.03.201310-29-21am.jpg	4	1191
655	foto-trasera-tr15.03.201310-32-31am.jpg	4	1192
657	foto-lateral-la15.03.201310-47-25am.jpg	3	1193
658	foto-frontal-fr15.03.201310-52-39am.jpg	2	1194
659	foto-lateral-la15.03.201310-52-39am.jpg	3	1194
660	foto-frontal-fr15.03.201311-35-34am.jpg	2	1199
661	foto-lateral-la15.03.201311-35-34am.jpg	3	1199
662	foto-trasera-tr15.03.201311-35-34am.jpg	4	1199
663	foto-frontal-fr15.03.201311-48-54am.jpg	2	1200
664	foto-lateral-la15.03.201311-48-54am.jpg	3	1200
665	foto-trasera-tr15.03.201311-48-54am.jpg	4	1200
666	foto-frontal-fr15.03.201311-53-41am.jpg	2	1201
667	foto-lateral-la15.03.201311-53-41am.jpg	3	1201
668	foto-trasera-tr15.03.201311-53-41am.jpg	4	1201
669	foto-frontal-fr15.03.201312-02-34pm.JPG	2	1202
670	foto-lateral-la15.03.201312-02-34pm.jpg	3	1202
671	foto-trasera-tr15.03.201312-02-34pm.JPG	4	1202
672	foto-frontal-fr15.03.201312-06-00pm.jpg	2	1203
673	foto-lateral-la15.03.201312-06-00pm.jpg	3	1203
674	foto-trasera-tr15.03.201312-06-00pm.jpg	4	1203
675	foto-frontal-fr15.03.201312-10-40pm.jpg	2	1204
676	foto-lateral-la15.03.201312-10-40pm.jpg	3	1204
677	foto-trasera-tr15.03.201312-10-40pm.jpg	4	1204
678	foto-frontal-fr15.03.201312-19-26pm.jpg	2	1205
679	foto-lateral-la15.03.201312-19-26pm.jpg	3	1205
680	foto-trasera-tr15.03.201312-19-26pm.jpg	4	1205
681	foto-frontal-fr15.03.201312-22-38pm.jpg	2	1206
682	foto-lateral-la15.03.201312-22-38pm.jpg	3	1206
683	foto-trasera-tr15.03.201312-22-38pm.jpg	4	1206
684	foto-frontal-fr15.03.201312-27-06pm.jpg	2	1207
685	foto-lateral-la15.03.201312-27-06pm.jpg	3	1207
686	foto-trasera-tr15.03.201312-27-06pm.jpg	4	1207
687	foto-frontal-fr15.03.20131-52-32pm.jpg	2	1208
688	foto-lateral-la15.03.20131-52-32pm.jpg	3	1208
689	foto-trasera-tr15.03.20131-52-32pm.jpg	4	1208
690	foto-frontal-fr15.03.20132-52-48pm.jpg	2	1209
691	foto-lateral-la15.03.20132-52-48pm.jpg	3	1209
692	foto-trasera-tr15.03.20132-52-48pm.jpg	4	1209
693	foto-frontal-fr15.03.20132-57-42pm.jpg	2	1210
694	foto-frontal-fr15.03.20133-03-23pm.jpg	2	1211
695	foto-lateral-la15.03.20133-03-23pm.jpg	3	1211
696	foto-trasera-tr15.03.20133-03-23pm.jpg	4	1211
697	foto-frontal-fr15.03.20133-07-14pm.jpg	2	1212
698	foto-lateral-la15.03.20133-07-14pm.jpg	3	1212
699	foto-trasera-tr15.03.20133-07-14pm.jpg	4	1212
700	foto-frontal-fr15.03.20133-10-47pm.jpg	2	1213
701	foto-lateral-la15.03.20133-10-47pm.jpg	3	1213
702	foto-trasera-tr15.03.20133-10-47pm.jpg	4	1213
703	foto-frontal-fr15.03.20133-39-38pm.jpg	2	1214
704	foto-lateral-la15.03.20133-39-38pm.jpg	3	1214
705	foto-trasera-tr15.03.20133-39-38pm.jpg	4	1214
706	foto-frontal-fr15.03.20133-43-32pm.jpg	2	1215
707	foto-lateral-la15.03.20133-43-32pm.jpg	3	1215
708	foto-trasera-tr15.03.20133-43-32pm.jpg	4	1215
709	foto-frontal-fr15.03.20134-01-23pm.jpg	2	1216
710	foto-lateral-la15.03.20134-01-23pm.jpg	3	1216
711	foto-trasera-tr15.03.20134-01-23pm.jpg	4	1216
712	foto-frontal-fr15.03.20134-23-15pm.jpg	2	1217
713	foto-lateral-la15.03.20134-23-15pm.jpg	3	1217
714	foto-trasera-tr15.03.20134-23-15pm.jpg	4	1217
715	foto-frontal-fr15.03.20134-30-36pm.jpg	2	1218
716	foto-lateral-la15.03.20134-30-36pm.jpg	3	1218
717	foto-trasera-tr15.03.20134-30-36pm.jpg	4	1218
718	foto-frontal-fr15.03.20134-35-39pm.jpg	2	1219
719	foto-lateral-la15.03.20134-35-39pm.jpg	3	1219
720	foto-trasera-tr15.03.20134-35-39pm.jpg	4	1219
721	foto-frontal-fr15.03.20134-42-49pm.jpg	2	1220
722	foto-lateral-la15.03.20134-42-49pm.jpg	3	1220
723	foto-trasera-tr15.03.20134-42-49pm.jpg	4	1220
724	foto-frontal-fr15.03.20134-46-18pm.jpg	2	1221
725	foto-lateral-la15.03.20134-46-18pm.jpg	3	1221
726	foto-trasera-tr15.03.20134-46-18pm.jpg	4	1221
727	foto-frontal-fr15.03.20135-26-27pm.jpg	2	1222
728	foto-lateral-la15.03.20135-26-27pm.jpg	3	1222
729	foto-trasera-tr15.03.20135-26-27pm.jpg	4	1222
730	foto-frontal-fr15.03.20135-31-23pm.jpg	2	1223
731	foto-lateral-la15.03.20135-31-23pm.jpg	3	1223
732	foto-trasera-tr15.03.20135-31-23pm.jpg	4	1223
733	foto-frontal-fr19.03.20137-56-42am.jpg	2	1224
734	foto-lateral-la19.03.20137-56-42am.jpg	3	1224
735	foto-trasera-tr19.03.20137-56-42am.jpg	4	1224
736	foto-frontal-fr19.03.20138-01-27am.jpg	2	1225
737	foto-lateral-la19.03.20138-01-27am.jpg	3	1225
738	foto-trasera-tr19.03.20138-01-27am.jpg	4	1225
739	foto-frontal-fr19.03.20138-18-59am.jpg	2	1226
740	foto-lateral-la19.03.20138-18-59am.jpg	3	1226
741	foto-trasera-tr19.03.20138-18-59am.jpg	4	1226
742	foto-frontal-fr19.03.20138-21-36am.jpg	2	1227
743	foto-lateral-la19.03.20138-21-36am.jpg	3	1227
744	foto-trasera-tr19.03.20138-21-36am.jpg	4	1227
745	foto-frontal-fr19.03.20138-29-03am.jpg	2	1228
746	foto-lateral-la19.03.20138-29-03am.jpg	3	1228
747	foto-trasera-tr19.03.20138-29-03am.jpg	4	1228
748	foto-frontal-fr19.03.20138-31-43am.jpg	2	1229
749	foto-lateral-la19.03.20138-31-43am.jpg	3	1229
750	foto-trasera-tr19.03.20138-31-43am.jpg	4	1229
751	foto-frontal-fr19.03.20138-36-22am.jpg	2	1230
752	foto-lateral-la19.03.20138-36-22am.jpg	3	1230
753	foto-trasera-tr19.03.20138-36-22am.jpg	4	1230
754	foto-frontal-fr19.03.20138-47-22am.jpg	2	1231
755	foto-lateral-la19.03.20138-47-22am.jpg	3	1231
756	foto-trasera-tr19.03.20138-47-22am.jpg	4	1231
757	foto-frontal-fr19.03.20138-51-04am.jpg	2	1232
758	foto-lateral-la19.03.20138-51-04am.jpg	3	1232
759	foto-trasera-tr19.03.20138-51-04am.jpg	4	1232
760	foto-frontal-fr19.03.20138-54-33am.jpg	2	1233
761	foto-lateral-la19.03.20138-54-33am.jpg	3	1233
762	foto-trasera-tr19.03.20138-54-33am.jpg	4	1233
763	foto-frontal-fr19.03.20138-57-18am.jpg	2	1234
764	foto-lateral-la19.03.20138-57-18am.jpg	3	1234
765	foto-trasera-tr19.03.20138-57-18am.jpg	4	1234
766	foto-frontal-fr19.03.20139-02-34am.jpg	2	795
767	foto-lateral-la19.03.20139-02-34am.jpg	3	795
768	foto-trasera-tr19.03.20139-02-34am.jpg	4	795
769	foto-frontal-fr19.03.20139-32-02am.jpg	2	1240
770	foto-lateral-la19.03.20139-32-02am.jpg	3	1240
771	foto-trasera-tr19.03.20139-32-02am.jpg	4	1240
772	foto-frontal-fr19.03.201310-05-53am.jpg	2	1243
773	foto-lateral-la19.03.201310-05-53am.jpg	3	1243
774	foto-trasera-tr19.03.201310-05-53am.jpg	4	1243
775	foto-frontal-fr19.03.201310-08-10am.jpg	2	1244
776	foto-lateral-la19.03.201310-08-10am.jpg	3	1244
777	foto-trasera-tr19.03.201310-08-10am.jpg	4	1244
778	foto-frontal-fr19.03.201310-17-40am.jpg	2	1246
779	foto-lateral-la19.03.201310-17-40am.jpg	3	1246
780	foto-frontal-fr19.03.201310-34-27am.jpg	2	1248
781	foto-frontal-fr19.03.201311-35-31am.jpg	2	1250
782	foto-lateral-la19.03.201311-35-31am.jpg	3	1250
783	foto-trasera-tr19.03.201311-35-31am.jpg	4	1250
784	foto-frontal-fr19.03.201311-52-15am.jpg	2	1251
785	foto-lateral-la19.03.201311-52-15am.jpg	3	1251
786	foto-trasera-tr19.03.201311-52-15am.jpg	4	1251
787	foto-frontal-fr19.03.201312-18-15pm.jpg	2	1252
788	foto-lateral-la19.03.201312-18-15pm.jpg	3	1252
789	foto-trasera-tr19.03.201312-18-15pm.jpg	4	1252
790	foto-frontal-fr19.03.201312-27-54pm.jpg	2	1253
791	foto-lateral-la19.03.201312-27-54pm.jpg	3	1253
792	foto-trasera-tr19.03.201312-27-54pm.jpg	4	1253
793	foto-frontal-fr19.03.201312-30-48pm.jpg	2	1254
794	foto-lateral-la19.03.201312-30-48pm.jpg	3	1254
795	foto-trasera-tr19.03.201312-30-48pm.jpg	4	1254
796	foto-frontal-fr19.03.201312-34-24pm.jpg	2	1255
797	foto-lateral-la19.03.201312-34-24pm.jpg	3	1255
798	foto-trasera-tr19.03.201312-34-24pm.jpg	4	1255
799	foto-frontal-fr19.03.20133-07-03pm.jpg	2	1257
800	foto-lateral-la19.03.20133-07-03pm.jpg	3	1257
801	foto-trasera-tr19.03.20133-07-03pm.jpg	4	1257
802	foto-frontal-fr19.03.20133-10-01pm.JPG	2	1258
803	foto-lateral-la19.03.20133-10-01pm.jpg	3	1258
804	foto-trasera-tr19.03.20133-10-01pm.jpg	4	1258
805	foto-frontal-fr19.03.20133-43-37pm.jpg	2	1259
806	foto-lateral-la19.03.20133-43-37pm.jpg	3	1259
807	foto-trasera-tr19.03.20133-43-37pm.jpg	4	1259
808	foto-frontal-fr19.03.20133-47-20pm.jpg	2	1260
809	foto-lateral-la19.03.20133-47-20pm.jpg	3	1260
810	foto-trasera-tr19.03.20133-47-20pm.jpg	4	1260
811	foto-frontal-fr19.03.20133-50-44pm.jpg	2	1261
812	foto-lateral-la19.03.20133-50-44pm.jpg	3	1261
813	foto-trasera-tr19.03.20133-50-44pm.JPG	4	1261
814	foto-frontal-fr19.03.20134-08-30pm.jpg	2	1262
815	foto-lateral-la19.03.20134-08-30pm.jpg	3	1262
816	foto-trasera-tr19.03.20134-08-30pm.jpg	4	1262
817	foto-frontal-fr19.03.20134-12-22pm.jpg	2	1263
818	foto-lateral-la19.03.20134-12-22pm.jpg	3	1263
819	foto-trasera-tr19.03.20134-12-22pm.jpg	4	1263
820	foto-frontal-fr19.03.20134-16-42pm.jpg	2	1264
821	foto-lateral-la19.03.20134-16-42pm.jpg	3	1264
822	foto-trasera-tr19.03.20134-16-42pm.jpg	4	1264
823	foto-frontal-fr19.03.20134-20-50pm.jpg	2	1265
824	foto-lateral-la19.03.20134-20-50pm.jpg	3	1265
825	foto-trasera-tr19.03.20134-20-50pm.jpg	4	1265
826	foto-frontal-fr19.03.20134-29-00pm.jpg	2	1266
827	foto-lateral-la19.03.20134-29-00pm.jpg	3	1266
828	foto-trasera-tr19.03.20134-29-00pm.jpg	4	1266
829	foto-frontal-fr19.03.20134-33-38pm.jpg	2	1267
830	foto-lateral-la19.03.20134-33-38pm.jpg	3	1267
831	foto-trasera-tr19.03.20134-33-38pm.jpg	4	1267
832	foto-frontal-fr19.03.20134-36-55pm.jpg	2	1268
833	foto-lateral-la19.03.20134-36-55pm.jpg	3	1268
834	foto-trasera-tr19.03.20134-36-55pm.jpg	4	1268
835	foto-frontal-fr19.03.20134-51-36pm.jpg	2	1269
836	foto-lateral-la19.03.20134-51-36pm.jpg	3	1269
837	foto-trasera-tr19.03.20134-51-36pm.jpg	4	1269
838	foto-frontal-fr19.03.20134-58-05pm.jpg	2	1270
839	foto-lateral-la19.03.20134-58-05pm.jpg	3	1270
840	foto-trasera-tr19.03.20134-58-05pm.jpg	4	1270
841	foto-frontal-fr19.03.20135-03-52pm.jpg	2	1271
842	foto-lateral-la19.03.20135-03-52pm.jpg	3	1271
843	foto-trasera-tr19.03.20135-03-52pm.jpg	4	1271
844	foto-frontal-fr19.03.20135-07-05pm.jpg	2	1272
845	foto-lateral-la19.03.20135-07-05pm.jpg	3	1272
846	foto-trasera-tr19.03.20135-07-05pm.jpg	4	1272
847	foto-frontal-fr19.03.20135-14-34pm.jpg	2	1273
848	foto-lateral-la19.03.20135-14-34pm.jpg	3	1273
849	foto-trasera-tr19.03.20135-14-34pm.JPG	4	1273
850	foto-frontal-fr19.03.20135-23-34pm.jpg	2	1274
851	foto-lateral-la19.03.20135-23-34pm.jpg	3	1274
852	foto-trasera-tr19.03.20135-23-34pm.jpg	4	1274
853	foto-frontal-fr19.03.20135-28-19pm.jpg	2	1275
854	foto-lateral-la19.03.20135-28-19pm.jpg	3	1275
855	foto-trasera-tr19.03.20135-28-19pm.jpg	4	1275
856	foto-frontal-fr19.03.20135-33-09pm.jpg	2	1276
857	foto-lateral-la19.03.20135-33-09pm.jpg	3	1276
858	foto-trasera-tr19.03.20135-33-09pm.jpg	4	1276
859	foto-frontal-fr19.03.20135-36-27pm.jpg	2	1277
860	foto-lateral-la19.03.20135-36-27pm.jpg	3	1277
861	foto-trasera-tr19.03.20135-36-27pm.jpg	4	1277
862	foto-frontal-fr20.03.20138-12-09am.JPG	2	1278
863	foto-lateral-la20.03.20138-12-09am.jpg	3	1278
864	foto-trasera-tr20.03.20138-12-09am.JPG	4	1278
865	foto-frontal-fr20.03.20138-16-48am.JPG	2	1279
866	foto-lateral-la20.03.20138-16-48am.jpg	3	1279
867	foto-trasera-tr20.03.20138-16-48am.jpg	4	1279
868	foto-frontal-fr20.03.20138-24-52am.JPG	2	1280
869	foto-lateral-la20.03.20138-24-52am.jpg	3	1280
870	foto-trasera-tr20.03.20138-24-52am.jpg	4	1280
871	foto-frontal-fr20.03.20138-35-03am.jpg	2	1281
872	foto-lateral-la20.03.20138-35-03am.jpg	3	1281
873	foto-trasera-tr20.03.20138-35-03am.jpg	4	1281
874	foto-frontal-fr20.03.20138-37-47am.jpg	2	1282
875	foto-lateral-la20.03.20138-37-47am.jpg	3	1282
876	foto-trasera-tr20.03.20138-37-47am.jpg	4	1282
877	foto-frontal-fr20.03.20138-40-56am.jpg	2	1283
878	foto-lateral-la20.03.20138-40-56am.jpg	3	1283
879	foto-trasera-tr20.03.20138-40-56am.jpg	4	1283
880	foto-frontal-fr20.03.20138-44-39am.jpg	2	1284
881	foto-lateral-la20.03.20138-44-39am.jpg	3	1284
882	foto-trasera-tr20.03.20138-44-39am.jpg	4	1284
883	foto-frontal-fr20.03.20138-47-46am.jpg	2	1285
884	foto-lateral-la20.03.20138-47-46am.jpg	3	1285
885	foto-trasera-tr20.03.20138-47-46am.jpg	4	1285
886	foto-frontal-fr20.03.20138-54-13am.jpg	2	1286
887	foto-lateral-la20.03.20138-54-13am.jpg	3	1286
888	foto-trasera-tr20.03.20138-54-13am.jpg	4	1286
889	foto-frontal-fr20.03.20138-57-06am.jpg	2	1287
890	foto-lateral-la20.03.20138-57-06am.jpg	3	1287
891	foto-trasera-tr20.03.20138-57-06am.jpg	4	1287
892	foto-frontal-fr20.03.20139-00-28am.jpg	2	1288
893	foto-lateral-la20.03.20139-00-28am.jpg	3	1288
894	foto-trasera-tr20.03.20139-00-28am.jpg	4	1288
895	foto-frontal-fr20.03.20139-06-33am.jpg	2	1289
896	foto-lateral-la20.03.20139-06-33am.jpg	3	1289
897	foto-trasera-tr20.03.20139-06-33am.jpg	4	1289
898	foto-frontal-fr20.03.20139-11-05am.jpg	2	1290
899	foto-lateral-la20.03.20139-11-05am.jpg	3	1290
900	foto-trasera-tr20.03.20139-11-05am.jpg	4	1290
901	foto-frontal-fr20.03.20139-13-47am.jpg	2	1291
902	foto-lateral-la20.03.20139-13-47am.jpg	3	1291
903	foto-trasera-tr20.03.20139-13-47am.jpg	4	1291
904	foto-frontal-fr21.03.20137-46-47am.jpg	2	1294
905	foto-lateral-la21.03.20137-46-47am.jpg	3	1294
906	foto-trasera-tr21.03.20137-46-47am.jpg	4	1294
907	foto-frontal-fr21.03.20137-51-49am.jpg	2	1295
908	foto-lateral-la21.03.20137-51-49am.jpg	3	1295
909	foto-trasera-tr21.03.20137-51-49am.jpg	4	1295
911	foto-lateral-la21.03.20138-03-11am.jpg	3	1296
912	foto-frontal-fr21.03.20138-13-43am.jpg	2	1297
913	foto-lateral-la21.03.20138-13-43am.jpg	3	1297
914	foto-frontal-fr21.03.20138-21-22am.jpg	2	1298
915	foto-lateral-la21.03.20138-21-22am.jpg	3	1298
917	foto-lateral-la21.03.20138-31-04am.jpg	3	1299
918	foto-frontal-fr21.03.20138-34-16am.jpg	2	1300
919	foto-lateral-la21.03.20138-34-16am.jpg	3	1300
920	foto-frontal-fr21.03.20138-38-13am.jpg	2	1301
921	foto-lateral-la21.03.20138-38-13am.jpg	3	1301
922	foto-frontal-fr21.03.20138-41-26am.jpg	2	1302
923	foto-lateral-la21.03.20138-41-26am.jpg	3	1302
924	foto-frontal-fr21.03.20138-57-44am.jpg	2	1303
925	foto-frontal-fr21.03.20139-04-59am.jpg	2	1304
926	foto-frontal-fr21.03.20139-06-56am.jpg	2	1305
927	foto-frontal-fr21.03.20139-27-25am.jpg	2	1306
928	foto-lateral-la21.03.20139-27-25am.jpg	3	1306
929	foto-trasera-tr21.03.20139-27-25am.jpg	4	1306
931	foto-lateral-la21.03.20139-31-24am.jpg	3	1307
932	foto-frontal-fr21.03.20139-33-50am.jpg	2	1308
933	foto-frontal-fr21.03.20139-43-15am.jpg	2	1309
934	foto-lateral-la21.03.20139-43-15am.jpg	3	1309
935	foto-frontal-fr21.03.201310-09-44am.jpg	2	1310
936	foto-lateral-la21.03.201310-09-44am.jpg	3	1310
937	foto-frontal-fr21.03.201310-13-18am.jpg	2	1311
938	foto-lateral-la21.03.201310-13-18am.jpg	3	1311
939	foto-frontal-fr21.03.201310-17-57am.jpg	2	1312
940	foto-frontal-fr21.03.201310-20-25am.jpg	2	1313
941	foto-frontal-fr21.03.201310-33-25am.jpg	2	1314
942	foto-frontal-fr21.03.201311-04-56am.jpg	2	1315
943	foto-lateral-la21.03.201311-04-56am.jpg	3	1315
944	foto-trasera-tr21.03.201311-04-56am.jpg	4	1315
945	foto-frontal-fr21.03.201311-08-25am.jpg	2	1316
946	foto-lateral-la21.03.201311-08-25am.jpg	3	1316
947	foto-trasera-tr21.03.201311-08-25am.jpg	4	1316
948	foto-frontal-fr21.03.201311-11-37am.jpg	2	1317
949	foto-lateral-la21.03.201311-11-37am.jpg	3	1317
950	foto-frontal-fr21.03.201311-13-40am.jpg	2	1318
951	foto-lateral-la21.03.201311-13-40am.jpg	3	1318
952	foto-frontal-fr21.03.201311-15-56am.jpg	2	1319
954	foto-trasera-la21.03.201311-15-56am.jpg	4	1319
955	foto-frontal-fr21.03.201311-18-33am.jpg	2	1320
956	foto-lateral-la21.03.201311-18-33am.jpg	3	1320
957	foto-trasera-tr21.03.201311-18-33am.jpg	4	1320
958	foto-frontal-fr21.03.201311-21-05am.jpg	2	1321
959	foto-lateral-la21.03.201311-21-05am.jpg	3	1321
960	foto-trasera-tr21.03.201311-21-05am.jpg	4	1321
961	foto-frontal-fr21.03.201311-23-11am.jpg	2	1322
962	foto-lateral-la21.03.201311-23-11am.jpg	3	1322
963	foto-trasera-tr21.03.201311-23-11am.jpg	4	1322
964	foto-frontal-fr21.03.201311-27-16am.jpg	2	1323
965	foto-lateral-la21.03.201311-27-16am.jpg	3	1323
966	foto-frontal-fr21.03.201311-37-02am.jpg	2	1324
967	foto-lateral-la21.03.201311-37-02am.jpg	3	1324
968	foto-trasera-tr21.03.201311-37-02am.jpg	4	1324
969	foto-frontal-fr21.03.201311-40-12am.jpg	2	1325
970	foto-frontal-fr21.03.201311-51-06am.jpg	2	1326
971	foto-lateral-la21.03.201311-51-06am.jpg	3	1326
972	foto-trasera-tr21.03.201311-51-06am.jpg	4	1326
973	foto-frontal-fr21.03.201312-11-32pm.jpg	2	1327
975	foto-trasera-tr21.03.201312-11-32pm.jpg	4	1327
976	foto-frontal-fr21.03.20131-21-28pm.jpg	2	1328
977	foto-lateral-la21.03.20131-21-28pm.jpg	3	1328
978	foto-frontal-fr21.03.20131-23-49pm.jpg	2	1329
979	foto-lateral-la21.03.20131-23-49pm.jpg	3	1329
980	foto-frontal-fr21.03.20131-33-46pm.jpg	2	1330
981	foto-lateral-la21.03.20131-33-46pm.jpg	3	1330
982	foto-frontal-fr21.03.20131-46-29pm.jpg	2	1331
983	foto-lateral-la21.03.20131-46-29pm.jpg	3	1331
984	foto-trasera-tr21.03.20131-46-29pm.jpg	4	1331
985	foto-frontal-FR21.03.20133-37-44pm.jpg	2	26
986	foto-lateral-LA21.03.20133-37-44pm.jpg	3	26
987	foto-trasera-TR21.03.20133-37-44pm.jpg	4	26
988	foto-frontal-FR21.03.20133-59-25pm.jpg	2	1332
989	foto-lateral-LA21.03.20133-59-25pm.jpg	3	1332
990	foto-trasera-TR21.03.20133-59-25pm.jpg	4	1332
991	foto-frontal-FR21.03.20134-02-04pm.jpg	2	1333
992	foto-lateral-LA21.03.20134-02-04pm.jpg	3	1333
993	foto-trasera-TR21.03.20134-02-04pm.jpg	4	1333
994	foto-frontal-FR21.03.20134-34-39pm.jpg	2	1335
995	foto-lateral-LA21.03.20134-34-39pm.jpg	3	1335
996	foto-trasera-TR21.03.20134-34-39pm.jpg	4	1335
997	foto-frontal-FR21.03.20134-39-56pm.jpg	2	1336
998	foto-lateral-LA21.03.20134-39-56pm.jpg	3	1336
999	foto-trasera-TR21.03.20134-39-56pm.jpg	4	1336
1000	foto-frontal-FR21.03.20134-43-58pm.jpg	2	1337
1001	foto-lateral-LA21.03.20134-43-58pm.jpg	3	1337
1002	foto-frontal-FR21.03.20134-48-26pm.jpg	2	1339
1003	foto-lateral-LA21.03.20134-48-26pm.jpg	3	1339
1004	foto-trasera-TR21.03.20134-48-26pm.jpg	4	1339
1005	foto-frontal-FR21.03.20134-54-38pm.jpg	2	1340
1006	foto-lateral-LA21.03.20134-54-38pm.jpg	3	1340
1007	foto-frontal-FR21.03.20135-10-05pm.jpg	2	1341
1008	foto-lateral-LA21.03.20135-10-05pm.jpg	3	1341
1009	foto-frontal-fr21.03.20135-16-48pm.jpg	2	1342
1010	foto-lateral-la21.03.20135-16-48pm.jpg	3	1342
1011	foto-trasera-tr21.03.20135-16-48pm.jpg	4	1342
1012	foto-frontal-fr21.03.20135-19-42pm.jpg	2	1343
1013	foto-lateral-la21.03.20135-19-42pm.jpg	3	1343
1014	foto-trasera-tr21.03.20135-19-42pm.jpg	4	1343
1015	foto-frontal-fr21.03.20135-22-16pm.jpg	2	1344
1016	foto-lateral-la21.03.20135-22-16pm.jpg	3	1344
1017	foto-trasera-tr21.03.20135-22-16pm.jpg	4	1344
1018	foto-frontal-fr21.03.20135-28-06pm.jpg	2	1345
1019	foto-lateral-la21.03.20135-28-06pm.jpg	3	1345
1020	foto-trasera-tr21.03.20135-28-06pm.jpg	4	1345
1021	foto-frontal-fr21.03.20135-32-14pm.jpg	2	1346
1022	foto-lateral-la21.03.20135-32-14pm.jpg	3	1346
1023	foto-trasera-tr21.03.20135-32-14pm.jpg	4	1346
1024	foto-frontal-fr21.03.20135-41-54pm.jpg	2	1347
1025	foto-lateral-la21.03.20135-41-54pm.jpg	3	1347
1026	foto-trasera-tr21.03.20135-41-54pm.jpg	4	1347
1027	foto-frontal-fr21.03.20136-07-29pm.jpg	2	1348
1028	foto-lateral-la21.03.20136-07-29pm.jpg	3	1348
1029	foto-trasera-tr21.03.20136-07-29pm.jpg	4	1348
1030	foto-frontal-fr21.03.20136-23-46pm.jpg	2	1349
1031	foto-lateral-la21.03.20136-23-46pm.jpg	3	1349
1032	foto-trasera-tr21.03.20136-23-46pm.jpg	4	1349
1033	foto-frontal-fr25.03.20138-34-24am.jpg	2	1354
1034	foto-lateral-la25.03.20138-34-24am.jpg	3	1354
1035	foto-trasera-tr25.03.20138-34-24am.jpg	4	1354
1036	foto-frontal-FR25.03.20134-59-33pm.jpg	2	132
1037	foto-lateral-LA25.03.20134-59-33pm.jpg	3	132
1038	foto-trasera-TR25.03.20134-59-33pm.jpg	4	132
1039	foto-frontal-FR25.03.20135-02-02pm.jpg	2	133
1040	foto-lateral-LA25.03.20135-02-02pm.jpg	3	133
1041	foto-trasera-TR25.03.20135-02-02pm.jpg	4	133
1042	foto-frontal-FR25.03.20135-06-26pm.jpg	2	1355
1043	foto-lateral-LA25.03.20135-06-26pm.jpg	3	1355
1044	foto-trasera-TR25.03.20135-06-26pm.jpg	4	1355
1045	foto-frontal-fr26.03.20138-14-38am.jpg	2	1359
1046	foto-lateral-la26.03.20138-14-38am.jpg	3	1359
1047	foto-trasera-tr26.03.20138-14-38am.jpg	4	1359
1048	foto-frontal-fr26.03.20138-16-52am.jpg	2	1360
1049	foto-lateral-la26.03.20138-16-52am.jpg	3	1360
1050	foto-trasera-tr26.03.20138-16-52am.jpg	4	1360
1051	foto-frontal-fr26.03.20138-18-59am.jpg	2	1361
1052	foto-lateral-la26.03.20138-18-59am.jpg	3	1361
1053	foto-trasera-tr26.03.20138-18-59am.jpg	4	1361
1054	foto-frontal-fr26.03.20138-21-29am.jpg	2	1362
1055	foto-lateral-la26.03.20138-21-29am.jpg	3	1362
1056	foto-trasera-tr26.03.20138-21-29am.jpg	4	1362
1057	foto-frontal-fr26.03.20138-25-06am.jpg	2	1363
1058	foto-lateral-la26.03.20138-25-06am.jpg	3	1363
1059	foto-frontal-fr26.03.20139-26-51am.jpg	2	1364
1060	foto-lateral-la26.03.20139-26-51am.jpg	3	1364
1061	foto-trasera-tr26.03.20139-26-51am.jpg	4	1364
1062	foto-frontal-fr26.03.201310-23-20am.jpg	2	1365
1063	foto-lateral-la26.03.201310-23-20am.jpg	3	1365
1064	foto-trasera-tr26.03.201310-23-20am.jpg	4	1365
1065	foto-frontal-fr26.03.201310-25-34am.jpg	2	1366
1066	foto-lateral-la26.03.201310-25-34am.jpg	3	1366
1067	foto-trasera-tr26.03.201310-25-34am.jpg	4	1366
1068	foto-frontal-fr26.03.201310-33-11am.jpg	2	1367
1069	foto-lateral-la26.03.201310-33-11am.jpg	3	1367
1070	foto-trasera-tr26.03.201310-33-11am.jpg	4	1367
1071	foto-frontal-fr26.03.201312-23-14pm.jpg	2	1368
1072	foto-lateral-la26.03.201312-23-14pm.jpg	3	1368
1073	foto-trasera-tr26.03.201312-23-14pm.jpg	4	1368
1074	foto-frontal-fr26.03.201312-26-31pm.jpg	2	1369
1076	foto-trasera-tr26.03.201312-26-31pm.jpg	4	1369
1077	foto-frontal-FR26.03.20131-46-41pm.jpg	2	1370
1078	foto-lateral-LA26.03.20131-46-41pm.jpg	3	1370
1079	foto-trasera-TR26.03.20131-46-41pm.jpg	4	1370
1080	foto-frontal-FR26.03.20131-53-10pm.jpg	2	1371
1081	foto-lateral-LA26.03.20131-53-10pm.jpg	3	1371
1082	foto-trasera-TR26.03.20131-53-10pm.jpg	4	1371
1083	foto-frontal-FR26.03.20131-56-17pm.jpg	2	1372
1084	foto-lateral-LA26.03.20131-56-17pm.jpg	3	1372
1085	foto-trasera-TR26.03.20131-56-17pm.jpg	4	1372
1086	foto-frontal-FR26.03.20132-37-26pm.jpg	2	1373
1087	foto-lateral-LA26.03.20132-37-26pm.jpg	3	1373
1088	foto-trasera-TR26.03.20132-37-26pm.jpg	4	1373
1089	foto-frontal-FR26.03.20132-44-32pm.jpg	2	1374
1090	foto-lateral-LA26.03.20132-44-32pm.jpg	3	1374
1091	foto-trasera-TR26.03.20132-44-32pm.jpg	4	1374
1092	foto-frontal-FR26.03.20132-52-35pm.jpg	2	1375
1094	foto-trasera-TR26.03.20132-52-35pm.jpg	4	1375
1095	foto-frontal-FR26.03.20133-02-45pm.jpg	2	1376
1096	foto-lateral-LA26.03.20133-02-45pm.jpg	3	1376
1097	foto-trasera-TR26.03.20133-02-45pm.jpg	4	1376
1098	foto-frontal-fr26.03.20133-10-09pm.jpg	2	1377
1099	foto-lateral-la26.03.20133-10-09pm.jpg	3	1377
1100	foto-trasera-tr26.03.20133-10-09pm.jpg	4	1377
1101	foto-frontal-fr26.03.20133-54-36pm.jpg	2	1378
1102	foto-lateral-la26.03.20133-54-36pm.jpg	3	1378
1103	foto-trasera-tr26.03.20133-54-36pm.jpg	4	1378
1104	foto-frontal-fr26.03.20133-59-26pm.jpg	2	1379
1105	foto-lateral-la26.03.20133-59-26pm.jpg	3	1379
1106	foto-trasera-tr26.03.20133-59-26pm.jpg	4	1379
1107	foto-frontal-fr26.03.20134-48-47pm.jpg	2	1380
1108	foto-lateral-la26.03.20134-48-47pm.jpg	3	1380
1109	foto-trasera-tr26.03.20134-48-47pm.jpg	4	1380
1110	foto-frontal-fr26.03.20134-59-08pm.jpg	2	1381
1111	foto-lateral-la26.03.20134-59-08pm.jpg	3	1381
1112	foto-trasera-tr26.03.20134-59-08pm.jpg	4	1381
1113	foto-frontal-fr26.03.20135-07-03pm.jpg	2	1382
1114	foto-lateral-la26.03.20135-07-03pm.jpg	3	1382
1115	foto-trasera-tr26.03.20135-07-03pm.jpg	4	1382
1116	foto-frontal-fr26.03.20135-13-49pm.jpg	2	1383
1117	foto-lateral-la26.03.20135-13-49pm.jpg	3	1383
1118	foto-trasera-tr26.03.20135-13-49pm.jpg	4	1383
1119	foto-frontal-fr26.03.20135-22-24pm.jpg	2	1384
1120	foto-lateral-la26.03.20135-22-24pm.jpg	3	1384
1121	foto-trasera-tr26.03.20135-22-24pm.jpg	4	1384
1122	foto-frontal-fr26.03.20135-36-13pm.jpg	2	1385
1123	foto-lateral-la26.03.20135-36-13pm.jpg	3	1385
1124	foto-trasera-tr26.03.20135-36-13pm.jpg	4	1385
1125	foto-frontal-fr26.03.20135-42-50pm.jpg	2	1386
1126	foto-lateral-la26.03.20135-42-50pm.jpg	3	1386
1127	foto-trasera-tr26.03.20135-42-50pm.jpg	4	1386
1128	foto-frontal-fr26.03.20135-55-03pm.jpg	2	1387
1129	foto-frontal-fr26.03.20136-01-16pm.jpg	2	1388
1130	foto-lateral-la26.03.20136-01-16pm.jpg	3	1388
1131	foto-trasera-tr26.03.20136-01-16pm.jpg	4	1388
1132	foto-frontal-FR27.03.20134-47-05pm.jpg	2	1389
1133	foto-lateral-LA27.03.20134-47-05pm.jpg	3	1389
1134	foto-trasera-TR27.03.20134-47-05pm.jpg	4	1389
1135	foto-frontal-FR27.03.20134-52-39pm.jpg	2	1391
1136	foto-lateral-LA27.03.20134-52-39pm.jpg	3	1391
1137	foto-trasera-TR27.03.20134-52-39pm.jpg	4	1391
1138	foto-frontal-FR27.03.20134-55-08pm.jpg	2	1392
1139	foto-lateral-LA27.03.20134-55-08pm.jpg	3	1392
1140	foto-trasera-TR27.03.20134-55-08pm.jpg	4	1392
1141	foto-frontal-FR27.03.20135-02-33pm.jpg	2	1393
1142	foto-lateral-LA27.03.20135-02-33pm.jpg	3	1393
1143	foto-trasera-TR27.03.20135-02-33pm.jpg	4	1393
1144	foto-frontal-FR27.03.20135-09-53pm.jpg	2	1395
1145	foto-lateral-LA27.03.20135-09-53pm.jpg	3	1395
1146	foto-trasera-TR27.03.20135-09-53pm.jpg	4	1395
1147	foto-frontal-fr28.03.20139-00-23am.jpg	2	1399
1148	foto-lateral-la28.03.20139-00-23am.jpg	3	1399
1149	foto-trasera-tr28.03.20139-00-23am.jpg	4	1399
1150	foto-frontal-fr28.03.20139-06-11am.jpg	2	1400
1151	foto-lateral-la28.03.20139-06-11am.jpg	3	1400
1152	foto-trasera-tr28.03.20139-06-11am.jpg	4	1400
1153	foto-frontal-fr28.03.20139-09-41am.jpg	2	1401
1154	foto-lateral-la28.03.20139-09-41am.jpg	3	1401
1155	foto-trasera-tr28.03.20139-09-41am.jpg	4	1401
1156	foto-frontal-fr28.03.20139-12-55am.jpg	2	1402
1157	foto-lateral-la28.03.20139-12-55am.jpg	3	1402
1158	foto-trasera-tr28.03.20139-12-55am.jpg	4	1402
1159	foto-frontal-fr28.03.20139-15-31am.jpg	2	1403
1160	foto-lateral-la28.03.20139-15-31am.jpg	3	1403
1161	foto-trasera-tr28.03.20139-15-31am.jpg	4	1403
1162	foto-frontal-FR28.03.201310-10-13am.jpg	2	1404
1163	foto-lateral-LA28.03.201310-10-13am.jpg	3	1404
1164	foto-trasera-TR28.03.201310-10-13am.jpg	4	1404
1165	foto-frontal-FR28.03.201310-12-16am.jpg	2	1405
1166	foto-lateral-LA28.03.201310-12-16am.jpg	3	1405
1167	foto-trasera-TR28.03.201310-12-16am.jpg	4	1405
1168	foto-frontal-FR28.03.201310-15-38am.jpg	2	1406
1169	foto-lateral-LA28.03.201310-15-38am.jpg	3	1406
1170	foto-trasera-TR28.03.201310-15-38am.jpg	4	1406
1171	foto-frontal-FR28.03.201310-24-43am.jpg	2	1407
1172	foto-lateral-LA28.03.201310-24-43am.jpg	3	1407
1173	foto-trasera-TR28.03.201310-24-43am.jpg	4	1407
1174	foto-frontal-FR28.03.201310-27-56am.jpg	2	1408
1175	foto-lateral-LA28.03.201310-27-56am.jpg	3	1408
1176	foto-trasera-TR28.03.201310-27-56am.jpg	4	1408
1177	foto-frontal-fr28.03.201311-38-09am.jpg	2	1409
1178	foto-lateral-la28.03.201311-38-09am.jpg	3	1409
1179	foto-frontal-fr28.03.201311-41-11am.jpg	2	1410
1180	foto-lateral-la28.03.201311-41-11am.jpg	3	1410
1181	foto-trasera-tr28.03.201311-41-11am.jpg	4	1410
1182	foto-frontal-FR28.03.201312-05-06pm.jpg	2	1412
1183	foto-lateral-LA28.03.201312-05-06pm.jpg	3	1412
1184	foto-trasera-TR28.03.201312-05-06pm.jpg	4	1412
1185	foto-frontal-FR28.03.201312-10-50pm.jpg	2	1413
1186	foto-lateral-LA28.03.201312-10-50pm.jpg	3	1413
1187	foto-trasera-TR28.03.201312-10-50pm.jpg	4	1413
1188	foto-frontal-FR28.03.201312-13-42pm.jpg	2	1414
1189	foto-lateral-LA28.03.201312-13-42pm.jpg	3	1414
1190	foto-trasera-TR28.03.201312-13-42pm.jpg	4	1414
1191	foto-frontal-FR28.03.20131-05-03pm.jpg	2	1415
1192	foto-lateral-LA28.03.20131-05-03pm.jpg	3	1415
1193	foto-trasera-TR28.03.20131-05-03pm.jpg	4	1415
1194	foto-frontal-fr28.03.20133-01-15pm.jpg	2	1421
1195	foto-lateral-la28.03.20133-01-15pm.jpg	3	1421
1196	foto-frontal-fr28.03.20133-04-25pm.jpg	2	1422
1197	foto-lateral-la28.03.20133-04-25pm.jpg	3	1422
1198	foto-trasera-tr28.03.20133-04-25pm.jpg	4	1422
1199	foto-frontal-fr28.03.20133-23-33pm.jpg	2	1423
1200	foto-lateral-la28.03.20133-23-33pm.jpg	3	1423
1201	foto-trasera-tr28.03.20133-23-33pm.jpg	4	1423
1202	foto-frontal-fr28.03.20133-26-25pm.jpg	2	1424
1203	foto-lateral-la28.03.20133-26-25pm.jpg	3	1424
1204	foto-trasera-tr28.03.20133-26-25pm.jpg	4	1424
1205	foto-frontal-fr28.03.20133-30-47pm.jpg	2	1425
1206	foto-lateral-la28.03.20133-30-47pm.jpg	3	1425
1207	foto-frontal-fr01.04.20138-07-12am.jpg	2	1426
1208	foto-lateral-la01.04.20138-07-12am.jpg	3	1426
1209	foto-trasera-tr01.04.20138-07-12am.jpg	4	1426
1210	foto-frontal-fr01.04.20138-18-38am.jpg	2	1427
1211	foto-lateral-la01.04.20138-18-38am.jpg	3	1427
1212	foto-trasera-tr01.04.20138-18-38am.jpg	4	1427
1213	foto-frontal-fr01.04.20138-26-17am.jpg	2	1428
1214	foto-lateral-la01.04.20138-26-17am.jpg	3	1428
1215	foto-trasera-tr01.04.20138-26-17am.jpg	4	1428
1216	foto-frontal-fr01.04.20138-41-08am.jpg	2	9
1217	foto-lateral-la01.04.20138-41-08am.jpg	3	9
1218	foto-trasera-tr01.04.20138-41-08am.jpg	4	9
1219	foto-frontal-fr01.04.20138-53-38am.jpg	2	1429
1220	foto-lateral-la01.04.20138-53-38am.jpg	3	1429
1221	foto-trasera-tr01.04.20138-53-38am.jpg	4	1429
1222	foto-frontal-fr01.04.20138-59-42am.jpg	2	1430
1223	foto-lateral-la01.04.20138-59-42am.jpg	3	1430
1224	foto-trasera-tr01.04.20138-59-42am.jpg	4	1430
1225	foto-frontal-fr01.04.20139-10-04am.jpg	2	1431
1226	foto-lateral-la01.04.20139-10-04am.jpg	3	1431
1227	foto-trasera-tr01.04.20139-10-04am.jpg	4	1431
1228	foto-frontal-fr01.04.20139-13-01am.jpg	2	1432
1229	foto-lateral-la01.04.20139-13-01am.jpg	3	1432
1230	foto-trasera-tr01.04.20139-13-01am.jpg	4	1432
1231	foto-frontal-FR02.04.20137-57-20am.jpg	2	1433
1233	foto-trasera-TR02.04.20137-57-20am.jpg	4	1433
1234	foto-frontal-FR02.04.20138-53-22am.jpg	2	1437
1235	foto-lateral-LA02.04.20138-53-22am.jpg	3	1437
1236	foto-trasera-TR02.04.20138-53-22am.jpg	4	1437
1237	foto-frontal-FR02.04.20139-01-10am.jpg	2	1438
1238	foto-lateral-LA02.04.20139-01-10am.jpg	3	1438
1239	foto-trasera-TR02.04.20139-01-10am.jpg	4	1438
1240	foto-frontal-fr02.04.20139-11-39am.jpg	2	1439
1241	foto-lateral-la02.04.20139-11-39am.jpg	3	1439
1242	foto-trasera-tr02.04.20139-11-39am.jpg	4	1439
1243	foto-frontal-fr02.04.20139-20-32am.jpg	2	1440
1244	foto-lateral-la02.04.20139-20-32am.jpg	3	1440
1245	foto-frontal-fr02.04.20139-26-49am.jpg	2	1441
1246	foto-lateral-la02.04.20139-26-49am.jpg	3	1441
1247	foto-trasera-tr02.04.20139-26-49am.jpg	4	1441
1248	foto-frontal-fr02.04.20139-31-57am.jpg	2	1442
1249	foto-lateral-la02.04.20139-31-57am.jpg	3	1442
1250	foto-trasera-tr02.04.20139-31-57am.jpg	4	1442
1251	foto-frontal-fr02.04.20139-40-44am.jpg	2	1443
1252	foto-lateral-la02.04.20139-40-44am.jpg	3	1443
1253	foto-trasera-tr02.04.20139-40-44am.jpg	4	1443
1254	foto-frontal-fr02.04.20139-46-07am.jpg	2	1444
1255	foto-lateral-la02.04.20139-46-07am.jpg	3	1444
1256	foto-trasera-tr02.04.20139-46-07am.jpg	4	1444
1257	foto-frontal-fr02.04.20139-53-31am.jpg	2	1445
1258	foto-lateral-la02.04.20139-53-31am.jpg	3	1445
1259	foto-trasera-tr02.04.20139-53-31am.jpg	4	1445
1260	foto-frontal-FR02.04.201311-10-19am.jpg	2	58
1261	foto-lateral-LA02.04.201311-10-19am.jpg	3	58
1262	foto-trasera-TR02.04.201311-10-19am.jpg	4	58
1263	foto-frontal-FR02.04.201311-22-05am.jpg	2	1451
1264	foto-lateral-LA02.04.201311-22-05am.jpg	3	1451
1265	foto-trasera-TR02.04.201311-22-05am.jpg	4	1451
1266	foto-frontal-FR02.04.201311-26-26am.jpg	2	1452
1267	foto-lateral-LA02.04.201311-26-26am.jpg	3	1452
1268	foto-trasera-TR02.04.201311-26-26am.jpg	4	1452
1269	foto-frontal-fr02.04.201311-45-01am.jpg	2	1454
1270	foto-lateral-la02.04.201311-45-01am.jpg	3	1454
1271	foto-trasera-tr02.04.201311-45-01am.jpg	4	1454
1272	foto-frontal-fr02.04.201311-52-46am.jpg	2	1455
1273	foto-lateral-la02.04.201311-52-46am.jpg	3	1455
1274	foto-trasera-tr02.04.201311-52-46am.jpg	4	1455
1275	foto-frontal-fr02.04.201311-55-48am.jpg	2	1456
1276	foto-lateral-la02.04.201311-55-48am.jpg	3	1456
1277	foto-trasera-tr02.04.201311-55-48am.jpg	4	1456
1278	foto-frontal-fr02.04.20132-19-51pm.jpg	2	1458
1279	foto-frontal-fr02.04.20132-38-25pm.jpg	2	1459
1280	foto-lateral-la02.04.20132-38-25pm.jpg	3	1459
1281	foto-trasera-tr02.04.20132-38-25pm.jpg	4	1459
1282	foto-frontal-fr02.04.20132-42-31pm.jpg	2	1460
1283	foto-lateral-la02.04.20132-42-31pm.jpg	3	1460
1284	foto-trasera-tr02.04.20132-42-31pm.jpg	4	1460
1285	foto-frontal-fr02.04.20132-47-54pm.jpg	2	1461
1286	foto-lateral-la02.04.20132-47-54pm.jpg	3	1461
1287	foto-trasera-tr02.04.20132-47-54pm.jpg	4	1461
1289	foto-lateral-la02.04.20132-52-42pm.jpg	3	1462
1290	foto-frontal-FR02.04.20133-06-37pm.jpg	2	1463
1291	foto-lateral-LA02.04.20133-06-37pm.jpg	3	1463
1292	foto-frontal-fr02.04.20133-42-40pm.jpg	2	1466
1293	foto-lateral-la02.04.20133-42-40pm.jpg	3	1466
1294	foto-trasera-tr02.04.20133-42-40pm.jpg	4	1466
1295	foto-frontal-fr02.04.20133-48-44pm.jpg	2	1467
1296	foto-lateral-la02.04.20133-48-44pm.jpg	3	1467
1297	foto-trasera-tr02.04.20133-48-44pm.jpg	4	1467
1298	foto-frontal-fr02.04.20133-52-24pm.jpg	2	1468
1299	foto-lateral-la02.04.20133-52-24pm.jpg	3	1468
1300	foto-trasera-tr02.04.20133-52-24pm.jpg	4	1468
1301	foto-frontal-fr02.04.20133-56-23pm.jpg	2	1469
1302	foto-lateral-la02.04.20133-56-23pm.jpg	3	1469
1303	foto-trasera-tr02.04.20133-56-23pm.jpg	4	1469
1304	foto-frontal-fr02.04.20134-10-46pm.jpg	2	1470
1305	foto-lateral-la02.04.20134-10-46pm.jpg	3	1470
1306	foto-trasera-tr02.04.20134-10-46pm.jpg	4	1470
1307	foto-frontal-fr02.04.20134-19-16pm.jpg	2	1471
1308	foto-lateral-la02.04.20134-19-16pm.jpg	3	1471
1309	foto-trasera-tr02.04.20134-19-16pm.jpg	4	1471
1310	foto-frontal-fr02.04.20134-39-34pm.jpg	2	1472
1311	foto-lateral-la02.04.20134-39-34pm.jpg	3	1472
1312	foto-trasera-tr02.04.20134-39-34pm.jpg	4	1472
1314	foto-lateral-la02.04.20134-59-42pm.jpg	3	1473
1316	foto-lateral-la02.04.20135-07-25pm.jpg	3	1476
1317	foto-frontal-fr02.04.20135-50-36pm.JPG	2	1480
1318	foto-lateral-la02.04.20135-50-36pm.jpg	3	1480
1319	foto-trasera-tr02.04.20135-50-36pm.jpg	4	1480
1320	foto-frontal-fr02.04.20135-53-05pm.jpg	2	1481
1321	foto-lateral-la02.04.20135-53-05pm.jpg	3	1481
1322	foto-trasera-tr02.04.20135-53-05pm.jpg	4	1481
1323	foto-frontal-fr03.04.20137-49-05am.jpg	2	1482
1324	foto-lateral-la03.04.20137-49-05am.jpg	3	1482
1325	foto-trasera-tr03.04.20137-49-05am.jpg	4	1482
1326	foto-frontal-fr03.04.20137-54-00am.jpg	2	1483
1327	foto-lateral-la03.04.20137-54-00am.jpg	3	1483
1328	foto-trasera-tr03.04.20137-54-00am.jpg	4	1483
1329	foto-frontal-FR03.04.201312-25-21pm.jpg	2	1486
1330	foto-lateral-LA03.04.201312-25-21pm.jpg	3	1486
1331	foto-frontal-FR03.04.201312-27-44pm.jpg	2	1487
1332	foto-lateral-LA03.04.201312-27-44pm.jpg	3	1487
1333	foto-frontal-fr03.04.20131-42-49pm.jpg	2	1488
1334	foto-frontal-fr03.04.20131-45-40pm.jpg	2	1489
1335	foto-lateral-la03.04.20131-45-40pm.jpg	3	1489
1336	foto-trasera-tr03.04.20131-45-40pm.jpg	4	1489
1337	foto-frontal-FR03.04.20132-08-41pm.jpg	2	1490
1338	foto-lateral-LA03.04.20132-08-41pm.jpg	3	1490
1339	foto-trasera-TR03.04.20132-08-41pm.jpg	4	1490
1340	foto-frontal-FR03.04.20132-37-28pm.jpg	2	1491
1341	foto-lateral-LA03.04.20132-37-28pm.jpg	3	1491
1342	foto-trasera-TR03.04.20132-37-28pm.jpg	4	1491
1343	foto-frontal-FR03.04.20132-39-43pm.jpg	2	1492
1345	foto-trasera-TR03.04.20132-39-43pm.jpg	4	1492
1346	foto-frontal-FR03.04.20132-47-10pm.jpg	2	1493
1348	foto-trasera-TR03.04.20132-47-10pm.jpg	4	1493
1349	foto-frontal-FR03.04.20133-22-50pm.jpg	2	1494
1350	foto-lateral-LA03.04.20133-22-50pm.jpg	3	1494
1351	foto-trasera-TR03.04.20133-22-50pm.jpg	4	1494
1352	foto-frontal-FR03.04.20133-25-17pm.jpg	2	1495
1354	foto-trasera-TR03.04.20133-25-17pm.jpg	4	1495
1355	foto-frontal-FR03.04.20133-35-40pm.jpg	2	1496
1356	foto-lateral-LA03.04.20133-35-40pm.jpg	3	1496
1357	foto-trasera-TR03.04.20133-35-40pm.jpg	4	1496
1358	foto-frontal-FR03.04.20133-38-31pm.jpg	2	1497
1359	foto-lateral-LA03.04.20133-38-31pm.jpg	3	1497
1360	foto-trasera-TR03.04.20133-38-31pm.jpg	4	1497
1361	foto-frontal-FR03.04.20133-41-28pm.jpg	2	1498
1362	foto-lateral-LA03.04.20133-41-28pm.jpg	3	1498
1363	foto-frontal-FR03.04.20133-44-25pm.jpg	2	1499
1364	foto-lateral-LA03.04.20133-44-25pm.jpg	3	1499
1365	foto-trasera-TR03.04.20133-44-25pm.jpg	4	1499
1366	foto-frontal-FR03.04.20133-50-36pm.jpg	2	1500
1367	foto-lateral-LA03.04.20133-50-36pm.jpg	3	1500
1368	foto-trasera-TR03.04.20133-50-36pm.jpg	4	1500
1369	foto-frontal-FR03.04.20133-54-14pm.jpg	2	1501
1370	foto-lateral-LA03.04.20133-54-14pm.jpg	3	1501
1371	foto-trasera-TR03.04.20133-54-14pm.jpg	4	1501
1373	foto-lateral-la03.04.20134-37-07pm.jpg	3	1502
1374	foto-frontal-fr03.04.20134-42-53pm.jpg	2	1503
1375	foto-lateral-la03.04.20134-42-53pm.jpg	3	1503
1376	foto-trasera-tr03.04.20134-42-53pm.jpg	4	1503
1377	foto-frontal-fr03.04.20134-49-28pm.jpg	2	1504
1379	foto-trasera-tr03.04.20134-49-28pm.jpg	4	1504
1380	foto-frontal-fr03.04.20134-52-05pm.jpg	2	1505
1381	foto-lateral-la03.04.20134-52-05pm.jpg	3	1505
1382	foto-trasera-tr03.04.20134-52-05pm.jpg	4	1505
1383	foto-frontal-fr03.04.20134-55-04pm.jpg	2	1506
1384	foto-lateral-la03.04.20134-55-04pm.jpg	3	1506
1385	foto-trasera-tr03.04.20134-55-04pm.jpg	4	1506
1386	foto-frontal-fr03.04.20135-00-00pm.jpg	2	1507
1387	foto-lateral-la03.04.20135-00-00pm.jpg	3	1507
1388	foto-trasera-tr03.04.20135-00-00pm.jpg	4	1507
1389	foto-frontal-fr03.04.20135-23-16pm.jpg	2	1508
1390	foto-frontal-FR04.04.20137-55-47am.jpg	2	1509
1391	foto-lateral-LA04.04.20137-55-47am.jpg	3	1509
1392	foto-trasera-TR04.04.20137-55-47am.jpg	4	1509
1393	foto-frontal-FR04.04.20138-12-57am.jpg	2	1510
1394	foto-frontal-fr04.04.20138-30-43am.jpg	2	1511
1395	foto-lateral-la04.04.20138-30-43am.jpg	3	1511
1396	foto-trasera-tr04.04.20138-30-43am.jpg	4	1511
1397	foto-frontal-fr04.04.20139-19-24am.jpg	2	1512
1398	foto-frontal-fr04.04.20139-33-19am.jpg	2	1514
1399	foto-lateral-la04.04.20139-33-19am.jpg	3	1514
1400	foto-trasera-tr04.04.20139-33-19am.jpg	4	1514
1401	foto-frontal-fr04.04.20139-45-26am.jpg	2	1515
1403	foto-trasera-tr04.04.20139-45-26am.jpg	4	1515
1404	foto-frontal-fr04.04.201310-27-50am.jpg	2	1516
1405	foto-lateral-la04.04.201310-27-50am.jpg	3	1516
1406	foto-trasera-tr04.04.201310-27-50am.jpg	4	1516
1407	foto-frontal-fr04.04.201310-31-34am.jpg	2	1517
1408	foto-lateral-la04.04.201310-31-34am.jpg	3	1517
1409	foto-trasera-tr04.04.201310-31-34am.jpg	4	1517
1410	foto-frontal-fr04.04.20131-34-27pm.jpg	2	1521
1411	foto-lateral-la04.04.20131-34-27pm.jpg	3	1521
1412	foto-trasera-tr04.04.20131-34-27pm.jpg	4	1521
1413	foto-frontal-FR04.04.20132-28-49pm.jpg	2	1523
1414	foto-lateral-LA04.04.20132-28-49pm.jpg	3	1523
1415	foto-trasera-TR04.04.20132-28-49pm.jpg	4	1523
1416	foto-frontal-fr04.04.20132-44-11pm.jpg	2	1524
1417	foto-lateral-la04.04.20132-44-11pm.jpg	3	1524
1418	foto-trasera-tr04.04.20132-44-11pm.jpg	4	1524
1419	foto-frontal-fr04.04.20133-14-34pm.jpg	2	1525
1420	foto-lateral-la04.04.20133-14-34pm.jpg	3	1525
1421	foto-trasera-tr04.04.20133-14-34pm.jpg	4	1525
1422	foto-frontal-fr04.04.20134-22-35pm.jpg	2	1526
1423	foto-lateral-la04.04.20134-22-35pm.jpg	3	1526
1424	foto-trasera-tr04.04.20134-22-35pm.jpg	4	1526
1425	foto-frontal-fr04.04.20134-30-43pm.jpg	2	1527
1426	foto-lateral-la04.04.20134-30-43pm.jpg	3	1527
1427	foto-trasera-tr04.04.20134-30-43pm.jpg	4	1527
1430	foto-trasera-fr04.04.20134-41-49pm.jpg	4	1528
1431	foto-frontal-fr04.04.20134-56-13pm.jpg	2	1531
1432	foto-lateral-la04.04.20134-56-13pm.jpg	3	1531
1433	foto-trasera-tr04.04.20134-56-13pm.jpg	4	1531
1434	foto-frontal-fr04.04.20134-59-56pm.jpg	2	1532
1435	foto-lateral-la04.04.20134-59-56pm.jpg	3	1532
1436	foto-trasera-tr04.04.20134-59-56pm.jpg	4	1532
1439	foto-trasera-tr04.04.20135-08-04pm.jpg	4	1534
1440	foto-frontal-darley05.04.201310-29-13am.jpg	2	1538
1441	foto-frontal-m18005.04.201310-30-47am.jpg	2	1539
1442	foto-frontal-bk1ok05.04.201312-39-59pm.JPG	2	1540
1443	foto-frontal-fr05.04.201312-44-14pm.jpg	2	1541
1444	foto-lateral-la05.04.201312-44-14pm.jpg	3	1541
1445	foto-trasera-tr05.04.201312-44-14pm.jpg	4	1541
1446	foto-frontal-fr08.04.20139-22-57am.jpg	2	55
1447	foto-lateral-la08.04.20139-22-57am.jpg	3	55
1448	foto-trasera-tr08.04.20139-22-57am.jpg	4	55
1449	foto-frontal-fr08.04.20139-31-31am.jpg	2	1542
1450	foto-lateral-la08.04.20139-31-31am.jpg	3	1542
1451	foto-trasera-tr08.04.20139-31-31am.jpg	4	1542
1452	foto-frontal-fr08.04.20139-33-55am.jpg	2	1543
1454	foto-trasera-tr08.04.20139-33-55am.jpg	4	1543
1455	foto-frontal-fr08.04.20139-37-38am.jpg	2	1544
1456	foto-lateral-la08.04.20139-37-38am.jpg	3	1544
1457	foto-trasera-tr08.04.20139-37-38am.jpg	4	1544
1458	foto-frontal-fr09.04.201310-18-35am.jpg	2	1549
1459	foto-lateral-la09.04.201310-18-35am.jpg	3	1549
1460	foto-trasera-tr09.04.201310-18-35am.jpg	4	1549
1461	foto-frontal-fr09.04.201310-21-16am.jpg	2	1550
1462	foto-lateral-la09.04.201310-21-16am.jpg	3	1550
1463	foto-trasera-tr09.04.201310-21-16am.jpg	4	1550
1464	foto-frontal-fr09.04.201310-24-13am.jpg	2	1551
1465	foto-lateral-la09.04.201310-24-13am.jpg	3	1551
1466	foto-trasera-tr09.04.201310-24-13am.jpg	4	1551
1467	foto-frontal-fr16.04.201310-40-24am.jpg	2	1617
1468	foto-lateral-la16.04.201310-40-24am.jpg	3	1617
1469	foto-trasera-tr16.04.201310-40-24am.jpg	4	1617
1470	foto-frontal-fr16.04.201310-49-48am.jpg	2	1618
1471	foto-lateral-la16.04.201310-49-48am.jpg	3	1618
1472	foto-trasera-tr16.04.201310-49-48am.jpg	4	1618
1473	foto-frontal-fr16.04.201310-54-43am.jpg	2	1619
1474	foto-lateral-la16.04.201310-54-43am.jpg	3	1619
1475	foto-trasera-tr16.04.201310-54-43am.jpg	4	1619
1476	foto-frontal-fr16.04.201310-58-14am.jpg	2	1620
1477	foto-lateral-la16.04.201310-58-14am.jpg	3	1620
1478	foto-trasera-tr16.04.201310-58-14am.jpg	4	1620
1479	foto-frontal-fr16.04.201311-05-27am.jpg	2	1621
1480	foto-lateral-la16.04.201311-05-27am.jpg	3	1621
1481	foto-trasera-tr16.04.201311-05-27am.jpg	4	1621
1482	foto-frontal-fr16.04.201311-15-24am.jpg	2	1622
1483	foto-lateral-la16.04.201311-15-24am.jpg	3	1622
1484	foto-trasera-tr16.04.201311-15-24am.jpg	4	1622
1485	foto-frontal-fr16.04.201311-18-42am.jpg	2	1623
1487	foto-trasera-tr16.04.201311-18-42am.jpg	4	1623
1488	foto-frontal-fr16.04.201311-24-08am.jpg	2	1624
1489	foto-lateral-la16.04.201311-24-08am.jpg	3	1624
1490	foto-trasera-tr16.04.201311-24-08am.jpg	4	1624
1491	foto-frontal-fr16.04.201312-14-18pm.jpg	2	1626
1492	foto-lateral-la16.04.201312-14-18pm.jpg	3	1626
1493	foto-trasera-tr16.04.201312-14-18pm.jpg	4	1626
1494	foto-frontal-fr16.04.201312-20-15pm.jpg	2	1627
1495	foto-lateral-la16.04.201312-20-15pm.jpg	3	1627
1496	foto-trasera-tr16.04.201312-20-15pm.jpg	4	1627
1497	foto-frontal-fr16.04.201312-25-23pm.jpg	2	1628
1498	foto-lateral-la16.04.201312-25-23pm.jpg	3	1628
1499	foto-trasera-tr16.04.201312-25-23pm.jpg	4	1628
1500	foto-frontal-fr16.04.201312-29-27pm.jpg	2	1629
1501	foto-lateral-la16.04.201312-29-27pm.jpg	3	1629
1502	foto-trasera-tr16.04.201312-29-27pm.jpg	4	1629
1503	foto-frontal-fr16.04.201312-56-38pm.jpg	2	1630
1504	foto-lateral-la16.04.201312-56-38pm.jpg	3	1630
1505	foto-trasera-tr16.04.201312-56-38pm.jpg	4	1630
1506	foto-frontal-fr16.04.20131-14-44pm.jpg	2	1632
1507	foto-lateral-la16.04.20131-14-44pm.jpg	3	1632
1508	foto-trasera-tr16.04.20131-14-44pm.jpg	4	1632
1509	foto-frontal-fr16.04.20131-24-44pm.jpg	2	1633
1510	foto-lateral-la16.04.20131-24-44pm.jpg	3	1633
1511	foto-trasera-tr16.04.20131-24-44pm.jpg	4	1633
1512	foto-frontal-fr16.04.20131-28-36pm.jpg	2	1634
1513	foto-lateral-la16.04.20131-28-36pm.jpg	3	1634
1514	foto-trasera-tr16.04.20131-28-36pm.jpg	4	1634
1515	foto-frontal-fr16.04.20131-37-32pm.jpg	2	1635
1516	foto-lateral-la16.04.20131-37-32pm.jpg	3	1635
1517	foto-trasera-tr16.04.20131-37-32pm.jpg	4	1635
1518	foto-frontal-fr17.04.20139-54-40am.jpg	2	1636
1519	foto-lateral-la17.04.20139-54-40am.jpg	3	1636
1520	foto-trasera-tr17.04.20139-54-40am.jpg	4	1636
1521	foto-frontal-fr17.04.201310-07-09am.jpg	2	1637
1522	foto-lateral-la17.04.201310-07-09am.jpg	3	1637
1523	foto-trasera-tr17.04.201310-07-09am.jpg	4	1637
1524	foto-frontal-fr17.04.201310-10-09am.jpg	2	1638
1525	foto-lateral-la17.04.201310-10-09am.jpg	3	1638
1526	foto-trasera-tr17.04.201310-10-09am.jpg	4	1638
1527	foto-frontal-fr17.04.201310-13-09am.jpg	2	1639
1528	foto-lateral-la17.04.201310-13-09am.jpg	3	1639
1529	foto-trasera-tr17.04.201310-13-09am.jpg	4	1639
1530	foto-frontal-fr17.04.201312-43-50pm.jpg	2	1640
1531	foto-lateral-la17.04.201312-43-50pm.jpg	3	1640
1532	foto-trasera-tr17.04.201312-43-50pm.jpg	4	1640
1533	foto-frontal-fr17.04.201312-51-11pm.jpg	2	1641
1534	foto-lateral-la17.04.201312-51-11pm.jpg	3	1641
1535	foto-trasera-tr17.04.201312-51-11pm.jpg	4	1641
1536	foto-frontal-FR17.04.20131-31-00pm.jpg	2	427
1537	foto-lateral-LA17.04.20131-31-00pm.jpg	3	427
1538	foto-trasera-TR17.04.20131-31-00pm.jpg	4	427
1539	foto-frontal-fr18.04.201311-36-59am.jpg	2	1653
1540	foto-frontal-fr18.04.20133-42-35pm.jpg	2	1659
1541	foto-lateral-la18.04.20133-42-35pm.jpg	3	1659
1542	foto-trasera-tr18.04.20133-42-35pm.jpg	4	1659
1543	foto-frontal-fr18.04.20133-44-02pm.jpg	2	1658
1544	foto-lateral-la18.04.20133-44-02pm.jpg	3	1658
1545	foto-trasera-tr18.04.20133-44-02pm.jpg	4	1658
1546	foto-frontal-fr18.04.20133-47-32pm.jpg	2	17
1547	foto-lateral-la18.04.20133-47-32pm.jpg	3	17
1548	foto-frontal-fr18.04.20133-54-03pm.jpg	2	1660
1549	foto-lateral-la18.04.20133-54-03pm.jpg	3	1660
1550	foto-trasera-tr18.04.20133-54-03pm.jpg	4	1660
1551	foto-frontal-fr18.04.20133-57-20pm.jpg	2	1661
1552	foto-lateral-la18.04.20133-57-20pm.jpg	3	1661
1553	foto-trasera-tr18.04.20133-57-20pm.jpg	4	1661
1554	foto-frontal-fr18.04.20134-34-38pm.jpg	2	1662
1555	foto-lateral-la18.04.20134-34-38pm.jpg	3	1662
1556	foto-trasera-tr18.04.20134-34-38pm.jpg	4	1662
1557	foto-frontal-fr18.04.20136-39-34pm.jpg	2	1663
1558	foto-lateral-la18.04.20136-39-34pm.jpg	3	1663
1559	foto-trasera-tr18.04.20136-39-34pm.jpg	4	1663
1560	foto-frontal-fr22.04.20139-31-56am.jpg	2	1665
1561	foto-frontal-fr22.04.20139-35-48am.jpg	2	1666
1562	foto-frontal-fr22.04.20139-48-39am.jpg	2	1667
1563	foto-frontal-fr22.04.201310-49-37am.jpg	2	1674
1564	foto-lateral-la22.04.201310-49-37am.jpg	3	1674
1565	foto-trasera-tr22.04.201310-49-37am.jpg	4	1674
1566	foto-frontal-fr22.04.201310-50-53am.jpg	2	1673
1567	foto-lateral-la22.04.201310-50-53am.jpg	3	1673
1568	foto-trasera-tr22.04.201310-50-53am.jpg	4	1673
1569	foto-frontal-FR22.04.20131-20-21pm.jpg	2	1686
1570	foto-lateral-LA22.04.20131-20-21pm.jpg	3	1686
1571	foto-trasera-TR22.04.20131-20-21pm.jpg	4	1686
1572	foto-frontal-FR22.04.20131-23-10pm.jpg	2	1687
1573	foto-lateral-LA22.04.20131-23-10pm.jpg	3	1687
1574	foto-trasera-TR22.04.20131-23-10pm.jpg	4	1687
1575	foto-frontal-fr22.04.20131-32-05pm.jpg	2	1688
1576	foto-lateral-la22.04.20131-32-05pm.jpg	3	1688
1577	foto-trasera-tr22.04.20131-32-05pm.jpg	4	1688
1578	foto-frontal-fr22.04.20131-49-21pm.jpg	2	1689
1579	foto-lateral-la22.04.20131-49-21pm.jpg	3	1689
1580	foto-trasera-tr22.04.20131-49-21pm.jpg	4	1689
1581	foto-frontal-fr22.04.20131-53-16pm.jpg	2	1690
1582	foto-lateral-la22.04.20131-53-16pm.jpg	3	1690
1583	foto-trasera-tr22.04.20131-53-16pm.jpg	4	1690
1584	foto-frontal-fr22.04.20132-53-53pm.jpg	2	1693
1585	foto-frontal-FR22.04.20136-05-15pm.jpg	2	1695
1586	foto-lateral-LA22.04.20136-05-15pm.jpg	3	1695
1587	foto-trasera-TR22.04.20136-05-15pm.jpg	4	1695
1588	foto-frontal-FR22.04.20136-14-54pm.jpg	2	1696
1589	foto-lateral-LA22.04.20136-14-54pm.jpg	3	1696
1590	foto-trasera-TR22.04.20136-14-54pm.jpg	4	1696
1591	foto-frontal-FR22.04.20136-23-22pm.jpg	2	1697
1592	foto-lateral-TR22.04.20136-23-22pm.jpg	3	1697
1593	foto-trasera-TR22.04.20136-23-22pm.jpg	4	1697
1595	foto-lateral-LA22.04.20136-30-49pm.jpg	3	1699
1596	foto-frontal-FR22.04.20136-34-02pm.jpg	2	1700
1597	foto-lateral-LA22.04.20136-34-02pm.jpg	3	1700
1598	foto-trasera-TR22.04.20136-34-02pm.jpg	4	1700
1599	foto-frontal-FR22.04.20136-37-29pm.jpg	2	1701
1601	foto-trasera-TR22.04.20136-37-29pm.jpg	4	1701
1602	foto-frontal-fr23.04.20138-53-32am.jpg	2	1702
1603	foto-lateral-la23.04.20138-53-32am.jpg	3	1702
1604	foto-trasera-tr23.04.20138-53-32am.jpg	4	1702
1605	foto-frontal-fr23.04.20139-00-47am.jpg	2	1703
1606	foto-frontal-fr123.04.20139-04-08am.jpg	2	1704
1607	foto-lateral-fr23.04.20139-04-08am.jpg	3	1704
1608	foto-trasera-tr23.04.20139-04-08am.jpg	4	1704
1609	foto-frontal-fr23.04.20139-36-01am.jpg	2	1705
1610	foto-lateral-la23.04.20139-36-01am.jpg	3	1705
1611	foto-trasera-tr23.04.20139-36-01am.jpg	4	1705
1612	foto-frontal-fr23.04.201310-02-26am.jpg	2	1706
1613	foto-lateral-la23.04.201310-02-26am.jpg	3	1706
1614	foto-trasera-tr23.04.201310-02-26am.jpg	4	1706
1615	foto-frontal-fr23.04.201310-10-45am.jpg	2	1707
1617	foto-trasera-tr23.04.201310-10-45am.jpg	4	1707
1618	foto-frontal-fr23.04.201310-33-15am.jpg	2	1708
1619	foto-lateral-la23.04.201310-33-15am.jpg	3	1708
1620	foto-trasera-tr23.04.201310-33-15am.jpg	4	1708
1622	foto-lateral-premium 260lat23.04.201310-34-29am.jpg	3	1707
1623	foto-frontal-fr23.04.201310-37-44am.jpg	2	1709
1624	foto-lateral-la23.04.201310-37-44am.jpg	3	1709
1625	foto-trasera-tr23.04.201310-37-44am.jpg	4	1709
1626	foto-frontal-fr23.04.201310-40-55am.jpg	2	1710
1627	foto-lateral-la23.04.201310-40-55am.jpg	3	1710
1628	foto-trasera-tr23.04.201310-40-55am.jpg	4	1710
1629	foto-frontal-fr23.04.201310-43-11am.jpg	2	1711
1630	foto-lateral-la23.04.201310-43-11am.jpg	3	1711
1631	foto-trasera-tr23.04.201310-43-11am.jpg	4	1711
1632	foto-frontal-fr23.04.201310-46-50am.jpg	2	1712
1633	foto-lateral-la23.04.201310-46-50am.jpg	3	1712
1634	foto-trasera-tr23.04.201310-46-50am.jpg	4	1712
1635	foto-frontal-fr23.04.201310-50-34am.jpg	2	1713
1636	foto-lateral-la23.04.201310-50-34am.jpg	3	1713
1637	foto-trasera-tr23.04.201310-50-34am.jpg	4	1713
1638	foto-frontal-fr23.04.201311-02-04am.jpg	2	1714
1639	foto-lateral-la23.04.201311-02-04am.jpg	3	1714
1640	foto-trasera-tr23.04.201311-02-04am.jpg	4	1714
1641	foto-frontal-fr23.04.201311-37-23am.jpg	2	1715
1643	foto-trasera-tr23.04.201311-37-23am.jpg	4	1715
1644	foto-frontal-fr23.04.201312-04-07pm.jpg	2	1716
1645	foto-frontal-fr23.04.201312-08-13pm.jpg	2	1717
1646	foto-lateral-la23.04.201312-08-13pm.jpg	3	1717
1647	foto-trasera-tr23.04.201312-08-13pm.jpg	4	1717
1648	foto-frontal-fr23.04.201312-10-53pm.jpg	2	1718
1649	foto-frontal-fr23.04.201312-15-20pm.jpg	2	1719
1650	foto-frontal-fr23.04.20131-03-32pm.jpg	2	1720
1651	foto-frontal-fr23.04.20132-59-10pm.jpg	2	1721
1652	foto-lateral-la23.04.20132-59-10pm.jpg	3	1721
1653	foto-trasera-tr23.04.20132-59-10pm.jpg	4	1721
1654	foto-frontal-fr23.04.20134-30-42pm.jpg	2	1722
1655	foto-lateral-la23.04.20134-30-42pm.jpg	3	1722
1656	foto-trasera-tr23.04.20134-30-42pm.jpg	4	1722
1657	foto-frontal-fr23.04.20134-35-18pm.jpg	2	1723
1658	foto-lateral-la23.04.20134-35-18pm.jpg	3	1723
1659	foto-trasera-tr23.04.20134-35-18pm.jpg	4	1723
1660	foto-frontal-fr23.04.20134-38-22pm.jpg	2	1724
1661	foto-lateral-la23.04.20134-38-22pm.jpg	3	1724
1662	foto-frontal-fr23.04.20134-42-01pm.jpg	2	1725
1663	foto-lateral-la23.04.20134-42-01pm.jpg	3	1725
1664	foto-trasera-tr23.04.20134-42-01pm.jpg	4	1725
1665	foto-frontal-fr23.04.20135-00-28pm.jpg	2	1727
1666	foto-lateral-la23.04.20135-00-28pm.jpg	3	1727
1667	foto-trasera-tr23.04.20135-00-28pm.jpg	4	1727
1669	foto-lateral-la24.04.201310-07-34am.jpg	3	1728
1670	foto-frontal-fr24.04.201310-19-48am.JPG	2	1730
1671	foto-lateral-la24.04.201310-19-48am.jpg	3	1730
1672	foto-trasera-tr24.04.201310-19-48am.JPG	4	1730
1673	foto-frontal-fr24.04.201310-45-11am.JPG	2	1732
1674	foto-lateral-la24.04.201310-45-11am.jpg	3	1732
1675	foto-trasera-tr24.04.201310-45-11am.JPG	4	1732
1676	foto-frontal-fr24.04.201311-04-57am.JPG	2	1735
1677	foto-lateral-la24.04.201311-04-57am.jpg	3	1735
1678	foto-trasera-tr24.04.201311-04-57am.jpg	4	1735
1679	foto-frontal-fr24.04.20131-38-15pm.jpg	2	1739
1680	foto-frontal-fr24.04.20131-51-47pm.jpg	2	1741
1681	foto-lateral-la24.04.20131-51-47pm.jpg	3	1741
1682	foto-trasera-tr24.04.20131-51-47pm.jpg	4	1741
1683	foto-frontal-fr24.04.20131-55-10pm.jpg	2	1742
1684	foto-lateral-la24.04.20131-55-10pm.jpg	3	1742
1685	foto-trasera-tr24.04.20131-55-10pm.jpg	4	1742
1686	foto-frontal-fr24.04.20132-58-26pm.jpg	2	1743
1687	foto-lateral-la24.04.20132-58-26pm.jpg	3	1743
1688	foto-trasera-tr24.04.20132-58-26pm.jpg	4	1743
1689	foto-frontal-fr25.04.20138-58-40am.jpg	2	1744
1690	foto-lateral-la25.04.20138-58-40am.jpg	3	1744
1691	foto-trasera-tr25.04.20138-58-40am.jpg	4	1744
1692	foto-frontal-fr25.04.20139-04-49am.jpg	2	1745
1693	foto-lateral-la25.04.20139-04-49am.jpg	3	1745
1694	foto-trasera-tr25.04.20139-04-49am.jpg	4	1745
1695	foto-frontal-FR25.04.20139-09-06am.jpg	2	1746
1696	foto-lateral-LA25.04.20139-09-06am.jpg	3	1746
1697	foto-trasera-TR25.04.20139-09-06am.jpg	4	1746
1698	foto-frontal-fr25.04.20139-44-56am.jpg	2	1747
1699	foto-lateral-la25.04.20139-44-56am.jpg	3	1747
1700	foto-trasera-tr25.04.20139-44-56am.jpg	4	1747
1701	foto-frontal-fr25.04.201311-49-43am.jpg	2	1748
1702	foto-lateral-la25.04.201311-49-43am.jpg	3	1748
1703	foto-trasera-tr25.04.201311-49-43am.jpg	4	1748
1704	foto-frontal-fr25.04.20131-49-21pm.jpg	2	610
1705	foto-lateral-la25.04.20131-49-21pm.jpg	3	610
1706	foto-trasera-tr25.04.20131-49-21pm.jpg	4	610
1707	foto-frontal-fr25.04.20133-03-52pm.jpg	2	1752
1708	foto-lateral-la25.04.20133-03-52pm.jpg	3	1752
1709	foto-trasera-tr25.04.20133-03-52pm.jpg	4	1752
1710	foto-frontal-fr25.04.20133-10-01pm.jpg	2	1753
1711	foto-lateral-la25.04.20133-10-01pm.jpg	3	1753
1712	foto-frontal-fr25.04.20133-40-42pm.jpg	2	166
1713	foto-lateral-la25.04.20133-40-42pm.jpg	3	166
1714	foto-trasera-tr25.04.20133-40-42pm.jpg	4	166
1715	foto-frontal-FR25.04.20133-45-12pm.jpg	2	1754
1716	foto-lateral-LA25.04.20133-45-12pm.jpg	3	1754
1717	foto-trasera-TR25.04.20133-45-12pm.jpg	4	1754
1718	foto-frontal-FR25.04.20133-49-45pm.jpg	2	1755
1719	foto-lateral-LA25.04.20133-49-45pm.jpg	3	1755
1720	foto-trasera-TR25.04.20133-49-45pm.jpg	4	1755
1721	foto-frontal-fr25.04.20134-13-36pm.jpg	2	1756
1722	foto-lateral-la25.04.20134-13-36pm.jpg	3	1756
1723	foto-trasera-tr25.04.20134-13-36pm.jpg	4	1756
1724	foto-frontal-fr25.04.20134-34-16pm.jpg	2	1757
1725	foto-lateral-la25.04.20134-34-16pm.jpg	3	1757
1726	foto-trasera-tr25.04.20134-34-16pm.jpg	4	1757
1727	foto-frontal-fr25.04.20134-38-14pm.jpg	2	1758
1728	foto-lateral-la25.04.20134-38-14pm.jpg	3	1758
1729	foto-trasera-tr25.04.20134-38-14pm.jpg	4	1758
1730	foto-frontal-fr25.04.20135-05-45pm.jpg	2	1759
1731	foto-lateral-la25.04.20135-05-45pm.jpg	3	1759
1732	foto-trasera-tr25.04.20135-05-45pm.jpg	4	1759
1733	foto-frontal-FR25.04.20135-34-50pm.jpg	2	1760
1734	foto-lateral-LA25.04.20135-34-50pm.jpg	3	1760
1735	foto-trasera-TR25.04.20135-34-50pm.jpg	4	1760
1736	foto-frontal-FR25.04.20135-46-43pm.jpg	2	1761
1737	foto-lateral-LA25.04.20135-46-43pm.jpg	3	1761
1738	foto-trasera-TR25.04.20135-46-43pm.jpg	4	1761
1739	foto-frontal-FR25.04.20135-53-22pm.jpg	2	1762
1740	foto-lateral-LA25.04.20135-53-22pm.jpg	3	1762
1741	foto-trasera-TR25.04.20135-53-22pm.jpg	4	1762
1742	foto-frontal-FR25.04.20135-57-11pm.jpg	2	1763
1743	foto-lateral-LA25.04.20135-57-11pm.jpg	3	1763
1744	foto-trasera-TR25.04.20135-57-11pm.jpg	4	1763
1745	foto-frontal-FR25.04.20136-00-30pm.jpg	2	1764
1746	foto-lateral-LA25.04.20136-00-30pm.jpg	3	1764
1747	foto-trasera-TR25.04.20136-00-30pm.jpg	4	1764
1748	foto-frontal-FR25.04.20136-04-06pm.jpg	2	1765
1749	foto-lateral-LA25.04.20136-04-06pm.jpg	3	1765
1750	foto-frontal-FR25.04.20136-09-54pm.jpg	2	1766
1751	foto-lateral-LA25.04.20136-09-54pm.jpg	3	1766
1752	foto-trasera-TR25.04.20136-09-54pm.jpg	4	1766
1753	foto-frontal-FR25.04.20136-18-42pm.jpg	2	1767
1754	foto-lateral-LA25.04.20136-18-42pm.jpg	3	1767
1755	foto-frontal-fr25.04.20136-27-54pm.jpg	2	1768
1756	foto-lateral-la25.04.20136-27-54pm.jpg	3	1768
1757	foto-trasera-tr25.04.20136-27-54pm.jpg	4	1768
1758	foto-frontal-fr25.04.20136-30-59pm.jpg	2	1769
1759	foto-lateral-la25.04.20136-30-59pm.jpg	3	1769
1760	foto-trasera-tr25.04.20136-30-59pm.jpg	4	1769
1761	foto-frontal-fr25.04.20136-33-07pm.jpg	2	1770
1762	foto-lateral-la25.04.20136-33-07pm.jpg	3	1770
1763	foto-trasera-tr25.04.20136-33-07pm.jpg	4	1770
1764	foto-frontal-fr25.04.20136-35-25pm.jpg	2	1771
1765	foto-lateral-la25.04.20136-35-25pm.jpg	3	1771
1766	foto-frontal-fr25.04.20136-38-39pm.jpg	2	1772
1767	foto-lateral-la25.04.20136-38-39pm.jpg	3	1772
1768	foto-trasera-tr25.04.20136-38-39pm.jpg	4	1772
1769	foto-frontal-fr25.04.20136-41-20pm.jpg	2	1773
1770	foto-lateral-la25.04.20136-41-20pm.jpg	3	1773
1771	foto-trasera-tr25.04.20136-41-20pm.jpg	4	1773
1772	foto-frontal-fr25.04.20136-43-25pm.jpg	2	1774
1773	foto-lateral-la25.04.20136-43-25pm.jpg	3	1774
1774	foto-trasera-tr25.04.20136-43-25pm.jpg	4	1774
1775	foto-frontal-fr29.04.201311-18-58am.jpg	2	1783
1776	foto-lateral-la29.04.201311-18-58am.jpg	3	1783
1777	foto-trasera-tr29.04.201311-18-58am.jpg	4	1783
1778	foto-frontal-fr29.04.201311-27-08am.jpg	2	8
1779	foto-lateral-la29.04.201311-27-08am.jpg	3	8
1780	foto-trasera-tr29.04.201311-27-08am.jpg	4	8
1781	foto-frontal-fr29.04.201311-40-16am.jpg	2	1784
1782	foto-lateral-la29.04.201311-40-16am.jpg	3	1784
1783	foto-frontal-fr29.04.201311-46-06am.jpg	2	1785
1784	foto-lateral-la29.04.201311-46-06am.jpg	3	1785
1785	foto-trasera-tr29.04.201311-46-06am.jpg	4	1785
1786	foto-frontal-FR29.04.20136-25-34pm.jpg	2	1787
1787	foto-lateral-LA29.04.20136-25-34pm.jpg	3	1787
1788	foto-trasera-TR29.04.20136-25-34pm.jpg	4	1787
1789	foto-frontal-FR29.04.20136-54-30pm.jpg	2	1788
1790	foto-lateral-LA29.04.20136-54-30pm.jpg	3	1788
1791	foto-trasera-TR29.04.20136-54-30pm.jpg	4	1788
1792	foto-frontal-FR29.04.20136-57-47pm.jpg	2	1789
1793	foto-lateral-LA29.04.20136-57-47pm.jpg	3	1789
1794	foto-frontal-FR29.04.20137-02-42pm.jpg	2	1790
1795	foto-lateral-LA29.04.20137-02-42pm.jpg	3	1790
1796	foto-trasera-TR29.04.20137-02-42pm.jpg	4	1790
1797	foto-frontal-fr30.04.20131-11-56pm.jpg	2	882
1798	foto-lateral-la30.04.20131-11-56pm.jpg	3	882
1799	foto-trasera-tr30.04.20131-11-56pm.jpg	4	882
1800	foto-frontal-fr30.04.20132-16-50pm.jpg	2	1796
1801	foto-lateral-la30.04.20132-16-50pm.jpg	3	1796
1802	foto-trasera-tr30.04.20132-16-50pm.jpg	4	1796
1803	foto-frontal-fr30.04.20132-20-12pm.jpg	2	1797
1804	foto-lateral-la30.04.20132-20-12pm.jpg	3	1797
1805	foto-trasera-tr30.04.20132-20-12pm.jpg	4	1797
1806	foto-frontal-FR30.04.20135-12-41pm.jpg	2	1799
1807	foto-lateral-LA30.04.20135-12-41pm.jpg	3	1799
1808	foto-trasera-TR30.04.20135-12-41pm.jpg	4	1799
1809	foto-frontal-FR30.04.20135-16-58pm.jpg	2	1800
1810	foto-lateral-LA30.04.20135-16-58pm.jpg	3	1800
1811	foto-frontal-FR30.04.20135-19-55pm.jpg	2	1801
1812	foto-lateral-LA30.04.20135-19-55pm.jpg	3	1801
1813	foto-frontal-FR30.04.20135-30-48pm.jpg	2	52
1814	foto-lateral-LA30.04.20135-30-48pm.jpg	3	52
1815	foto-trasera-TR30.04.20135-30-48pm.jpg	4	52
1816	foto-frontal-FR30.04.20135-33-01pm.jpg	2	53
1817	foto-lateral-LA30.04.20135-33-01pm.jpg	3	53
1818	foto-trasera-TR30.04.20135-33-01pm.jpg	4	53
1819	foto-frontal-fr30.04.20135-37-34pm.jpg	2	1802
1820	foto-lateral-la30.04.20135-37-34pm.jpg	3	1802
1821	foto-frontal-fr30.04.20135-40-27pm.jpg	2	1803
1822	foto-lateral-la30.04.20135-40-27pm.jpg	3	1803
1823	foto-trasera-tr30.04.20135-40-27pm.jpg	4	1803
1824	foto-frontal-fr30.04.20135-55-48pm.jpg	2	1804
1825	foto-lateral-la30.04.20135-55-48pm.jpg	3	1804
1826	foto-frontal-fr30.04.20135-58-02pm.jpg	2	1805
1827	foto-lateral-la30.04.20135-58-02pm.jpg	3	1805
1828	foto-frontal-fr02.05.201310-53-12am.jpg	2	1811
1829	foto-frontal-fr02.05.201312-21-31pm.jpg	2	147
1830	foto-frontal-fr02.05.201312-40-22pm.jpg	2	1817
1831	foto-frontal-fr02.05.201312-50-33pm.jpg	2	1818
1832	foto-lateral-la02.05.201312-50-33pm.jpg	3	1818
1833	foto-trasera-tr02.05.201312-50-33pm.jpg	4	1818
1834	foto-frontal-fr02.05.20132-19-47pm.jpg	2	1821
1836	foto-trasera-tr02.05.20132-19-47pm.jpg	4	1821
1837	foto-frontal-fr02.05.20134-47-21pm.jpg	2	1826
1838	foto-lateral-la02.05.20134-47-21pm.jpg	3	1826
1839	foto-trasera-tr02.05.20134-47-21pm.jpg	4	1826
1840	foto-frontal-fr02.05.20135-27-12pm.jpg	2	1827
1841	foto-lateral-la02.05.20135-27-12pm.jpg	3	1827
1842	foto-trasera-tr02.05.20135-27-12pm.jpg	4	1827
1843	foto-frontal-fr02.05.20135-51-31pm.jpg	2	1828
1844	foto-lateral-la02.05.20135-51-31pm.jpg	3	1828
1845	foto-trasera-tr02.05.20135-51-31pm.jpg	4	1828
1846	foto-frontal-fr02.05.20135-54-06pm.jpg	2	1829
1847	foto-lateral-la02.05.20135-54-06pm.jpg	3	1829
1848	foto-trasera-tr02.05.20135-54-06pm.jpg	4	1829
1849	foto-frontal-fr02.05.20136-27-22pm.jpg	2	1830
1850	foto-lateral-la02.05.20136-27-22pm.jpg	3	1830
1851	foto-frontal-fr02.05.20136-30-01pm.jpg	2	1831
1852	foto-lateral-la02.05.20136-30-01pm.jpg	3	1831
1853	foto-trasera-tr02.05.20136-30-01pm.jpg	4	1831
1854	foto-frontal-fr03.05.201310-35-00am.jpg	2	1834
1855	foto-lateral-la03.05.201310-35-00am.jpg	3	1834
1856	foto-trasera-tr03.05.201310-35-00am.jpg	4	1834
1857	foto-frontal-FR03.05.201310-39-57am.jpg	2	1835
1858	foto-lateral-LA03.05.201310-39-57am.jpg	3	1835
1859	foto-trasera-TR03.05.201310-39-57am.jpg	4	1835
1860	foto-frontal-FR03.05.201312-35-38pm.jpg	2	1836
1861	foto-lateral-LA03.05.201312-35-38pm.jpg	3	1836
1862	foto-trasera-TR03.05.201312-35-38pm.jpg	4	1836
1863	foto-frontal-FR03.05.20131-16-58pm.jpg	2	1837
1864	foto-lateral-LA03.05.20131-16-58pm.jpg	3	1837
1865	foto-trasera-TR03.05.20131-16-58pm.jpg	4	1837
1866	foto-frontal-fr03.05.20131-48-28pm.jpg	2	1838
1867	foto-lateral-la03.05.20131-48-28pm.jpg	3	1838
1868	foto-trasera-tr03.05.20131-48-28pm.jpg	4	1838
1869	foto-frontal-fr03.05.20132-11-23pm.jpg	2	1839
1870	foto-lateral-la03.05.20132-11-23pm.jpg	3	1839
1871	foto-trasera-tr03.05.20132-11-23pm.jpg	4	1839
1872	foto-frontal-fr03.05.20132-21-40pm.jpg	2	1840
1873	foto-lateral-la03.05.20132-21-40pm.jpg	3	1840
1874	foto-trasera-tr03.05.20132-21-40pm.jpg	4	1840
1875	foto-frontal-fr03.05.20132-25-55pm.jpg	2	1841
1876	foto-lateral-la03.05.20132-25-55pm.jpg	3	1841
1877	foto-trasera-tr03.05.20132-25-55pm.jpg	4	1841
1878	foto-frontal-fr03.05.20132-31-42pm.jpg	2	1842
1879	foto-lateral-la03.05.20132-31-42pm.jpg	3	1842
1880	foto-trasera-tr03.05.20132-31-42pm.jpg	4	1842
1884	foto-frontal-fr03.05.20134-46-00pm.jpg	2	1844
1885	foto-lateral-la03.05.20134-46-00pm.jpg	3	1844
1886	foto-trasera-tr03.05.20134-46-00pm.jpg	4	1844
1887	foto-frontal-fr03.05.20134-49-15pm.jpg	2	1843
1888	foto-lateral-la03.05.20134-49-15pm.jpg	3	1843
1889	foto-trasera-tr03.05.20134-49-15pm.jpg	4	1843
1890	foto-frontal-fr03.05.20134-55-04pm.jpg	2	1845
1891	foto-lateral-la03.05.20134-55-04pm.jpg	3	1845
1892	foto-trasera-tr03.05.20134-55-04pm.jpg	4	1845
1893	foto-frontal-fr03.05.20134-58-13pm.jpg	2	1846
1894	foto-lateral-la03.05.20134-58-13pm.jpg	3	1846
1895	foto-trasera-tr03.05.20134-58-13pm.jpg	4	1846
1896	foto-frontal-fr03.05.20135-00-53pm.jpg	2	1847
1897	foto-lateral-la03.05.20135-00-53pm.jpg	3	1847
1898	foto-trasera-tr03.05.20135-00-53pm.jpg	4	1847
1899	foto-frontal-fr06.05.20139-14-48am.jpg	2	1848
1900	foto-lateral-la06.05.20139-14-48am.jpg	3	1848
1901	foto-trasera-tr06.05.20139-14-48am.jpg	4	1848
1902	foto-frontal-fr06.05.20139-21-22am.jpg	2	1849
1903	foto-lateral-la06.05.20139-21-22am.jpg	3	1849
1904	foto-trasera-tr06.05.20139-21-22am.jpg	4	1849
1905	foto-frontal-fr06.05.20139-24-51am.jpg	2	1850
1906	foto-lateral-la06.05.20139-24-51am.jpg	3	1850
1907	foto-trasera-tr06.05.20139-24-51am.jpg	4	1850
1908	foto-frontal-fr06.05.20139-54-01am.jpg	2	1851
1909	foto-lateral-la06.05.20139-54-01am.jpg	3	1851
1910	foto-trasera-tr06.05.20139-54-01am.jpg	4	1851
1911	foto-frontal-fr06.05.20139-57-15am.jpg	2	1852
1912	foto-lateral-la06.05.20139-57-15am.jpg	3	1852
1913	foto-trasera-tr06.05.20139-57-15am.jpg	4	1852
1914	foto-frontal-fr06.05.201310-02-57am.jpg	2	1853
1915	foto-lateral-la06.05.201310-02-57am.jpg	3	1853
1916	foto-trasera-tr06.05.201310-02-57am.jpg	4	1853
1917	foto-frontal-fr06.05.201310-06-07am.jpg	2	1854
1918	foto-lateral-la06.05.201310-06-07am.jpg	3	1854
1919	foto-trasera-tr06.05.201310-06-07am.jpg	4	1854
\.


--
-- Data for Name: vehiculo_informacion_general; Type: TABLE DATA; Schema: public; Owner: carlos
--

COPY vehiculo_informacion_general (vehiculo_informacion_general_id, categoria_id, vehiculo_id, modelo_id) FROM stdin;
167	81	5	\N
168	98	5	\N
169	15	5	\N
170	122	5	\N
171	110	5	\N
172	63	5	\N
173	42	5	\N
174	\N	5	11
175	81	6	\N
176	101	6	\N
177	15	6	\N
178	122	6	\N
179	110	6	\N
180	63	6	\N
181	42	6	\N
182	\N	6	11
183	81	7	\N
184	99	7	\N
185	15	7	\N
186	122	7	\N
187	110	7	\N
188	27	7	\N
189	63	7	\N
190	42	7	\N
191	\N	7	12
209	\N	9	14
250	81	15	\N
251	101	15	\N
252	126	15	\N
253	85	15	\N
65	100	7	\N
254	110	15	\N
255	27	15	\N
256	63	15	\N
257	42	15	\N
258	45	15	\N
218	81	10	\N
259	123	15	\N
260	\N	15	17
265	110	16	\N
269	\N	16	17
279	81	16	\N
280	90	16	\N
281	126	16	\N
282	85	16	\N
283	128	16	\N
284	27	16	\N
285	63	16	\N
286	42	16	\N
287	\N	16	19
261	81	2	\N
262	90	2	\N
263	15	2	\N
264	122	2	\N
266	27	2	\N
267	42	2	\N
268	45	2	\N
219	101	10	\N
220	127	10	\N
221	79	10	\N
222	110	10	\N
223	63	10	\N
224	42	10	\N
225	\N	10	18
210	81	11	\N
211	95	11	\N
212	15	11	\N
213	122	11	\N
214	110	11	\N
215	63	11	\N
216	42	11	\N
217	\N	11	12
145	81	3	\N
146	91	3	\N
147	15	3	\N
148	122	3	\N
149	110	3	\N
150	27	3	\N
151	63	3	\N
152	42	3	\N
153	45	3	\N
154	123	3	\N
155	\N	3	10
156	81	4	\N
157	92	4	\N
158	15	4	\N
159	122	4	\N
160	112	4	\N
161	27	4	\N
162	63	4	\N
163	42	4	\N
164	45	4	\N
165	120	4	\N
166	\N	4	9
304	\N	18	19
305	81	18	\N
306	90	18	\N
307	126	18	\N
308	85	18	\N
309	110	18	\N
310	63	18	\N
311	42	18	\N
312	\N	18	20
321	81	13	\N
322	15	13	\N
323	122	13	\N
324	110	13	\N
325	42	13	\N
326	\N	13	15
327	81	20	\N
328	90	20	\N
329	126	20	\N
330	110	20	\N
331	27	20	\N
332	63	20	\N
333	42	20	\N
334	45	20	\N
335	\N	20	17
336	81	22	\N
337	56	22	\N
338	126	22	\N
339	110	22	\N
340	27	22	\N
341	63	22	\N
342	42	22	\N
343	45	22	\N
344	\N	22	20
345	81	23	\N
346	83	23	\N
347	15	23	\N
348	110	23	\N
349	27	23	\N
350	63	23	\N
351	42	23	\N
352	45	23	\N
353	\N	23	21
362	\N	24	21
363	81	24	\N
364	83	24	\N
365	15	24	\N
366	110	24	\N
367	27	24	\N
368	63	24	\N
369	42	24	\N
370	45	24	\N
371	\N	24	22
381	\N	25	13
382	81	25	\N
383	90	25	\N
384	15	25	\N
385	110	25	\N
386	27	25	\N
387	63	25	\N
388	42	25	\N
389	45	25	\N
390	123	25	\N
391	\N	25	23
409	81	27	\N
410	83	27	\N
411	15	27	\N
412	110	27	\N
413	27	27	\N
414	63	27	\N
415	42	27	\N
416	45	27	\N
417	\N	27	21
426	81	28	\N
427	91	28	\N
428	126	28	\N
429	110	28	\N
430	27	28	\N
431	63	28	\N
432	42	28	\N
433	45	28	\N
434	\N	28	17
435	81	29	\N
436	91	29	\N
437	15	29	\N
438	110	29	\N
439	27	29	\N
440	63	29	\N
441	42	29	\N
442	45	29	\N
443	123	29	\N
444	\N	29	23
445	81	30	\N
446	56	30	\N
447	126	30	\N
448	110	30	\N
449	27	30	\N
450	63	30	\N
451	42	30	\N
452	45	30	\N
453	\N	30	17
454	81	31	\N
455	91	31	\N
456	15	31	\N
457	111	31	\N
458	27	31	\N
459	63	31	\N
460	42	31	\N
461	45	31	\N
462	\N	31	10
463	81	32	\N
464	90	32	\N
465	126	32	\N
466	110	32	\N
467	27	32	\N
468	63	32	\N
469	42	32	\N
470	45	32	\N
471	\N	32	17
472	81	33	\N
473	91	33	\N
474	15	33	\N
475	110	33	\N
476	27	33	\N
477	63	33	\N
478	42	33	\N
479	45	33	\N
480	\N	33	15
489	81	34	\N
490	91	34	\N
491	15	34	\N
492	110	34	\N
493	27	34	\N
494	63	34	\N
495	42	34	\N
496	45	34	\N
497	\N	34	25
498	81	35	\N
499	56	35	\N
500	15	35	\N
501	110	35	\N
502	27	35	\N
503	63	35	\N
504	42	35	\N
505	45	35	\N
506	\N	35	23
507	81	36	\N
508	91	36	\N
509	15	36	\N
510	110	36	\N
511	27	36	\N
512	63	36	\N
513	42	36	\N
514	45	36	\N
515	\N	36	10
516	81	37	\N
517	91	37	\N
518	15	37	\N
519	110	37	\N
520	27	37	\N
521	63	37	\N
522	42	37	\N
523	45	37	\N
524	\N	37	23
525	81	38	\N
526	83	38	\N
527	15	38	\N
528	110	38	\N
529	27	38	\N
530	63	38	\N
531	42	38	\N
532	45	38	\N
533	\N	38	21
534	81	39	\N
535	56	39	\N
536	126	39	\N
537	110	39	\N
538	27	39	\N
539	63	39	\N
540	42	39	\N
541	45	39	\N
542	\N	39	17
543	81	40	\N
544	56	40	\N
545	126	40	\N
546	110	40	\N
547	27	40	\N
548	63	40	\N
549	42	40	\N
550	45	40	\N
551	\N	40	17
560	81	41	\N
561	56	41	\N
562	15	41	\N
563	110	41	\N
564	27	41	\N
565	63	41	\N
566	42	41	\N
567	\N	41	21
568	81	42	\N
569	56	42	\N
570	126	42	\N
571	110	42	\N
572	27	42	\N
573	63	42	\N
574	42	42	\N
575	45	42	\N
576	\N	42	17
577	81	43	\N
578	56	43	\N
579	126	43	\N
580	110	43	\N
581	27	43	\N
582	63	43	\N
583	42	43	\N
584	45	43	\N
585	\N	43	17
593	\N	44	3
594	81	44	\N
595	102	44	\N
596	15	44	\N
597	110	44	\N
598	27	44	\N
599	63	44	\N
600	42	44	\N
601	\N	44	26
602	81	45	\N
603	91	45	\N
604	126	45	\N
605	110	45	\N
606	27	45	\N
607	63	45	\N
608	42	45	\N
609	45	45	\N
610	\N	45	17
611	81	46	\N
612	90	46	\N
613	126	46	\N
614	110	46	\N
615	27	46	\N
616	63	46	\N
617	42	46	\N
618	45	46	\N
619	123	46	\N
620	\N	46	17
621	81	47	\N
622	91	47	\N
623	15	47	\N
624	110	47	\N
625	27	47	\N
626	63	47	\N
627	42	47	\N
628	45	47	\N
629	\N	47	23
630	81	48	\N
631	83	48	\N
632	15	48	\N
633	110	48	\N
634	27	48	\N
635	63	48	\N
636	42	48	\N
637	45	48	\N
638	\N	48	21
639	81	49	\N
640	90	49	\N
641	15	49	\N
642	110	49	\N
643	27	49	\N
644	63	49	\N
645	42	49	\N
646	45	49	\N
647	123	49	\N
648	\N	49	13
649	81	50	\N
650	83	50	\N
651	15	50	\N
652	110	50	\N
653	27	50	\N
654	63	50	\N
655	42	50	\N
656	45	50	\N
657	123	50	\N
658	\N	50	21
659	81	51	\N
660	91	51	\N
661	126	51	\N
662	110	51	\N
663	27	51	\N
664	42	51	\N
665	45	51	\N
666	\N	51	17
677	91	53	\N
686	81	54	\N
687	91	54	\N
688	15	54	\N
689	110	54	\N
690	27	54	\N
691	63	54	\N
692	42	54	\N
693	45	54	\N
694	123	54	\N
695	\N	54	10
714	81	56	\N
715	83	56	\N
716	15	56	\N
717	110	56	\N
718	27	56	\N
719	63	56	\N
720	42	56	\N
721	45	56	\N
722	123	56	\N
723	\N	56	21
724	81	57	\N
725	91	57	\N
726	126	57	\N
727	110	57	\N
728	27	57	\N
729	63	57	\N
730	42	57	\N
731	45	57	\N
732	123	57	\N
733	\N	57	17
744	81	59	\N
745	56	59	\N
746	15	59	\N
747	110	59	\N
748	27	59	\N
749	63	59	\N
750	42	59	\N
751	45	59	\N
752	\N	59	13
753	81	60	\N
754	90	60	\N
755	15	60	\N
756	110	60	\N
757	27	60	\N
758	63	60	\N
759	42	60	\N
760	45	60	\N
761	\N	60	10
762	81	61	\N
763	91	61	\N
764	15	61	\N
765	110	61	\N
766	27	61	\N
767	63	61	\N
768	42	61	\N
769	45	61	\N
770	\N	61	23
771	81	62	\N
772	95	62	\N
773	15	62	\N
774	110	62	\N
775	27	62	\N
776	63	62	\N
777	42	62	\N
778	\N	62	27
779	81	63	\N
780	91	63	\N
781	126	63	\N
782	110	63	\N
783	27	63	\N
784	63	63	\N
785	42	63	\N
786	45	63	\N
787	\N	63	17
788	81	64	\N
789	83	64	\N
790	15	64	\N
791	110	64	\N
792	27	64	\N
793	63	64	\N
794	42	64	\N
795	45	64	\N
796	123	64	\N
797	\N	64	22
807	81	66	\N
808	91	66	\N
809	15	66	\N
810	110	66	\N
811	27	66	\N
812	63	66	\N
813	42	66	\N
814	45	66	\N
815	123	66	\N
816	\N	66	23
817	81	67	\N
818	56	67	\N
819	15	67	\N
820	110	67	\N
821	27	67	\N
822	63	67	\N
823	42	67	\N
824	45	67	\N
825	123	67	\N
826	\N	67	13
827	81	68	\N
828	90	68	\N
829	15	68	\N
830	110	68	\N
831	27	68	\N
832	63	68	\N
833	42	68	\N
834	45	68	\N
835	123	68	\N
836	\N	68	10
837	81	69	\N
838	90	69	\N
839	126	69	\N
840	110	69	\N
841	27	69	\N
842	63	69	\N
843	42	69	\N
844	45	69	\N
845	123	69	\N
846	\N	69	17
847	81	70	\N
848	56	70	\N
849	15	70	\N
850	110	70	\N
851	27	70	\N
852	63	70	\N
853	42	70	\N
854	45	70	\N
855	123	70	\N
856	\N	70	13
857	81	71	\N
858	103	71	\N
859	15	71	\N
860	107	71	\N
861	27	71	\N
862	63	71	\N
863	42	71	\N
864	\N	71	13
865	81	72	\N
866	91	72	\N
867	126	72	\N
868	110	72	\N
869	27	72	\N
870	63	72	\N
871	42	72	\N
872	45	72	\N
873	\N	72	17
894	81	73	\N
895	91	73	\N
896	15	73	\N
897	60	73	\N
898	27	73	\N
899	63	73	\N
900	42	73	\N
901	45	73	\N
902	123	73	\N
903	\N	73	10
914	81	75	\N
915	91	75	\N
916	126	75	\N
917	110	75	\N
918	27	75	\N
919	63	75	\N
920	42	75	\N
921	45	75	\N
922	\N	75	17
923	81	76	\N
924	91	76	\N
925	126	76	\N
926	110	76	\N
927	27	76	\N
928	63	76	\N
929	42	76	\N
930	45	76	\N
931	\N	76	17
932	81	77	\N
933	91	77	\N
934	15	77	\N
935	110	77	\N
936	27	77	\N
937	63	77	\N
938	42	77	\N
939	45	77	\N
940	\N	77	13
949	123	78	\N
961	81	80	\N
962	91	80	\N
963	126	80	\N
964	110	80	\N
965	27	80	\N
966	63	80	\N
967	42	80	\N
968	45	80	\N
969	123	80	\N
970	\N	80	17
971	81	81	\N
972	83	81	\N
973	15	81	\N
974	110	81	\N
975	27	81	\N
976	63	81	\N
977	42	81	\N
978	45	81	\N
979	123	81	\N
980	\N	81	21
981	81	82	\N
982	90	82	\N
983	126	82	\N
984	110	82	\N
985	27	82	\N
986	63	82	\N
987	42	82	\N
988	45	82	\N
989	\N	82	17
990	81	83	\N
991	90	83	\N
992	126	83	\N
993	110	83	\N
994	27	83	\N
995	63	83	\N
996	42	83	\N
997	45	83	\N
998	\N	83	17
999	81	84	\N
1000	91	84	\N
1001	126	84	\N
1002	110	84	\N
1003	27	84	\N
1004	63	84	\N
1005	42	84	\N
1006	45	84	\N
1007	\N	84	17
1008	81	85	\N
1009	90	85	\N
1010	126	85	\N
1011	110	85	\N
1012	27	85	\N
1013	63	85	\N
1014	42	85	\N
1015	45	85	\N
1016	\N	85	17
1017	81	86	\N
1018	83	86	\N
1019	15	86	\N
1020	110	86	\N
1021	27	86	\N
1022	63	86	\N
1023	42	86	\N
1024	45	86	\N
1025	123	86	\N
1026	\N	86	21
1027	81	88	\N
1028	90	88	\N
1029	126	88	\N
1030	110	88	\N
1031	27	88	\N
1032	63	88	\N
1033	42	88	\N
1034	45	88	\N
1035	\N	88	17
1036	81	89	\N
1037	83	89	\N
1038	15	89	\N
1039	110	89	\N
1040	27	89	\N
1041	63	89	\N
1042	42	89	\N
1043	45	89	\N
1044	123	89	\N
1045	\N	89	7
1046	81	90	\N
1047	56	90	\N
1048	15	90	\N
1049	110	90	\N
1050	27	90	\N
1051	63	90	\N
1052	42	90	\N
1053	45	90	\N
1054	\N	90	13
1072	81	93	\N
1073	91	93	\N
1074	15	93	\N
1075	110	93	\N
1076	27	93	\N
1077	63	93	\N
1078	42	93	\N
1079	45	93	\N
1080	\N	93	10
1081	81	94	\N
1082	83	94	\N
1083	15	94	\N
1084	110	94	\N
1085	27	94	\N
1086	63	94	\N
1087	42	94	\N
1088	45	94	\N
1089	123	94	\N
1090	\N	94	22
1091	81	95	\N
1092	56	95	\N
1093	126	95	\N
1094	110	95	\N
1095	27	95	\N
1096	63	95	\N
1097	42	95	\N
1098	45	95	\N
1099	\N	95	17
1100	81	96	\N
1101	90	96	\N
1102	15	96	\N
1103	110	96	\N
1104	27	96	\N
1105	63	96	\N
1106	42	96	\N
1107	45	96	\N
1108	123	96	\N
1109	\N	96	11
1110	81	97	\N
1111	91	97	\N
1112	15	97	\N
1113	110	97	\N
1114	27	97	\N
1115	63	97	\N
1116	42	97	\N
1117	45	97	\N
1118	\N	97	10
1119	81	98	\N
1120	91	98	\N
1121	126	98	\N
1122	110	98	\N
1123	27	98	\N
1124	63	98	\N
1125	42	98	\N
1126	45	98	\N
1127	\N	98	17
1135	81	99	\N
1136	83	99	\N
1137	15	99	\N
1138	60	99	\N
1139	117	99	\N
1140	63	99	\N
1141	42	99	\N
1142	45	99	\N
1143	130	99	\N
1144	\N	99	28
1145	81	100	\N
1146	90	100	\N
1147	126	100	\N
1148	110	100	\N
1149	27	100	\N
1150	63	100	\N
1151	42	100	\N
1152	45	100	\N
1153	123	100	\N
1154	\N	100	17
1155	81	101	\N
1156	56	101	\N
1157	126	101	\N
1158	110	101	\N
1159	27	101	\N
1160	63	101	\N
1161	42	101	\N
1162	45	101	\N
1163	\N	101	17
1164	81	102	\N
1165	56	102	\N
1166	15	102	\N
1167	110	102	\N
1168	27	102	\N
1169	63	102	\N
1170	42	102	\N
1171	45	102	\N
1172	123	102	\N
1173	\N	102	11
1174	81	103	\N
1175	95	103	\N
1176	126	103	\N
1177	110	103	\N
1178	27	103	\N
1179	63	103	\N
1180	42	103	\N
1181	\N	103	17
1182	81	104	\N
1183	83	104	\N
1184	15	104	\N
1185	110	104	\N
1186	27	104	\N
1187	63	104	\N
1188	42	104	\N
1189	45	104	\N
1190	123	104	\N
1191	\N	104	21
1192	81	105	\N
1193	56	105	\N
1194	15	105	\N
1195	110	105	\N
1196	27	105	\N
1197	63	105	\N
1198	42	105	\N
1199	45	105	\N
1200	123	105	\N
1201	\N	105	13
1202	81	106	\N
1203	83	106	\N
1204	15	106	\N
1205	110	106	\N
1206	27	106	\N
1207	63	106	\N
1208	42	106	\N
1209	45	106	\N
1210	123	106	\N
1211	\N	106	21
1212	81	107	\N
1213	91	107	\N
1214	126	107	\N
1215	110	107	\N
1216	27	107	\N
1217	63	107	\N
1218	42	107	\N
1219	45	107	\N
1220	\N	107	17
1221	81	108	\N
1222	56	108	\N
1223	126	108	\N
1224	110	108	\N
1225	27	108	\N
1226	63	108	\N
1227	42	108	\N
1228	\N	108	17
1229	81	109	\N
1230	91	109	\N
1231	126	109	\N
1232	110	109	\N
1233	27	109	\N
1234	63	109	\N
1235	42	109	\N
1236	45	109	\N
1237	\N	109	20
1238	81	110	\N
1239	91	110	\N
1240	15	110	\N
1241	110	110	\N
1242	27	110	\N
1243	63	110	\N
1244	42	110	\N
1245	45	110	\N
1246	123	110	\N
1247	\N	110	10
1248	81	111	\N
1249	101	111	\N
1250	15	111	\N
1251	110	111	\N
1252	27	111	\N
1253	63	111	\N
1254	42	111	\N
1255	\N	111	16
1256	81	112	\N
1257	98	112	\N
1258	15	112	\N
1259	110	112	\N
1260	27	112	\N
1261	63	112	\N
1262	42	112	\N
1263	45	112	\N
1264	123	112	\N
1265	\N	112	23
1266	81	113	\N
1267	100	113	\N
1268	15	113	\N
1269	110	113	\N
1270	27	113	\N
1271	63	113	\N
1272	42	113	\N
1273	\N	113	12
1274	81	114	\N
1275	91	114	\N
1276	126	114	\N
1277	110	114	\N
1278	27	114	\N
1279	63	114	\N
1280	42	114	\N
1281	45	114	\N
1282	123	114	\N
1283	\N	114	17
1284	81	115	\N
1285	91	115	\N
1286	126	115	\N
1287	110	115	\N
1288	27	115	\N
1289	63	115	\N
1290	42	115	\N
1291	45	115	\N
1292	123	115	\N
1293	\N	115	17
1304	81	117	\N
1305	101	117	\N
1306	15	117	\N
1307	110	117	\N
1308	27	117	\N
1309	63	117	\N
1310	42	117	\N
1311	\N	117	26
1312	81	118	\N
1313	90	118	\N
1314	15	118	\N
1315	110	118	\N
1316	27	118	\N
1317	63	118	\N
1318	42	118	\N
1319	45	118	\N
1320	123	118	\N
1321	\N	118	23
1322	81	119	\N
1323	91	119	\N
1324	126	119	\N
1325	110	119	\N
1326	27	119	\N
1327	63	119	\N
1328	42	119	\N
1329	45	119	\N
1330	\N	119	17
1331	81	120	\N
1332	91	120	\N
1333	15	120	\N
1334	110	120	\N
1335	27	120	\N
1336	63	120	\N
1337	42	120	\N
1338	45	120	\N
1339	123	120	\N
1340	\N	120	10
1341	81	121	\N
1342	56	121	\N
1343	15	121	\N
1344	110	121	\N
1345	27	121	\N
1346	63	121	\N
1347	42	121	\N
1348	45	121	\N
1349	123	121	\N
1350	\N	121	23
1351	81	122	\N
1352	56	122	\N
1353	15	122	\N
1354	110	122	\N
1355	27	122	\N
1356	63	122	\N
1357	42	122	\N
1358	45	122	\N
1359	\N	122	15
1360	81	123	\N
1361	90	123	\N
1362	15	123	\N
1363	110	123	\N
1364	27	123	\N
1365	63	123	\N
1366	42	123	\N
1367	45	123	\N
1368	123	123	\N
1369	\N	123	2
1370	81	124	\N
1371	56	124	\N
1372	15	124	\N
1373	110	124	\N
1374	27	124	\N
1375	63	124	\N
1376	42	124	\N
1377	45	124	\N
1378	123	124	\N
1379	\N	124	13
1380	81	125	\N
1381	91	125	\N
1382	126	125	\N
1383	110	125	\N
1384	27	125	\N
1385	63	125	\N
1386	42	125	\N
1387	45	125	\N
1388	\N	125	17
1389	81	126	\N
1390	92	126	\N
1391	15	126	\N
1392	110	126	\N
1393	27	126	\N
1394	63	126	\N
1395	42	126	\N
1396	45	126	\N
1397	123	126	\N
1398	\N	126	7
1399	81	127	\N
1400	56	127	\N
1401	15	127	\N
1402	110	127	\N
1403	27	127	\N
1404	63	127	\N
1405	42	127	\N
1406	45	127	\N
1407	123	127	\N
1408	\N	127	13
1409	81	128	\N
1410	91	128	\N
1411	126	128	\N
1412	110	128	\N
1413	27	128	\N
1414	63	128	\N
1415	42	128	\N
1416	45	128	\N
1417	\N	128	20
1418	81	129	\N
1419	91	129	\N
1420	126	129	\N
1421	110	129	\N
1422	27	129	\N
1423	63	129	\N
1424	42	129	\N
1425	45	129	\N
1426	\N	129	17
1427	81	130	\N
1428	91	130	\N
1429	15	130	\N
1430	110	130	\N
1431	27	130	\N
1432	63	130	\N
1433	42	130	\N
1434	45	130	\N
1435	123	130	\N
1436	\N	130	23
1437	81	131	\N
1438	91	131	\N
1439	126	131	\N
1440	110	131	\N
1441	27	131	\N
1442	63	131	\N
1443	42	131	\N
1444	45	131	\N
1445	\N	131	20
1465	81	134	\N
1466	101	134	\N
1467	15	134	\N
1468	110	134	\N
1469	27	134	\N
1470	63	134	\N
1471	42	134	\N
1472	45	134	\N
1473	123	134	\N
1474	\N	134	10
1475	81	135	\N
1476	56	135	\N
1477	15	135	\N
1478	110	135	\N
1479	27	135	\N
1480	63	135	\N
1481	42	135	\N
1482	45	135	\N
1483	\N	135	10
1485	98	136	\N
1504	81	138	\N
1505	56	138	\N
1506	15	138	\N
1507	110	138	\N
1508	27	138	\N
1509	63	138	\N
1510	42	138	\N
1511	45	138	\N
1512	123	138	\N
1513	\N	138	10
1514	81	137	\N
1515	91	137	\N
1516	15	137	\N
1517	110	137	\N
1518	27	137	\N
1519	63	137	\N
1520	42	137	\N
1521	45	137	\N
1522	123	137	\N
1523	\N	137	23
1524	81	139	\N
1525	91	139	\N
1526	15	139	\N
1527	110	139	\N
1528	27	139	\N
1529	63	139	\N
1530	42	139	\N
1531	45	139	\N
1532	123	139	\N
1533	\N	139	23
1541	45	136	\N
1542	123	136	\N
1544	81	140	\N
1545	91	140	\N
1546	15	140	\N
1547	110	140	\N
1548	27	140	\N
1549	63	140	\N
1550	42	140	\N
1551	45	140	\N
1552	123	140	\N
1553	\N	140	7
1562	81	136	\N
1563	95	136	\N
1564	15	136	\N
1565	110	136	\N
1566	27	136	\N
1567	63	136	\N
1568	42	136	\N
1569	\N	136	7
1570	81	141	\N
1571	56	141	\N
1572	15	141	\N
1573	110	141	\N
1574	27	141	\N
1575	63	141	\N
1576	42	141	\N
1577	45	141	\N
1578	123	141	\N
1579	\N	141	10
1580	81	142	\N
1581	91	142	\N
1582	126	142	\N
1583	110	142	\N
1584	27	142	\N
1585	63	142	\N
1586	42	142	\N
1587	45	142	\N
1588	\N	142	17
1589	81	143	\N
1590	91	143	\N
1591	15	143	\N
1592	110	143	\N
1593	27	143	\N
1594	63	143	\N
1595	42	143	\N
1596	45	143	\N
1597	68	143	\N
1598	\N	143	10
1599	81	144	\N
1600	56	144	\N
1601	126	144	\N
1602	110	144	\N
1603	27	144	\N
1604	63	144	\N
1605	42	144	\N
1606	45	144	\N
1607	\N	144	17
1608	81	145	\N
1609	83	145	\N
1610	15	145	\N
1611	110	145	\N
1612	27	145	\N
1613	63	145	\N
1614	42	145	\N
1615	45	145	\N
1616	123	145	\N
1617	\N	145	21
1618	81	146	\N
1619	90	146	\N
1620	126	146	\N
1621	110	146	\N
1622	27	146	\N
1623	63	146	\N
1624	42	146	\N
1625	45	146	\N
1626	123	146	\N
1627	\N	146	17
1638	81	148	\N
1639	56	148	\N
1640	126	148	\N
1641	110	148	\N
1642	27	148	\N
1643	63	148	\N
1644	42	148	\N
1645	45	148	\N
1646	\N	148	17
1665	81	149	\N
1666	91	149	\N
1667	126	149	\N
1668	110	149	\N
1669	27	149	\N
1670	63	149	\N
1671	42	149	\N
1672	45	149	\N
1673	\N	149	17
1674	81	150	\N
1675	56	150	\N
1676	15	150	\N
1677	110	150	\N
1678	27	150	\N
1679	63	150	\N
1680	42	150	\N
1681	45	150	\N
1682	123	150	\N
1683	\N	150	10
1684	81	151	\N
1685	56	151	\N
1686	126	151	\N
1687	110	151	\N
1688	27	151	\N
1689	63	151	\N
1690	42	151	\N
1691	45	151	\N
1692	123	151	\N
1693	\N	151	17
1694	81	152	\N
1695	101	152	\N
1696	15	152	\N
1697	110	152	\N
1698	27	152	\N
1699	63	152	\N
1700	42	152	\N
1701	\N	152	16
1702	81	153	\N
1703	91	153	\N
1704	15	153	\N
1705	110	153	\N
1706	27	153	\N
1707	63	153	\N
1708	42	153	\N
1709	45	153	\N
1710	123	153	\N
1711	\N	153	23
1712	81	154	\N
1713	56	154	\N
1714	15	154	\N
1715	110	154	\N
1716	27	154	\N
1717	63	154	\N
1718	42	154	\N
1719	45	154	\N
1720	\N	154	13
1721	81	155	\N
1722	90	155	\N
1723	15	155	\N
1724	110	155	\N
1725	27	155	\N
1726	63	155	\N
1727	42	155	\N
1728	45	155	\N
1729	123	155	\N
1730	\N	155	10
1731	81	156	\N
1732	91	156	\N
1733	126	156	\N
1734	110	156	\N
1735	27	156	\N
1736	63	156	\N
1737	42	156	\N
1738	45	156	\N
1739	123	156	\N
1740	\N	156	20
1741	81	157	\N
1742	91	157	\N
1743	126	157	\N
1744	110	157	\N
1745	27	157	\N
1746	63	157	\N
1747	42	157	\N
1748	45	157	\N
1749	123	157	\N
1750	\N	157	20
1751	81	158	\N
1752	91	158	\N
1753	126	158	\N
1754	110	158	\N
1755	27	158	\N
1756	63	158	\N
1757	42	158	\N
1758	\N	158	20
1759	81	159	\N
1760	83	159	\N
1761	15	159	\N
1762	110	159	\N
1763	27	159	\N
1764	63	159	\N
1765	42	159	\N
1766	45	159	\N
1767	123	159	\N
1768	\N	159	21
1769	81	160	\N
1770	56	160	\N
1771	15	160	\N
1772	110	160	\N
1773	27	160	\N
1774	63	160	\N
1775	42	160	\N
1776	45	160	\N
1777	123	160	\N
1778	\N	160	7
1788	81	162	\N
1789	91	162	\N
1790	15	162	\N
1791	110	162	\N
1792	27	162	\N
1793	63	162	\N
1794	42	162	\N
1795	45	162	\N
1796	123	162	\N
1797	\N	162	10
1798	81	163	\N
1799	90	163	\N
1800	126	163	\N
1801	110	163	\N
1802	27	163	\N
1803	63	163	\N
1804	42	163	\N
1805	45	163	\N
1806	\N	163	17
1807	81	164	\N
1808	83	164	\N
1809	15	164	\N
1810	110	164	\N
1811	27	164	\N
1812	63	164	\N
1813	42	164	\N
1814	45	164	\N
1815	123	164	\N
1816	\N	164	21
1817	81	165	\N
1818	56	165	\N
1819	126	165	\N
1820	110	165	\N
1821	27	165	\N
1822	63	165	\N
1823	42	165	\N
1824	45	165	\N
1825	\N	165	17
1845	81	168	\N
1846	56	168	\N
1847	126	168	\N
1848	110	168	\N
1849	27	168	\N
1850	63	168	\N
1851	42	168	\N
1852	45	168	\N
1853	\N	168	17
1854	81	169	\N
1855	90	169	\N
1856	126	169	\N
1857	110	169	\N
1858	27	169	\N
1859	63	169	\N
1860	42	169	\N
1861	45	169	\N
1862	\N	169	17
1863	81	170	\N
1864	101	170	\N
1865	15	170	\N
1866	110	170	\N
1867	27	170	\N
1868	63	170	\N
1869	42	170	\N
1870	45	170	\N
1871	123	170	\N
1872	\N	170	23
1873	81	171	\N
1874	56	171	\N
1875	15	171	\N
1876	110	171	\N
1877	27	171	\N
1878	63	171	\N
1879	42	171	\N
1880	45	171	\N
1881	123	171	\N
1882	\N	171	10
1883	81	172	\N
1884	56	172	\N
1885	15	172	\N
1886	110	172	\N
1887	27	172	\N
1888	63	172	\N
1889	42	172	\N
1890	45	172	\N
1891	123	172	\N
1892	\N	172	10
1893	81	173	\N
1894	100	173	\N
1895	15	173	\N
1896	110	173	\N
1897	27	173	\N
1898	63	173	\N
1899	42	173	\N
1900	\N	173	15
1901	81	174	\N
1902	91	174	\N
1903	15	174	\N
1904	110	174	\N
1905	27	174	\N
1906	63	174	\N
1907	42	174	\N
1908	45	174	\N
1909	123	174	\N
1910	\N	174	10
1919	123	175	\N
1921	81	176	\N
1922	91	176	\N
1923	15	176	\N
1924	110	176	\N
1925	27	176	\N
1926	63	176	\N
1927	42	176	\N
1928	45	176	\N
1929	123	176	\N
1930	\N	176	10
1931	81	177	\N
1932	101	177	\N
1933	126	177	\N
1934	110	177	\N
1935	27	177	\N
1936	63	177	\N
1937	42	177	\N
1938	45	177	\N
1939	123	177	\N
1940	\N	177	17
1941	81	178	\N
1942	56	178	\N
1943	126	178	\N
1944	110	178	\N
1945	27	178	\N
1946	63	178	\N
1947	42	178	\N
1948	45	178	\N
1949	123	178	\N
1950	\N	178	17
1951	81	179	\N
1952	131	179	\N
1953	132	179	\N
1954	110	179	\N
1955	63	179	\N
1956	66	179	\N
1957	\N	179	29
1958	81	180	\N
1959	131	180	\N
1960	133	180	\N
1961	110	180	\N
1962	63	180	\N
1963	66	180	\N
1964	\N	180	30
1965	81	181	\N
1966	131	181	\N
1967	57	181	\N
1968	110	181	\N
1969	63	181	\N
1970	42	181	\N
1971	\N	181	31
1972	81	182	\N
1973	134	182	\N
1974	135	182	\N
1975	110	182	\N
1976	63	182	\N
1977	66	182	\N
1978	\N	182	32
1979	81	183	\N
1980	131	183	\N
1981	136	183	\N
1982	110	183	\N
1983	63	183	\N
1984	66	183	\N
1985	\N	183	33
1986	81	184	\N
1987	92	184	\N
1988	15	184	\N
1989	110	184	\N
1990	27	184	\N
1991	63	184	\N
1992	42	184	\N
1993	45	184	\N
1994	\N	184	3
1995	81	185	\N
1996	101	185	\N
1997	15	185	\N
1998	110	185	\N
1999	27	185	\N
2000	63	185	\N
2001	42	185	\N
2002	45	185	\N
2003	\N	185	15
2004	81	186	\N
2005	98	186	\N
2006	137	186	\N
2007	110	186	\N
2008	87	186	\N
2009	36	186	\N
2010	42	186	\N
2011	\N	186	39
2012	81	187	\N
2013	101	187	\N
2014	15	187	\N
2015	110	187	\N
2016	27	187	\N
2017	63	187	\N
2018	42	187	\N
2019	45	187	\N
2020	123	187	\N
2021	\N	187	15
2022	81	188	\N
2023	91	188	\N
2024	139	188	\N
2025	110	188	\N
2026	117	188	\N
2027	87	188	\N
2028	42	188	\N
2029	\N	188	41
2030	81	189	\N
2031	92	189	\N
2032	15	189	\N
2033	110	189	\N
2034	27	189	\N
2035	63	189	\N
2036	42	189	\N
2037	45	189	\N
2038	\N	189	42
2039	81	190	\N
2040	98	190	\N
2041	15	190	\N
2042	110	190	\N
2043	27	190	\N
2044	63	190	\N
2045	42	190	\N
2046	45	190	\N
2047	\N	190	11
2048	81	191	\N
2049	92	191	\N
2050	15	191	\N
2051	110	191	\N
2052	27	191	\N
2053	63	191	\N
2054	42	191	\N
2055	45	191	\N
2056	\N	191	3
2075	81	194	\N
2076	101	194	\N
2077	15	194	\N
2078	110	194	\N
2079	27	194	\N
2080	63	194	\N
2081	42	194	\N
2082	45	194	\N
2083	123	194	\N
2084	\N	194	38
2085	81	195	\N
2086	91	195	\N
2087	140	195	\N
2088	110	195	\N
2089	86	195	\N
2090	87	195	\N
2091	36	195	\N
2092	42	195	\N
2093	\N	195	43
2094	81	196	\N
2095	101	196	\N
2096	15	196	\N
2097	110	196	\N
2098	27	196	\N
2099	63	196	\N
2100	42	196	\N
2101	45	196	\N
2102	\N	196	44
2103	81	197	\N
2104	92	197	\N
2105	15	197	\N
2106	110	197	\N
2107	27	197	\N
2108	63	197	\N
2109	42	197	\N
2110	45	197	\N
2111	123	197	\N
2112	\N	197	3
2113	81	198	\N
2114	101	198	\N
2115	127	198	\N
2116	110	198	\N
2117	27	198	\N
2118	63	198	\N
2119	42	198	\N
2120	\N	198	18
2121	81	199	\N
2122	92	199	\N
2123	15	199	\N
2124	110	199	\N
2125	27	199	\N
2126	63	199	\N
2127	42	199	\N
2128	45	199	\N
2129	\N	199	3
2130	81	200	\N
2131	101	200	\N
2132	15	200	\N
2133	110	200	\N
2134	27	200	\N
2135	63	200	\N
2136	42	200	\N
2137	45	200	\N
2138	\N	200	15
2139	81	201	\N
2140	90	201	\N
2141	15	201	\N
2142	110	201	\N
2143	27	201	\N
2144	63	201	\N
2145	42	201	\N
2146	45	201	\N
2147	123	201	\N
2148	\N	201	37
2149	81	202	\N
2150	101	202	\N
2151	143	202	\N
2152	110	202	\N
2153	61	202	\N
2154	87	202	\N
2155	36	202	\N
2156	42	202	\N
2157	\N	202	46
2158	81	203	\N
2159	90	203	\N
2160	15	203	\N
2161	110	203	\N
2162	27	203	\N
2163	63	203	\N
2164	42	203	\N
2165	45	203	\N
2166	\N	203	11
2167	81	204	\N
2168	91	204	\N
2169	15	204	\N
2170	110	204	\N
2171	27	204	\N
2172	63	204	\N
2173	42	204	\N
2174	45	204	\N
2175	\N	204	9
2176	81	205	\N
2177	101	205	\N
2178	144	205	\N
2179	110	205	\N
2180	86	205	\N
2181	87	205	\N
2182	36	205	\N
2183	42	205	\N
2184	\N	205	47
2192	121	206	\N
2193	141	206	\N
2194	145	206	\N
2195	110	206	\N
2196	147	206	\N
2197	63	206	\N
2198	42	206	\N
2199	\N	206	48
2200	81	207	\N
2201	91	207	\N
2202	15	207	\N
2203	110	207	\N
2204	27	207	\N
2205	63	207	\N
2206	42	207	\N
2207	45	207	\N
2208	123	207	\N
2209	\N	207	51
2210	81	208	\N
2211	100	208	\N
2212	138	208	\N
2213	110	208	\N
2214	117	208	\N
2215	87	208	\N
2216	36	208	\N
2217	42	208	\N
2218	\N	208	40
2219	81	209	\N
2220	91	209	\N
2221	15	209	\N
2222	110	209	\N
2223	27	209	\N
2224	63	209	\N
2225	42	209	\N
2226	45	209	\N
2227	123	209	\N
2228	\N	209	51
2229	81	210	\N
2230	101	210	\N
2231	146	210	\N
2232	110	210	\N
2233	27	210	\N
2234	63	210	\N
2235	42	210	\N
2236	\N	210	50
2237	81	211	\N
2238	105	211	\N
2239	15	211	\N
2240	112	211	\N
2241	27	211	\N
2242	63	211	\N
2243	42	211	\N
2244	\N	211	52
2245	81	212	\N
2246	134	212	\N
2247	135	212	\N
2248	110	212	\N
2249	87	212	\N
2250	66	212	\N
2251	\N	212	53
2252	80	213	\N
2253	134	213	\N
2254	132	213	\N
2255	110	213	\N
2256	63	213	\N
2257	42	213	\N
2258	\N	213	54
2259	80	214	\N
2260	134	214	\N
2261	132	214	\N
2262	110	214	\N
2263	63	214	\N
2264	42	214	\N
2265	\N	214	55
2266	121	215	\N
2267	134	215	\N
2268	148	215	\N
2269	110	215	\N
2270	63	215	\N
2271	42	215	\N
2272	\N	215	56
2273	80	216	\N
2274	106	216	\N
2275	148	216	\N
2276	110	216	\N
2277	63	216	\N
2278	42	216	\N
2279	\N	216	57
2280	81	217	\N
2281	56	217	\N
2282	15	217	\N
2283	110	217	\N
2284	27	217	\N
2285	63	217	\N
2286	42	217	\N
2287	45	217	\N
2288	123	217	\N
2289	\N	217	23
2298	81	219	\N
2299	90	219	\N
2300	15	219	\N
2301	110	219	\N
2302	27	219	\N
2303	63	219	\N
2304	42	219	\N
2305	45	219	\N
2306	123	219	\N
2307	\N	219	8
2308	81	220	\N
2309	141	220	\N
2310	143	220	\N
2311	108	220	\N
2312	87	220	\N
2313	36	220	\N
2314	42	220	\N
2315	\N	220	59
2316	81	221	\N
2317	91	221	\N
2318	15	221	\N
2319	110	221	\N
2320	27	221	\N
2321	63	221	\N
2322	42	221	\N
2323	45	221	\N
2324	123	221	\N
2325	\N	221	23
2326	81	222	\N
2327	100	222	\N
2328	15	222	\N
2329	110	222	\N
2330	27	222	\N
2331	63	222	\N
2332	42	222	\N
2333	\N	222	60
2334	81	223	\N
2335	95	223	\N
2336	127	223	\N
2337	60	223	\N
2338	115	223	\N
2339	63	223	\N
2340	42	223	\N
2341	\N	223	35
2342	81	224	\N
2343	90	224	\N
2344	15	224	\N
2345	110	224	\N
2346	27	224	\N
2347	63	224	\N
2348	42	224	\N
2349	45	224	\N
2350	123	224	\N
2351	\N	224	13
2352	81	225	\N
2353	90	225	\N
2354	15	225	\N
2355	110	225	\N
2356	27	225	\N
2357	63	225	\N
2358	42	225	\N
2359	45	225	\N
2360	123	225	\N
2361	\N	225	8
2362	81	226	\N
2363	94	226	\N
2364	143	226	\N
2365	110	226	\N
2366	87	226	\N
2367	42	226	\N
2368	\N	226	61
2369	80	227	\N
2370	134	227	\N
2371	150	227	\N
2372	110	227	\N
2373	63	227	\N
2374	42	227	\N
2375	\N	227	62
2376	81	228	\N
2377	90	228	\N
2378	15	228	\N
2379	110	228	\N
2380	27	228	\N
2381	63	228	\N
2382	42	228	\N
2383	45	228	\N
2384	123	228	\N
2385	\N	228	13
2386	81	229	\N
2387	94	229	\N
2388	135	229	\N
2389	108	229	\N
2390	27	229	\N
2391	87	229	\N
2392	42	229	\N
2393	\N	229	63
2394	80	230	\N
2395	134	230	\N
2396	135	230	\N
2397	110	230	\N
2398	87	230	\N
2399	66	230	\N
2400	\N	230	53
2401	80	231	\N
2402	134	231	\N
2403	135	231	\N
2404	110	231	\N
2405	87	231	\N
2406	66	231	\N
2407	\N	231	53
2408	80	232	\N
2409	134	232	\N
2410	135	232	\N
2411	110	232	\N
2412	63	232	\N
2413	42	232	\N
2414	\N	232	49
2415	80	233	\N
2416	134	233	\N
2417	151	233	\N
2418	110	233	\N
2419	63	233	\N
2420	42	233	\N
2421	\N	233	64
2422	121	234	\N
2423	134	234	\N
2424	145	234	\N
2425	110	234	\N
2426	63	234	\N
2427	42	234	\N
2428	\N	234	48
2429	80	235	\N
2430	134	235	\N
2431	57	235	\N
2432	110	235	\N
2433	63	235	\N
2434	42	235	\N
2435	\N	235	65
2446	81	237	\N
2447	98	237	\N
2448	15	237	\N
2449	108	237	\N
2450	27	237	\N
2451	63	237	\N
2452	42	237	\N
2453	45	237	\N
2454	123	237	\N
2455	\N	237	51
2456	81	238	\N
2457	101	238	\N
2458	144	238	\N
2459	110	238	\N
2460	86	238	\N
2461	87	238	\N
2462	42	238	\N
2463	\N	238	67
2464	81	239	\N
2465	91	239	\N
2466	15	239	\N
2467	110	239	\N
2468	27	239	\N
2469	63	239	\N
2470	42	239	\N
2471	45	239	\N
2472	123	239	\N
2473	\N	239	38
2474	81	240	\N
2475	96	240	\N
2476	152	240	\N
2477	110	240	\N
2478	87	240	\N
2479	42	240	\N
2480	\N	240	68
2481	81	241	\N
2482	101	241	\N
2483	152	241	\N
2484	110	241	\N
2485	87	241	\N
2486	42	241	\N
2487	\N	241	69
2488	81	242	\N
2489	95	242	\N
2490	133	242	\N
2491	110	242	\N
2492	63	242	\N
2493	42	242	\N
2494	\N	242	70
2495	81	243	\N
2496	95	243	\N
2497	15	243	\N
2498	110	243	\N
2499	27	243	\N
2500	63	243	\N
2501	42	243	\N
2502	\N	243	38
2503	81	244	\N
2504	100	244	\N
2505	15	244	\N
2506	110	244	\N
2507	27	244	\N
2508	63	244	\N
2509	42	244	\N
2510	\N	244	15
2511	81	245	\N
2512	100	245	\N
2513	15	245	\N
2514	107	245	\N
2515	27	245	\N
2516	63	245	\N
2517	42	245	\N
2518	\N	245	9
2519	81	246	\N
2520	56	246	\N
2521	15	246	\N
2522	111	246	\N
2523	27	246	\N
2524	63	246	\N
2525	42	246	\N
2526	45	246	\N
2527	123	246	\N
2528	\N	246	15
2529	81	247	\N
2530	101	247	\N
2531	127	247	\N
2532	110	247	\N
2533	115	247	\N
2534	63	247	\N
2535	42	247	\N
2536	\N	247	71
2537	81	248	\N
2538	95	248	\N
2539	127	248	\N
2540	110	248	\N
2541	115	248	\N
2542	63	248	\N
2543	42	248	\N
2544	\N	248	72
2545	81	249	\N
2546	100	249	\N
2547	15	249	\N
2548	110	249	\N
2549	27	249	\N
2550	63	249	\N
2551	42	249	\N
2552	\N	249	51
2553	81	250	\N
2554	100	250	\N
2555	146	250	\N
2556	110	250	\N
2557	27	250	\N
2558	63	250	\N
2559	42	250	\N
2560	\N	250	73
2561	81	251	\N
2562	100	251	\N
2563	15	251	\N
2564	110	251	\N
2565	27	251	\N
2566	63	251	\N
2567	42	251	\N
2568	\N	251	51
2569	81	252	\N
2570	101	252	\N
2571	146	252	\N
2572	110	252	\N
2573	115	252	\N
2574	63	252	\N
2575	42	252	\N
2576	\N	252	74
2577	81	253	\N
2578	103	253	\N
2579	138	253	\N
2580	110	253	\N
2581	117	253	\N
2582	87	253	\N
2583	42	253	\N
2584	\N	253	40
2585	81	254	\N
2586	98	254	\N
2587	15	254	\N
2588	110	254	\N
2589	27	254	\N
2590	63	254	\N
2591	42	254	\N
2592	45	254	\N
2593	123	254	\N
2594	\N	254	15
2595	81	255	\N
2596	94	255	\N
2597	144	255	\N
2598	112	255	\N
2599	147	255	\N
2600	87	255	\N
2601	36	255	\N
2602	42	255	\N
2603	\N	255	47
2604	81	256	\N
2605	94	256	\N
2606	144	256	\N
2607	110	256	\N
2608	147	256	\N
2609	87	256	\N
2610	36	256	\N
2611	42	256	\N
2612	\N	256	47
2613	81	257	\N
2614	94	257	\N
2615	144	257	\N
2616	110	257	\N
2617	147	257	\N
2618	87	257	\N
2619	42	257	\N
2620	\N	257	47
2621	81	258	\N
2622	101	258	\N
2623	144	258	\N
2624	110	258	\N
2625	117	258	\N
2626	87	258	\N
2627	36	258	\N
2628	42	258	\N
2629	\N	258	47
2630	121	259	\N
2631	141	259	\N
2632	137	259	\N
2633	108	259	\N
2634	87	259	\N
2635	42	259	\N
2636	\N	259	45
2637	121	260	\N
2638	105	260	\N
2639	146	260	\N
2640	110	260	\N
2641	63	260	\N
2642	42	260	\N
2643	\N	260	50
2644	121	261	\N
2645	105	261	\N
2646	57	261	\N
2647	110	261	\N
2648	63	261	\N
2649	42	261	\N
2650	\N	261	75
2651	81	262	\N
2652	91	262	\N
2653	153	262	\N
2654	110	262	\N
2655	87	262	\N
2656	42	262	\N
2657	\N	262	76
2658	81	263	\N
2659	90	263	\N
2660	15	263	\N
2661	110	263	\N
2662	27	263	\N
2663	63	263	\N
2664	42	263	\N
2665	45	263	\N
2666	123	263	\N
2667	\N	263	9
2668	81	264	\N
2669	90	264	\N
2670	15	264	\N
2671	110	264	\N
2672	27	264	\N
2673	63	264	\N
2674	42	264	\N
2675	123	264	\N
2676	\N	264	9
2677	81	265	\N
2678	90	265	\N
2679	15	265	\N
2680	110	265	\N
2681	27	265	\N
2682	63	265	\N
2683	42	265	\N
2684	45	265	\N
2685	123	265	\N
2686	\N	265	23
2687	81	266	\N
2688	91	266	\N
2689	138	266	\N
2690	111	266	\N
2691	117	266	\N
2692	87	266	\N
2693	36	266	\N
2694	42	266	\N
2695	\N	266	40
2696	81	267	\N
2697	92	267	\N
2698	138	267	\N
2699	109	267	\N
2700	86	267	\N
2701	87	267	\N
2702	36	267	\N
2703	42	267	\N
2704	\N	267	40
2705	81	268	\N
2706	90	268	\N
2707	15	268	\N
2708	110	268	\N
2709	27	268	\N
2710	63	268	\N
2711	42	268	\N
2712	45	268	\N
2713	123	268	\N
2714	\N	268	9
2715	81	269	\N
2716	92	269	\N
2717	15	269	\N
2718	111	269	\N
2719	27	269	\N
2720	63	269	\N
2721	42	269	\N
2722	45	269	\N
2723	123	269	\N
2724	\N	269	3
2725	81	270	\N
2726	91	270	\N
2727	140	270	\N
2728	110	270	\N
2729	86	270	\N
2730	87	270	\N
2731	36	270	\N
2732	42	270	\N
2733	\N	270	43
2734	81	271	\N
2735	92	271	\N
2736	15	271	\N
2737	110	271	\N
2738	27	271	\N
2739	63	271	\N
2740	42	271	\N
2741	45	271	\N
2742	68	271	\N
2743	\N	271	66
2744	81	272	\N
2745	92	272	\N
2746	140	272	\N
2747	110	272	\N
2748	86	272	\N
2749	87	272	\N
2750	36	272	\N
2751	42	272	\N
2752	\N	272	43
2761	81	274	\N
2762	92	274	\N
2763	154	274	\N
2764	110	274	\N
2765	116	274	\N
2766	87	274	\N
2767	42	274	\N
2768	\N	274	77
2769	81	275	\N
2770	92	275	\N
2771	15	275	\N
2772	111	275	\N
2773	27	275	\N
2774	63	275	\N
2775	42	275	\N
2776	45	275	\N
2777	123	275	\N
2778	\N	275	3
2779	81	276	\N
2780	91	276	\N
2781	153	276	\N
2782	110	276	\N
2783	87	276	\N
2784	42	276	\N
2785	\N	276	76
2786	81	277	\N
2787	96	277	\N
2788	140	277	\N
2789	110	277	\N
2790	86	277	\N
2791	87	277	\N
2792	42	277	\N
2793	\N	277	78
2794	81	278	\N
2795	96	278	\N
2796	140	278	\N
2797	110	278	\N
2798	86	278	\N
2799	87	278	\N
2800	42	278	\N
2801	\N	278	78
2802	81	279	\N
2803	90	279	\N
2804	15	279	\N
2805	111	279	\N
2806	27	279	\N
2807	63	279	\N
2808	42	279	\N
2809	45	279	\N
2810	123	279	\N
2811	\N	279	2
2812	81	280	\N
2813	90	280	\N
2814	15	280	\N
2815	110	280	\N
2816	27	280	\N
2817	63	280	\N
2818	42	280	\N
2819	45	280	\N
2820	123	280	\N
2821	\N	280	2
2822	81	281	\N
2823	101	281	\N
2824	144	281	\N
2825	110	281	\N
2826	117	281	\N
2827	87	281	\N
2828	36	281	\N
2829	39	281	\N
2830	42	281	\N
2831	\N	281	47
2832	80	282	\N
2833	134	282	\N
2834	151	282	\N
2835	108	282	\N
2836	63	282	\N
2837	66	282	\N
2838	\N	282	79
2839	81	283	\N
2840	92	283	\N
2841	15	283	\N
2842	110	283	\N
2843	27	283	\N
2844	63	283	\N
2845	42	283	\N
2846	45	283	\N
2847	123	283	\N
2848	\N	283	80
2849	81	284	\N
2850	90	284	\N
2851	15	284	\N
2852	110	284	\N
2853	27	284	\N
2854	63	284	\N
2855	42	284	\N
2856	45	284	\N
2857	123	284	\N
2858	\N	284	7
2859	81	285	\N
2860	101	285	\N
2861	146	285	\N
2862	110	285	\N
2863	63	285	\N
2864	42	285	\N
2865	\N	285	50
2866	81	286	\N
2867	90	286	\N
2868	15	286	\N
2869	110	286	\N
2870	27	286	\N
2871	63	286	\N
2872	42	286	\N
2873	45	286	\N
2874	123	286	\N
2875	\N	286	2
2876	81	287	\N
2877	94	287	\N
2878	150	287	\N
2879	110	287	\N
2880	63	287	\N
2881	42	287	\N
2882	\N	287	81
2883	81	288	\N
2884	90	288	\N
2885	15	288	\N
2886	110	288	\N
2887	27	288	\N
2888	63	288	\N
2889	42	288	\N
2890	45	288	\N
2891	123	288	\N
2892	\N	288	23
2893	81	289	\N
2894	90	289	\N
2895	15	289	\N
2896	110	289	\N
2897	27	289	\N
2898	63	289	\N
2899	42	289	\N
2900	45	289	\N
2901	123	289	\N
2902	\N	289	13
2903	121	290	\N
2904	134	290	\N
2905	145	290	\N
2906	108	290	\N
2907	63	290	\N
2908	42	290	\N
2909	\N	290	48
2910	81	291	\N
2911	90	291	\N
2912	15	291	\N
2913	110	291	\N
2914	27	291	\N
2915	63	291	\N
2916	42	291	\N
2917	45	291	\N
2918	123	291	\N
2919	\N	291	2
2920	81	292	\N
2921	90	292	\N
2922	15	292	\N
2923	110	292	\N
2924	27	292	\N
2925	63	292	\N
2926	42	292	\N
2927	45	292	\N
2928	123	292	\N
2929	\N	292	8
2930	81	293	\N
2931	92	293	\N
2932	15	293	\N
2933	110	293	\N
2934	27	293	\N
2935	63	293	\N
2936	42	293	\N
2937	45	293	\N
2938	123	293	\N
2939	\N	293	80
2940	81	294	\N
2941	101	294	\N
2942	15	294	\N
2943	110	294	\N
2944	27	294	\N
2945	63	294	\N
2946	42	294	\N
2947	\N	294	82
2948	81	295	\N
2949	92	295	\N
2950	15	295	\N
2951	110	295	\N
2952	27	295	\N
2953	63	295	\N
2954	42	295	\N
2955	45	295	\N
2956	123	295	\N
2957	\N	295	3
2958	81	296	\N
2959	95	296	\N
2960	146	296	\N
2961	110	296	\N
2962	115	296	\N
2963	87	296	\N
2964	42	296	\N
2965	\N	296	83
2966	81	297	\N
2967	90	297	\N
2968	15	297	\N
2969	110	297	\N
2970	27	297	\N
2971	63	297	\N
2972	42	297	\N
2973	45	297	\N
2974	123	297	\N
2975	\N	297	7
2976	81	298	\N
2977	95	298	\N
2978	156	298	\N
2979	110	298	\N
2980	63	298	\N
2981	42	298	\N
2982	\N	298	84
2983	81	299	\N
2984	92	299	\N
2985	15	299	\N
2986	110	299	\N
2987	27	299	\N
2988	63	299	\N
2989	42	299	\N
2990	45	299	\N
2991	68	299	\N
2992	\N	299	85
2993	81	300	\N
2994	101	300	\N
2995	144	300	\N
2996	110	300	\N
2997	87	300	\N
2998	42	300	\N
2999	\N	300	86
3000	81	301	\N
3001	90	301	\N
3002	15	301	\N
3003	110	301	\N
3004	27	301	\N
3005	63	301	\N
3006	42	301	\N
3007	45	301	\N
3008	123	301	\N
3009	\N	301	7
3010	81	302	\N
3011	101	302	\N
3012	146	302	\N
3013	110	302	\N
3014	63	302	\N
3015	42	302	\N
3016	\N	302	50
3017	81	303	\N
3018	141	303	\N
3019	135	303	\N
3020	112	303	\N
3021	87	303	\N
3022	66	303	\N
3023	\N	303	87
3024	121	304	\N
3025	134	304	\N
3026	148	304	\N
3027	128	304	\N
3028	63	304	\N
3029	42	304	\N
3030	\N	304	56
3031	81	305	\N
3032	91	305	\N
3033	15	305	\N
3034	110	305	\N
3035	27	305	\N
3036	63	305	\N
3037	42	305	\N
3038	45	305	\N
3039	123	305	\N
3040	\N	305	51
3041	81	306	\N
3042	90	306	\N
3043	15	306	\N
3044	110	306	\N
3045	27	306	\N
3046	63	306	\N
3047	42	306	\N
3048	45	306	\N
3049	123	306	\N
3050	\N	306	23
3051	81	307	\N
3052	90	307	\N
3053	15	307	\N
3054	110	307	\N
3055	27	307	\N
3056	63	307	\N
3057	42	307	\N
3058	45	307	\N
3059	123	307	\N
3060	\N	307	7
3061	10	308	\N
3062	101	308	\N
3063	135	308	\N
3064	110	308	\N
3065	63	308	\N
3066	42	308	\N
3067	\N	308	88
3068	121	309	\N
3069	134	309	\N
3070	151	309	\N
3071	110	309	\N
3072	63	309	\N
3073	42	309	\N
3074	\N	309	89
3075	81	310	\N
3076	90	310	\N
3077	15	310	\N
3078	110	310	\N
3079	27	310	\N
3080	63	310	\N
3081	42	310	\N
3082	45	310	\N
3083	123	310	\N
3084	\N	310	13
3085	81	311	\N
3086	100	311	\N
3087	127	311	\N
3088	110	311	\N
3089	115	311	\N
3090	63	311	\N
3091	42	311	\N
3092	\N	311	90
3093	121	312	\N
3094	134	312	\N
3095	146	312	\N
3096	110	312	\N
3097	63	312	\N
3098	42	312	\N
3099	\N	312	50
3100	81	313	\N
3101	90	313	\N
3102	15	313	\N
3103	110	313	\N
3104	27	313	\N
3105	63	313	\N
3106	42	313	\N
3107	45	313	\N
3108	123	313	\N
3109	\N	313	23
3110	81	314	\N
3111	94	314	\N
3112	157	314	\N
3113	110	314	\N
3114	63	314	\N
3115	42	314	\N
3116	\N	314	91
3117	81	315	\N
3118	134	315	\N
3119	135	315	\N
3120	110	315	\N
3121	63	315	\N
3122	42	315	\N
3123	\N	315	92
3124	121	316	\N
3125	134	316	\N
3126	148	316	\N
3127	110	316	\N
3128	63	316	\N
3129	42	316	\N
3130	\N	316	93
3131	81	317	\N
3132	91	317	\N
3133	15	317	\N
3134	110	317	\N
3135	27	317	\N
3136	63	317	\N
3137	42	317	\N
3138	45	317	\N
3139	123	317	\N
3140	\N	317	8
3141	81	318	\N
3142	106	318	\N
3143	150	318	\N
3144	108	318	\N
3145	63	318	\N
3146	42	318	\N
3147	\N	318	94
3148	81	319	\N
3149	90	319	\N
3150	15	319	\N
3151	110	319	\N
3152	27	319	\N
3153	63	319	\N
3154	42	319	\N
3155	45	319	\N
3156	123	319	\N
3157	\N	319	8
3158	81	320	\N
3159	91	320	\N
3160	15	320	\N
3161	110	320	\N
3162	27	320	\N
3163	63	320	\N
3164	42	320	\N
3165	45	320	\N
3166	123	320	\N
3167	\N	320	8
3168	81	321	\N
3169	90	321	\N
3170	15	321	\N
3171	111	321	\N
3172	27	321	\N
3173	63	321	\N
3174	42	321	\N
3175	45	321	\N
3176	123	321	\N
3177	\N	321	13
3178	80	322	\N
3179	134	322	\N
3180	151	322	\N
3181	110	322	\N
3182	63	322	\N
3183	42	322	\N
3184	\N	322	79
3185	82	323	\N
3186	134	323	\N
3187	151	323	\N
3188	110	323	\N
3189	63	323	\N
3190	66	323	\N
3191	\N	323	95
3192	121	324	\N
3193	134	324	\N
3194	148	324	\N
3195	110	324	\N
3196	63	324	\N
3197	42	324	\N
3198	\N	324	57
3199	80	325	\N
3200	134	325	\N
3201	158	325	\N
3202	110	325	\N
3203	63	325	\N
3204	42	325	\N
3205	\N	325	96
3206	80	326	\N
3207	134	326	\N
3208	145	326	\N
3209	110	326	\N
3210	63	326	\N
3211	42	326	\N
3212	\N	326	97
3213	81	327	\N
3214	91	327	\N
3215	15	327	\N
3216	110	327	\N
3217	27	327	\N
3218	63	327	\N
3219	42	327	\N
3220	45	327	\N
3221	123	327	\N
3222	\N	327	8
3223	81	328	\N
3224	101	328	\N
3225	137	328	\N
3226	110	328	\N
3227	63	328	\N
3228	42	328	\N
3229	\N	328	98
3230	80	329	\N
3231	134	329	\N
3232	135	329	\N
3233	110	329	\N
3234	63	329	\N
3235	66	329	\N
3236	\N	329	99
3237	81	330	\N
3238	91	330	\N
3239	15	330	\N
3240	110	330	\N
3241	27	330	\N
3242	63	330	\N
3243	42	330	\N
3244	45	330	\N
3245	123	330	\N
3246	\N	330	7
3247	80	331	\N
3248	106	331	\N
3249	151	331	\N
3250	110	331	\N
3251	63	331	\N
3252	42	331	\N
3253	\N	331	100
3254	81	332	\N
3255	141	332	\N
3256	137	332	\N
3257	110	332	\N
3258	63	332	\N
3259	66	332	\N
3260	\N	332	45
3261	121	333	\N
3262	134	333	\N
3263	148	333	\N
3264	110	333	\N
3265	63	333	\N
3266	42	333	\N
3267	\N	333	56
3268	81	334	\N
3269	90	334	\N
3270	15	334	\N
3271	110	334	\N
3272	27	334	\N
3273	63	334	\N
3274	42	334	\N
3275	45	334	\N
3276	123	334	\N
3277	\N	334	38
3278	81	335	\N
3279	94	335	\N
3280	137	335	\N
3281	63	335	\N
3282	42	335	\N
3283	\N	335	98
3284	80	336	\N
3285	134	336	\N
3286	135	336	\N
3287	110	336	\N
3288	63	336	\N
3289	66	336	\N
3290	\N	336	99
3291	81	337	\N
3292	90	337	\N
3293	15	337	\N
3294	110	337	\N
3295	27	337	\N
3296	63	337	\N
3297	42	337	\N
3298	45	337	\N
3299	123	337	\N
3300	\N	337	8
3301	81	338	\N
3302	95	338	\N
3303	137	338	\N
3304	110	338	\N
3305	63	338	\N
3306	42	338	\N
3307	\N	338	98
3308	121	339	\N
3309	134	339	\N
3310	148	339	\N
3311	111	339	\N
3312	63	339	\N
3313	42	339	\N
3314	\N	339	57
3315	80	340	\N
3316	134	340	\N
3317	135	340	\N
3318	110	340	\N
3319	63	340	\N
3320	42	340	\N
3321	\N	340	101
3322	81	341	\N
3323	91	341	\N
3324	15	341	\N
3325	110	341	\N
3326	27	341	\N
3327	63	341	\N
3328	42	341	\N
3329	45	341	\N
3330	123	341	\N
3331	\N	341	9
3332	81	342	\N
3333	90	342	\N
3334	15	342	\N
3335	110	342	\N
3336	27	342	\N
3337	63	342	\N
3338	42	342	\N
3339	45	342	\N
3340	123	342	\N
3341	\N	342	23
3342	80	343	\N
3343	134	343	\N
3344	132	343	\N
3345	110	343	\N
3346	63	343	\N
3347	66	343	\N
3348	\N	343	102
3349	81	344	\N
3350	105	344	\N
3351	146	344	\N
3352	110	344	\N
3353	63	344	\N
3354	42	344	\N
3355	\N	344	50
3356	81	345	\N
3357	100	345	\N
3358	15	345	\N
3359	110	345	\N
3360	27	345	\N
3361	63	345	\N
3362	42	345	\N
3363	\N	345	60
3364	80	346	\N
3365	134	346	\N
3366	159	346	\N
3367	110	346	\N
3368	63	346	\N
3369	66	346	\N
3370	\N	346	103
3371	80	347	\N
3372	134	347	\N
3373	159	347	\N
3374	110	347	\N
3375	63	347	\N
3376	42	347	\N
3377	\N	347	104
3378	80	348	\N
3379	134	348	\N
3380	135	348	\N
3381	110	348	\N
3382	63	348	\N
3383	66	348	\N
3384	\N	348	99
3385	121	349	\N
3386	134	349	\N
3387	148	349	\N
3388	108	349	\N
3389	63	349	\N
3390	42	349	\N
3391	\N	349	56
3392	81	350	\N
3393	90	350	\N
3394	15	350	\N
3395	110	350	\N
3396	27	350	\N
3397	63	350	\N
3398	42	350	\N
3399	45	350	\N
3400	123	350	\N
3401	\N	350	8
3402	81	351	\N
3403	90	351	\N
3404	15	351	\N
3405	110	351	\N
3406	27	351	\N
3407	63	351	\N
3408	42	351	\N
3409	45	351	\N
3410	123	351	\N
3411	\N	351	23
3412	81	352	\N
3413	101	352	\N
3414	15	352	\N
3415	110	352	\N
3416	27	352	\N
3417	63	352	\N
3418	42	352	\N
3419	\N	352	82
3420	81	353	\N
3421	94	353	\N
3422	57	353	\N
3423	108	353	\N
3424	63	353	\N
3425	42	353	\N
3426	\N	353	105
3427	81	354	\N
3428	90	354	\N
3429	15	354	\N
3430	110	354	\N
3431	27	354	\N
3432	63	354	\N
3433	42	354	\N
3434	45	354	\N
3435	123	354	\N
3436	\N	354	13
3437	81	355	\N
3438	83	355	\N
3439	15	355	\N
3440	110	355	\N
3441	27	355	\N
3442	63	355	\N
3443	42	355	\N
3444	45	355	\N
3445	123	355	\N
3446	\N	355	21
3447	121	356	\N
3448	134	356	\N
3449	148	356	\N
3450	160	356	\N
3451	63	356	\N
3452	42	356	\N
3453	\N	356	56
3454	80	357	\N
3455	134	357	\N
3456	148	357	\N
3457	110	357	\N
3458	63	357	\N
3459	42	357	\N
3460	\N	357	57
3461	81	358	\N
3462	91	358	\N
3463	15	358	\N
3464	110	358	\N
3465	27	358	\N
3466	63	358	\N
3467	42	358	\N
3468	45	358	\N
3469	123	358	\N
3470	\N	358	3
3471	81	359	\N
3472	90	359	\N
3473	15	359	\N
3474	110	359	\N
3475	27	359	\N
3476	63	359	\N
3477	42	359	\N
3478	45	359	\N
3479	123	359	\N
3480	\N	359	7
3481	81	360	\N
3482	90	360	\N
3483	15	360	\N
3484	110	360	\N
3485	27	360	\N
3486	63	360	\N
3487	42	360	\N
3488	45	360	\N
3489	123	360	\N
3490	\N	360	7
3491	81	361	\N
3492	91	361	\N
3493	15	361	\N
3494	110	361	\N
3495	27	361	\N
3496	63	361	\N
3497	42	361	\N
3498	45	361	\N
3499	123	361	\N
3500	\N	361	10
3501	81	362	\N
3502	90	362	\N
3503	15	362	\N
3504	110	362	\N
3505	27	362	\N
3506	63	362	\N
3507	42	362	\N
3508	45	362	\N
3509	123	362	\N
3510	\N	362	13
3511	81	363	\N
3512	90	363	\N
3513	15	363	\N
3514	110	363	\N
3515	27	363	\N
3516	63	363	\N
3517	42	363	\N
3518	45	363	\N
3519	123	363	\N
3520	\N	363	13
3521	81	364	\N
3522	90	364	\N
3523	15	364	\N
3524	110	364	\N
3525	27	364	\N
3526	63	364	\N
3527	42	364	\N
3528	45	364	\N
3529	123	364	\N
3530	\N	364	7
3554	80	366	\N
3555	98	366	\N
3556	146	366	\N
3557	110	366	\N
3558	63	366	\N
3559	42	366	\N
3560	\N	366	50
3561	80	367	\N
3562	101	367	\N
3563	137	367	\N
3564	110	367	\N
3565	87	367	\N
3566	42	367	\N
3567	\N	367	39
3568	121	368	\N
3569	134	368	\N
3570	148	368	\N
3571	110	368	\N
3572	63	368	\N
3573	42	368	\N
3574	\N	368	56
3575	81	369	\N
3576	95	369	\N
3577	127	369	\N
3578	110	369	\N
3579	115	369	\N
3580	87	369	\N
3581	42	369	\N
3582	\N	369	35
3583	81	370	\N
3584	100	370	\N
3585	57	370	\N
3586	110	370	\N
3587	63	370	\N
3588	42	370	\N
3589	\N	370	106
3590	81	371	\N
3591	100	371	\N
3592	138	371	\N
3593	110	371	\N
3594	87	371	\N
3595	42	371	\N
3596	\N	371	107
3597	81	372	\N
3598	101	372	\N
3599	15	372	\N
3600	110	372	\N
3601	27	372	\N
3602	63	372	\N
3603	42	372	\N
3604	45	372	\N
3605	123	372	\N
3606	\N	372	15
3607	81	373	\N
3608	101	373	\N
3609	144	373	\N
3610	110	373	\N
3611	87	373	\N
3612	36	373	\N
3613	42	373	\N
3614	\N	373	108
3615	81	374	\N
3616	101	374	\N
3617	137	374	\N
3618	108	374	\N
3619	87	374	\N
3620	42	374	\N
3621	\N	374	109
3622	81	375	\N
3623	101	375	\N
3624	144	375	\N
3625	110	375	\N
3626	87	375	\N
3627	42	375	\N
3628	\N	375	86
3629	81	376	\N
3630	94	376	\N
3631	150	376	\N
3632	110	376	\N
3633	63	376	\N
3634	42	376	\N
3635	\N	376	110
3636	80	377	\N
3637	134	377	\N
3638	132	377	\N
3639	110	377	\N
3640	63	377	\N
3641	42	377	\N
3642	\N	377	55
3643	121	378	\N
3644	106	378	\N
3645	145	378	\N
3646	110	378	\N
3647	63	378	\N
3648	42	378	\N
3649	\N	378	48
3650	80	379	\N
3651	134	379	\N
3652	159	379	\N
3653	110	379	\N
3654	63	379	\N
3655	66	379	\N
3656	\N	379	111
3657	81	380	\N
3658	90	380	\N
3659	15	380	\N
3660	110	380	\N
3661	27	380	\N
3662	63	380	\N
3663	42	380	\N
3664	45	380	\N
3665	123	380	\N
3666	\N	380	8
3667	81	381	\N
3668	101	381	\N
3669	15	381	\N
3670	110	381	\N
3671	27	381	\N
3672	63	381	\N
3673	42	381	\N
3674	45	381	\N
3675	123	381	\N
3676	\N	381	13
3677	81	382	\N
3678	90	382	\N
3679	15	382	\N
3680	110	382	\N
3681	27	382	\N
3682	63	382	\N
3683	42	382	\N
3684	45	382	\N
3685	123	382	\N
3686	\N	382	80
3687	121	383	\N
3688	134	383	\N
3689	110	383	\N
3690	63	383	\N
3691	42	383	\N
3692	81	384	\N
3693	101	384	\N
3694	146	384	\N
3695	110	384	\N
3696	63	384	\N
3697	42	384	\N
3698	\N	384	50
3699	81	385	\N
3700	90	385	\N
3701	15	385	\N
3702	110	385	\N
3703	27	385	\N
3704	63	385	\N
3705	42	385	\N
3706	45	385	\N
3707	123	385	\N
3708	\N	385	7
3709	81	386	\N
3710	90	386	\N
3711	15	386	\N
3712	110	386	\N
3713	27	386	\N
3714	63	386	\N
3715	42	386	\N
3716	45	386	\N
3717	123	386	\N
3718	\N	386	7
3726	81	388	\N
3727	90	388	\N
3728	15	388	\N
3729	110	388	\N
3730	27	388	\N
3731	63	388	\N
3732	42	388	\N
3733	45	388	\N
3734	123	388	\N
3735	\N	388	23
3736	81	389	\N
3737	101	389	\N
3738	143	389	\N
3739	110	389	\N
3740	87	389	\N
3741	36	389	\N
3742	42	389	\N
3743	\N	389	112
3744	81	390	\N
3745	91	390	\N
3746	15	390	\N
3747	110	390	\N
3748	27	390	\N
3749	63	390	\N
3750	42	390	\N
3751	45	390	\N
3752	123	390	\N
3753	\N	390	3
3754	80	391	\N
3755	98	391	\N
3756	135	391	\N
3757	110	391	\N
3758	63	391	\N
3759	66	391	\N
3760	\N	391	113
3761	81	392	\N
3762	90	392	\N
3763	15	392	\N
3764	110	392	\N
3765	27	392	\N
3766	63	392	\N
3767	42	392	\N
3768	45	392	\N
3769	123	392	\N
3770	\N	392	8
3808	81	397	\N
3809	90	397	\N
3810	15	397	\N
3811	110	397	\N
3812	27	397	\N
3813	63	397	\N
3814	42	397	\N
3815	45	397	\N
3816	123	397	\N
3817	\N	397	8
3818	121	398	\N
3819	134	398	\N
3820	148	398	\N
3821	110	398	\N
3822	63	398	\N
3823	42	398	\N
3824	\N	398	56
3825	80	399	\N
3826	134	399	\N
3827	161	399	\N
3828	110	399	\N
3829	87	399	\N
3830	42	399	\N
3831	\N	399	114
3832	81	400	\N
3833	90	400	\N
3834	15	400	\N
3835	110	400	\N
3836	27	400	\N
3837	63	400	\N
3838	42	400	\N
3839	45	400	\N
3840	123	400	\N
3841	\N	400	8
3842	81	401	\N
3843	98	401	\N
3844	15	401	\N
3845	110	401	\N
3846	27	401	\N
3847	63	401	\N
3848	42	401	\N
3849	\N	401	26
3850	81	402	\N
3851	90	402	\N
3852	15	402	\N
3853	110	402	\N
3854	27	402	\N
3855	63	402	\N
3856	42	402	\N
3857	45	402	\N
3858	123	402	\N
3859	\N	402	13
3860	81	403	\N
3861	90	403	\N
3862	15	403	\N
3863	110	403	\N
3864	27	403	\N
3865	63	403	\N
3866	42	403	\N
3867	45	403	\N
3868	123	403	\N
3869	\N	403	23
3870	81	404	\N
3871	101	404	\N
3872	146	404	\N
3873	110	404	\N
3874	63	404	\N
3875	42	404	\N
3876	\N	404	50
3877	81	405	\N
3878	90	405	\N
3879	15	405	\N
3880	110	405	\N
3881	27	405	\N
3882	63	405	\N
3883	42	405	\N
3884	45	405	\N
3885	123	405	\N
3886	\N	405	8
3887	81	406	\N
3888	90	406	\N
3889	15	406	\N
3890	110	406	\N
3891	27	406	\N
3892	63	406	\N
3893	42	406	\N
3894	45	406	\N
3895	123	406	\N
3896	\N	406	13
3897	81	407	\N
3898	90	407	\N
3899	15	407	\N
3900	110	407	\N
3901	27	407	\N
3902	63	407	\N
3903	42	407	\N
3904	45	407	\N
3905	123	407	\N
3906	\N	407	23
3907	81	408	\N
3908	90	408	\N
3909	15	408	\N
3910	110	408	\N
3911	27	408	\N
3912	63	408	\N
3913	42	408	\N
3914	45	408	\N
3915	123	408	\N
3916	\N	408	80
3917	121	409	\N
3918	134	409	\N
3919	151	409	\N
3920	108	409	\N
3921	63	409	\N
3922	42	409	\N
3923	\N	409	89
3924	121	410	\N
3925	101	410	\N
3926	135	410	\N
3927	110	410	\N
3928	87	410	\N
3929	66	410	\N
3930	\N	410	87
3931	121	411	\N
3932	134	411	\N
3933	148	411	\N
3934	108	411	\N
3935	63	411	\N
3936	42	411	\N
3937	\N	411	56
3938	81	412	\N
3939	101	412	\N
3940	146	412	\N
3941	110	412	\N
3942	27	412	\N
3943	63	412	\N
3944	42	412	\N
3945	\N	412	50
3946	81	413	\N
3947	90	413	\N
3948	15	413	\N
3949	110	413	\N
3950	27	413	\N
3951	63	413	\N
3952	42	413	\N
3953	45	413	\N
3954	123	413	\N
3955	\N	413	13
3956	81	414	\N
3957	90	414	\N
3958	15	414	\N
3959	110	414	\N
3960	27	414	\N
3961	63	414	\N
3962	42	414	\N
3963	45	414	\N
3964	123	414	\N
3965	\N	414	13
3966	121	415	\N
3967	101	415	\N
3968	57	415	\N
3969	110	415	\N
3970	63	415	\N
3971	42	415	\N
3972	\N	415	75
3973	81	416	\N
3974	90	416	\N
3975	15	416	\N
3976	110	416	\N
3977	27	416	\N
3978	63	416	\N
3979	42	416	\N
3980	45	416	\N
3981	123	416	\N
3982	\N	416	2
3983	81	417	\N
3984	90	417	\N
3985	15	417	\N
3986	110	417	\N
3987	27	417	\N
3988	63	417	\N
3989	42	417	\N
3990	45	417	\N
3991	123	417	\N
3992	\N	417	8
3993	81	418	\N
3994	90	418	\N
3995	15	418	\N
3996	110	418	\N
3997	27	418	\N
3998	63	418	\N
3999	42	418	\N
4000	45	418	\N
4001	123	418	\N
4002	\N	418	2
4003	121	419	\N
4004	134	419	\N
4005	57	419	\N
4006	110	419	\N
4007	63	419	\N
4008	42	419	\N
4009	\N	419	75
4010	80	420	\N
4011	134	420	\N
4012	162	420	\N
4013	110	420	\N
4014	63	420	\N
4015	66	420	\N
4016	\N	420	116
4017	81	421	\N
4018	101	421	\N
4019	143	421	\N
4020	110	421	\N
4021	87	421	\N
4022	36	421	\N
4023	42	421	\N
4024	\N	421	59
4025	81	422	\N
4026	92	422	\N
4027	163	422	\N
4028	110	422	\N
4029	87	422	\N
4030	42	422	\N
4031	\N	422	117
4032	80	423	\N
4033	134	423	\N
4034	159	423	\N
4035	110	423	\N
4036	63	423	\N
4037	66	423	\N
4038	\N	423	103
4039	82	424	\N
4040	134	424	\N
4041	135	424	\N
4042	110	424	\N
4043	63	424	\N
4044	66	424	\N
4045	\N	424	118
4046	80	425	\N
4047	134	425	\N
4048	135	425	\N
4049	110	425	\N
4050	63	425	\N
4051	66	425	\N
4052	\N	425	99
4053	81	426	\N
4054	90	426	\N
4055	15	426	\N
4056	110	426	\N
4057	27	426	\N
4058	63	426	\N
4059	42	426	\N
4060	45	426	\N
4061	123	426	\N
4062	\N	426	7
4072	121	428	\N
4073	134	428	\N
4074	145	428	\N
4075	108	428	\N
4076	63	428	\N
4077	42	428	\N
4078	\N	428	48
4106	164	432	\N
4111	\N	432	120
4139	81	436	\N
4140	83	436	\N
4141	15	436	\N
4142	110	436	\N
4143	27	436	\N
4144	63	436	\N
4145	42	436	\N
4146	45	436	\N
4147	123	436	\N
4148	\N	436	8
4149	81	437	\N
4150	90	437	\N
4151	15	437	\N
4152	110	437	\N
4153	27	437	\N
4154	63	437	\N
4155	42	437	\N
4156	45	437	\N
4157	123	437	\N
4158	\N	437	13
4159	121	438	\N
4160	134	438	\N
4161	145	438	\N
4162	110	438	\N
4163	63	438	\N
4164	42	438	\N
4165	\N	438	48
4166	81	393	\N
4167	90	393	\N
4168	15	393	\N
4169	110	393	\N
4170	27	393	\N
4171	63	393	\N
4172	42	393	\N
4173	45	393	\N
4174	123	393	\N
4175	\N	393	13
4176	81	439	\N
4177	90	439	\N
4178	15	439	\N
4179	110	439	\N
4180	27	439	\N
4181	63	439	\N
4182	42	439	\N
4183	45	439	\N
4184	123	439	\N
4185	\N	439	80
4186	81	394	\N
4187	83	394	\N
4188	15	394	\N
4189	110	394	\N
4190	27	394	\N
4191	63	394	\N
4192	42	394	\N
4193	45	394	\N
4194	123	394	\N
4195	\N	394	21
4196	81	395	\N
4197	90	395	\N
4198	15	395	\N
4199	110	395	\N
4200	27	395	\N
4201	63	395	\N
4202	42	395	\N
4203	45	395	\N
4204	123	395	\N
4205	\N	395	23
4206	81	396	\N
4207	101	396	\N
4208	146	396	\N
4209	110	396	\N
4210	63	396	\N
4211	42	396	\N
4212	\N	396	50
4213	81	440	\N
4214	94	440	\N
4215	150	440	\N
4216	110	440	\N
4217	63	440	\N
4218	42	440	\N
4219	\N	440	121
4220	81	441	\N
4221	83	441	\N
4222	15	441	\N
4223	110	441	\N
4224	27	441	\N
4225	63	441	\N
4226	42	441	\N
4227	45	441	\N
4228	123	441	\N
4229	\N	441	38
4230	81	442	\N
4231	101	442	\N
4232	144	442	\N
4233	110	442	\N
4234	114	442	\N
4235	87	442	\N
4236	36	442	\N
4237	42	442	\N
4238	\N	442	47
4249	81	444	\N
4250	56	444	\N
4251	15	444	\N
4252	110	444	\N
4253	27	444	\N
4254	63	444	\N
4255	42	444	\N
4256	45	444	\N
4257	123	444	\N
4258	\N	444	122
4259	81	445	\N
4260	95	445	\N
4261	15	445	\N
4262	110	445	\N
4263	27	445	\N
4264	63	445	\N
4265	42	445	\N
4266	\N	445	38
4267	81	446	\N
4268	100	446	\N
4269	137	446	\N
4270	112	446	\N
4271	63	446	\N
4272	42	446	\N
4273	\N	446	98
4274	81	447	\N
4275	101	447	\N
4276	57	447	\N
4277	110	447	\N
4278	63	447	\N
4279	42	447	\N
4280	\N	447	36
4281	81	448	\N
4282	92	448	\N
4283	154	448	\N
4284	110	448	\N
4285	116	448	\N
4286	87	448	\N
4287	36	448	\N
4288	42	448	\N
4289	\N	448	123
4290	81	449	\N
4291	90	449	\N
4292	15	449	\N
4293	110	449	\N
4294	27	449	\N
4295	63	449	\N
4296	42	449	\N
4297	45	449	\N
4298	123	449	\N
4299	\N	449	23
4300	81	450	\N
4301	90	450	\N
4302	15	450	\N
4303	110	450	\N
4304	27	450	\N
4305	63	450	\N
4306	42	450	\N
4307	45	450	\N
4308	123	450	\N
4309	\N	450	23
4310	81	451	\N
4311	94	451	\N
4312	150	451	\N
4313	108	451	\N
4314	63	451	\N
4315	42	451	\N
4316	\N	451	110
4317	81	452	\N
4318	91	452	\N
4319	57	452	\N
4320	110	452	\N
4321	63	452	\N
4322	42	452	\N
4323	\N	452	124
4324	81	453	\N
4325	94	453	\N
4326	150	453	\N
4327	108	453	\N
4328	63	453	\N
4329	42	453	\N
4330	\N	453	110
4331	81	454	\N
4332	91	454	\N
4333	57	454	\N
4334	108	454	\N
4335	63	454	\N
4336	42	454	\N
4337	\N	454	124
4338	81	455	\N
4339	90	455	\N
4340	15	455	\N
4341	110	455	\N
4342	27	455	\N
4343	63	455	\N
4344	42	455	\N
4345	45	455	\N
4346	123	455	\N
4347	\N	455	23
4348	81	456	\N
4349	94	456	\N
4350	57	456	\N
4351	108	456	\N
4352	63	456	\N
4353	42	456	\N
4354	\N	456	125
4355	81	457	\N
4356	90	457	\N
4357	15	457	\N
4358	110	457	\N
4359	27	457	\N
4360	63	457	\N
4361	42	457	\N
4362	45	457	\N
4363	123	457	\N
4364	\N	457	23
4365	81	458	\N
4366	94	458	\N
4367	57	458	\N
4368	108	458	\N
4369	63	458	\N
4370	42	458	\N
4371	\N	458	125
4372	121	459	\N
4373	134	459	\N
4374	132	459	\N
4375	111	459	\N
4376	63	459	\N
4377	42	459	\N
4378	\N	459	126
4379	80	460	\N
4380	134	460	\N
4381	135	460	\N
4382	108	460	\N
4383	63	460	\N
4384	66	460	\N
4385	\N	460	99
4386	81	461	\N
4387	98	461	\N
4388	146	461	\N
4389	110	461	\N
4390	147	461	\N
4391	63	461	\N
4392	42	461	\N
4393	\N	461	50
4394	81	462	\N
4395	90	462	\N
4396	57	462	\N
4397	110	462	\N
4398	63	462	\N
4399	42	462	\N
4400	\N	462	106
4401	80	463	\N
4402	134	463	\N
4403	132	463	\N
4404	110	463	\N
4405	63	463	\N
4406	42	463	\N
4407	\N	463	55
4408	81	464	\N
4409	101	464	\N
4410	146	464	\N
4411	110	464	\N
4412	63	464	\N
4413	42	464	\N
4414	\N	464	50
4415	81	465	\N
4416	90	465	\N
4417	15	465	\N
4418	110	465	\N
4419	27	465	\N
4420	63	465	\N
4421	42	465	\N
4422	45	465	\N
4423	123	465	\N
4424	\N	465	13
4425	81	466	\N
4426	83	466	\N
4427	144	466	\N
4428	110	466	\N
4429	114	466	\N
4430	87	466	\N
4431	42	466	\N
4432	\N	466	67
4433	80	467	\N
4434	134	467	\N
4435	135	467	\N
4436	110	467	\N
4437	63	467	\N
4438	66	467	\N
4439	\N	467	49
4440	81	468	\N
4441	90	468	\N
4442	15	468	\N
4443	110	468	\N
4444	27	468	\N
4445	63	468	\N
4446	42	468	\N
4447	45	468	\N
4448	123	468	\N
4449	\N	468	23
4450	81	469	\N
4451	90	469	\N
4452	15	469	\N
4453	110	469	\N
4454	27	469	\N
4455	63	469	\N
4456	42	469	\N
4457	45	469	\N
4458	123	469	\N
4459	\N	469	8
4460	81	470	\N
4461	56	470	\N
4462	135	470	\N
4463	110	470	\N
4464	165	470	\N
4465	63	470	\N
4466	66	470	\N
4467	\N	470	127
4468	81	471	\N
4469	90	471	\N
4470	15	471	\N
4471	110	471	\N
4472	27	471	\N
4473	63	471	\N
4474	42	471	\N
4475	45	471	\N
4476	123	471	\N
4477	\N	471	23
4478	81	472	\N
4479	92	472	\N
4480	15	472	\N
4481	110	472	\N
4482	27	472	\N
4483	63	472	\N
4484	42	472	\N
4485	45	472	\N
4486	123	472	\N
4487	\N	472	80
4488	81	473	\N
4489	90	473	\N
4490	15	473	\N
4491	110	473	\N
4492	27	473	\N
4493	63	473	\N
4494	42	473	\N
4495	45	473	\N
4496	123	473	\N
4497	\N	473	8
4498	81	474	\N
4499	101	474	\N
4500	146	474	\N
4501	110	474	\N
4502	63	474	\N
4503	42	474	\N
4504	\N	474	50
4512	81	475	\N
4513	101	475	\N
4514	57	475	\N
4515	110	475	\N
4516	147	475	\N
4517	63	475	\N
4518	42	475	\N
4519	\N	475	75
4520	121	476	\N
4521	141	476	\N
4522	57	476	\N
4523	108	476	\N
4524	63	476	\N
4525	42	476	\N
4526	\N	476	75
4527	80	477	\N
4528	101	477	\N
4529	135	477	\N
4530	110	477	\N
4531	63	477	\N
4532	42	477	\N
4533	\N	477	49
4544	81	479	\N
4545	90	479	\N
4546	15	479	\N
4547	110	479	\N
4548	27	479	\N
4549	63	479	\N
4550	42	479	\N
4551	45	479	\N
4552	123	479	\N
4553	\N	479	13
4554	81	480	\N
4555	101	480	\N
4556	146	480	\N
4557	110	480	\N
4558	63	480	\N
4559	42	480	\N
4560	\N	480	50
4561	121	481	\N
4562	101	481	\N
4563	145	481	\N
4564	110	481	\N
4565	27	481	\N
4566	63	481	\N
4567	42	481	\N
4568	45	481	\N
4569	123	481	\N
4570	\N	481	48
4571	81	482	\N
4572	90	482	\N
4573	15	482	\N
4574	110	482	\N
4575	27	482	\N
4576	63	482	\N
4577	42	482	\N
4578	45	482	\N
4579	123	482	\N
4580	\N	482	8
4581	81	483	\N
4582	94	483	\N
4583	144	483	\N
4584	110	483	\N
4585	147	483	\N
4586	87	483	\N
4587	42	483	\N
4588	\N	483	47
4589	80	484	\N
4590	134	484	\N
4591	156	484	\N
4592	110	484	\N
4593	63	484	\N
4594	42	484	\N
4595	\N	484	128
4596	80	485	\N
4597	134	485	\N
4598	135	485	\N
4599	110	485	\N
4600	63	485	\N
4601	42	485	\N
4602	\N	485	49
4603	81	486	\N
4604	90	486	\N
4605	15	486	\N
4606	110	486	\N
4607	27	486	\N
4608	63	486	\N
4609	42	486	\N
4610	45	486	\N
4611	123	486	\N
4612	\N	486	13
4613	81	487	\N
4614	90	487	\N
4615	15	487	\N
4616	110	487	\N
4617	27	487	\N
4618	63	487	\N
4619	42	487	\N
4620	45	487	\N
4621	123	487	\N
4622	\N	487	8
4623	80	488	\N
4624	101	488	\N
4625	156	488	\N
4626	110	488	\N
4627	63	488	\N
4628	42	488	\N
4629	\N	488	128
4630	81	489	\N
4631	98	489	\N
4632	146	489	\N
4633	110	489	\N
4634	63	489	\N
4635	42	489	\N
4636	\N	489	129
4637	80	490	\N
4638	134	490	\N
4639	132	490	\N
4640	110	490	\N
4641	63	490	\N
4642	42	490	\N
4643	\N	490	55
4644	81	491	\N
4645	101	491	\N
4646	137	491	\N
4647	110	491	\N
4648	63	491	\N
4649	42	491	\N
4650	\N	491	39
4651	81	492	\N
4652	101	492	\N
4653	146	492	\N
4654	110	492	\N
4655	63	492	\N
4656	42	492	\N
4657	\N	492	50
4658	81	493	\N
4659	90	493	\N
4660	15	493	\N
4661	110	493	\N
4662	27	493	\N
4663	63	493	\N
4664	42	493	\N
4665	45	493	\N
4666	123	493	\N
4667	\N	493	80
4668	81	478	\N
4669	90	478	\N
4670	15	478	\N
4671	110	478	\N
4672	27	478	\N
4673	63	478	\N
4674	42	478	\N
4675	45	478	\N
4676	123	478	\N
4677	\N	478	13
4678	10	494	\N
4679	94	494	\N
4680	166	494	\N
4681	110	494	\N
4682	63	494	\N
4683	42	494	\N
4684	\N	494	130
4685	81	495	\N
4686	83	495	\N
4687	15	495	\N
4688	110	495	\N
4689	27	495	\N
4690	63	495	\N
4691	42	495	\N
4692	45	495	\N
4693	123	495	\N
4694	\N	495	2
4695	121	496	\N
4696	101	496	\N
4697	156	496	\N
4698	167	496	\N
4699	63	496	\N
4700	42	496	\N
4701	\N	496	131
4702	81	497	\N
4703	90	497	\N
4704	15	497	\N
4705	110	497	\N
4706	27	497	\N
4707	63	497	\N
4708	42	497	\N
4709	45	497	\N
4710	123	497	\N
4711	\N	497	23
4712	81	498	\N
4713	90	498	\N
4714	15	498	\N
4715	110	498	\N
4716	27	498	\N
4717	63	498	\N
4718	42	498	\N
4719	45	498	\N
4720	123	498	\N
4721	\N	498	13
4727	66	499	\N
4729	80	500	\N
4730	101	500	\N
4731	156	500	\N
4732	110	500	\N
4733	63	500	\N
4734	66	500	\N
4735	\N	500	128
4736	80	499	\N
4737	101	499	\N
4738	162	499	\N
4739	110	499	\N
4740	63	499	\N
4741	42	499	\N
4742	\N	499	116
4743	81	501	\N
4744	90	501	\N
4745	15	501	\N
4746	110	501	\N
4747	27	501	\N
4748	63	501	\N
4749	42	501	\N
4750	45	501	\N
4751	123	501	\N
4752	\N	501	80
4753	81	502	\N
4754	92	502	\N
4755	144	502	\N
4756	110	502	\N
4757	114	502	\N
4758	87	502	\N
4759	36	502	\N
4760	42	502	\N
4761	\N	502	47
4762	81	503	\N
4763	101	503	\N
4764	15	503	\N
4765	107	503	\N
4766	27	503	\N
4767	63	503	\N
4768	42	503	\N
4769	\N	503	13
4770	121	504	\N
4771	141	504	\N
4772	57	504	\N
4773	110	504	\N
4774	63	504	\N
4775	42	504	\N
4776	\N	504	75
4777	81	505	\N
4778	90	505	\N
4779	15	505	\N
4780	110	505	\N
4781	27	505	\N
4782	63	505	\N
4783	42	505	\N
4784	45	505	\N
4785	123	505	\N
4786	\N	505	8
4787	81	506	\N
4788	90	506	\N
4789	15	506	\N
4790	60	506	\N
4791	27	506	\N
4792	63	506	\N
4793	42	506	\N
4794	45	506	\N
4795	123	506	\N
4796	\N	506	10
4811	121	509	\N
4812	134	509	\N
4813	148	509	\N
4814	110	509	\N
4815	63	509	\N
4816	66	509	\N
4817	\N	509	93
4818	81	510	\N
4819	94	510	\N
4820	150	510	\N
4821	110	510	\N
4822	63	510	\N
4823	42	510	\N
4824	\N	510	121
4825	121	511	\N
4826	134	511	\N
4827	168	511	\N
4828	110	511	\N
4829	63	511	\N
4830	66	511	\N
4831	\N	511	133
4832	81	512	\N
4833	131	512	\N
4834	132	512	\N
4835	110	512	\N
4836	63	512	\N
4837	66	512	\N
4838	\N	512	29
4839	81	513	\N
4840	100	513	\N
4841	15	513	\N
4842	110	513	\N
4843	27	513	\N
4844	63	513	\N
4845	42	513	\N
4846	\N	513	23
4847	81	514	\N
4848	90	514	\N
4849	15	514	\N
4850	110	514	\N
4851	27	514	\N
4852	63	514	\N
4853	42	514	\N
4854	45	514	\N
4855	123	514	\N
4856	\N	514	23
4857	81	515	\N
4858	90	515	\N
4859	15	515	\N
4860	110	515	\N
4861	27	515	\N
4862	63	515	\N
4863	42	515	\N
4864	45	515	\N
4865	123	515	\N
4866	\N	515	23
4867	81	516	\N
4868	101	516	\N
4869	15	516	\N
4870	110	516	\N
4871	27	516	\N
4872	63	516	\N
4873	42	516	\N
4874	\N	516	16
4875	80	517	\N
4876	101	517	\N
4877	125	517	\N
4878	108	517	\N
4879	87	517	\N
4880	42	517	\N
4881	\N	517	134
4882	81	518	\N
4883	98	518	\N
4884	126	518	\N
4885	110	518	\N
4886	27	518	\N
4887	63	518	\N
4888	42	518	\N
4889	45	518	\N
4890	\N	518	17
4891	81	519	\N
4892	90	519	\N
4893	15	519	\N
4894	110	519	\N
4895	27	519	\N
4896	63	519	\N
4897	42	519	\N
4898	45	519	\N
4899	123	519	\N
4900	\N	519	23
4901	80	520	\N
4902	98	520	\N
4903	162	520	\N
4904	110	520	\N
4905	63	520	\N
4906	66	520	\N
4907	\N	520	116
4908	81	521	\N
4909	91	521	\N
4910	15	521	\N
4911	110	521	\N
4912	27	521	\N
4913	63	521	\N
4914	42	521	\N
4915	45	521	\N
4916	123	521	\N
4917	\N	521	23
4918	81	522	\N
4919	94	522	\N
4920	137	522	\N
4921	110	522	\N
4922	63	522	\N
4923	42	522	\N
4924	\N	522	98
4925	81	523	\N
4926	90	523	\N
4927	15	523	\N
4928	110	523	\N
4929	27	523	\N
4930	63	523	\N
4931	42	523	\N
4932	45	523	\N
4933	123	523	\N
4934	\N	523	7
4935	81	524	\N
4936	83	524	\N
4937	15	524	\N
4938	110	524	\N
4939	27	524	\N
4940	63	524	\N
4941	42	524	\N
4942	45	524	\N
4943	123	524	\N
4944	\N	524	2
4945	81	525	\N
4946	94	525	\N
4947	137	525	\N
4948	110	525	\N
4949	63	525	\N
4950	42	525	\N
4951	\N	525	98
4952	80	526	\N
4953	134	526	\N
4954	169	526	\N
4955	110	526	\N
4956	63	526	\N
4957	42	526	\N
4958	\N	526	135
4959	121	527	\N
4960	134	527	\N
4961	148	527	\N
4962	110	527	\N
4963	63	527	\N
4964	42	527	\N
4965	\N	527	56
4976	81	529	\N
4977	83	529	\N
4978	15	529	\N
4979	110	529	\N
4980	27	529	\N
4981	63	529	\N
4982	42	529	\N
4983	45	529	\N
4984	123	529	\N
4985	\N	529	22
4986	81	530	\N
4987	90	530	\N
4988	126	530	\N
4989	110	530	\N
4990	27	530	\N
4991	63	530	\N
4992	42	530	\N
4993	45	530	\N
4994	\N	530	17
4995	80	531	\N
4996	101	531	\N
4997	135	531	\N
4998	108	531	\N
4999	63	531	\N
5000	66	531	\N
5001	\N	531	99
5002	121	532	\N
5003	101	532	\N
5004	156	532	\N
5005	108	532	\N
5006	63	532	\N
5007	42	532	\N
5008	\N	532	136
5009	81	533	\N
5010	90	533	\N
5011	15	533	\N
5012	110	533	\N
5013	27	533	\N
5014	63	533	\N
5015	42	533	\N
5016	45	533	\N
5017	123	533	\N
5018	\N	533	7
5019	81	534	\N
5020	94	534	\N
5021	57	534	\N
5022	110	534	\N
5023	63	534	\N
5024	42	534	\N
5025	\N	534	105
5026	81	535	\N
5027	90	535	\N
5028	15	535	\N
5029	110	535	\N
5030	27	535	\N
5031	63	535	\N
5032	42	535	\N
5033	45	535	\N
5034	123	535	\N
5035	\N	535	2
5036	81	536	\N
5037	91	536	\N
5038	15	536	\N
5039	110	536	\N
5040	27	536	\N
5041	63	536	\N
5042	42	536	\N
5043	45	536	\N
5044	123	536	\N
5045	\N	536	8
5046	81	537	\N
5047	91	537	\N
5048	15	537	\N
5049	112	537	\N
5050	27	537	\N
5051	63	537	\N
5052	42	537	\N
5053	45	537	\N
5054	123	537	\N
5055	\N	537	8
5056	81	538	\N
5057	101	538	\N
5058	57	538	\N
5059	112	538	\N
5060	63	538	\N
5061	42	538	\N
5062	\N	538	75
5063	81	539	\N
5064	56	539	\N
5065	15	539	\N
5066	110	539	\N
5067	27	539	\N
5068	63	539	\N
5069	42	539	\N
5070	45	539	\N
5071	123	539	\N
5072	\N	539	122
5073	81	540	\N
5074	90	540	\N
5075	15	540	\N
5076	110	540	\N
5077	27	540	\N
5078	63	540	\N
5079	42	540	\N
5080	45	540	\N
5081	123	540	\N
5082	\N	540	8
5083	81	541	\N
5084	90	541	\N
5085	15	541	\N
5086	110	541	\N
5087	27	541	\N
5088	63	541	\N
5089	42	541	\N
5090	45	541	\N
5091	123	541	\N
5092	\N	541	7
5093	81	542	\N
5094	90	542	\N
5095	15	542	\N
5096	110	542	\N
5097	27	542	\N
5098	63	542	\N
5099	42	542	\N
5100	45	542	\N
5101	123	542	\N
5102	\N	542	8
5103	81	543	\N
5104	83	543	\N
5105	15	543	\N
5106	109	543	\N
5107	27	543	\N
5108	63	543	\N
5109	42	543	\N
5110	45	543	\N
5111	123	543	\N
5112	\N	543	23
5113	81	544	\N
5114	83	544	\N
5115	15	544	\N
5116	110	544	\N
5117	27	544	\N
5118	63	544	\N
5119	42	544	\N
5120	45	544	\N
5121	123	544	\N
5122	\N	544	22
5123	81	545	\N
5124	90	545	\N
5125	15	545	\N
5126	110	545	\N
5127	27	545	\N
5128	63	545	\N
5129	42	545	\N
5130	45	545	\N
5131	123	545	\N
5132	\N	545	80
5133	81	528	\N
5134	90	528	\N
5135	15	528	\N
5136	110	528	\N
5137	27	528	\N
5138	63	528	\N
5139	42	528	\N
5140	45	528	\N
5141	123	528	\N
5142	\N	528	23
5143	81	546	\N
5144	94	546	\N
5145	137	546	\N
5146	110	546	\N
5147	63	546	\N
5148	42	546	\N
5149	\N	546	98
5150	80	547	\N
5151	101	547	\N
5152	148	547	\N
5153	110	547	\N
5154	147	547	\N
5155	63	547	\N
5156	42	547	\N
5157	\N	547	56
5158	81	548	\N
5159	90	548	\N
5160	15	548	\N
5161	110	548	\N
5162	27	548	\N
5163	63	548	\N
5164	42	548	\N
5165	45	548	\N
5166	123	548	\N
5167	\N	548	13
5168	81	549	\N
5169	90	549	\N
5170	15	549	\N
5171	110	549	\N
5172	27	549	\N
5173	63	549	\N
5174	42	549	\N
5175	45	549	\N
5176	123	549	\N
5177	\N	549	2
5178	80	550	\N
5179	101	550	\N
5180	132	550	\N
5181	110	550	\N
5182	63	550	\N
5183	66	550	\N
5184	\N	550	102
5185	81	551	\N
5186	90	551	\N
5187	15	551	\N
5188	110	551	\N
5189	27	551	\N
5190	63	551	\N
5191	42	551	\N
5192	45	551	\N
5193	123	551	\N
5194	\N	551	2
5195	81	552	\N
5196	92	552	\N
5197	170	552	\N
5198	108	552	\N
5199	171	552	\N
5200	63	552	\N
5201	42	552	\N
5202	\N	552	137
5203	81	553	\N
5204	90	553	\N
5205	15	553	\N
5206	110	553	\N
5207	27	553	\N
5208	63	553	\N
5209	42	553	\N
5210	45	553	\N
5211	123	553	\N
5212	\N	553	13
5213	81	554	\N
5214	90	554	\N
5215	15	554	\N
5216	110	554	\N
5217	27	554	\N
5218	63	554	\N
5219	42	554	\N
5220	45	554	\N
5221	123	554	\N
5222	\N	554	2
5223	81	555	\N
5224	90	555	\N
5225	15	555	\N
5226	110	555	\N
5227	27	555	\N
5228	63	555	\N
5229	42	555	\N
5230	45	555	\N
5231	123	555	\N
5232	\N	555	2
5233	81	556	\N
5234	95	556	\N
5235	127	556	\N
5236	110	556	\N
5237	63	556	\N
5238	42	556	\N
5239	\N	556	35
5240	81	557	\N
5241	90	557	\N
5242	15	557	\N
5243	110	557	\N
5244	27	557	\N
5245	63	557	\N
5246	42	557	\N
5247	45	557	\N
5248	123	557	\N
5249	\N	557	8
5250	81	558	\N
5251	90	558	\N
5252	15	558	\N
5253	110	558	\N
5254	27	558	\N
5255	63	558	\N
5256	42	558	\N
5257	45	558	\N
5258	123	558	\N
5259	\N	558	13
5260	81	559	\N
5261	101	559	\N
5262	15	559	\N
5263	110	559	\N
5264	27	559	\N
5265	63	559	\N
5266	42	559	\N
5267	45	559	\N
5268	123	559	\N
5269	\N	559	15
5270	81	560	\N
5271	90	560	\N
5272	15	560	\N
5273	110	560	\N
5274	27	560	\N
5275	63	560	\N
5276	42	560	\N
5277	45	560	\N
5278	123	560	\N
5279	\N	560	13
5280	80	561	\N
5281	101	561	\N
5282	137	561	\N
5283	108	561	\N
5284	87	561	\N
5285	66	561	\N
5286	\N	561	39
5287	81	562	\N
5288	90	562	\N
5289	15	562	\N
5290	110	562	\N
5291	27	562	\N
5292	63	562	\N
5293	42	562	\N
5294	45	562	\N
5295	123	562	\N
5296	\N	562	13
5297	121	563	\N
5298	101	563	\N
5299	137	563	\N
5300	108	563	\N
5301	87	563	\N
5302	66	563	\N
5303	\N	563	45
5304	80	564	\N
5305	134	564	\N
5306	135	564	\N
5307	110	564	\N
5308	63	564	\N
5309	66	564	\N
5310	\N	564	138
5311	81	565	\N
5312	90	565	\N
5313	15	565	\N
5314	110	565	\N
5315	27	565	\N
5316	63	565	\N
5317	42	565	\N
5318	45	565	\N
5319	123	565	\N
5320	\N	565	23
5321	121	566	\N
5322	134	566	\N
5323	151	566	\N
5324	110	566	\N
5325	63	566	\N
5326	42	566	\N
5327	\N	566	89
5328	81	567	\N
5329	90	567	\N
5330	15	567	\N
5331	110	567	\N
5332	27	567	\N
5333	63	567	\N
5334	42	567	\N
5335	45	567	\N
5336	123	567	\N
5337	\N	567	13
5338	82	568	\N
5339	134	568	\N
5340	156	568	\N
5341	110	568	\N
5342	63	568	\N
5343	66	568	\N
5344	\N	568	139
5345	121	569	\N
5346	134	569	\N
5347	148	569	\N
5348	110	569	\N
5349	63	569	\N
5350	42	569	\N
5351	\N	569	56
5352	80	570	\N
5353	134	570	\N
5354	132	570	\N
5355	110	570	\N
5356	63	570	\N
5357	42	570	\N
5358	\N	570	54
5359	81	571	\N
5360	90	571	\N
5361	15	571	\N
5362	110	571	\N
5363	27	571	\N
5364	63	571	\N
5365	42	571	\N
5366	45	571	\N
5367	123	571	\N
5368	\N	571	10
5369	81	572	\N
5370	90	572	\N
5371	15	572	\N
5372	110	572	\N
5373	27	572	\N
5374	63	572	\N
5375	42	572	\N
5376	45	572	\N
5377	123	572	\N
5378	\N	572	80
5379	81	573	\N
5380	90	573	\N
5381	15	573	\N
5382	110	573	\N
5383	27	573	\N
5384	63	573	\N
5385	42	573	\N
5386	45	573	\N
5387	123	573	\N
5388	\N	573	2
5389	80	574	\N
5390	134	574	\N
5391	132	574	\N
5392	110	574	\N
5393	63	574	\N
5394	42	574	\N
5395	\N	574	55
5396	80	575	\N
5397	101	575	\N
5398	172	575	\N
5399	109	575	\N
5400	63	575	\N
5401	42	575	\N
5402	\N	575	140
5403	121	576	\N
5404	98	576	\N
5405	145	576	\N
5406	110	576	\N
5407	63	576	\N
5408	42	576	\N
5409	\N	576	48
5410	81	577	\N
5411	90	577	\N
5412	126	577	\N
5413	110	577	\N
5414	27	577	\N
5415	63	577	\N
5416	42	577	\N
5417	45	577	\N
5418	\N	577	17
5419	81	578	\N
5420	90	578	\N
5421	15	578	\N
5422	110	578	\N
5423	27	578	\N
5424	63	578	\N
5425	42	578	\N
5426	45	578	\N
5427	123	578	\N
5428	\N	578	2
5429	81	579	\N
5430	56	579	\N
5431	132	579	\N
5432	110	579	\N
5433	63	579	\N
5434	42	579	\N
5435	\N	579	141
5436	81	580	\N
5437	90	580	\N
5438	15	580	\N
5439	110	580	\N
5440	27	580	\N
5441	63	580	\N
5442	42	580	\N
5443	45	580	\N
5444	123	580	\N
5445	\N	580	23
5446	81	581	\N
5447	90	581	\N
5448	15	581	\N
5449	110	581	\N
5450	27	581	\N
5451	63	581	\N
5452	42	581	\N
5453	45	581	\N
5454	123	581	\N
5455	\N	581	13
5456	80	582	\N
5457	134	582	\N
5458	135	582	\N
5459	110	582	\N
5460	63	582	\N
5461	66	582	\N
5462	\N	582	99
5463	80	583	\N
5464	101	583	\N
5465	173	583	\N
5466	108	583	\N
5467	63	583	\N
5468	42	583	\N
5469	\N	583	142
5470	121	584	\N
5471	101	584	\N
5472	145	584	\N
5473	110	584	\N
5474	27	584	\N
5475	63	584	\N
5476	42	584	\N
5477	45	584	\N
5478	123	584	\N
5479	\N	584	48
5480	81	585	\N
5481	90	585	\N
5482	15	585	\N
5483	110	585	\N
5484	27	585	\N
5485	63	585	\N
5486	42	585	\N
5487	45	585	\N
5488	120	585	\N
5489	\N	585	13
5490	80	586	\N
5491	134	586	\N
5492	132	586	\N
5493	111	586	\N
5494	63	586	\N
5495	42	586	\N
5496	\N	586	55
5497	81	587	\N
5498	90	587	\N
5499	15	587	\N
5500	110	587	\N
5501	27	587	\N
5502	63	587	\N
5503	42	587	\N
5504	45	587	\N
5505	123	587	\N
5506	\N	587	8
5507	81	588	\N
5508	90	588	\N
5509	15	588	\N
5510	110	588	\N
5511	27	588	\N
5512	63	588	\N
5513	42	588	\N
5514	45	588	\N
5515	123	588	\N
5516	\N	588	2
5527	80	590	\N
5528	134	590	\N
5529	132	590	\N
5530	110	590	\N
5531	63	590	\N
5532	66	590	\N
5533	\N	590	102
5534	81	591	\N
5535	90	591	\N
5536	15	591	\N
5537	110	591	\N
5538	27	591	\N
5539	63	591	\N
5540	42	591	\N
5541	45	591	\N
5542	123	591	\N
5543	\N	591	8
5544	81	592	\N
5545	90	592	\N
5546	15	592	\N
5547	110	592	\N
5548	27	592	\N
5549	63	592	\N
5550	42	592	\N
5551	45	592	\N
5552	123	592	\N
5553	\N	592	13
5554	81	593	\N
5555	101	593	\N
5556	146	593	\N
5557	112	593	\N
5558	63	593	\N
5559	42	593	\N
5560	\N	593	50
5561	80	594	\N
5562	101	594	\N
5563	156	594	\N
5564	110	594	\N
5565	63	594	\N
5566	42	594	\N
5567	\N	594	128
5568	81	595	\N
5569	90	595	\N
5570	15	595	\N
5571	110	595	\N
5572	27	595	\N
5573	63	595	\N
5574	42	595	\N
5575	45	595	\N
5576	123	595	\N
5577	\N	595	2
5578	81	596	\N
5579	90	596	\N
5580	15	596	\N
5581	110	596	\N
5582	27	596	\N
5583	63	596	\N
5584	42	596	\N
5585	45	596	\N
5586	123	596	\N
5587	\N	596	80
5588	80	597	\N
5589	134	597	\N
5590	137	597	\N
5591	110	597	\N
5592	63	597	\N
5593	42	597	\N
5594	\N	597	143
5595	81	598	\N
5596	90	598	\N
5597	15	598	\N
5598	110	598	\N
5599	27	598	\N
5600	63	598	\N
5601	42	598	\N
5602	45	598	\N
5603	123	598	\N
5604	\N	598	23
5605	81	599	\N
5606	101	599	\N
5607	15	599	\N
5608	110	599	\N
5609	27	599	\N
5610	63	599	\N
5611	42	599	\N
5612	\N	599	16
5613	81	273	\N
5614	90	273	\N
5615	127	273	\N
5616	110	273	\N
5617	115	273	\N
5618	63	273	\N
5619	42	273	\N
5620	\N	273	71
5621	81	507	\N
5622	90	507	\N
5623	57	507	\N
5624	110	507	\N
5625	63	507	\N
5626	42	507	\N
5627	\N	507	106
5628	81	600	\N
5629	90	600	\N
5630	57	600	\N
5631	110	600	\N
5632	63	600	\N
5633	42	600	\N
5634	\N	600	145
5635	81	601	\N
5636	90	601	\N
5637	15	601	\N
5638	110	601	\N
5639	27	601	\N
5640	63	601	\N
5641	42	601	\N
5642	45	601	\N
5643	123	601	\N
5644	\N	601	13
5645	81	508	\N
5646	98	508	\N
5647	125	508	\N
5648	110	508	\N
5649	63	508	\N
5650	42	508	\N
5651	\N	508	132
5652	121	602	\N
5653	101	602	\N
5654	148	602	\N
5655	110	602	\N
5656	63	602	\N
5657	42	602	\N
5658	\N	602	56
5659	81	603	\N
5660	83	603	\N
5661	15	603	\N
5662	110	603	\N
5663	27	603	\N
5664	63	603	\N
5665	42	603	\N
5666	45	603	\N
5667	123	603	\N
5668	\N	603	38
5669	81	604	\N
5670	90	604	\N
5671	15	604	\N
5672	110	604	\N
5673	27	604	\N
5674	63	604	\N
5675	42	604	\N
5676	45	604	\N
5677	123	604	\N
5678	\N	604	8
5679	81	605	\N
5680	83	605	\N
5681	15	605	\N
5682	110	605	\N
5683	27	605	\N
5684	63	605	\N
5685	42	605	\N
5686	45	605	\N
5687	123	605	\N
5688	\N	605	22
5689	81	606	\N
5690	90	606	\N
5691	15	606	\N
5692	24	606	\N
5693	27	606	\N
5694	63	606	\N
5695	42	606	\N
5696	45	606	\N
5697	123	606	\N
5698	\N	606	2
5699	80	607	\N
5700	101	607	\N
5701	162	607	\N
5702	110	607	\N
5703	63	607	\N
5704	66	607	\N
5705	\N	607	116
5706	81	608	\N
5707	90	608	\N
5708	126	608	\N
5709	110	608	\N
5710	27	608	\N
5711	63	608	\N
5712	42	608	\N
5713	45	608	\N
5714	\N	608	17
5715	81	609	\N
5716	90	609	\N
5717	15	609	\N
5718	110	609	\N
5719	27	609	\N
5720	63	609	\N
5721	42	609	\N
5722	45	609	\N
5723	123	609	\N
5724	\N	609	7
5735	81	611	\N
5736	90	611	\N
5737	15	611	\N
5738	110	611	\N
5739	27	611	\N
5740	63	611	\N
5741	42	611	\N
5742	45	611	\N
5743	123	611	\N
5744	\N	611	7
5745	81	612	\N
5746	83	612	\N
5747	15	612	\N
5748	110	612	\N
5749	27	612	\N
5750	63	612	\N
5751	42	612	\N
5752	45	612	\N
5753	123	612	\N
5754	\N	612	2
5755	81	613	\N
5756	90	613	\N
5757	15	613	\N
5758	110	613	\N
5759	27	613	\N
5760	63	613	\N
5761	42	613	\N
5762	45	613	\N
5763	123	613	\N
5764	\N	613	7
5765	81	614	\N
5766	101	614	\N
5767	15	614	\N
5768	110	614	\N
5769	27	614	\N
5770	63	614	\N
5771	42	614	\N
5772	\N	614	16
5773	81	615	\N
5774	90	615	\N
5775	15	615	\N
5776	110	615	\N
5777	27	615	\N
5778	63	615	\N
5779	42	615	\N
5780	45	615	\N
5781	123	615	\N
5782	\N	615	8
5783	80	616	\N
5784	134	616	\N
5785	156	616	\N
5786	110	616	\N
5787	87	616	\N
5788	42	616	\N
5789	\N	616	146
5790	81	617	\N
5791	101	617	\N
5792	15	617	\N
5793	108	617	\N
5794	27	617	\N
5795	63	617	\N
5796	42	617	\N
5797	\N	617	9
5798	81	618	\N
5799	103	618	\N
5800	15	618	\N
5801	24	618	\N
5802	27	618	\N
5803	87	618	\N
5804	42	618	\N
5805	45	618	\N
5806	\N	618	3
5807	81	619	\N
5808	101	619	\N
5809	15	619	\N
5810	24	619	\N
5811	27	619	\N
5812	87	619	\N
5813	42	619	\N
5814	\N	619	80
5815	81	620	\N
5816	90	620	\N
5817	15	620	\N
5818	110	620	\N
5819	27	620	\N
5820	63	620	\N
5821	42	620	\N
5822	45	620	\N
5823	123	620	\N
5824	\N	620	10
5825	81	621	\N
5826	90	621	\N
5827	15	621	\N
5828	110	621	\N
5829	27	621	\N
5830	63	621	\N
5831	42	621	\N
5832	45	621	\N
5833	123	621	\N
5834	\N	621	23
5835	80	622	\N
5836	101	622	\N
5837	137	622	\N
5838	108	622	\N
5839	87	622	\N
5840	66	622	\N
5841	\N	622	39
5842	81	623	\N
5843	90	623	\N
5844	15	623	\N
5845	110	623	\N
5846	27	623	\N
5847	63	623	\N
5848	42	623	\N
5849	45	623	\N
5850	123	623	\N
5851	\N	623	10
5852	81	624	\N
5853	90	624	\N
5854	15	624	\N
5855	110	624	\N
5856	27	624	\N
5857	63	624	\N
5858	42	624	\N
5859	45	624	\N
5860	123	624	\N
5861	\N	624	23
5862	121	625	\N
5863	101	625	\N
5864	169	625	\N
5865	110	625	\N
5866	27	625	\N
5867	63	625	\N
5868	42	625	\N
5869	\N	625	147
5870	81	626	\N
5871	92	626	\N
5872	15	626	\N
5873	110	626	\N
5874	27	626	\N
5875	87	626	\N
5876	42	626	\N
5877	45	626	\N
5878	68	626	\N
5879	\N	626	80
5880	81	627	\N
5881	83	627	\N
5882	15	627	\N
5883	110	627	\N
5884	27	627	\N
5885	63	627	\N
5886	42	627	\N
5887	45	627	\N
5888	123	627	\N
5889	\N	627	10
5890	81	628	\N
5891	92	628	\N
5892	15	628	\N
5893	110	628	\N
5894	27	628	\N
5895	87	628	\N
5896	42	628	\N
5897	45	628	\N
5898	68	628	\N
5899	\N	628	80
5920	81	629	\N
5921	98	629	\N
5922	15	629	\N
5923	110	629	\N
5924	27	629	\N
5925	63	629	\N
5926	42	629	\N
5927	45	629	\N
5928	68	629	\N
5929	\N	629	9
5930	81	630	\N
5931	98	630	\N
5932	146	630	\N
5933	110	630	\N
5934	63	630	\N
5935	42	630	\N
5936	\N	630	50
5937	81	631	\N
5938	141	631	\N
5939	137	631	\N
5940	108	631	\N
5941	87	631	\N
5942	42	631	\N
5943	\N	631	148
5944	81	632	\N
5945	95	632	\N
5946	146	632	\N
5947	110	632	\N
5948	115	632	\N
5949	87	632	\N
5950	42	632	\N
5951	\N	632	83
5952	81	633	\N
5953	100	633	\N
5954	15	633	\N
5955	110	633	\N
5956	27	633	\N
5957	63	633	\N
5958	42	633	\N
5959	\N	633	10
5960	81	634	\N
5961	90	634	\N
5962	15	634	\N
5963	110	634	\N
5964	27	634	\N
5965	63	634	\N
5966	42	634	\N
5967	45	634	\N
5968	123	634	\N
5969	\N	634	23
5970	81	635	\N
5971	90	635	\N
5972	15	635	\N
5973	110	635	\N
5974	27	635	\N
5975	63	635	\N
5976	42	635	\N
5977	45	635	\N
5978	123	635	\N
5979	\N	635	8
5980	81	636	\N
5981	90	636	\N
5982	15	636	\N
5983	110	636	\N
5984	27	636	\N
5985	63	636	\N
5986	42	636	\N
5987	45	636	\N
5988	123	636	\N
5989	\N	636	8
5990	81	637	\N
5991	90	637	\N
5992	126	637	\N
5993	110	637	\N
5994	27	637	\N
5995	63	637	\N
5996	42	637	\N
5997	45	637	\N
5998	\N	637	17
5999	81	638	\N
6000	90	638	\N
6001	15	638	\N
6002	110	638	\N
6003	27	638	\N
6004	63	638	\N
6005	42	638	\N
6006	45	638	\N
6007	123	638	\N
6008	\N	638	13
6009	81	639	\N
6010	94	639	\N
6011	57	639	\N
6012	110	639	\N
6013	63	639	\N
6014	42	639	\N
6015	\N	639	149
6016	81	640	\N
6017	83	640	\N
6018	15	640	\N
6019	110	640	\N
6020	27	640	\N
6021	63	640	\N
6022	42	640	\N
6023	45	640	\N
6024	123	640	\N
6025	\N	640	22
6026	81	641	\N
6027	90	641	\N
6028	57	641	\N
6029	128	641	\N
6030	63	641	\N
6031	42	641	\N
6032	\N	641	150
6033	81	642	\N
6034	90	642	\N
6035	15	642	\N
6036	110	642	\N
6037	27	642	\N
6038	63	642	\N
6039	42	642	\N
6040	45	642	\N
6041	123	642	\N
6042	\N	642	13
6043	81	643	\N
6044	90	643	\N
6045	15	643	\N
6046	110	643	\N
6047	27	643	\N
6048	63	643	\N
6049	42	643	\N
6050	45	643	\N
6051	123	643	\N
6052	\N	643	23
6053	81	644	\N
6054	94	644	\N
6055	57	644	\N
6056	110	644	\N
6057	63	644	\N
6058	42	644	\N
6059	\N	644	149
6060	81	645	\N
6061	90	645	\N
6062	57	645	\N
6063	110	645	\N
6064	63	645	\N
6065	42	645	\N
6066	\N	645	150
6067	81	646	\N
6068	101	646	\N
6069	135	646	\N
6070	110	646	\N
6071	63	646	\N
6072	66	646	\N
6073	\N	646	32
6074	81	647	\N
6075	91	647	\N
6076	15	647	\N
6077	110	647	\N
6078	27	647	\N
6079	63	647	\N
6080	42	647	\N
6081	45	647	\N
6082	123	647	\N
6083	\N	647	80
6084	81	648	\N
6085	91	648	\N
6086	57	648	\N
6087	110	648	\N
6088	63	648	\N
6089	42	648	\N
6090	\N	648	106
6091	81	649	\N
6092	90	649	\N
6093	15	649	\N
6094	110	649	\N
6095	27	649	\N
6096	63	649	\N
6097	42	649	\N
6098	45	649	\N
6099	123	649	\N
6100	\N	649	2
6101	81	650	\N
6102	90	650	\N
6103	15	650	\N
6104	110	650	\N
6105	27	650	\N
6106	63	650	\N
6107	42	650	\N
6108	45	650	\N
6109	123	650	\N
6110	\N	650	7
6111	81	651	\N
6112	90	651	\N
6113	126	651	\N
6114	110	651	\N
6115	27	651	\N
6116	63	651	\N
6117	42	651	\N
6118	\N	651	17
6119	81	652	\N
6120	91	652	\N
6121	57	652	\N
6122	110	652	\N
6123	63	652	\N
6124	42	652	\N
6125	\N	652	106
6126	81	653	\N
6127	90	653	\N
6128	15	653	\N
6129	110	653	\N
6130	27	653	\N
6131	63	653	\N
6132	42	653	\N
6133	45	653	\N
6134	123	653	\N
6135	\N	653	23
6136	81	654	\N
6137	90	654	\N
6138	15	654	\N
6139	110	654	\N
6140	27	654	\N
6141	63	654	\N
6142	42	654	\N
6143	45	654	\N
6144	123	654	\N
6145	\N	654	8
6146	81	655	\N
6147	101	655	\N
6148	15	655	\N
6149	110	655	\N
6150	27	655	\N
6151	63	655	\N
6152	42	655	\N
6153	45	655	\N
6154	123	655	\N
6155	\N	655	15
6156	81	656	\N
6157	94	656	\N
6158	57	656	\N
6159	110	656	\N
6160	63	656	\N
6161	42	656	\N
6162	\N	656	151
6163	81	657	\N
6164	90	657	\N
6165	15	657	\N
6166	110	657	\N
6167	27	657	\N
6168	63	657	\N
6169	42	657	\N
6170	45	657	\N
6171	123	657	\N
6172	\N	657	38
6173	81	658	\N
6174	92	658	\N
6175	15	658	\N
6176	110	658	\N
6177	27	658	\N
6178	63	658	\N
6179	42	658	\N
6180	45	658	\N
6181	123	658	\N
6182	\N	658	3
6183	81	659	\N
6184	92	659	\N
6185	15	659	\N
6186	110	659	\N
6187	27	659	\N
6188	63	659	\N
6189	42	659	\N
6190	45	659	\N
6191	123	659	\N
6192	\N	659	80
6193	81	660	\N
6194	90	660	\N
6195	15	660	\N
6196	110	660	\N
6197	27	660	\N
6198	63	660	\N
6199	42	660	\N
6200	45	660	\N
6201	123	660	\N
6202	\N	660	23
6203	81	661	\N
6204	90	661	\N
6205	126	661	\N
6206	110	661	\N
6207	27	661	\N
6208	63	661	\N
6209	42	661	\N
6210	45	661	\N
6211	\N	661	17
6212	81	662	\N
6213	91	662	\N
6214	57	662	\N
6215	110	662	\N
6216	63	662	\N
6217	42	662	\N
6218	\N	662	106
6219	81	663	\N
6220	94	663	\N
6221	57	663	\N
6222	110	663	\N
6223	63	663	\N
6224	42	663	\N
6225	\N	663	151
6226	81	664	\N
6227	95	664	\N
6228	127	664	\N
6229	110	664	\N
6230	115	664	\N
6231	63	664	\N
6232	42	664	\N
6233	\N	664	72
6234	80	665	\N
6235	134	665	\N
6236	132	665	\N
6237	110	665	\N
6238	63	665	\N
6239	66	665	\N
6240	\N	665	152
6241	82	666	\N
6242	134	666	\N
6243	135	666	\N
6244	108	666	\N
6245	63	666	\N
6246	66	666	\N
6247	\N	666	153
6248	121	667	\N
6249	134	667	\N
6250	148	667	\N
6251	167	667	\N
6252	63	667	\N
6253	42	667	\N
6254	\N	667	56
6255	81	668	\N
6256	90	668	\N
6257	15	668	\N
6258	110	668	\N
6259	27	668	\N
6260	63	668	\N
6261	42	668	\N
6262	45	668	\N
6263	123	668	\N
6264	\N	668	8
6265	80	669	\N
6266	101	669	\N
6267	135	669	\N
6268	108	669	\N
6269	147	669	\N
6270	63	669	\N
6271	66	669	\N
6272	\N	669	154
6273	121	670	\N
6274	134	670	\N
6275	148	670	\N
6276	110	670	\N
6277	63	670	\N
6278	42	670	\N
6279	\N	670	57
6280	81	671	\N
6281	83	671	\N
6282	15	671	\N
6283	110	671	\N
6284	27	671	\N
6285	63	671	\N
6286	42	671	\N
6287	45	671	\N
6288	123	671	\N
6289	\N	671	21
6290	81	672	\N
6291	90	672	\N
6292	126	672	\N
6293	110	672	\N
6294	27	672	\N
6295	63	672	\N
6296	42	672	\N
6297	45	672	\N
6298	\N	672	17
6299	81	673	\N
6300	91	673	\N
6301	174	673	\N
6302	110	673	\N
6303	63	673	\N
6304	42	673	\N
6305	\N	673	155
6306	81	674	\N
6307	101	674	\N
6308	137	674	\N
6309	112	674	\N
6310	175	674	\N
6311	63	674	\N
6312	42	674	\N
6313	\N	674	98
6314	81	675	\N
6315	94	675	\N
6316	168	675	\N
6317	110	675	\N
6318	63	675	\N
6319	42	675	\N
6320	\N	675	156
6321	57	676	\N
6322	110	676	\N
6323	63	676	\N
6324	42	676	\N
6325	\N	676	157
6326	81	677	\N
6327	94	677	\N
6328	57	677	\N
6329	110	677	\N
6330	63	677	\N
6331	42	677	\N
6332	\N	677	157
6333	81	678	\N
6334	94	678	\N
6335	135	678	\N
6336	110	678	\N
6337	63	678	\N
6338	42	678	\N
6339	\N	678	63
6340	81	679	\N
6341	105	679	\N
6342	15	679	\N
6343	110	679	\N
6344	27	679	\N
6345	63	679	\N
6346	42	679	\N
6347	\N	679	26
6348	80	680	\N
6349	134	680	\N
6350	137	680	\N
6351	87	680	\N
6352	66	680	\N
6353	\N	680	158
6354	121	681	\N
6355	134	681	\N
6356	148	681	\N
6357	110	681	\N
6358	63	681	\N
6359	42	681	\N
6360	\N	681	57
6361	80	682	\N
6362	134	682	\N
6363	148	682	\N
6364	110	682	\N
6365	63	682	\N
6366	42	682	\N
6367	\N	682	56
6368	81	683	\N
6369	92	683	\N
6370	15	683	\N
6371	110	683	\N
6372	27	683	\N
6373	63	683	\N
6374	42	683	\N
6375	45	683	\N
6376	123	683	\N
6377	\N	683	80
6378	121	684	\N
6379	141	684	\N
6380	169	684	\N
6381	108	684	\N
6382	63	684	\N
6383	42	684	\N
6384	\N	684	147
6385	81	685	\N
6386	92	685	\N
6387	15	685	\N
6388	110	685	\N
6389	27	685	\N
6390	63	685	\N
6391	42	685	\N
6392	45	685	\N
6393	123	685	\N
6394	\N	685	80
6395	81	686	\N
6396	101	686	\N
6397	146	686	\N
6398	110	686	\N
6399	147	686	\N
6400	63	686	\N
6401	42	686	\N
6402	\N	686	50
6403	81	687	\N
6404	92	687	\N
6405	15	687	\N
6406	110	687	\N
6407	27	687	\N
6408	63	687	\N
6409	42	687	\N
6410	45	687	\N
6411	123	687	\N
6412	\N	687	3
6413	81	688	\N
6414	91	688	\N
6415	57	688	\N
6416	110	688	\N
6417	175	688	\N
6418	63	688	\N
6419	42	688	\N
6420	\N	688	124
6421	81	689	\N
6422	100	689	\N
6423	57	689	\N
6424	108	689	\N
6425	175	689	\N
6426	63	689	\N
6427	42	689	\N
6428	\N	689	105
6429	81	690	\N
6430	91	690	\N
6431	15	690	\N
6432	110	690	\N
6433	27	690	\N
6434	63	690	\N
6435	42	690	\N
6436	45	690	\N
6437	123	690	\N
6438	\N	690	2
6439	81	691	\N
6440	101	691	\N
6441	15	691	\N
6442	110	691	\N
6443	27	691	\N
6444	63	691	\N
6445	42	691	\N
6446	45	691	\N
6447	123	691	\N
6448	\N	691	10
6449	81	692	\N
6450	91	692	\N
6451	15	692	\N
6452	110	692	\N
6453	27	692	\N
6454	63	692	\N
6455	42	692	\N
6456	45	692	\N
6457	123	692	\N
6458	\N	692	51
6459	81	693	\N
6460	95	693	\N
6461	140	693	\N
6462	110	693	\N
6463	86	693	\N
6464	87	693	\N
6465	42	693	\N
6466	\N	693	159
6467	81	694	\N
6468	83	694	\N
6469	15	694	\N
6470	110	694	\N
6471	27	694	\N
6472	63	694	\N
6473	42	694	\N
6474	45	694	\N
6475	123	694	\N
6476	\N	694	23
6477	81	695	\N
6478	101	695	\N
6479	57	695	\N
6480	108	695	\N
6481	175	695	\N
6482	63	695	\N
6483	42	695	\N
6484	\N	695	124
6485	81	696	\N
6486	95	696	\N
6487	15	696	\N
6488	110	696	\N
6489	27	696	\N
6490	63	696	\N
6491	42	696	\N
6492	\N	696	38
6493	81	697	\N
6494	92	697	\N
6495	15	697	\N
6496	110	697	\N
6497	27	697	\N
6498	63	697	\N
6499	42	697	\N
6500	45	697	\N
6501	123	697	\N
6502	\N	697	80
6503	81	698	\N
6504	91	698	\N
6505	15	698	\N
6506	110	698	\N
6507	27	698	\N
6508	63	698	\N
6509	42	698	\N
6510	45	698	\N
6511	123	698	\N
6512	\N	698	51
6513	81	699	\N
6514	101	699	\N
6515	127	699	\N
6516	110	699	\N
6517	115	699	\N
6518	63	699	\N
6519	42	699	\N
6520	\N	699	160
6521	81	700	\N
6522	95	700	\N
6523	127	700	\N
6524	109	700	\N
6525	115	700	\N
6526	63	700	\N
6527	42	700	\N
6528	\N	700	144
6529	81	701	\N
6530	92	701	\N
6531	15	701	\N
6532	110	701	\N
6533	27	701	\N
6534	63	701	\N
6535	42	701	\N
6536	45	701	\N
6537	123	701	\N
6538	\N	701	80
6539	81	702	\N
6540	91	702	\N
6541	143	702	\N
6542	110	702	\N
6543	87	702	\N
6544	42	702	\N
6545	\N	702	161
6546	81	703	\N
6547	141	703	\N
6548	57	703	\N
6549	110	703	\N
6550	63	703	\N
6551	42	703	\N
6552	\N	703	162
6553	81	704	\N
6554	92	704	\N
6555	57	704	\N
6556	110	704	\N
6557	175	704	\N
6558	63	704	\N
6559	42	704	\N
6560	\N	704	163
6561	81	705	\N
6562	141	705	\N
6563	151	705	\N
6564	108	705	\N
6565	63	705	\N
6566	42	705	\N
6567	\N	705	100
6575	81	706	\N
6576	101	706	\N
6577	135	706	\N
6578	110	706	\N
6579	63	706	\N
6580	42	706	\N
6581	\N	706	32
6582	81	707	\N
6583	91	707	\N
6584	57	707	\N
6585	110	707	\N
6586	175	707	\N
6587	63	707	\N
6588	42	707	\N
6589	\N	707	105
6590	81	708	\N
6591	94	708	\N
6592	57	708	\N
6593	112	708	\N
6594	175	708	\N
6595	63	708	\N
6596	42	708	\N
6597	\N	708	164
6598	80	709	\N
6599	134	709	\N
6600	151	709	\N
6601	128	709	\N
6602	63	709	\N
6603	42	709	\N
6604	\N	709	165
6605	81	710	\N
6606	90	710	\N
6607	15	710	\N
6608	110	710	\N
6609	27	710	\N
6610	63	710	\N
6611	42	710	\N
6612	45	710	\N
6613	123	710	\N
6614	\N	710	7
6615	81	711	\N
6616	90	711	\N
6617	126	711	\N
6618	110	711	\N
6619	27	711	\N
6620	63	711	\N
6621	42	711	\N
6622	45	711	\N
6623	\N	711	17
6624	81	712	\N
6625	90	712	\N
6626	125	712	\N
6627	110	712	\N
6628	63	712	\N
6629	66	712	\N
6630	\N	712	34
6631	81	713	\N
6632	90	713	\N
6633	57	713	\N
6634	110	713	\N
6635	63	713	\N
6636	42	713	\N
6637	\N	713	150
6638	81	714	\N
6639	90	714	\N
6640	57	714	\N
6641	110	714	\N
6642	63	714	\N
6643	42	714	\N
6644	\N	714	150
6645	81	715	\N
6646	90	715	\N
6647	15	715	\N
6648	110	715	\N
6649	27	715	\N
6650	63	715	\N
6651	42	715	\N
6652	45	715	\N
6653	123	715	\N
6654	\N	715	2
6655	81	716	\N
6656	90	716	\N
6657	15	716	\N
6658	110	716	\N
6659	27	716	\N
6660	63	716	\N
6661	42	716	\N
6662	45	716	\N
6663	123	716	\N
6664	\N	716	38
6665	81	717	\N
6666	90	717	\N
6667	57	717	\N
6668	60	717	\N
6669	63	717	\N
6670	42	717	\N
6671	\N	717	166
6672	81	718	\N
6673	90	718	\N
6674	15	718	\N
6675	110	718	\N
6676	27	718	\N
6677	63	718	\N
6678	42	718	\N
6679	45	718	\N
6680	123	718	\N
6681	\N	718	13
6682	81	719	\N
6683	90	719	\N
6684	126	719	\N
6685	110	719	\N
6686	27	719	\N
6687	63	719	\N
6688	42	719	\N
6689	45	719	\N
6690	123	719	\N
6691	\N	719	17
6692	81	720	\N
6693	101	720	\N
6694	135	720	\N
6695	112	720	\N
6696	87	720	\N
6697	42	720	\N
6698	\N	720	87
6699	81	721	\N
6700	90	721	\N
6701	57	721	\N
6702	110	721	\N
6703	63	721	\N
6704	42	721	\N
6705	\N	721	150
6706	80	722	\N
6707	134	722	\N
6708	176	722	\N
6709	108	722	\N
6710	63	722	\N
6711	42	722	\N
6712	\N	722	167
6713	80	723	\N
6714	134	723	\N
6715	135	723	\N
6716	110	723	\N
6717	63	723	\N
6718	66	723	\N
6719	\N	723	168
6720	80	724	\N
6721	134	724	\N
6722	135	724	\N
6723	110	724	\N
6724	63	724	\N
6725	66	724	\N
6726	\N	724	99
6727	81	725	\N
6728	90	725	\N
6729	15	725	\N
6730	110	725	\N
6731	27	725	\N
6732	63	725	\N
6733	42	725	\N
6734	45	725	\N
6735	123	725	\N
6736	\N	725	13
6737	81	726	\N
6738	101	726	\N
6739	146	726	\N
6740	110	726	\N
6741	115	726	\N
6742	63	726	\N
6743	42	726	\N
6744	\N	726	50
6745	81	727	\N
6746	90	727	\N
6747	15	727	\N
6748	110	727	\N
6749	27	727	\N
6750	63	727	\N
6751	42	727	\N
6752	45	727	\N
6753	123	727	\N
6754	\N	727	8
6755	81	728	\N
6756	94	728	\N
6757	150	728	\N
6758	110	728	\N
6759	63	728	\N
6760	42	728	\N
6761	\N	728	121
6762	81	729	\N
6763	90	729	\N
6764	126	729	\N
6765	110	729	\N
6766	27	729	\N
6767	63	729	\N
6768	42	729	\N
6769	45	729	\N
6770	\N	729	17
6771	81	730	\N
6772	92	730	\N
6773	144	730	\N
6774	110	730	\N
6775	114	730	\N
6776	87	730	\N
6777	42	730	\N
6778	\N	730	47
6779	80	731	\N
6780	134	731	\N
6781	132	731	\N
6782	108	731	\N
6783	63	731	\N
6784	66	731	\N
6785	\N	731	102
6786	81	732	\N
6787	90	732	\N
6788	15	732	\N
6789	110	732	\N
6790	27	732	\N
6791	63	732	\N
6792	42	732	\N
6793	45	732	\N
6794	123	732	\N
6795	\N	732	13
6796	81	733	\N
6797	101	733	\N
6798	57	733	\N
6799	108	733	\N
6800	63	733	\N
6801	42	733	\N
6802	\N	733	75
6803	80	734	\N
6804	134	734	\N
6805	159	734	\N
6806	110	734	\N
6807	63	734	\N
6808	66	734	\N
6809	\N	734	169
6810	81	735	\N
6811	90	735	\N
6812	126	735	\N
6813	110	735	\N
6814	27	735	\N
6815	63	735	\N
6816	42	735	\N
6817	45	735	\N
6818	\N	735	17
6819	81	736	\N
6820	90	736	\N
6821	15	736	\N
6822	110	736	\N
6823	27	736	\N
6824	63	736	\N
6825	42	736	\N
6826	45	736	\N
6827	123	736	\N
6828	\N	736	23
6836	81	738	\N
6837	90	738	\N
6838	15	738	\N
6839	110	738	\N
6840	27	738	\N
6841	63	738	\N
6842	42	738	\N
6843	45	738	\N
6844	123	738	\N
6845	\N	738	13
6846	81	739	\N
6847	90	739	\N
6848	126	739	\N
6849	110	739	\N
6850	27	739	\N
6851	63	739	\N
6852	42	739	\N
6853	45	739	\N
6854	\N	739	17
6855	81	740	\N
6856	91	740	\N
6857	15	740	\N
6858	110	740	\N
6859	27	740	\N
6860	63	740	\N
6861	42	740	\N
6862	45	740	\N
6863	123	740	\N
6864	\N	740	2
6865	81	741	\N
6866	56	741	\N
6867	132	741	\N
6868	110	741	\N
6869	63	741	\N
6870	66	741	\N
6871	\N	741	170
6872	81	737	\N
6873	56	737	\N
6874	132	737	\N
6875	110	737	\N
6876	63	737	\N
6877	66	737	\N
6878	\N	737	29
6879	81	742	\N
6880	103	742	\N
6881	138	742	\N
6882	110	742	\N
6883	61	742	\N
6884	87	742	\N
6885	36	742	\N
6886	42	742	\N
6887	\N	742	107
6888	81	743	\N
6889	95	743	\N
6890	15	743	\N
6891	110	743	\N
6892	27	743	\N
6893	63	743	\N
6894	42	743	\N
6895	\N	743	171
6896	81	744	\N
6897	101	744	\N
6898	143	744	\N
6899	107	744	\N
6900	61	744	\N
6901	87	744	\N
6902	36	744	\N
6903	42	744	\N
6904	\N	744	172
6905	81	745	\N
6906	95	745	\N
6907	152	745	\N
6908	110	745	\N
6909	115	745	\N
6910	87	745	\N
6911	42	745	\N
6912	\N	745	173
6913	81	746	\N
6914	141	746	\N
6915	137	746	\N
6916	110	746	\N
6917	87	746	\N
6918	42	746	\N
6919	\N	746	109
6920	81	747	\N
6921	92	747	\N
6922	138	747	\N
6923	108	747	\N
6924	61	747	\N
6925	87	747	\N
6926	42	747	\N
6927	\N	747	40
6928	81	748	\N
6929	83	748	\N
6930	15	748	\N
6931	110	748	\N
6932	27	748	\N
6933	63	748	\N
6934	42	748	\N
6935	45	748	\N
6936	123	748	\N
6937	\N	748	21
6938	81	749	\N
6939	90	749	\N
6940	15	749	\N
6941	110	749	\N
6942	27	749	\N
6943	63	749	\N
6944	42	749	\N
6945	45	749	\N
6946	123	749	\N
6947	\N	749	13
6948	81	750	\N
6949	90	750	\N
6950	15	750	\N
6951	110	750	\N
6952	27	750	\N
6953	63	750	\N
6954	42	750	\N
6955	45	750	\N
6956	123	750	\N
6957	\N	750	2
6958	81	751	\N
6959	101	751	\N
6960	57	751	\N
6961	108	751	\N
6962	63	751	\N
6963	42	751	\N
6964	\N	751	75
6965	81	752	\N
6966	90	752	\N
6967	15	752	\N
6968	110	752	\N
6969	27	752	\N
6970	63	752	\N
6971	42	752	\N
6972	45	752	\N
6973	123	752	\N
6974	\N	752	13
6975	81	753	\N
6976	90	753	\N
6977	126	753	\N
6978	110	753	\N
6979	27	753	\N
6980	63	753	\N
6981	42	753	\N
6982	45	753	\N
6983	123	753	\N
6984	\N	753	17
6985	81	754	\N
6986	90	754	\N
6987	127	754	\N
6988	110	754	\N
6989	115	754	\N
6990	63	754	\N
6991	42	754	\N
6992	\N	754	35
6993	81	755	\N
6994	90	755	\N
6995	127	755	\N
6996	110	755	\N
6997	115	755	\N
6998	63	755	\N
6999	42	755	\N
7000	\N	755	144
7001	81	756	\N
7002	94	756	\N
7003	57	756	\N
7004	110	756	\N
7005	63	756	\N
7006	42	756	\N
7007	\N	756	149
7008	81	757	\N
7009	90	757	\N
7010	15	757	\N
7011	110	757	\N
7012	27	757	\N
7013	63	757	\N
7014	42	757	\N
7015	45	757	\N
7016	123	757	\N
7017	\N	757	13
7018	81	758	\N
7019	90	758	\N
7020	15	758	\N
7021	110	758	\N
7022	27	758	\N
7023	63	758	\N
7024	42	758	\N
7025	45	758	\N
7026	123	758	\N
7027	\N	758	13
7028	81	759	\N
7029	101	759	\N
7030	57	759	\N
7031	108	759	\N
7032	63	759	\N
7033	42	759	\N
7034	\N	759	75
7035	81	760	\N
7036	90	760	\N
7037	15	760	\N
7038	110	760	\N
7039	27	760	\N
7040	63	760	\N
7041	42	760	\N
7042	45	760	\N
7043	123	760	\N
7044	\N	760	23
7045	81	761	\N
7046	94	761	\N
7047	57	761	\N
7048	110	761	\N
7049	63	761	\N
7050	42	761	\N
7051	\N	761	149
7052	81	762	\N
7053	90	762	\N
7054	15	762	\N
7055	110	762	\N
7056	27	762	\N
7057	63	762	\N
7058	42	762	\N
7059	45	762	\N
7060	123	762	\N
7061	\N	762	2
7062	81	763	\N
7063	90	763	\N
7064	126	763	\N
7065	110	763	\N
7066	27	763	\N
7067	63	763	\N
7068	42	763	\N
7069	45	763	\N
7070	\N	763	17
7071	81	764	\N
7072	90	764	\N
7073	57	764	\N
7074	110	764	\N
7075	63	764	\N
7076	42	764	\N
7077	\N	764	150
7078	81	765	\N
7079	90	765	\N
7080	15	765	\N
7081	110	765	\N
7082	27	765	\N
7083	63	765	\N
7084	42	765	\N
7085	45	765	\N
7086	123	765	\N
7087	\N	765	13
7088	81	766	\N
7089	90	766	\N
7090	127	766	\N
7091	110	766	\N
7092	115	766	\N
7093	63	766	\N
7094	42	766	\N
7095	\N	766	144
7096	81	767	\N
7097	90	767	\N
7098	15	767	\N
7099	110	767	\N
7100	27	767	\N
7101	63	767	\N
7102	42	767	\N
7103	45	767	\N
7104	123	767	\N
7105	\N	767	13
7106	81	768	\N
7107	90	768	\N
7108	57	768	\N
7109	110	768	\N
7110	63	768	\N
7111	42	768	\N
7112	\N	768	150
7113	121	769	\N
7114	141	769	\N
7115	148	769	\N
7116	167	769	\N
7117	63	769	\N
7118	42	769	\N
7119	\N	769	56
7120	81	770	\N
7121	92	770	\N
7122	15	770	\N
7123	24	770	\N
7124	27	770	\N
7125	87	770	\N
7126	42	770	\N
7127	45	770	\N
7128	123	770	\N
7129	\N	770	80
7130	81	771	\N
7131	101	771	\N
7132	15	771	\N
7133	110	771	\N
7134	27	771	\N
7135	63	771	\N
7136	42	771	\N
7137	\N	771	82
7138	81	772	\N
7139	83	772	\N
7140	127	772	\N
7141	60	772	\N
7142	115	772	\N
7143	63	772	\N
7144	42	772	\N
7145	\N	772	35
7146	81	773	\N
7147	91	773	\N
7148	15	773	\N
7149	110	773	\N
7150	27	773	\N
7151	63	773	\N
7152	42	773	\N
7153	45	773	\N
7154	123	773	\N
7155	\N	773	23
7156	81	774	\N
7157	83	774	\N
7158	15	774	\N
7159	110	774	\N
7160	27	774	\N
7161	63	774	\N
7162	42	774	\N
7163	45	774	\N
7164	123	774	\N
7165	\N	774	21
7166	81	775	\N
7167	91	775	\N
7168	137	775	\N
7169	110	775	\N
7170	63	775	\N
7171	42	775	\N
7172	\N	775	175
7173	81	776	\N
7174	91	776	\N
7175	132	776	\N
7176	110	776	\N
7177	63	776	\N
7178	66	776	\N
7179	\N	776	141
7180	81	777	\N
7181	94	777	\N
7182	57	777	\N
7183	110	777	\N
7184	63	777	\N
7185	42	777	\N
7186	\N	777	149
7187	81	778	\N
7188	90	778	\N
7189	15	778	\N
7190	110	778	\N
7191	27	778	\N
7192	63	778	\N
7193	42	778	\N
7194	45	778	\N
7195	123	778	\N
7196	\N	778	13
7197	81	779	\N
7198	90	779	\N
7199	126	779	\N
7200	110	779	\N
7201	27	779	\N
7202	63	779	\N
7203	42	779	\N
7204	45	779	\N
7205	\N	779	17
7206	81	780	\N
7207	83	780	\N
7208	15	780	\N
7209	112	780	\N
7210	27	780	\N
7211	63	780	\N
7212	42	780	\N
7213	45	780	\N
7214	123	780	\N
7215	\N	780	22
7216	81	781	\N
7217	94	781	\N
7218	57	781	\N
7219	110	781	\N
7220	63	781	\N
7221	42	781	\N
7222	\N	781	149
7223	81	782	\N
7224	90	782	\N
7225	15	782	\N
7226	110	782	\N
7227	27	782	\N
7228	63	782	\N
7229	42	782	\N
7230	45	782	\N
7231	123	782	\N
7232	\N	782	2
7233	81	783	\N
7234	101	783	\N
7235	132	783	\N
7236	110	783	\N
7237	63	783	\N
7238	66	783	\N
7239	\N	783	170
7250	81	784	\N
7251	90	784	\N
7252	126	784	\N
7253	110	784	\N
7254	27	784	\N
7255	63	784	\N
7256	42	784	\N
7257	45	784	\N
7258	123	784	\N
7259	\N	784	17
7260	81	785	\N
7261	91	785	\N
7262	137	785	\N
7263	110	785	\N
7264	63	785	\N
7265	66	785	\N
7266	\N	785	175
7267	81	786	\N
7268	91	786	\N
7269	132	786	\N
7270	110	786	\N
7271	63	786	\N
7272	66	786	\N
7273	\N	786	141
7274	81	787	\N
7275	90	787	\N
7276	57	787	\N
7277	110	787	\N
7278	117	787	\N
7279	63	787	\N
7280	42	787	\N
7281	\N	787	150
7282	81	788	\N
7283	90	788	\N
7284	126	788	\N
7285	110	788	\N
7286	27	788	\N
7287	63	788	\N
7288	42	788	\N
7289	45	788	\N
7290	123	788	\N
7291	\N	788	17
7292	81	789	\N
7293	90	789	\N
7294	15	789	\N
7295	110	789	\N
7296	27	789	\N
7297	63	789	\N
7298	42	789	\N
7299	45	789	\N
7300	\N	789	11
7301	81	790	\N
7302	90	790	\N
7303	15	790	\N
7304	110	790	\N
7305	27	790	\N
7306	63	790	\N
7307	42	790	\N
7308	45	790	\N
7309	123	790	\N
7310	\N	790	7
7311	81	791	\N
7312	90	791	\N
7313	15	791	\N
7314	110	791	\N
7315	27	791	\N
7316	63	791	\N
7317	42	791	\N
7318	45	791	\N
7319	123	791	\N
7320	\N	791	80
7321	81	792	\N
7322	101	792	\N
7323	15	792	\N
7324	110	792	\N
7325	27	792	\N
7326	63	792	\N
7327	42	792	\N
7328	\N	792	16
7329	81	793	\N
7330	90	793	\N
7331	15	793	\N
7332	110	793	\N
7333	27	793	\N
7334	63	793	\N
7335	42	793	\N
7336	45	793	\N
7337	123	793	\N
7338	\N	793	23
7339	81	794	\N
7340	95	794	\N
7341	15	794	\N
7342	110	794	\N
7343	27	794	\N
7344	63	794	\N
7345	42	794	\N
7346	\N	794	38
7355	81	796	\N
7356	101	796	\N
7357	15	796	\N
7358	110	796	\N
7359	27	796	\N
7360	63	796	\N
7361	42	796	\N
7362	45	796	\N
7363	123	796	\N
7364	\N	796	3
7365	81	797	\N
7366	91	797	\N
7367	15	797	\N
7368	27	797	\N
7369	63	797	\N
7370	42	797	\N
7371	45	797	\N
7372	123	797	\N
7373	\N	797	51
7374	81	798	\N
7375	90	798	\N
7376	15	798	\N
7377	110	798	\N
7378	27	798	\N
7379	63	798	\N
7380	42	798	\N
7381	45	798	\N
7382	123	798	\N
7383	\N	798	7
7384	81	799	\N
7385	134	799	\N
7386	148	799	\N
7387	110	799	\N
7388	63	799	\N
7389	42	799	\N
7390	\N	799	176
7391	81	800	\N
7392	91	800	\N
7393	15	800	\N
7394	110	800	\N
7395	27	800	\N
7396	63	800	\N
7397	42	800	\N
7398	45	800	\N
7399	123	800	\N
7400	\N	800	38
7401	81	801	\N
7402	91	801	\N
7403	15	801	\N
7404	110	801	\N
7405	27	801	\N
7406	63	801	\N
7407	42	801	\N
7408	45	801	\N
7409	123	801	\N
7410	\N	801	51
7421	81	803	\N
7422	91	803	\N
7423	15	803	\N
7424	110	803	\N
7425	27	803	\N
7426	63	803	\N
7427	42	803	\N
7428	45	803	\N
7429	123	803	\N
7430	\N	803	51
7431	81	804	\N
7432	90	804	\N
7433	15	804	\N
7434	110	804	\N
7435	27	804	\N
7436	63	804	\N
7437	42	804	\N
7438	45	804	\N
7439	123	804	\N
7440	\N	804	7
7441	81	805	\N
7442	101	805	\N
7443	15	805	\N
7444	110	805	\N
7445	27	805	\N
7446	63	805	\N
7447	42	805	\N
7448	45	805	\N
7449	123	805	\N
7450	\N	805	23
7451	81	806	\N
7452	90	806	\N
7453	15	806	\N
7454	110	806	\N
7455	27	806	\N
7456	63	806	\N
7457	42	806	\N
7458	45	806	\N
7459	123	806	\N
7460	\N	806	2
7461	81	807	\N
7462	90	807	\N
7463	15	807	\N
7464	110	807	\N
7465	27	807	\N
7466	63	807	\N
7467	42	807	\N
7468	45	807	\N
7469	123	807	\N
7470	\N	807	13
7471	81	808	\N
7472	90	808	\N
7473	15	808	\N
7474	110	808	\N
7475	27	808	\N
7476	63	808	\N
7477	42	808	\N
7478	45	808	\N
7479	123	808	\N
7480	\N	808	13
7481	81	809	\N
7482	101	809	\N
7483	146	809	\N
7484	110	809	\N
7485	27	809	\N
7486	63	809	\N
7487	42	809	\N
7488	\N	809	50
7496	81	811	\N
7497	90	811	\N
7498	15	811	\N
7499	110	811	\N
7500	27	811	\N
7501	63	811	\N
7502	42	811	\N
7503	45	811	\N
7504	123	811	\N
7505	\N	811	13
7506	81	812	\N
7507	90	812	\N
7508	15	812	\N
7509	110	812	\N
7510	27	812	\N
7511	63	812	\N
7512	42	812	\N
7513	45	812	\N
7514	123	812	\N
7515	\N	812	23
7516	121	813	\N
7517	134	813	\N
7518	148	813	\N
7519	160	813	\N
7520	63	813	\N
7521	42	813	\N
7522	\N	813	56
7523	81	814	\N
7524	101	814	\N
7525	15	814	\N
7526	110	814	\N
7527	27	814	\N
7528	63	814	\N
7529	42	814	\N
7530	45	814	\N
7531	123	814	\N
7532	\N	814	7
7533	81	815	\N
7534	90	815	\N
7535	126	815	\N
7536	110	815	\N
7537	27	815	\N
7538	63	815	\N
7539	42	815	\N
7540	45	815	\N
7541	\N	815	17
7542	81	816	\N
7543	90	816	\N
7544	15	816	\N
7545	110	816	\N
7546	27	816	\N
7547	63	816	\N
7548	42	816	\N
7549	45	816	\N
7550	123	816	\N
7551	\N	816	7
7552	121	817	\N
7553	134	817	\N
7554	15	817	\N
7555	108	817	\N
7556	63	817	\N
7557	42	817	\N
7558	\N	817	178
7559	81	818	\N
7560	101	818	\N
7561	137	818	\N
7562	108	818	\N
7563	87	818	\N
7564	42	818	\N
7565	\N	818	109
7566	81	819	\N
7567	90	819	\N
7568	15	819	\N
7569	110	819	\N
7570	27	819	\N
7571	63	819	\N
7572	42	819	\N
7573	45	819	\N
7574	123	819	\N
7575	\N	819	7
7576	81	820	\N
7577	90	820	\N
7578	15	820	\N
7579	110	820	\N
7580	27	820	\N
7581	63	820	\N
7582	42	820	\N
7583	45	820	\N
7584	123	820	\N
7585	\N	820	2
7586	81	821	\N
7587	90	821	\N
7588	15	821	\N
7589	110	821	\N
7590	27	821	\N
7591	63	821	\N
7592	42	821	\N
7593	45	821	\N
7594	123	821	\N
7595	\N	821	13
7596	80	822	\N
7597	134	822	\N
7598	135	822	\N
7599	110	822	\N
7600	63	822	\N
7601	66	822	\N
7602	\N	822	99
7603	81	823	\N
7604	90	823	\N
7605	15	823	\N
7606	110	823	\N
7607	27	823	\N
7608	63	823	\N
7609	42	823	\N
7610	45	823	\N
7611	123	823	\N
7612	\N	823	10
7613	81	365	\N
7614	90	365	\N
7615	15	365	\N
7616	110	365	\N
7617	27	365	\N
7618	63	365	\N
7619	42	365	\N
7620	45	365	\N
7621	\N	365	10
7622	121	824	\N
7623	134	824	\N
7624	57	824	\N
7625	108	824	\N
7626	63	824	\N
7627	42	824	\N
7628	\N	824	179
7629	81	825	\N
7630	101	825	\N
7631	15	825	\N
7632	107	825	\N
7633	27	825	\N
7634	63	825	\N
7635	42	825	\N
7636	\N	825	16
7637	121	387	\N
7638	141	387	\N
7639	151	387	\N
7640	108	387	\N
7641	63	387	\N
7642	42	387	\N
7643	\N	387	89
7654	81	65	\N
7655	91	65	\N
7656	15	65	\N
7657	110	65	\N
7658	27	65	\N
7659	63	65	\N
7660	42	65	\N
7661	45	65	\N
7662	123	65	\N
7663	\N	65	10
7664	81	826	\N
7665	90	826	\N
7666	15	826	\N
7667	110	826	\N
7668	27	826	\N
7669	63	826	\N
7670	42	826	\N
7671	45	826	\N
7672	123	826	\N
7673	\N	826	13
7674	81	827	\N
7675	100	827	\N
7676	57	827	\N
7677	60	827	\N
7678	63	827	\N
7679	42	827	\N
7680	\N	827	180
7681	81	828	\N
7682	141	828	\N
7683	57	828	\N
7684	108	828	\N
7685	63	828	\N
7686	66	828	\N
7687	\N	828	181
7688	81	829	\N
7689	101	829	\N
7690	15	829	\N
7691	110	829	\N
7692	27	829	\N
7693	63	829	\N
7694	42	829	\N
7695	\N	829	82
7696	81	830	\N
7697	100	830	\N
7698	57	830	\N
7699	110	830	\N
7700	63	830	\N
7701	42	830	\N
7702	\N	830	106
7703	81	831	\N
7704	95	831	\N
7705	127	831	\N
7706	110	831	\N
7707	115	831	\N
7708	63	831	\N
7709	42	831	\N
7710	\N	831	35
7711	81	832	\N
7712	98	832	\N
7713	57	832	\N
7714	112	832	\N
7715	63	832	\N
7716	42	832	\N
7717	\N	832	106
7724	\N	833	182
7725	81	834	\N
7726	92	834	\N
7727	15	834	\N
7728	110	834	\N
7729	27	834	\N
7730	63	834	\N
7731	42	834	\N
7732	45	834	\N
7733	68	834	\N
7734	\N	834	85
7735	81	835	\N
7736	94	835	\N
7737	150	835	\N
7738	110	835	\N
7739	63	835	\N
7740	42	835	\N
7741	\N	835	121
7742	81	836	\N
7743	101	836	\N
7744	178	836	\N
7745	110	836	\N
7746	63	836	\N
7747	42	836	\N
7748	\N	836	183
7749	81	837	\N
7750	98	837	\N
7751	146	837	\N
7752	110	837	\N
7753	63	837	\N
7754	42	837	\N
7755	\N	837	50
7756	81	838	\N
7757	92	838	\N
7758	178	838	\N
7759	110	838	\N
7760	63	838	\N
7761	42	838	\N
7762	\N	838	184
7763	81	839	\N
7764	90	839	\N
7765	15	839	\N
7766	110	839	\N
7767	27	839	\N
7768	63	839	\N
7769	42	839	\N
7770	45	839	\N
7771	123	839	\N
7772	\N	839	23
7773	81	840	\N
7774	92	840	\N
7775	15	840	\N
7776	110	840	\N
7777	27	840	\N
7778	63	840	\N
7779	42	840	\N
7780	45	840	\N
7781	123	840	\N
7782	\N	840	80
7783	121	841	\N
7784	101	841	\N
7785	145	841	\N
7786	110	841	\N
7787	63	841	\N
7788	42	841	\N
7789	\N	841	48
7790	81	842	\N
7791	92	842	\N
7792	15	842	\N
7793	110	842	\N
7794	27	842	\N
7795	63	842	\N
7796	42	842	\N
7797	45	842	\N
7798	123	842	\N
7799	\N	842	85
7800	81	843	\N
7801	98	843	\N
7802	57	843	\N
7803	110	843	\N
7804	63	843	\N
7805	42	843	\N
7806	\N	843	149
7807	81	844	\N
7808	90	844	\N
7809	126	844	\N
7810	110	844	\N
7811	27	844	\N
7812	63	844	\N
7813	42	844	\N
7814	45	844	\N
7815	\N	844	17
7816	81	845	\N
7817	94	845	\N
7818	57	845	\N
7819	110	845	\N
7820	63	845	\N
7821	42	845	\N
7822	\N	845	149
7823	81	846	\N
7824	90	846	\N
7825	15	846	\N
7826	110	846	\N
7827	27	846	\N
7828	63	846	\N
7829	42	846	\N
7830	45	846	\N
7831	123	846	\N
7832	\N	846	7
7833	80	847	\N
7834	101	847	\N
7835	135	847	\N
7836	108	847	\N
7837	63	847	\N
7838	42	847	\N
7839	\N	847	49
7840	81	848	\N
7841	90	848	\N
7842	15	848	\N
7843	110	848	\N
7844	27	848	\N
7845	63	848	\N
7846	42	848	\N
7847	45	848	\N
7848	123	848	\N
7849	\N	848	2
7850	81	849	\N
7851	83	849	\N
7852	15	849	\N
7853	110	849	\N
7854	27	849	\N
7855	63	849	\N
7856	42	849	\N
7857	45	849	\N
7858	123	849	\N
7859	\N	849	21
7860	81	850	\N
7861	90	850	\N
7862	57	850	\N
7863	110	850	\N
7864	63	850	\N
7865	42	850	\N
7866	\N	850	150
7867	81	851	\N
7868	90	851	\N
7869	137	851	\N
7870	110	851	\N
7871	63	851	\N
7872	66	851	\N
7873	\N	851	174
7874	80	852	\N
7875	134	852	\N
7876	132	852	\N
7877	110	852	\N
7878	63	852	\N
7879	42	852	\N
7880	\N	852	55
7881	81	853	\N
7882	90	853	\N
7883	15	853	\N
7884	110	853	\N
7885	27	853	\N
7886	63	853	\N
7887	42	853	\N
7888	45	853	\N
7889	123	853	\N
7890	\N	853	2
7905	81	856	\N
7906	90	856	\N
7907	15	856	\N
7908	110	856	\N
7909	27	856	\N
7910	63	856	\N
7911	42	856	\N
7912	45	856	\N
7913	\N	856	11
7914	81	857	\N
7915	141	857	\N
7916	135	857	\N
7917	110	857	\N
7918	87	857	\N
7919	42	857	\N
7920	\N	857	186
7921	81	858	\N
7922	90	858	\N
7923	15	858	\N
7924	110	858	\N
7925	27	858	\N
7926	63	858	\N
7927	42	858	\N
7928	45	858	\N
7929	123	858	\N
7930	\N	858	7
7931	81	859	\N
7932	90	859	\N
7933	15	859	\N
7934	110	859	\N
7935	27	859	\N
7936	30	859	\N
7937	42	859	\N
7938	45	859	\N
7939	123	859	\N
7940	\N	859	7
7949	81	861	\N
7950	134	861	\N
7951	180	861	\N
7952	108	861	\N
7953	63	861	\N
7954	42	861	\N
7955	\N	861	187
7956	81	862	\N
7957	90	862	\N
7958	137	862	\N
7959	110	862	\N
7960	63	862	\N
7961	66	862	\N
7962	\N	862	174
7971	81	864	\N
7972	101	864	\N
7973	57	864	\N
7974	108	864	\N
7975	63	864	\N
7976	42	864	\N
7977	\N	864	75
7978	121	865	\N
7979	134	865	\N
7980	148	865	\N
7981	167	865	\N
7982	63	865	\N
7983	42	865	\N
7984	\N	865	56
7985	80	866	\N
7986	134	866	\N
7987	135	866	\N
7988	110	866	\N
7989	63	866	\N
7990	66	866	\N
7991	\N	866	168
7992	81	867	\N
7993	90	867	\N
7994	15	867	\N
7995	110	867	\N
7996	27	867	\N
7997	63	867	\N
7998	42	867	\N
7999	45	867	\N
8000	123	867	\N
8001	\N	867	13
8009	81	869	\N
8010	90	869	\N
8011	15	869	\N
8012	110	869	\N
8013	27	869	\N
8014	63	869	\N
8015	42	869	\N
8016	45	869	\N
8017	123	869	\N
8018	\N	869	2
8019	81	870	\N
8020	90	870	\N
8021	15	870	\N
8022	110	870	\N
8023	27	870	\N
8024	63	870	\N
8025	42	870	\N
8026	45	870	\N
8027	123	870	\N
8028	\N	870	7
8039	81	872	\N
8040	90	872	\N
8041	15	872	\N
8042	110	872	\N
8043	27	872	\N
8044	63	872	\N
8045	42	872	\N
8046	45	872	\N
8047	123	872	\N
8048	\N	872	13
8049	121	873	\N
8050	134	873	\N
8051	148	873	\N
8052	167	873	\N
8053	63	873	\N
8054	42	873	\N
8055	\N	873	56
8056	81	874	\N
8057	91	874	\N
8058	15	874	\N
8059	110	874	\N
8060	27	874	\N
8061	63	874	\N
8062	42	874	\N
8063	45	874	\N
8064	123	874	\N
8065	\N	874	23
8066	121	875	\N
8067	134	875	\N
8068	148	875	\N
8069	167	875	\N
8070	63	875	\N
8071	42	875	\N
8072	\N	875	56
8073	81	876	\N
8074	90	876	\N
8075	126	876	\N
8076	110	876	\N
8077	27	876	\N
8078	63	876	\N
8079	42	876	\N
8080	45	876	\N
8081	\N	876	17
8082	81	877	\N
8083	90	877	\N
8084	15	877	\N
8085	110	877	\N
8086	27	877	\N
8087	63	877	\N
8088	42	877	\N
8089	45	877	\N
8090	123	877	\N
8091	\N	877	13
8092	121	878	\N
8093	141	878	\N
8094	145	878	\N
8095	108	878	\N
8096	63	878	\N
8097	42	878	\N
8098	\N	878	48
8099	81	879	\N
8100	101	879	\N
8101	57	879	\N
8102	110	879	\N
8103	63	879	\N
8104	42	879	\N
8105	\N	879	75
8106	82	880	\N
8107	134	880	\N
8108	135	880	\N
8109	108	880	\N
8110	63	880	\N
8111	66	880	\N
8112	\N	880	118
8113	81	881	\N
8114	90	881	\N
8115	15	881	\N
8116	110	881	\N
8117	27	881	\N
8118	63	881	\N
8119	42	881	\N
8120	45	881	\N
8121	123	881	\N
8122	\N	881	7
8133	81	883	\N
8134	90	883	\N
8135	15	883	\N
8136	110	883	\N
8137	27	883	\N
8138	63	883	\N
8139	42	883	\N
8140	45	883	\N
8141	123	883	\N
8142	\N	883	2
8143	81	884	\N
8144	101	884	\N
8145	145	884	\N
8146	108	884	\N
8147	63	884	\N
8148	42	884	\N
8149	\N	884	48
8150	81	885	\N
8151	90	885	\N
8152	15	885	\N
8153	110	885	\N
8154	27	885	\N
8155	63	885	\N
8156	42	885	\N
8157	45	885	\N
8158	123	885	\N
8159	\N	885	23
8160	80	886	\N
8161	134	886	\N
8162	135	886	\N
8163	167	886	\N
8164	63	886	\N
8165	66	886	\N
8166	\N	886	99
8167	121	887	\N
8168	101	887	\N
8169	162	887	\N
8170	110	887	\N
8171	63	887	\N
8172	66	887	\N
8173	\N	887	189
8174	81	888	\N
8175	90	888	\N
8176	15	888	\N
8177	110	888	\N
8178	27	888	\N
8179	63	888	\N
8180	42	888	\N
8181	45	888	\N
8182	123	888	\N
8183	\N	888	10
8184	81	889	\N
8185	90	889	\N
8186	15	889	\N
8187	110	889	\N
8188	27	889	\N
8189	63	889	\N
8190	42	889	\N
8191	45	889	\N
8192	123	889	\N
8193	\N	889	2
8194	121	890	\N
8195	134	890	\N
8196	15	890	\N
8197	108	890	\N
8198	63	890	\N
8199	42	890	\N
8200	\N	890	178
8201	81	891	\N
8202	90	891	\N
8203	15	891	\N
8204	110	891	\N
8205	27	891	\N
8206	63	891	\N
8207	42	891	\N
8208	45	891	\N
8209	123	891	\N
8210	\N	891	13
8211	81	892	\N
8212	101	892	\N
8213	146	892	\N
8214	110	892	\N
8215	115	892	\N
8216	63	892	\N
8217	42	892	\N
8218	\N	892	50
8219	121	893	\N
8220	101	893	\N
8221	162	893	\N
8222	110	893	\N
8223	63	893	\N
8224	66	893	\N
8225	\N	893	189
8226	80	894	\N
8227	101	894	\N
8228	132	894	\N
8229	110	894	\N
8230	63	894	\N
8231	42	894	\N
8232	\N	894	55
8233	81	895	\N
8234	90	895	\N
8235	15	895	\N
8236	110	895	\N
8237	27	895	\N
8238	63	895	\N
8239	42	895	\N
8240	45	895	\N
8241	123	895	\N
8242	\N	895	13
8243	80	896	\N
8244	134	896	\N
8245	135	896	\N
8246	110	896	\N
8247	63	896	\N
8248	66	896	\N
8249	\N	896	99
8250	81	897	\N
8251	90	897	\N
8252	15	897	\N
8253	110	897	\N
8254	27	897	\N
8255	63	897	\N
8256	42	897	\N
8257	45	897	\N
8258	123	897	\N
8259	\N	897	13
8260	81	898	\N
8261	90	898	\N
8262	126	898	\N
8263	110	898	\N
8264	27	898	\N
8265	63	898	\N
8266	42	898	\N
8267	45	898	\N
8268	\N	898	17
8269	121	899	\N
8270	101	899	\N
8271	145	899	\N
8272	108	899	\N
8273	63	899	\N
8274	42	899	\N
8275	\N	899	48
8276	80	900	\N
8277	134	900	\N
8278	132	900	\N
8279	110	900	\N
8280	63	900	\N
8281	66	900	\N
8282	\N	900	102
8283	121	901	\N
8284	134	901	\N
8285	148	901	\N
8286	108	901	\N
8287	63	901	\N
8288	42	901	\N
8289	\N	901	56
8297	81	903	\N
8298	90	903	\N
8299	15	903	\N
8300	110	903	\N
8301	27	903	\N
8302	63	903	\N
8303	42	903	\N
8304	45	903	\N
8305	123	903	\N
8306	\N	903	13
8307	81	904	\N
8308	90	904	\N
8309	15	904	\N
8310	110	904	\N
8311	27	904	\N
8312	63	904	\N
8313	42	904	\N
8314	45	904	\N
8315	123	904	\N
8316	\N	904	23
8317	81	905	\N
8318	90	905	\N
8319	126	905	\N
8320	110	905	\N
8321	27	905	\N
8322	63	905	\N
8323	42	905	\N
8324	45	905	\N
8325	\N	905	20
8326	121	906	\N
8327	134	906	\N
8328	57	906	\N
8329	108	906	\N
8330	63	906	\N
8331	42	906	\N
8332	\N	906	75
8333	81	907	\N
8334	134	907	\N
8335	57	907	\N
8336	110	907	\N
8337	63	907	\N
8338	42	907	\N
8339	\N	907	75
8340	81	908	\N
8341	90	908	\N
8342	15	908	\N
8343	110	908	\N
8344	27	908	\N
8345	63	908	\N
8346	42	908	\N
8347	45	908	\N
8348	123	908	\N
8349	\N	908	7
8350	81	909	\N
8351	98	909	\N
8352	15	909	\N
8353	110	909	\N
8354	27	909	\N
8355	63	909	\N
8356	42	909	\N
8357	45	909	\N
8358	123	909	\N
8359	\N	909	13
8360	81	910	\N
8361	95	910	\N
8362	127	910	\N
8363	110	910	\N
8364	115	910	\N
8365	87	910	\N
8366	42	910	\N
8367	\N	910	160
8368	81	911	\N
8369	101	911	\N
8370	137	911	\N
8371	108	911	\N
8372	87	911	\N
8373	42	911	\N
8374	\N	911	45
8375	81	912	\N
8376	90	912	\N
8377	15	912	\N
8378	110	912	\N
8379	27	912	\N
8380	63	912	\N
8381	42	912	\N
8382	45	912	\N
8383	123	912	\N
8384	\N	912	2
8385	81	913	\N
8386	90	913	\N
8387	15	913	\N
8388	110	913	\N
8389	27	913	\N
8390	63	913	\N
8391	42	913	\N
8392	45	913	\N
8393	\N	913	10
8394	81	914	\N
8395	90	914	\N
8396	15	914	\N
8397	110	914	\N
8398	27	914	\N
8399	63	914	\N
8400	42	914	\N
8401	45	914	\N
8402	123	914	\N
8403	\N	914	10
8404	81	915	\N
8405	90	915	\N
8406	126	915	\N
8407	110	915	\N
8408	27	915	\N
8409	63	915	\N
8410	42	915	\N
8411	45	915	\N
8412	\N	915	17
8413	81	916	\N
8414	90	916	\N
8415	125	916	\N
8416	110	916	\N
8417	63	916	\N
8418	42	916	\N
8419	\N	916	34
8420	81	917	\N
8421	83	917	\N
8422	57	917	\N
8423	110	917	\N
8424	63	917	\N
8425	42	917	\N
8426	\N	917	36
8427	81	918	\N
8428	90	918	\N
8429	125	918	\N
8430	110	918	\N
8431	63	918	\N
8432	42	918	\N
8433	\N	918	34
8434	82	919	\N
8435	134	919	\N
8436	156	919	\N
8437	110	919	\N
8438	63	919	\N
8439	42	919	\N
8440	\N	919	190
8441	81	920	\N
8442	101	920	\N
8443	146	920	\N
8444	110	920	\N
8445	27	920	\N
8446	63	920	\N
8447	42	920	\N
8448	\N	920	50
8449	81	921	\N
8450	90	921	\N
8451	15	921	\N
8452	110	921	\N
8453	27	921	\N
8454	63	921	\N
8455	42	921	\N
8456	45	921	\N
8457	123	921	\N
8458	\N	921	23
8459	121	922	\N
8460	134	922	\N
8461	148	922	\N
8462	160	922	\N
8463	63	922	\N
8464	42	922	\N
8465	\N	922	56
8466	80	923	\N
8467	134	923	\N
8468	135	923	\N
8469	110	923	\N
8470	63	923	\N
8471	42	923	\N
8472	\N	923	49
8473	81	924	\N
8474	90	924	\N
8475	15	924	\N
8476	110	924	\N
8477	27	924	\N
8478	63	924	\N
8479	42	924	\N
8480	45	924	\N
8481	123	924	\N
8482	\N	924	13
8483	81	925	\N
8484	101	925	\N
8485	57	925	\N
8486	107	925	\N
8487	181	925	\N
8488	63	925	\N
8489	42	925	\N
8490	\N	925	75
8491	81	926	\N
8492	90	926	\N
8493	15	926	\N
8494	110	926	\N
8495	27	926	\N
8496	63	926	\N
8497	42	926	\N
8498	45	926	\N
8499	123	926	\N
8500	\N	926	2
8501	81	927	\N
8502	90	927	\N
8503	15	927	\N
8504	110	927	\N
8505	27	927	\N
8506	63	927	\N
8507	42	927	\N
8508	45	927	\N
8509	123	927	\N
8510	\N	927	2
8511	81	928	\N
8512	90	928	\N
8513	15	928	\N
8514	110	928	\N
8515	27	928	\N
8516	63	928	\N
8517	42	928	\N
8518	45	928	\N
8519	123	928	\N
8520	\N	928	7
8521	121	929	\N
8522	134	929	\N
8523	148	929	\N
8524	167	929	\N
8525	63	929	\N
8526	42	929	\N
8527	\N	929	56
8528	121	930	\N
8529	101	930	\N
8530	145	930	\N
8531	110	930	\N
8532	63	930	\N
8533	42	930	\N
8534	\N	930	48
8535	80	931	\N
8536	134	931	\N
8537	132	931	\N
8538	110	931	\N
8539	63	931	\N
8540	42	931	\N
8541	\N	931	55
8542	121	932	\N
8543	106	932	\N
8544	169	932	\N
8545	108	932	\N
8546	63	932	\N
8547	42	932	\N
8548	\N	932	147
8549	81	933	\N
8550	90	933	\N
8551	15	933	\N
8552	110	933	\N
8553	27	933	\N
8554	63	933	\N
8555	42	933	\N
8556	45	933	\N
8557	123	933	\N
8558	\N	933	13
8559	81	934	\N
8560	90	934	\N
8561	15	934	\N
8562	110	934	\N
8563	27	934	\N
8564	63	934	\N
8565	42	934	\N
8566	45	934	\N
8567	123	934	\N
8568	\N	934	7
8569	81	935	\N
8570	101	935	\N
8571	57	935	\N
8572	110	935	\N
8573	182	935	\N
8574	63	935	\N
8575	42	935	\N
8576	\N	935	145
8577	81	936	\N
8578	101	936	\N
8579	169	936	\N
8580	110	936	\N
8581	63	936	\N
8582	42	936	\N
8583	\N	936	147
8584	81	937	\N
8585	90	937	\N
8586	15	937	\N
8587	110	937	\N
8588	27	937	\N
8589	63	937	\N
8590	42	937	\N
8591	45	937	\N
8592	120	937	\N
8593	\N	937	2
8594	81	938	\N
8595	90	938	\N
8596	127	938	\N
8597	110	938	\N
8598	115	938	\N
8599	63	938	\N
8600	42	938	\N
8601	\N	938	191
8602	81	939	\N
8603	83	939	\N
8604	157	939	\N
8605	110	939	\N
8606	87	939	\N
8607	42	939	\N
8608	\N	939	192
8609	81	940	\N
8610	90	940	\N
8611	15	940	\N
8612	110	940	\N
8613	27	940	\N
8614	63	940	\N
8615	42	940	\N
8616	45	940	\N
8617	123	940	\N
8618	\N	940	2
8619	81	941	\N
8620	134	941	\N
8621	57	941	\N
8622	110	941	\N
8623	63	941	\N
8624	42	941	\N
8625	\N	941	75
8626	81	942	\N
8627	90	942	\N
8628	126	942	\N
8629	110	942	\N
8630	27	942	\N
8631	63	942	\N
8632	42	942	\N
8633	45	942	\N
8634	\N	942	17
8635	81	943	\N
8636	90	943	\N
8637	15	943	\N
8638	110	943	\N
8639	27	943	\N
8640	63	943	\N
8641	42	943	\N
8642	45	943	\N
8643	123	943	\N
8644	\N	943	2
8645	121	944	\N
8646	141	944	\N
8647	57	944	\N
8648	110	944	\N
8649	63	944	\N
8650	42	944	\N
8651	\N	944	75
8652	80	945	\N
8653	93	945	\N
8654	132	945	\N
8655	122	945	\N
8656	108	945	\N
8657	\N	945	54
8664	81	946	\N
8665	83	946	\N
8666	126	946	\N
8667	79	946	\N
8668	60	946	\N
8669	\N	946	19
8670	81	948	\N
8671	141	948	\N
8672	169	948	\N
8673	85	948	\N
8674	60	948	\N
8675	27	948	\N
8676	\N	948	135
8697	81	443	\N
8698	90	443	\N
8699	15	443	\N
8700	110	443	\N
8701	27	443	\N
8702	63	443	\N
8703	42	443	\N
8704	45	443	\N
8705	123	443	\N
8706	\N	443	2
8723	82	949	\N
8724	134	949	\N
8725	162	949	\N
8726	85	949	\N
8727	24	949	\N
8728	171	949	\N
8729	30	949	\N
8730	87	949	\N
8731	36	949	\N
8732	118	949	\N
8733	42	949	\N
8734	45	949	\N
8735	123	949	\N
8736	51	949	\N
8737	54	949	\N
8738	\N	949	116
8739	81	950	\N
8740	90	950	\N
8741	15	950	\N
8742	110	950	\N
8743	27	950	\N
8744	185	950	\N
8745	63	950	\N
8746	42	950	\N
8747	45	950	\N
8748	123	950	\N
8749	\N	950	7
8750	81	951	\N
8751	90	951	\N
8752	126	951	\N
8753	110	951	\N
8754	27	951	\N
8755	185	951	\N
8756	63	951	\N
8757	42	951	\N
8758	45	951	\N
8759	\N	951	17
8760	121	952	\N
8761	101	952	\N
8762	57	952	\N
8763	112	952	\N
8764	181	952	\N
8765	185	952	\N
8766	63	952	\N
8767	42	952	\N
8768	\N	952	75
8769	81	953	\N
8770	90	953	\N
8771	15	953	\N
8772	110	953	\N
8773	27	953	\N
8774	185	953	\N
8775	63	953	\N
8776	42	953	\N
8777	45	953	\N
8778	123	953	\N
8779	\N	953	2
8780	81	954	\N
8781	90	954	\N
8782	15	954	\N
8783	110	954	\N
8784	27	954	\N
8785	185	954	\N
8786	63	954	\N
8787	42	954	\N
8788	45	954	\N
8789	123	954	\N
8790	\N	954	13
8791	81	955	\N
8792	56	955	\N
8793	137	955	\N
8794	110	955	\N
8795	187	955	\N
8796	183	955	\N
8797	63	955	\N
8798	42	955	\N
8799	\N	955	174
8800	81	956	\N
8801	90	956	\N
8802	126	956	\N
8803	110	956	\N
8804	27	956	\N
8805	185	956	\N
8806	63	956	\N
8807	42	956	\N
8808	45	956	\N
8809	\N	956	17
8810	81	957	\N
8811	90	957	\N
8812	15	957	\N
8813	110	957	\N
8814	27	957	\N
8815	185	957	\N
8816	63	957	\N
8817	42	957	\N
8818	45	957	\N
8819	123	957	\N
8820	\N	957	80
8821	80	958	\N
8822	134	958	\N
8823	159	958	\N
8824	110	958	\N
8825	185	958	\N
8826	63	958	\N
8827	66	958	\N
8828	\N	958	104
8829	81	959	\N
8830	90	959	\N
8831	15	959	\N
8832	110	959	\N
8833	27	959	\N
8834	185	959	\N
8835	63	959	\N
8836	42	959	\N
8837	45	959	\N
8838	123	959	\N
8839	\N	959	8
8840	81	960	\N
8841	90	960	\N
8842	15	960	\N
8843	110	960	\N
8844	27	960	\N
8845	185	960	\N
8846	63	960	\N
8847	42	960	\N
8848	45	960	\N
8849	123	960	\N
8850	\N	960	2
8851	121	961	\N
8852	101	961	\N
8853	15	961	\N
8854	24	961	\N
8855	185	961	\N
8856	63	961	\N
8857	42	961	\N
8858	\N	961	178
8859	80	962	\N
8860	134	962	\N
8861	132	962	\N
8862	108	962	\N
8863	185	962	\N
8864	63	962	\N
8865	42	962	\N
8866	\N	962	55
8867	81	963	\N
8868	90	963	\N
8869	137	963	\N
8870	110	963	\N
8871	187	963	\N
8872	185	963	\N
8873	63	963	\N
8874	66	963	\N
8875	67	963	\N
8876	\N	963	174
8877	81	964	\N
8878	90	964	\N
8879	15	964	\N
8880	110	964	\N
8881	27	964	\N
8882	185	964	\N
8883	63	964	\N
8884	42	964	\N
8885	45	964	\N
8886	123	964	\N
8887	\N	964	2
8888	81	965	\N
8889	90	965	\N
8890	15	965	\N
8891	110	965	\N
8892	27	965	\N
8893	185	965	\N
8894	63	965	\N
8895	42	965	\N
8896	45	965	\N
8897	123	965	\N
8898	\N	965	8
8899	81	966	\N
8900	131	966	\N
8901	132	966	\N
8902	110	966	\N
8903	186	966	\N
8904	63	966	\N
8905	66	966	\N
8906	\N	966	141
8907	81	967	\N
8908	101	967	\N
8909	137	967	\N
8910	110	967	\N
8911	185	967	\N
8912	63	967	\N
8913	42	967	\N
8914	\N	967	45
8915	81	968	\N
8916	90	968	\N
8917	15	968	\N
8918	110	968	\N
8919	27	968	\N
8920	185	968	\N
8921	63	968	\N
8922	42	968	\N
8923	45	968	\N
8924	123	968	\N
8925	\N	968	2
8926	81	969	\N
8927	90	969	\N
8928	15	969	\N
8929	110	969	\N
8930	27	969	\N
8931	185	969	\N
8932	63	969	\N
8933	42	969	\N
8934	45	969	\N
8935	123	969	\N
8936	\N	969	2
8937	81	970	\N
8938	90	970	\N
8939	15	970	\N
8940	110	970	\N
8941	27	970	\N
8942	185	970	\N
8943	63	970	\N
8944	42	970	\N
8945	45	970	\N
8946	123	970	\N
8947	\N	970	2
8948	81	971	\N
8949	90	971	\N
8950	126	971	\N
8951	110	971	\N
8952	27	971	\N
8953	185	971	\N
8954	63	971	\N
8955	42	971	\N
8956	45	971	\N
8957	123	971	\N
8958	\N	971	17
8959	81	972	\N
8960	90	972	\N
8961	15	972	\N
8962	110	972	\N
8963	27	972	\N
8964	185	972	\N
8965	63	972	\N
8966	42	972	\N
8967	45	972	\N
8968	123	972	\N
8969	\N	972	8
8970	81	973	\N
8971	101	973	\N
8972	144	973	\N
8973	110	973	\N
8974	185	973	\N
8975	87	973	\N
8976	42	973	\N
8977	\N	973	86
8978	81	974	\N
8979	90	974	\N
8980	15	974	\N
8981	110	974	\N
8982	27	974	\N
8983	185	974	\N
8984	63	974	\N
8985	42	974	\N
8986	45	974	\N
8987	123	974	\N
8988	\N	974	2
9000	81	976	\N
9001	90	976	\N
9002	15	976	\N
9003	110	976	\N
9004	27	976	\N
9005	185	976	\N
9006	63	976	\N
9007	42	976	\N
9008	45	976	\N
9009	123	976	\N
9010	\N	976	8
9011	81	977	\N
9012	131	977	\N
9013	137	977	\N
9014	110	977	\N
9015	187	977	\N
9016	183	977	\N
9017	63	977	\N
9018	66	977	\N
9019	\N	977	174
9020	81	975	\N
9021	90	975	\N
9022	15	975	\N
9023	110	975	\N
9024	27	975	\N
9025	185	975	\N
9026	63	975	\N
9027	42	975	\N
9028	45	975	\N
9029	123	975	\N
9030	\N	975	13
9031	81	91	\N
9032	56	91	\N
9033	126	91	\N
9034	110	91	\N
9035	27	91	\N
9036	63	91	\N
9037	42	91	\N
9038	45	91	\N
9039	\N	91	20
9040	81	978	\N
9041	90	978	\N
9042	15	978	\N
9043	110	978	\N
9044	27	978	\N
9045	185	978	\N
9046	63	978	\N
9047	42	978	\N
9048	45	978	\N
9049	123	978	\N
9050	\N	978	8
9051	81	979	\N
9052	90	979	\N
9053	15	979	\N
9054	110	979	\N
9055	27	979	\N
9056	185	979	\N
9057	63	979	\N
9058	42	979	\N
9059	45	979	\N
9060	123	979	\N
9061	\N	979	2
9062	81	980	\N
9063	83	980	\N
9064	15	980	\N
9065	110	980	\N
9066	27	980	\N
9067	185	980	\N
9068	63	980	\N
9069	42	980	\N
9070	45	980	\N
9071	123	980	\N
9072	\N	980	21
9073	81	981	\N
9074	131	981	\N
9075	57	981	\N
9076	110	981	\N
9077	183	981	\N
9078	63	981	\N
9079	66	981	\N
9080	81	982	\N
9081	90	982	\N
9082	15	982	\N
9083	110	982	\N
9084	27	982	\N
9085	185	982	\N
9086	63	982	\N
9087	42	982	\N
9088	45	982	\N
9089	123	982	\N
9090	\N	982	8
9091	81	983	\N
9092	90	983	\N
9093	15	983	\N
9094	110	983	\N
9095	27	983	\N
9096	185	983	\N
9097	63	983	\N
9098	42	983	\N
9099	45	983	\N
9100	123	983	\N
9101	\N	983	13
9102	81	984	\N
9103	90	984	\N
9104	15	984	\N
9105	110	984	\N
9106	27	984	\N
9107	185	984	\N
9108	63	984	\N
9109	42	984	\N
9110	45	984	\N
9111	123	984	\N
9112	\N	984	10
9113	81	985	\N
9114	100	985	\N
9115	57	985	\N
9116	110	985	\N
9117	185	985	\N
9118	63	985	\N
9119	42	985	\N
9120	\N	985	194
9121	81	986	\N
9122	90	986	\N
9123	126	986	\N
9124	110	986	\N
9125	27	986	\N
9126	185	986	\N
9127	63	986	\N
9128	42	986	\N
9129	45	986	\N
9130	\N	986	17
9131	81	987	\N
9132	101	987	\N
9133	15	987	\N
9134	110	987	\N
9135	27	987	\N
9136	185	987	\N
9137	63	987	\N
9138	42	987	\N
9139	\N	987	16
9140	81	988	\N
9141	101	988	\N
9142	146	988	\N
9143	110	988	\N
9144	115	988	\N
9145	185	988	\N
9146	63	988	\N
9147	42	988	\N
9148	\N	988	50
9149	80	989	\N
9150	134	989	\N
9151	132	989	\N
9152	108	989	\N
9153	185	989	\N
9154	63	989	\N
9155	42	989	\N
9156	\N	989	55
9157	121	990	\N
9158	134	990	\N
9159	148	990	\N
9160	108	990	\N
9161	185	990	\N
9162	63	990	\N
9163	42	990	\N
9164	\N	990	57
9165	81	991	\N
9166	90	991	\N
9167	15	991	\N
9168	110	991	\N
9169	27	991	\N
9170	185	991	\N
9171	63	991	\N
9172	42	991	\N
9173	45	991	\N
9174	123	991	\N
9175	\N	991	2
9176	81	992	\N
9177	95	992	\N
9178	57	992	\N
9179	110	992	\N
9180	184	992	\N
9181	63	992	\N
9182	42	992	\N
9183	\N	992	195
9184	81	993	\N
9185	90	993	\N
9186	15	993	\N
9187	110	993	\N
9188	27	993	\N
9189	185	993	\N
9190	63	993	\N
9191	42	993	\N
9192	45	993	\N
9193	123	993	\N
9194	\N	993	2
9195	81	994	\N
9196	90	994	\N
9197	15	994	\N
9198	110	994	\N
9199	27	994	\N
9200	185	994	\N
9201	63	994	\N
9202	42	994	\N
9203	45	994	\N
9204	123	994	\N
9205	\N	994	8
9206	81	995	\N
9207	90	995	\N
9208	15	995	\N
9209	110	995	\N
9210	27	995	\N
9211	185	995	\N
9212	63	995	\N
9213	42	995	\N
9214	45	995	\N
9215	123	995	\N
9216	\N	995	2
9217	81	996	\N
9218	90	996	\N
9219	127	996	\N
9220	110	996	\N
9221	115	996	\N
9222	185	996	\N
9223	63	996	\N
9224	42	996	\N
9225	45	996	\N
9226	123	996	\N
9227	\N	996	35
9228	80	997	\N
9229	134	997	\N
9230	162	997	\N
9231	108	997	\N
9232	185	997	\N
9233	63	997	\N
9234	66	997	\N
9235	\N	997	189
9236	81	998	\N
9237	90	998	\N
9238	15	998	\N
9239	110	998	\N
9240	27	998	\N
9241	185	998	\N
9242	63	998	\N
9243	42	998	\N
9244	45	998	\N
9245	123	998	\N
9246	\N	998	8
9247	81	999	\N
9248	101	999	\N
9249	137	999	\N
9250	108	999	\N
9251	185	999	\N
9252	87	999	\N
9253	42	999	\N
9254	\N	999	45
9255	121	1000	\N
9256	134	1000	\N
9257	162	1000	\N
9258	110	1000	\N
9259	185	1000	\N
9260	63	1000	\N
9261	66	1000	\N
9262	\N	1000	189
9263	81	1001	\N
9264	90	1001	\N
9265	15	1001	\N
9266	110	1001	\N
9267	27	1001	\N
9268	185	1001	\N
9269	63	1001	\N
9270	42	1001	\N
9271	45	1001	\N
9272	123	1001	\N
9273	\N	1001	10
9274	81	1002	\N
9275	131	1002	\N
9276	132	1002	\N
9277	110	1002	\N
9278	186	1002	\N
9279	63	1002	\N
9280	66	1002	\N
9281	\N	1002	141
9282	81	1003	\N
9283	83	1003	\N
9284	126	1003	\N
9285	110	1003	\N
9286	27	1003	\N
9287	185	1003	\N
9288	63	1003	\N
9289	42	1003	\N
9290	45	1003	\N
9291	\N	1003	196
9292	81	1004	\N
9293	90	1004	\N
9294	126	1004	\N
9295	110	1004	\N
9296	27	1004	\N
9297	185	1004	\N
9298	63	1004	\N
9299	42	1004	\N
9300	45	1004	\N
9301	\N	1004	20
9302	81	1005	\N
9303	90	1005	\N
9304	126	1005	\N
9305	110	1005	\N
9306	27	1005	\N
9307	185	1005	\N
9308	63	1005	\N
9309	42	1005	\N
9310	45	1005	\N
9311	\N	1005	17
9312	80	1006	\N
9313	134	1006	\N
9314	135	1006	\N
9315	108	1006	\N
9316	184	1006	\N
9317	63	1006	\N
9318	66	1006	\N
9319	\N	1006	138
9320	81	1007	\N
9321	90	1007	\N
9322	127	1007	\N
9323	110	1007	\N
9324	115	1007	\N
9325	184	1007	\N
9326	63	1007	\N
9327	42	1007	\N
9328	\N	1007	35
9329	81	74	\N
9330	90	74	\N
9331	126	74	\N
9332	110	74	\N
9333	27	74	\N
9334	63	74	\N
9335	42	74	\N
9336	45	74	\N
9337	123	74	\N
9338	\N	74	17
9339	81	1008	\N
9340	90	1008	\N
9341	15	1008	\N
9342	110	1008	\N
9343	27	1008	\N
9344	185	1008	\N
9345	63	1008	\N
9346	42	1008	\N
9347	45	1008	\N
9348	123	1008	\N
9349	\N	1008	13
9350	81	1009	\N
9351	90	1009	\N
9352	15	1009	\N
9353	110	1009	\N
9354	27	1009	\N
9355	185	1009	\N
9356	63	1009	\N
9357	42	1009	\N
9358	45	1009	\N
9359	123	1009	\N
9360	\N	1009	2
9361	81	1010	\N
9362	101	1010	\N
9363	57	1010	\N
9364	112	1010	\N
9365	185	1010	\N
9366	63	1010	\N
9367	42	1010	\N
9368	\N	1010	75
9369	81	1011	\N
9370	92	1011	\N
9371	15	1011	\N
9372	110	1011	\N
9373	27	1011	\N
9374	185	1011	\N
9375	63	1011	\N
9376	42	1011	\N
9377	45	1011	\N
9378	123	1011	\N
9379	\N	1011	2
9380	81	1012	\N
9381	90	1012	\N
9382	15	1012	\N
9383	110	1012	\N
9384	27	1012	\N
9385	185	1012	\N
9386	63	1012	\N
9387	42	1012	\N
9388	45	1012	\N
9389	123	1012	\N
9390	\N	1012	13
9391	81	1013	\N
9392	90	1013	\N
9393	126	1013	\N
9394	110	1013	\N
9395	27	1013	\N
9396	185	1013	\N
9397	63	1013	\N
9398	42	1013	\N
9399	45	1013	\N
9400	\N	1013	17
9401	81	1014	\N
9402	94	1014	\N
9403	15	1014	\N
9404	110	1014	\N
9405	27	1014	\N
9406	185	1014	\N
9407	63	1014	\N
9408	42	1014	\N
9409	\N	1014	197
9410	81	1015	\N
9411	131	1015	\N
9412	126	1015	\N
9413	110	1015	\N
9414	27	1015	\N
9415	186	1015	\N
9416	63	1015	\N
9417	42	1015	\N
9418	45	1015	\N
9419	\N	1015	20
9420	81	1016	\N
9421	90	1016	\N
9422	125	1016	\N
9423	110	1016	\N
9424	187	1016	\N
9425	185	1016	\N
9426	63	1016	\N
9427	66	1016	\N
9428	67	1016	\N
9429	\N	1016	34
9430	81	1017	\N
9431	56	1017	\N
9432	132	1017	\N
9433	110	1017	\N
9434	185	1017	\N
9435	63	1017	\N
9436	42	1017	\N
9437	\N	1017	141
9438	81	1018	\N
9439	101	1018	\N
9440	137	1018	\N
9441	111	1018	\N
9442	185	1018	\N
9443	87	1018	\N
9444	42	1018	\N
9445	\N	1018	45
9446	121	1019	\N
9447	134	1019	\N
9448	151	1019	\N
9449	108	1019	\N
9450	185	1019	\N
9451	63	1019	\N
9452	42	1019	\N
9453	\N	1019	89
9454	80	1020	\N
9455	134	1020	\N
9456	162	1020	\N
9457	108	1020	\N
9458	185	1020	\N
9459	63	1020	\N
9460	66	1020	\N
9461	\N	1020	116
9462	80	1021	\N
9463	101	1021	\N
9464	148	1021	\N
9465	110	1021	\N
9466	185	1021	\N
9467	63	1021	\N
9468	42	1021	\N
9469	\N	1021	57
9470	121	1022	\N
9471	101	1022	\N
9472	132	1022	\N
9473	110	1022	\N
9474	185	1022	\N
9475	63	1022	\N
9476	66	1022	\N
9477	\N	1022	198
9478	81	1023	\N
9479	90	1023	\N
9480	15	1023	\N
9481	110	1023	\N
9482	27	1023	\N
9483	185	1023	\N
9484	63	1023	\N
9485	42	1023	\N
9486	45	1023	\N
9487	123	1023	\N
9488	\N	1023	2
9489	81	1024	\N
9490	90	1024	\N
9491	15	1024	\N
9492	110	1024	\N
9493	27	1024	\N
9494	185	1024	\N
9495	63	1024	\N
9496	42	1024	\N
9497	45	1024	\N
9498	123	1024	\N
9499	\N	1024	13
9500	80	1025	\N
9501	101	1025	\N
9502	162	1025	\N
9503	110	1025	\N
9504	185	1025	\N
9505	63	1025	\N
9506	66	1025	\N
9507	\N	1025	116
9508	81	1026	\N
9509	91	1026	\N
9510	137	1026	\N
9511	110	1026	\N
9512	171	1026	\N
9513	185	1026	\N
9514	63	1026	\N
9515	66	1026	\N
9516	\N	1026	193
9517	81	1027	\N
9518	90	1027	\N
9519	15	1027	\N
9520	110	1027	\N
9521	27	1027	\N
9522	185	1027	\N
9523	63	1027	\N
9524	42	1027	\N
9525	45	1027	\N
9526	123	1027	\N
9527	\N	1027	2
9528	81	1028	\N
9529	83	1028	\N
9530	57	1028	\N
9531	110	1028	\N
9532	185	1028	\N
9533	63	1028	\N
9534	42	1028	\N
9535	\N	1028	199
9536	81	1029	\N
9537	90	1029	\N
9538	15	1029	\N
9539	110	1029	\N
9540	27	1029	\N
9541	185	1029	\N
9542	63	1029	\N
9543	42	1029	\N
9544	45	1029	\N
9545	123	1029	\N
9546	\N	1029	13
9547	81	1030	\N
9548	90	1030	\N
9549	15	1030	\N
9550	110	1030	\N
9551	27	1030	\N
9552	185	1030	\N
9553	63	1030	\N
9554	42	1030	\N
9555	45	1030	\N
9556	123	1030	\N
9557	\N	1030	2
9558	81	1031	\N
9559	90	1031	\N
9560	132	1031	\N
9561	110	1031	\N
9562	184	1031	\N
9563	63	1031	\N
9564	66	1031	\N
9565	\N	1031	141
9566	80	1032	\N
9567	134	1032	\N
9568	135	1032	\N
9569	188	1032	\N
9570	184	1032	\N
9571	63	1032	\N
9572	66	1032	\N
9573	\N	1032	99
9574	81	1033	\N
9575	83	1033	\N
9576	15	1033	\N
9577	110	1033	\N
9578	27	1033	\N
9579	185	1033	\N
9580	63	1033	\N
9581	42	1033	\N
9582	45	1033	\N
9583	\N	1033	22
9584	80	1034	\N
9585	134	1034	\N
9586	162	1034	\N
9587	108	1034	\N
9588	184	1034	\N
9589	63	1034	\N
9590	66	1034	\N
9591	\N	1034	116
9592	10	1035	\N
9593	56	1035	\N
9594	168	1035	\N
9595	110	1035	\N
9596	184	1035	\N
9597	63	1035	\N
9598	42	1035	\N
9599	\N	1035	200
9600	80	1036	\N
9601	134	1036	\N
9602	137	1036	\N
9603	111	1036	\N
9604	185	1036	\N
9605	87	1036	\N
9606	66	1036	\N
9607	\N	1036	201
9608	80	1037	\N
9609	134	1037	\N
9610	159	1037	\N
9611	160	1037	\N
9612	185	1037	\N
9613	63	1037	\N
9614	66	1037	\N
9615	\N	1037	202
9616	81	1038	\N
9617	90	1038	\N
9618	15	1038	\N
9619	110	1038	\N
9620	27	1038	\N
9621	185	1038	\N
9622	63	1038	\N
9623	42	1038	\N
9624	45	1038	\N
9625	123	1038	\N
9626	\N	1038	2
9627	121	1039	\N
9628	101	1039	\N
9629	162	1039	\N
9630	108	1039	\N
9631	185	1039	\N
9632	63	1039	\N
9633	42	1039	\N
9634	\N	1039	189
9635	81	1040	\N
9636	101	1040	\N
9637	57	1040	\N
9638	108	1040	\N
9639	185	1040	\N
9640	63	1040	\N
9641	42	1040	\N
9642	\N	1040	203
9643	81	1041	\N
9644	91	1041	\N
9645	133	1041	\N
9646	110	1041	\N
9647	185	1041	\N
9648	63	1041	\N
9649	42	1041	\N
9650	\N	1041	205
9651	81	1042	\N
9652	131	1042	\N
9653	127	1042	\N
9654	110	1042	\N
9655	186	1042	\N
9656	63	1042	\N
9657	42	1042	\N
9658	\N	1042	204
9659	80	1043	\N
9660	134	1043	\N
9661	135	1043	\N
9662	110	1043	\N
9663	185	1043	\N
9664	63	1043	\N
9665	66	1043	\N
9666	\N	1043	206
9667	81	1044	\N
9668	100	1044	\N
9669	135	1044	\N
9670	112	1044	\N
9671	147	1044	\N
9672	185	1044	\N
9673	63	1044	\N
9674	42	1044	\N
9675	\N	1044	207
9676	81	1045	\N
9677	90	1045	\N
9678	15	1045	\N
9679	110	1045	\N
9680	27	1045	\N
9681	185	1045	\N
9682	63	1045	\N
9683	42	1045	\N
9684	45	1045	\N
9685	123	1045	\N
9686	\N	1045	13
9687	81	1046	\N
9688	90	1046	\N
9689	15	1046	\N
9690	110	1046	\N
9691	27	1046	\N
9692	185	1046	\N
9693	63	1046	\N
9694	42	1046	\N
9695	45	1046	\N
9696	123	1046	\N
9697	\N	1046	7
9698	81	1047	\N
9699	98	1047	\N
9700	15	1047	\N
9701	110	1047	\N
9702	27	1047	\N
9703	185	1047	\N
9704	63	1047	\N
9705	42	1047	\N
9706	45	1047	\N
9707	123	1047	\N
9708	\N	1047	2
9709	81	1048	\N
9710	101	1048	\N
9711	15	1048	\N
9712	110	1048	\N
9713	27	1048	\N
9714	185	1048	\N
9715	63	1048	\N
9716	42	1048	\N
9717	\N	1048	82
9718	121	1049	\N
9719	101	1049	\N
9720	57	1049	\N
9721	108	1049	\N
9722	185	1049	\N
9723	63	1049	\N
9724	42	1049	\N
9725	\N	1049	179
9726	81	1050	\N
9727	90	1050	\N
9728	15	1050	\N
9729	110	1050	\N
9730	27	1050	\N
9731	185	1050	\N
9732	63	1050	\N
9733	42	1050	\N
9734	45	1050	\N
9735	123	1050	\N
9736	\N	1050	2
9737	81	1051	\N
9738	83	1051	\N
9739	146	1051	\N
9740	110	1051	\N
9741	185	1051	\N
9742	63	1051	\N
9743	42	1051	\N
9744	\N	1051	208
9745	80	1052	\N
9746	134	1052	\N
9747	189	1052	\N
9748	108	1052	\N
9749	185	1052	\N
9750	63	1052	\N
9751	66	1052	\N
9752	\N	1052	209
9753	80	1053	\N
9754	134	1053	\N
9755	132	1053	\N
9756	110	1053	\N
9757	185	1053	\N
9758	63	1053	\N
9759	42	1053	\N
9760	\N	1053	54
9761	80	1054	\N
9762	134	1054	\N
9763	156	1054	\N
9764	110	1054	\N
9765	185	1054	\N
9766	63	1054	\N
9767	42	1054	\N
9768	\N	1054	128
9769	10	1055	\N
9770	101	1055	\N
9771	151	1055	\N
9772	108	1055	\N
9773	185	1055	\N
9774	63	1055	\N
9775	42	1055	\N
9776	\N	1055	100
9777	81	1056	\N
9778	91	1056	\N
9779	15	1056	\N
9780	110	1056	\N
9781	27	1056	\N
9782	185	1056	\N
9783	63	1056	\N
9784	42	1056	\N
9785	45	1056	\N
9786	123	1056	\N
9787	\N	1056	8
9788	81	1057	\N
9789	90	1057	\N
9790	15	1057	\N
9791	110	1057	\N
9792	27	1057	\N
9793	185	1057	\N
9794	63	1057	\N
9795	42	1057	\N
9796	45	1057	\N
9797	123	1057	\N
9798	\N	1057	13
9799	80	1058	\N
9800	101	1058	\N
9801	162	1058	\N
9802	110	1058	\N
9803	185	1058	\N
9804	63	1058	\N
9805	66	1058	\N
9806	\N	1058	116
9807	81	1059	\N
9808	91	1059	\N
9809	15	1059	\N
9810	110	1059	\N
9811	27	1059	\N
9812	185	1059	\N
9813	63	1059	\N
9814	42	1059	\N
9815	45	1059	\N
9816	123	1059	\N
9817	\N	1059	8
9818	81	1060	\N
9819	95	1060	\N
9820	127	1060	\N
9821	110	1060	\N
9822	115	1060	\N
9823	185	1060	\N
9824	63	1060	\N
9825	42	1060	\N
9826	\N	1060	210
9827	81	1061	\N
9828	90	1061	\N
9829	15	1061	\N
9830	110	1061	\N
9831	27	1061	\N
9832	185	1061	\N
9833	63	1061	\N
9834	42	1061	\N
9835	45	1061	\N
9836	123	1061	\N
9837	\N	1061	23
9838	81	1062	\N
9839	92	1062	\N
9840	15	1062	\N
9841	110	1062	\N
9842	27	1062	\N
9843	185	1062	\N
9844	63	1062	\N
9845	42	1062	\N
9846	45	1062	\N
9847	123	1062	\N
9848	\N	1062	8
9849	81	1063	\N
9850	90	1063	\N
9851	15	1063	\N
9852	110	1063	\N
9853	27	1063	\N
9854	185	1063	\N
9855	63	1063	\N
9856	42	1063	\N
9857	45	1063	\N
9858	123	1063	\N
9859	\N	1063	7
9860	81	1064	\N
9861	101	1064	\N
9862	146	1064	\N
9863	110	1064	\N
9864	27	1064	\N
9865	185	1064	\N
9866	63	1064	\N
9867	42	1064	\N
9868	\N	1064	50
9869	81	1065	\N
9870	95	1065	\N
9871	146	1065	\N
9872	110	1065	\N
9873	115	1065	\N
9874	185	1065	\N
9875	87	1065	\N
9876	42	1065	\N
9877	\N	1065	83
9878	81	1066	\N
9879	90	1066	\N
9880	15	1066	\N
9881	110	1066	\N
9882	27	1066	\N
9883	185	1066	\N
9884	63	1066	\N
9885	42	1066	\N
9886	45	1066	\N
9887	123	1066	\N
9888	\N	1066	10
9889	81	1067	\N
9890	90	1067	\N
9891	15	1067	\N
9892	110	1067	\N
9893	27	1067	\N
9894	185	1067	\N
9895	63	1067	\N
9896	42	1067	\N
9897	45	1067	\N
9898	123	1067	\N
9899	\N	1067	8
9900	81	1068	\N
9901	92	1068	\N
9902	15	1068	\N
9903	110	1068	\N
9904	27	1068	\N
9905	185	1068	\N
9906	63	1068	\N
9907	42	1068	\N
9908	45	1068	\N
9909	123	1068	\N
9910	\N	1068	2
9911	81	1069	\N
9912	131	1069	\N
9913	137	1069	\N
9914	110	1069	\N
9915	187	1069	\N
9916	186	1069	\N
9917	63	1069	\N
9918	66	1069	\N
9919	67	1069	\N
9920	\N	1069	174
9921	81	1070	\N
9922	83	1070	\N
9923	15	1070	\N
9924	110	1070	\N
9925	27	1070	\N
9926	185	1070	\N
9927	63	1070	\N
9928	42	1070	\N
9929	45	1070	\N
9930	\N	1070	21
9931	81	1071	\N
9932	90	1071	\N
9933	126	1071	\N
9934	110	1071	\N
9935	27	1071	\N
9936	185	1071	\N
9937	63	1071	\N
9938	42	1071	\N
9939	45	1071	\N
9940	\N	1071	20
9941	81	1072	\N
9942	90	1072	\N
9943	126	1072	\N
9944	110	1072	\N
9945	27	1072	\N
9946	185	1072	\N
9947	63	1072	\N
9948	42	1072	\N
9949	45	1072	\N
9950	\N	1072	20
9951	80	1073	\N
9952	134	1073	\N
9953	135	1073	\N
9954	167	1073	\N
9955	185	1073	\N
9956	63	1073	\N
9957	66	1073	\N
9958	\N	1073	99
9959	80	1074	\N
9960	134	1074	\N
9961	135	1074	\N
9962	160	1074	\N
9963	185	1074	\N
9964	63	1074	\N
9965	66	1074	\N
9966	\N	1074	99
9967	81	1075	\N
9968	83	1075	\N
9969	15	1075	\N
9970	110	1075	\N
9971	27	1075	\N
9972	185	1075	\N
9973	63	1075	\N
9974	42	1075	\N
9975	45	1075	\N
9976	\N	1075	23
9977	81	1076	\N
9978	90	1076	\N
9979	15	1076	\N
9980	110	1076	\N
9981	27	1076	\N
9982	185	1076	\N
9983	63	1076	\N
9984	42	1076	\N
9985	45	1076	\N
9986	123	1076	\N
9987	\N	1076	7
9988	81	1077	\N
9989	101	1077	\N
9990	57	1077	\N
9991	110	1077	\N
9992	185	1077	\N
9993	63	1077	\N
9994	42	1077	\N
9995	\N	1077	75
9996	121	1078	\N
9997	134	1078	\N
9998	148	1078	\N
9999	167	1078	\N
10000	185	1078	\N
10001	63	1078	\N
10002	42	1078	\N
10003	\N	1078	56
10004	81	1079	\N
10005	90	1079	\N
10006	126	1079	\N
10007	110	1079	\N
10008	27	1079	\N
10009	185	1079	\N
10010	63	1079	\N
10011	42	1079	\N
10012	45	1079	\N
10013	\N	1079	17
10014	81	1080	\N
10015	90	1080	\N
10016	15	1080	\N
10017	110	1080	\N
10018	27	1080	\N
10019	185	1080	\N
10020	63	1080	\N
10021	42	1080	\N
10022	45	1080	\N
10023	123	1080	\N
10024	\N	1080	23
10025	81	1081	\N
10026	101	1081	\N
10027	135	1081	\N
10028	108	1081	\N
10029	185	1081	\N
10030	87	1081	\N
10031	66	1081	\N
10032	\N	1081	186
10033	80	1082	\N
10034	134	1082	\N
10035	135	1082	\N
10036	108	1082	\N
10037	185	1082	\N
10038	63	1082	\N
10039	66	1082	\N
10040	\N	1082	99
10041	80	1083	\N
10042	134	1083	\N
10043	148	1083	\N
10044	108	1083	\N
10045	185	1083	\N
10046	63	1083	\N
10047	42	1083	\N
10048	\N	1083	211
10049	81	1084	\N
10050	92	1084	\N
10051	127	1084	\N
10052	110	1084	\N
10053	115	1084	\N
10054	185	1084	\N
10055	63	1084	\N
10056	42	1084	\N
10057	\N	1084	35
10058	81	1085	\N
10059	94	1085	\N
10060	57	1085	\N
10061	110	1085	\N
10062	185	1085	\N
10063	63	1085	\N
10064	42	1085	\N
10065	\N	1085	212
10066	121	1086	\N
10067	134	1086	\N
10068	148	1086	\N
10069	110	1086	\N
10070	185	1086	\N
10071	63	1086	\N
10072	42	1086	\N
10073	\N	1086	93
10074	81	1087	\N
10075	90	1087	\N
10076	15	1087	\N
10077	110	1087	\N
10078	27	1087	\N
10079	185	1087	\N
10080	63	1087	\N
10081	42	1087	\N
10082	45	1087	\N
10083	123	1087	\N
10084	\N	1087	23
10085	81	1088	\N
10086	90	1088	\N
10087	15	1088	\N
10088	110	1088	\N
10089	27	1088	\N
10090	185	1088	\N
10091	63	1088	\N
10092	42	1088	\N
10093	45	1088	\N
10094	\N	1088	22
10095	81	1089	\N
10096	94	1089	\N
10097	57	1089	\N
10098	128	1089	\N
10099	185	1089	\N
10100	63	1089	\N
10101	42	1089	\N
10102	\N	1089	213
10103	121	1090	\N
10104	134	1090	\N
10105	148	1090	\N
10106	167	1090	\N
10107	185	1090	\N
10108	63	1090	\N
10109	42	1090	\N
10110	\N	1090	56
10111	81	1091	\N
10112	90	1091	\N
10113	15	1091	\N
10114	110	1091	\N
10115	27	1091	\N
10116	185	1091	\N
10117	63	1091	\N
10118	42	1091	\N
10119	45	1091	\N
10120	123	1091	\N
10121	\N	1091	2
10122	80	1092	\N
10123	134	1092	\N
10124	135	1092	\N
10125	110	1092	\N
10126	185	1092	\N
10127	63	1092	\N
10128	66	1092	\N
10129	\N	1092	99
10130	81	1093	\N
10131	90	1093	\N
10132	15	1093	\N
10133	110	1093	\N
10134	27	1093	\N
10135	185	1093	\N
10136	63	1093	\N
10137	42	1093	\N
10138	45	1093	\N
10139	123	1093	\N
10140	\N	1093	7
10141	81	1094	\N
10142	90	1094	\N
10143	15	1094	\N
10144	110	1094	\N
10145	27	1094	\N
10146	185	1094	\N
10147	63	1094	\N
10148	42	1094	\N
10149	45	1094	\N
10150	123	1094	\N
10151	\N	1094	7
10152	81	1095	\N
10153	83	1095	\N
10154	15	1095	\N
10155	110	1095	\N
10156	27	1095	\N
10157	185	1095	\N
10158	63	1095	\N
10159	42	1095	\N
10160	45	1095	\N
10161	123	1095	\N
10162	\N	1095	2
10163	81	1096	\N
10164	90	1096	\N
10165	15	1096	\N
10166	110	1096	\N
10167	27	1096	\N
10168	185	1096	\N
10169	63	1096	\N
10170	42	1096	\N
10171	45	1096	\N
10172	123	1096	\N
10173	\N	1096	38
10174	81	833	\N
10175	90	833	\N
10176	177	833	\N
10177	110	833	\N
10178	63	833	\N
10179	42	833	\N
10180	\N	833	214
10181	81	1097	\N
10182	95	1097	\N
10183	177	1097	\N
10184	107	1097	\N
10185	185	1097	\N
10186	63	1097	\N
10187	42	1097	\N
10188	\N	1097	214
10189	81	1098	\N
10190	92	1098	\N
10191	57	1098	\N
10192	60	1098	\N
10193	185	1098	\N
10194	63	1098	\N
10195	42	1098	\N
10196	\N	1098	215
10197	81	1099	\N
10198	83	1099	\N
10199	15	1099	\N
10200	110	1099	\N
10201	27	1099	\N
10202	185	1099	\N
10203	63	1099	\N
10204	42	1099	\N
10205	45	1099	\N
10206	123	1099	\N
10207	\N	1099	21
10208	81	1100	\N
10209	91	1100	\N
10210	15	1100	\N
10211	110	1100	\N
10212	27	1100	\N
10213	185	1100	\N
10214	63	1100	\N
10215	42	1100	\N
10216	45	1100	\N
10217	123	1100	\N
10218	\N	1100	10
10219	81	1101	\N
10220	94	1101	\N
10221	57	1101	\N
10222	110	1101	\N
10223	185	1101	\N
10224	63	1101	\N
10225	42	1101	\N
10226	\N	1101	213
10227	81	1102	\N
10228	131	1102	\N
10229	137	1102	\N
10230	110	1102	\N
10231	171	1102	\N
10232	186	1102	\N
10233	63	1102	\N
10234	66	1102	\N
10235	\N	1102	174
10236	81	1103	\N
10237	83	1103	\N
10238	15	1103	\N
10239	110	1103	\N
10240	27	1103	\N
10241	185	1103	\N
10242	63	1103	\N
10243	42	1103	\N
10244	45	1103	\N
10245	123	1103	\N
10246	\N	1103	2
10247	80	1104	\N
10248	134	1104	\N
10249	135	1104	\N
10250	110	1104	\N
10251	185	1104	\N
10252	63	1104	\N
10253	66	1104	\N
10254	\N	1104	99
10255	81	1105	\N
10256	94	1105	\N
10257	57	1105	\N
10258	128	1105	\N
10259	185	1105	\N
10260	63	1105	\N
10261	42	1105	\N
10262	\N	1105	212
10263	81	1106	\N
10264	90	1106	\N
10265	15	1106	\N
10266	110	1106	\N
10267	27	1106	\N
10268	185	1106	\N
10269	63	1106	\N
10270	42	1106	\N
10271	45	1106	\N
10272	123	1106	\N
10273	\N	1106	13
10274	81	1107	\N
10275	101	1107	\N
10276	146	1107	\N
10277	110	1107	\N
10278	27	1107	\N
10279	185	1107	\N
10280	63	1107	\N
10281	42	1107	\N
10282	\N	1107	50
10283	80	1108	\N
10284	83	1108	\N
10285	190	1108	\N
10286	110	1108	\N
10287	184	1108	\N
10288	63	1108	\N
10289	66	1108	\N
10290	\N	1108	216
10291	80	1109	\N
10292	101	1109	\N
10293	135	1109	\N
10294	110	1109	\N
10295	185	1109	\N
10296	63	1109	\N
10297	66	1109	\N
10298	\N	1109	99
10299	80	1110	\N
10300	134	1110	\N
10301	159	1110	\N
10302	110	1110	\N
10303	185	1110	\N
10304	63	1110	\N
10305	66	1110	\N
10306	\N	1110	217
10307	81	1111	\N
10308	83	1111	\N
10309	15	1111	\N
10310	110	1111	\N
10311	27	1111	\N
10312	185	1111	\N
10313	63	1111	\N
10314	42	1111	\N
10315	45	1111	\N
10316	\N	1111	22
10317	121	1112	\N
10318	101	1112	\N
10319	135	1112	\N
10320	108	1112	\N
10321	185	1112	\N
10322	63	1112	\N
10323	66	1112	\N
10324	\N	1112	186
10325	81	1113	\N
10326	90	1113	\N
10327	15	1113	\N
10328	110	1113	\N
10329	27	1113	\N
10330	185	1113	\N
10331	63	1113	\N
10332	42	1113	\N
10333	45	1113	\N
10334	123	1113	\N
10335	\N	1113	13
10336	81	1114	\N
10337	83	1114	\N
10338	15	1114	\N
10339	110	1114	\N
10340	27	1114	\N
10341	185	1114	\N
10342	63	1114	\N
10343	42	1114	\N
10344	45	1114	\N
10345	123	1114	\N
10346	\N	1114	2
10347	81	1115	\N
10348	101	1115	\N
10349	191	1115	\N
10350	110	1115	\N
10351	185	1115	\N
10352	87	1115	\N
10353	42	1115	\N
10354	\N	1115	218
10355	81	1116	\N
10356	83	1116	\N
10357	15	1116	\N
10358	110	1116	\N
10359	27	1116	\N
10360	185	1116	\N
10361	63	1116	\N
10362	42	1116	\N
10363	45	1116	\N
10364	\N	1116	2
10365	80	1117	\N
10366	134	1117	\N
10367	192	1117	\N
10368	110	1117	\N
10369	185	1117	\N
10370	63	1117	\N
10371	66	1117	\N
10372	\N	1117	219
10373	81	1118	\N
10374	90	1118	\N
10375	15	1118	\N
10376	110	1118	\N
10377	27	1118	\N
10378	185	1118	\N
10379	63	1118	\N
10380	42	1118	\N
10381	45	1118	\N
10382	123	1118	\N
10383	\N	1118	8
10384	81	1119	\N
10385	90	1119	\N
10386	15	1119	\N
10387	110	1119	\N
10388	27	1119	\N
10389	185	1119	\N
10390	63	1119	\N
10391	42	1119	\N
10392	45	1119	\N
10393	123	1119	\N
10394	\N	1119	23
10395	81	1120	\N
10396	90	1120	\N
10397	15	1120	\N
10398	110	1120	\N
10399	27	1120	\N
10400	185	1120	\N
10401	63	1120	\N
10402	42	1120	\N
10403	45	1120	\N
10404	123	1120	\N
10405	\N	1120	8
10406	81	1121	\N
10407	83	1121	\N
10408	15	1121	\N
10409	110	1121	\N
10410	27	1121	\N
10411	185	1121	\N
10412	63	1121	\N
10413	42	1121	\N
10414	45	1121	\N
10415	\N	1121	21
10416	81	1122	\N
10417	101	1122	\N
10418	146	1122	\N
10419	112	1122	\N
10420	185	1122	\N
10421	63	1122	\N
10422	42	1122	\N
10423	\N	1122	50
10424	81	1123	\N
10425	94	1123	\N
10426	57	1123	\N
10427	110	1123	\N
10428	27	1123	\N
10429	185	1123	\N
10430	63	1123	\N
10431	42	1123	\N
10432	\N	1123	212
10433	80	1124	\N
10434	134	1124	\N
10435	135	1124	\N
10436	110	1124	\N
10437	185	1124	\N
10438	63	1124	\N
10439	66	1124	\N
10440	\N	1124	99
10441	81	1125	\N
10442	83	1125	\N
10443	15	1125	\N
10444	110	1125	\N
10445	27	1125	\N
10446	185	1125	\N
10447	63	1125	\N
10448	42	1125	\N
10449	45	1125	\N
10450	\N	1125	22
10451	80	1126	\N
10452	134	1126	\N
10453	132	1126	\N
10454	110	1126	\N
10455	185	1126	\N
10456	63	1126	\N
10457	66	1126	\N
10458	\N	1126	102
10459	81	1127	\N
10460	90	1127	\N
10461	15	1127	\N
10462	110	1127	\N
10463	27	1127	\N
10464	185	1127	\N
10465	63	1127	\N
10466	42	1127	\N
10467	45	1127	\N
10468	123	1127	\N
10469	\N	1127	2
10470	81	1128	\N
10471	101	1128	\N
10472	156	1128	\N
10473	110	1128	\N
10474	185	1128	\N
10475	63	1128	\N
10476	42	1128	\N
10477	\N	1128	220
10478	81	1129	\N
10479	94	1129	\N
10480	57	1129	\N
10481	108	1129	\N
10482	185	1129	\N
10483	63	1129	\N
10484	42	1129	\N
10485	\N	1129	221
10486	81	1130	\N
10487	83	1130	\N
10488	15	1130	\N
10489	110	1130	\N
10490	27	1130	\N
10491	185	1130	\N
10492	63	1130	\N
10493	42	1130	\N
10494	45	1130	\N
10495	123	1130	\N
10496	\N	1130	2
10497	81	1131	\N
10498	92	1131	\N
10499	191	1131	\N
10500	110	1131	\N
10501	185	1131	\N
10502	87	1131	\N
10503	42	1131	\N
10504	\N	1131	222
10505	81	1132	\N
10506	101	1132	\N
10507	191	1132	\N
10508	110	1132	\N
10509	185	1132	\N
10510	87	1132	\N
10511	42	1132	\N
10512	\N	1132	222
10513	81	1133	\N
10514	94	1133	\N
10515	150	1133	\N
10516	110	1133	\N
10517	185	1133	\N
10518	63	1133	\N
10519	42	1133	\N
10520	\N	1133	94
10521	80	1134	\N
10522	134	1134	\N
10523	132	1134	\N
10524	110	1134	\N
10525	185	1134	\N
10526	63	1134	\N
10527	66	1134	\N
10528	\N	1134	102
10529	80	1135	\N
10530	134	1135	\N
10531	135	1135	\N
10532	110	1135	\N
10533	185	1135	\N
10534	63	1135	\N
10535	42	1135	\N
10536	\N	1135	99
10547	81	1136	\N
10548	90	1136	\N
10549	126	1136	\N
10550	110	1136	\N
10551	27	1136	\N
10552	185	1136	\N
10553	63	1136	\N
10554	42	1136	\N
10555	45	1136	\N
10556	\N	1136	17
10557	80	1137	\N
10558	134	1137	\N
10559	132	1137	\N
10560	110	1137	\N
10561	185	1137	\N
10562	63	1137	\N
10563	42	1137	\N
10564	\N	1137	55
10565	81	1138	\N
10566	83	1138	\N
10567	15	1138	\N
10568	110	1138	\N
10569	27	1138	\N
10570	185	1138	\N
10571	63	1138	\N
10572	42	1138	\N
10573	45	1138	\N
10574	\N	1138	22
10575	81	1139	\N
10576	90	1139	\N
10577	15	1139	\N
10578	110	1139	\N
10579	27	1139	\N
10580	185	1139	\N
10581	63	1139	\N
10582	42	1139	\N
10583	45	1139	\N
10584	123	1139	\N
10585	\N	1139	8
10586	81	1140	\N
10587	101	1140	\N
10588	191	1140	\N
10589	112	1140	\N
10590	185	1140	\N
10591	63	1140	\N
10592	42	1140	\N
10593	\N	1140	218
10594	81	1141	\N
10595	83	1141	\N
10596	15	1141	\N
10597	110	1141	\N
10598	27	1141	\N
10599	185	1141	\N
10600	63	1141	\N
10601	42	1141	\N
10602	45	1141	\N
10603	123	1141	\N
10604	\N	1141	2
10605	81	1142	\N
10606	94	1142	\N
10607	57	1142	\N
10608	108	1142	\N
10609	184	1142	\N
10610	30	1142	\N
10611	42	1142	\N
10612	\N	1142	213
10613	81	1143	\N
10614	90	1143	\N
10615	126	1143	\N
10616	110	1143	\N
10617	27	1143	\N
10618	185	1143	\N
10619	63	1143	\N
10620	42	1143	\N
10621	45	1143	\N
10622	\N	1143	17
10623	81	218	\N
10624	149	218	\N
10625	15	218	\N
10626	60	218	\N
10627	27	218	\N
10628	63	218	\N
10629	42	218	\N
10630	\N	218	58
10631	81	1144	\N
10632	90	1144	\N
10633	15	1144	\N
10634	110	1144	\N
10635	27	1144	\N
10636	185	1144	\N
10637	63	1144	\N
10638	42	1144	\N
10639	45	1144	\N
10640	123	1144	\N
10641	\N	1144	23
10642	81	1145	\N
10643	90	1145	\N
10644	15	1145	\N
10645	112	1145	\N
10646	27	1145	\N
10647	185	1145	\N
10648	63	1145	\N
10649	42	1145	\N
10650	45	1145	\N
10651	123	1145	\N
10652	\N	1145	7
10653	81	1146	\N
10654	83	1146	\N
10655	15	1146	\N
10656	110	1146	\N
10657	27	1146	\N
10658	185	1146	\N
10659	63	1146	\N
10660	42	1146	\N
10661	45	1146	\N
10662	123	1146	\N
10663	\N	1146	2
10664	81	1147	\N
10665	98	1147	\N
10666	193	1147	\N
10667	24	1147	\N
10668	185	1147	\N
10669	63	1147	\N
10670	42	1147	\N
10671	\N	1147	223
10672	81	1148	\N
10673	95	1148	\N
10674	15	1148	\N
10675	60	1148	\N
10676	185	1148	\N
10677	87	1148	\N
10678	42	1148	\N
10679	\N	1148	58
10680	10	1149	\N
10681	106	1149	\N
10682	176	1149	\N
10683	107	1149	\N
10684	185	1149	\N
10685	63	1149	\N
10686	42	1149	\N
10687	\N	1149	224
10688	81	1150	\N
10689	90	1150	\N
10690	15	1150	\N
10691	110	1150	\N
10692	27	1150	\N
10693	185	1150	\N
10694	63	1150	\N
10695	42	1150	\N
10696	45	1150	\N
10697	123	1150	\N
10698	\N	1150	8
10699	81	1151	\N
10700	94	1151	\N
10701	57	1151	\N
10702	128	1151	\N
10703	185	1151	\N
10704	63	1151	\N
10705	42	1151	\N
10706	\N	1151	213
10707	81	1152	\N
10708	90	1152	\N
10709	126	1152	\N
10710	110	1152	\N
10711	27	1152	\N
10712	185	1152	\N
10713	63	1152	\N
10714	42	1152	\N
10715	45	1152	\N
10716	\N	1152	17
10717	81	1153	\N
10718	94	1153	\N
10719	57	1153	\N
10720	108	1153	\N
10721	185	1153	\N
10722	63	1153	\N
10723	42	1153	\N
10724	\N	1153	124
10725	81	1154	\N
10726	90	1154	\N
10727	126	1154	\N
10728	110	1154	\N
10729	27	1154	\N
10730	185	1154	\N
10731	63	1154	\N
10732	42	1154	\N
10733	45	1154	\N
10734	\N	1154	17
10735	81	1155	\N
10736	83	1155	\N
10737	15	1155	\N
10738	110	1155	\N
10739	27	1155	\N
10740	185	1155	\N
10741	63	1155	\N
10742	42	1155	\N
10743	45	1155	\N
10744	\N	1155	22
10745	81	1156	\N
10746	94	1156	\N
10747	135	1156	\N
10748	110	1156	\N
10749	185	1156	\N
10750	63	1156	\N
10751	42	1156	\N
10752	\N	1156	225
10753	80	1157	\N
10754	134	1157	\N
10755	132	1157	\N
10756	110	1157	\N
10757	185	1157	\N
10758	63	1157	\N
10759	42	1157	\N
10760	\N	1157	55
10761	81	1158	\N
10762	90	1158	\N
10763	126	1158	\N
10764	110	1158	\N
10765	27	1158	\N
10766	185	1158	\N
10767	63	1158	\N
10768	42	1158	\N
10769	45	1158	\N
10770	\N	1158	17
10771	81	1159	\N
10772	94	1159	\N
10773	57	1159	\N
10774	128	1159	\N
10775	185	1159	\N
10776	63	1159	\N
10777	42	1159	\N
10778	\N	1159	213
10779	81	1160	\N
10780	83	1160	\N
10781	15	1160	\N
10782	110	1160	\N
10783	27	1160	\N
10784	185	1160	\N
10785	63	1160	\N
10786	42	1160	\N
10787	45	1160	\N
10788	123	1160	\N
10789	\N	1160	2
10790	81	1161	\N
10791	92	1161	\N
10792	191	1161	\N
10793	110	1161	\N
10794	185	1161	\N
10795	87	1161	\N
10796	42	1161	\N
10797	\N	1161	226
10798	81	1162	\N
10799	101	1162	\N
10800	191	1162	\N
10801	110	1162	\N
10802	185	1162	\N
10803	63	1162	\N
10804	42	1162	\N
10805	\N	1162	226
10806	81	1163	\N
10807	92	1163	\N
10808	191	1163	\N
10809	110	1163	\N
10810	185	1163	\N
10811	87	1163	\N
10812	42	1163	\N
10813	\N	1163	222
10814	80	1164	\N
10815	134	1164	\N
10816	132	1164	\N
10817	112	1164	\N
10818	185	1164	\N
10819	63	1164	\N
10820	66	1164	\N
10821	\N	1164	102
10822	80	1165	\N
10823	134	1165	\N
10824	132	1165	\N
10825	167	1165	\N
10826	185	1165	\N
10827	63	1165	\N
10828	66	1165	\N
10829	\N	1165	102
10830	81	1166	\N
10831	83	1166	\N
10832	15	1166	\N
10833	110	1166	\N
10834	27	1166	\N
10835	185	1166	\N
10836	63	1166	\N
10837	42	1166	\N
10838	45	1166	\N
10839	\N	1166	21
10840	81	1167	\N
10841	90	1167	\N
10842	15	1167	\N
10843	110	1167	\N
10844	27	1167	\N
10845	185	1167	\N
10846	63	1167	\N
10847	42	1167	\N
10848	45	1167	\N
10849	123	1167	\N
10850	\N	1167	7
10851	173	1168	\N
10852	109	1168	\N
10853	185	1168	\N
10854	63	1168	\N
10855	42	1168	\N
10856	\N	1168	142
10857	81	1169	\N
10858	94	1169	\N
10859	57	1169	\N
10860	108	1169	\N
10861	185	1169	\N
10862	63	1169	\N
10863	42	1169	\N
10864	\N	1169	221
10865	81	1170	\N
10866	83	1170	\N
10867	15	1170	\N
10868	110	1170	\N
10869	27	1170	\N
10870	185	1170	\N
10871	63	1170	\N
10872	42	1170	\N
10873	45	1170	\N
10874	\N	1170	2
10875	81	1171	\N
10876	90	1171	\N
10877	15	1171	\N
10878	110	1171	\N
10879	27	1171	\N
10880	185	1171	\N
10881	63	1171	\N
10882	42	1171	\N
10883	45	1171	\N
10884	123	1171	\N
10885	\N	1171	8
10886	80	1172	\N
10887	134	1172	\N
10888	135	1172	\N
10889	110	1172	\N
10890	185	1172	\N
10891	63	1172	\N
10892	66	1172	\N
10893	\N	1172	99
10894	81	1173	\N
10895	101	1173	\N
10896	15	1173	\N
10897	110	1173	\N
10898	27	1173	\N
10899	185	1173	\N
10900	63	1173	\N
10901	42	1173	\N
10902	\N	1173	16
10903	121	1174	\N
10904	134	1174	\N
10905	148	1174	\N
10906	108	1174	\N
10907	185	1174	\N
10908	63	1174	\N
10909	42	1174	\N
10910	\N	1174	93
10911	81	1175	\N
10912	90	1175	\N
10913	15	1175	\N
10914	110	1175	\N
10915	27	1175	\N
10916	185	1175	\N
10917	63	1175	\N
10918	42	1175	\N
10919	45	1175	\N
10920	123	1175	\N
10921	\N	1175	23
10922	81	1176	\N
10923	94	1176	\N
10924	57	1176	\N
10925	108	1176	\N
10926	185	1176	\N
10927	63	1176	\N
10928	42	1176	\N
10929	\N	1176	212
10930	81	1177	\N
10931	92	1177	\N
10932	15	1177	\N
10933	60	1177	\N
10934	27	1177	\N
10935	185	1177	\N
10936	63	1177	\N
10937	42	1177	\N
10938	45	1177	\N
10939	\N	1177	11
10940	81	1178	\N
10941	90	1178	\N
10942	15	1178	\N
10943	110	1178	\N
10944	27	1178	\N
10945	185	1178	\N
10946	63	1178	\N
10947	66	1178	\N
10948	45	1178	\N
10949	123	1178	\N
10950	\N	1178	8
10951	81	1179	\N
10952	101	1179	\N
10953	146	1179	\N
10954	110	1179	\N
10955	27	1179	\N
10956	185	1179	\N
10957	63	1179	\N
10958	42	1179	\N
10959	\N	1179	50
10960	81	1180	\N
10961	94	1180	\N
10962	57	1180	\N
10963	108	1180	\N
10964	185	1180	\N
10965	63	1180	\N
10966	42	1180	\N
10967	\N	1180	212
10968	81	1181	\N
10969	91	1181	\N
10970	135	1181	\N
10971	110	1181	\N
10972	185	1181	\N
10973	63	1181	\N
10974	66	1181	\N
10975	\N	1181	188
10976	80	1182	\N
10977	101	1182	\N
10978	135	1182	\N
10979	110	1182	\N
10980	185	1182	\N
10981	63	1182	\N
10982	42	1182	\N
10983	\N	1182	49
10984	81	1183	\N
10985	83	1183	\N
10986	15	1183	\N
10987	110	1183	\N
10988	27	1183	\N
10989	185	1183	\N
10990	63	1183	\N
10991	42	1183	\N
10992	45	1183	\N
10993	\N	1183	2
10994	81	1184	\N
10995	91	1184	\N
10996	137	1184	\N
10997	110	1184	\N
10998	185	1184	\N
10999	63	1184	\N
11000	66	1184	\N
11001	\N	1184	174
11002	81	1185	\N
11003	131	1185	\N
11004	137	1185	\N
11005	110	1185	\N
11006	186	1185	\N
11007	63	1185	\N
11008	66	1185	\N
11009	\N	1185	228
11010	81	1186	\N
11011	83	1186	\N
11012	15	1186	\N
11013	110	1186	\N
11014	27	1186	\N
11015	185	1186	\N
11016	63	1186	\N
11017	42	1186	\N
11018	45	1186	\N
11019	\N	1186	22
11020	81	236	\N
11021	98	236	\N
11022	15	236	\N
11023	112	236	\N
11024	27	236	\N
11025	63	236	\N
11026	42	236	\N
11027	45	236	\N
11028	68	236	\N
11029	\N	236	66
11039	81	1187	\N
11040	92	1187	\N
11041	138	1187	\N
11042	112	1187	\N
11043	117	1187	\N
11044	185	1187	\N
11045	87	1187	\N
11046	42	1187	\N
11047	\N	1187	40
11048	81	1188	\N
11049	90	1188	\N
11050	137	1188	\N
11051	110	1188	\N
11052	185	1188	\N
11053	63	1188	\N
11054	42	1188	\N
11055	\N	1188	174
11056	81	1189	\N
11057	90	1189	\N
11058	126	1189	\N
11059	110	1189	\N
11060	27	1189	\N
11061	185	1189	\N
11062	63	1189	\N
11063	42	1189	\N
11064	45	1189	\N
11065	\N	1189	17
11066	80	1190	\N
11067	101	1190	\N
11068	148	1190	\N
11069	108	1190	\N
11070	185	1190	\N
11071	63	1190	\N
11072	42	1190	\N
11073	\N	1190	57
11074	81	1191	\N
11075	90	1191	\N
11076	15	1191	\N
11077	110	1191	\N
11078	27	1191	\N
11079	185	1191	\N
11080	63	1191	\N
11081	42	1191	\N
11082	45	1191	\N
11083	123	1191	\N
11084	\N	1191	13
11085	81	1192	\N
11086	90	1192	\N
11087	15	1192	\N
11088	110	1192	\N
11089	27	1192	\N
11090	185	1192	\N
11091	63	1192	\N
11092	42	1192	\N
11093	45	1192	\N
11094	123	1192	\N
11095	\N	1192	8
11096	81	1193	\N
11097	90	1193	\N
11098	57	1193	\N
11099	110	1193	\N
11100	185	1193	\N
11101	63	1193	\N
11102	42	1193	\N
11103	\N	1193	106
11104	81	1194	\N
11105	131	1194	\N
11106	135	1194	\N
11107	110	1194	\N
11108	186	1194	\N
11109	63	1194	\N
11110	66	1194	\N
11111	\N	1194	113
11112	80	1195	\N
11113	134	1195	\N
11114	135	1195	\N
11115	108	1195	\N
11116	185	1195	\N
11117	63	1195	\N
11118	42	1195	\N
11119	\N	1195	99
11120	121	1196	\N
11121	134	1196	\N
11122	148	1196	\N
11123	107	1196	\N
11124	185	1196	\N
11125	63	1196	\N
11126	42	1196	\N
11127	\N	1196	93
11128	121	1197	\N
11129	134	1197	\N
11130	148	1197	\N
11131	108	1197	\N
11132	185	1197	\N
11133	63	1197	\N
11134	42	1197	\N
11135	\N	1197	56
11136	81	1198	\N
11137	101	1198	\N
11138	15	1198	\N
11139	110	1198	\N
11140	27	1198	\N
11141	185	1198	\N
11142	87	1198	\N
11143	42	1198	\N
11144	45	1198	\N
11145	123	1198	\N
11146	\N	1198	8
11147	81	1199	\N
11148	90	1199	\N
11149	15	1199	\N
11150	110	1199	\N
11151	27	1199	\N
11152	185	1199	\N
11153	63	1199	\N
11154	42	1199	\N
11155	45	1199	\N
11156	123	1199	\N
11157	\N	1199	23
11158	121	1200	\N
11159	134	1200	\N
11160	194	1200	\N
11161	110	1200	\N
11162	185	1200	\N
11163	63	1200	\N
11164	42	1200	\N
11165	\N	1200	229
11166	81	1201	\N
11167	92	1201	\N
11168	191	1201	\N
11169	110	1201	\N
11170	185	1201	\N
11171	87	1201	\N
11172	42	1201	\N
11173	\N	1201	222
11174	81	1202	\N
11175	83	1202	\N
11176	15	1202	\N
11177	110	1202	\N
11178	27	1202	\N
11179	185	1202	\N
11180	63	1202	\N
11181	42	1202	\N
11182	45	1202	\N
11183	123	1202	\N
11184	\N	1202	2
11185	81	1203	\N
11186	90	1203	\N
11187	15	1203	\N
11188	110	1203	\N
11189	27	1203	\N
11190	185	1203	\N
11191	63	1203	\N
11192	42	1203	\N
11193	45	1203	\N
11194	123	1203	\N
11195	\N	1203	2
11196	81	1204	\N
11197	101	1204	\N
11198	191	1204	\N
11199	108	1204	\N
11200	185	1204	\N
11201	87	1204	\N
11202	42	1204	\N
11203	\N	1204	222
11204	81	1205	\N
11205	90	1205	\N
11206	15	1205	\N
11207	110	1205	\N
11208	27	1205	\N
11209	185	1205	\N
11210	63	1205	\N
11211	42	1205	\N
11212	45	1205	\N
11213	123	1205	\N
11214	\N	1205	2
11215	81	1206	\N
11216	94	1206	\N
11217	57	1206	\N
11218	110	1206	\N
11219	185	1206	\N
11220	63	1206	\N
11221	42	1206	\N
11222	\N	1206	213
11223	81	1207	\N
11224	95	1207	\N
11225	127	1207	\N
11226	60	1207	\N
11227	115	1207	\N
11228	185	1207	\N
11229	63	1207	\N
11230	42	1207	\N
11231	\N	1207	35
11232	80	1208	\N
11233	134	1208	\N
11234	125	1208	\N
11235	108	1208	\N
11236	185	1208	\N
11237	63	1208	\N
11238	66	1208	\N
11239	\N	1208	230
11240	121	1209	\N
11241	134	1209	\N
11242	151	1209	\N
11243	108	1209	\N
11244	185	1209	\N
11245	63	1209	\N
11246	42	1209	\N
11247	\N	1209	89
11248	80	1210	\N
11249	134	1210	\N
11250	132	1210	\N
11251	108	1210	\N
11252	185	1210	\N
11253	63	1210	\N
11254	42	1210	\N
11255	\N	1210	55
11256	81	1211	\N
11257	90	1211	\N
11258	15	1211	\N
11259	110	1211	\N
11260	27	1211	\N
11261	185	1211	\N
11262	63	1211	\N
11263	42	1211	\N
11264	45	1211	\N
11265	123	1211	\N
11266	\N	1211	7
11267	81	1212	\N
11268	101	1212	\N
11269	15	1212	\N
11270	24	1212	\N
11271	27	1212	\N
11272	185	1212	\N
11273	63	1212	\N
11274	42	1212	\N
11275	45	1212	\N
11276	123	1212	\N
11277	\N	1212	2
11278	81	1213	\N
11279	101	1213	\N
11280	15	1213	\N
11281	110	1213	\N
11282	27	1213	\N
11283	185	1213	\N
11284	63	1213	\N
11285	42	1213	\N
11286	\N	1213	26
11287	81	1214	\N
11288	90	1214	\N
11289	15	1214	\N
11290	110	1214	\N
11291	27	1214	\N
11292	185	1214	\N
11293	63	1214	\N
11294	42	1214	\N
11295	45	1214	\N
11296	123	1214	\N
11297	\N	1214	23
11298	81	1215	\N
11299	83	1215	\N
11300	15	1215	\N
11301	110	1215	\N
11302	27	1215	\N
11303	185	1215	\N
11304	63	1215	\N
11305	42	1215	\N
11306	45	1215	\N
11307	123	1215	\N
11308	\N	1215	8
11309	81	1216	\N
11310	96	1216	\N
11311	156	1216	\N
11312	110	1216	\N
11313	185	1216	\N
11314	63	1216	\N
11315	42	1216	\N
11316	\N	1216	84
11317	81	1217	\N
11318	90	1217	\N
11319	15	1217	\N
11320	110	1217	\N
11321	27	1217	\N
11322	185	1217	\N
11323	63	1217	\N
11324	42	1217	\N
11325	45	1217	\N
11326	123	1217	\N
11327	\N	1217	8
11328	81	1218	\N
11329	83	1218	\N
11330	15	1218	\N
11331	110	1218	\N
11332	27	1218	\N
11333	185	1218	\N
11334	63	1218	\N
11335	42	1218	\N
11336	45	1218	\N
11337	\N	1218	22
11338	81	1219	\N
11339	94	1219	\N
11340	57	1219	\N
11341	108	1219	\N
11342	185	1219	\N
11343	63	1219	\N
11344	42	1219	\N
11345	\N	1219	213
11346	81	1220	\N
11347	90	1220	\N
11348	15	1220	\N
11349	110	1220	\N
11350	27	1220	\N
11351	185	1220	\N
11352	63	1220	\N
11353	42	1220	\N
11354	45	1220	\N
11355	123	1220	\N
11356	\N	1220	8
11357	81	1221	\N
11358	83	1221	\N
11359	15	1221	\N
11360	110	1221	\N
11361	27	1221	\N
11362	185	1221	\N
11363	63	1221	\N
11364	42	1221	\N
11365	45	1221	\N
11366	\N	1221	21
11367	81	1222	\N
11368	178	1222	\N
11369	110	1222	\N
11370	185	1222	\N
11371	63	1222	\N
11372	42	1222	\N
11373	\N	1222	183
11374	81	1223	\N
11375	90	1223	\N
11376	126	1223	\N
11377	110	1223	\N
11378	27	1223	\N
11379	185	1223	\N
11380	63	1223	\N
11381	42	1223	\N
11382	45	1223	\N
11383	\N	1223	17
11384	81	1224	\N
11385	90	1224	\N
11386	126	1224	\N
11387	110	1224	\N
11388	27	1224	\N
11389	185	1224	\N
11390	63	1224	\N
11391	42	1224	\N
11392	45	1224	\N
11393	\N	1224	17
11394	81	1225	\N
11395	83	1225	\N
11396	15	1225	\N
11397	110	1225	\N
11398	27	1225	\N
11399	185	1225	\N
11400	63	1225	\N
11401	42	1225	\N
11402	45	1225	\N
11403	\N	1225	21
11404	81	1226	\N
11405	101	1226	\N
11406	137	1226	\N
11407	24	1226	\N
11408	185	1226	\N
11409	63	1226	\N
11410	66	1226	\N
11411	\N	1226	39
11412	80	1227	\N
11413	90	1227	\N
11414	15	1227	\N
11415	110	1227	\N
11416	27	1227	\N
11417	185	1227	\N
11418	63	1227	\N
11419	42	1227	\N
11420	45	1227	\N
11421	123	1227	\N
11422	\N	1227	8
11423	81	1228	\N
11424	101	1228	\N
11425	125	1228	\N
11426	110	1228	\N
11427	147	1228	\N
11428	185	1228	\N
11429	87	1228	\N
11430	42	1228	\N
11431	\N	1228	231
11432	81	1229	\N
11433	94	1229	\N
11434	57	1229	\N
11435	110	1229	\N
11436	185	1229	\N
11437	63	1229	\N
11438	42	1229	\N
11439	\N	1229	213
11440	80	1230	\N
11441	134	1230	\N
11442	132	1230	\N
11443	110	1230	\N
11444	185	1230	\N
11445	63	1230	\N
11446	66	1230	\N
11447	\N	1230	102
11448	81	1231	\N
11449	90	1231	\N
11450	15	1231	\N
11451	110	1231	\N
11452	27	1231	\N
11453	185	1231	\N
11454	63	1231	\N
11455	42	1231	\N
11456	45	1231	\N
11457	123	1231	\N
11458	\N	1231	38
11459	81	1232	\N
11460	94	1232	\N
11461	57	1232	\N
11462	108	1232	\N
11463	185	1232	\N
11464	63	1232	\N
11465	42	1232	\N
11466	\N	1232	212
11467	81	1233	\N
11468	101	1233	\N
11469	57	1233	\N
11470	110	1233	\N
11471	181	1233	\N
11472	185	1233	\N
11473	63	1233	\N
11474	42	1233	\N
11475	\N	1233	75
11476	80	1234	\N
11477	134	1234	\N
11478	135	1234	\N
11479	110	1234	\N
11480	185	1234	\N
11481	63	1234	\N
11482	42	1234	\N
11483	\N	1234	49
11484	81	795	\N
11485	100	795	\N
11486	15	795	\N
11487	110	795	\N
11488	27	795	\N
11489	63	795	\N
11490	42	795	\N
11491	\N	795	60
11492	81	1235	\N
11493	90	1235	\N
11494	15	1235	\N
11495	110	1235	\N
11496	27	1235	\N
11497	185	1235	\N
11498	63	1235	\N
11499	42	1235	\N
11500	45	1235	\N
11501	123	1235	\N
11502	\N	1235	23
11503	81	1236	\N
11504	101	1236	\N
11505	15	1236	\N
11506	110	1236	\N
11507	27	1236	\N
11508	185	1236	\N
11509	63	1236	\N
11510	42	1236	\N
11511	\N	1236	16
11512	81	1237	\N
11513	91	1237	\N
11514	15	1237	\N
11515	110	1237	\N
11516	27	1237	\N
11517	185	1237	\N
11518	63	1237	\N
11519	42	1237	\N
11520	45	1237	\N
11521	123	1237	\N
11522	\N	1237	10
11523	81	1238	\N
11524	90	1238	\N
11525	15	1238	\N
11526	110	1238	\N
11527	27	1238	\N
11528	185	1238	\N
11529	63	1238	\N
11530	42	1238	\N
11531	45	1238	\N
11532	123	1238	\N
11533	\N	1238	2
11534	81	1239	\N
11535	101	1239	\N
11536	57	1239	\N
11537	110	1239	\N
11538	185	1239	\N
11539	63	1239	\N
11540	42	1239	\N
11541	\N	1239	75
11542	81	1240	\N
11543	149	1240	\N
11544	15	1240	\N
11545	60	1240	\N
11546	27	1240	\N
11547	184	1240	\N
11548	87	1240	\N
11549	42	1240	\N
11550	\N	1240	58
11551	81	1241	\N
11552	90	1241	\N
11553	15	1241	\N
11554	110	1241	\N
11555	27	1241	\N
11556	185	1241	\N
11557	63	1241	\N
11558	42	1241	\N
11559	45	1241	\N
11560	123	1241	\N
11561	\N	1241	2
11562	81	1242	\N
11563	90	1242	\N
11564	15	1242	\N
11565	110	1242	\N
11566	27	1242	\N
11567	185	1242	\N
11568	63	1242	\N
11569	42	1242	\N
11570	45	1242	\N
11571	123	1242	\N
11572	\N	1242	23
11573	81	1243	\N
11574	90	1243	\N
11575	126	1243	\N
11576	110	1243	\N
11577	27	1243	\N
11578	185	1243	\N
11579	63	1243	\N
11580	42	1243	\N
11581	45	1243	\N
11582	\N	1243	17
11583	81	1244	\N
11584	83	1244	\N
11585	15	1244	\N
11586	110	1244	\N
11587	27	1244	\N
11588	185	1244	\N
11589	63	1244	\N
11590	42	1244	\N
11591	45	1244	\N
11592	\N	1244	23
11593	81	1245	\N
11594	94	1245	\N
11595	57	1245	\N
11596	110	1245	\N
11597	185	1245	\N
11598	63	1245	\N
11599	42	1245	\N
11600	\N	1245	213
11601	121	1246	\N
11602	134	1246	\N
11603	148	1246	\N
11604	108	1246	\N
11605	185	1246	\N
11606	63	1246	\N
11607	42	1246	\N
11608	\N	1246	93
11609	121	1247	\N
11610	134	1247	\N
11611	195	1247	\N
11612	167	1247	\N
11613	185	1247	\N
11614	63	1247	\N
11615	66	1247	\N
11616	\N	1247	232
11617	81	1248	\N
11618	90	1248	\N
11619	15	1248	\N
11620	110	1248	\N
11621	27	1248	\N
11622	185	1248	\N
11623	63	1248	\N
11624	42	1248	\N
11625	45	1248	\N
11626	123	1248	\N
11627	\N	1248	8
11628	81	1249	\N
11629	94	1249	\N
11630	57	1249	\N
11631	108	1249	\N
11632	185	1249	\N
11633	63	1249	\N
11634	42	1249	\N
11635	\N	1249	221
11636	10	1250	\N
11637	94	1250	\N
11638	57	1250	\N
11639	108	1250	\N
11640	196	1250	\N
11641	185	1250	\N
11642	63	1250	\N
11643	42	1250	\N
11644	\N	1250	213
11645	81	1251	\N
11646	90	1251	\N
11647	15	1251	\N
11648	110	1251	\N
11649	27	1251	\N
11650	185	1251	\N
11651	63	1251	\N
11652	42	1251	\N
11653	45	1251	\N
11654	123	1251	\N
11655	\N	1251	13
11656	81	1252	\N
11657	90	1252	\N
11658	15	1252	\N
11659	110	1252	\N
11660	27	1252	\N
11661	185	1252	\N
11662	63	1252	\N
11663	42	1252	\N
11664	45	1252	\N
11665	123	1252	\N
11666	\N	1252	8
11667	81	1253	\N
11668	90	1253	\N
11669	15	1253	\N
11670	110	1253	\N
11671	27	1253	\N
11672	185	1253	\N
11673	63	1253	\N
11674	42	1253	\N
11675	45	1253	\N
11676	123	1253	\N
11677	\N	1253	23
11678	81	1254	\N
11679	83	1254	\N
11680	15	1254	\N
11681	110	1254	\N
11682	27	1254	\N
11683	185	1254	\N
11684	63	1254	\N
11685	42	1254	\N
11686	45	1254	\N
11687	\N	1254	22
11688	81	1255	\N
11689	101	1255	\N
11690	15	1255	\N
11691	110	1255	\N
11692	27	1255	\N
11693	185	1255	\N
11694	63	1255	\N
11695	42	1255	\N
11696	\N	1255	16
11697	121	1256	\N
11698	134	1256	\N
11699	148	1256	\N
11700	160	1256	\N
11701	185	1256	\N
11702	63	1256	\N
11703	42	1256	\N
11704	\N	1256	56
11705	81	1257	\N
11706	91	1257	\N
11707	15	1257	\N
11708	110	1257	\N
11709	27	1257	\N
11710	185	1257	\N
11711	63	1257	\N
11712	42	1257	\N
11713	45	1257	\N
11714	123	1257	\N
11715	\N	1257	2
11716	81	1258	\N
11717	90	1258	\N
11718	15	1258	\N
11719	110	1258	\N
11720	27	1258	\N
11721	185	1258	\N
11722	63	1258	\N
11723	42	1258	\N
11724	45	1258	\N
11725	123	1258	\N
11726	\N	1258	23
11727	81	1259	\N
11728	90	1259	\N
11729	15	1259	\N
11730	60	1259	\N
11731	27	1259	\N
11732	185	1259	\N
11733	63	1259	\N
11734	42	1259	\N
11735	45	1259	\N
11736	123	1259	\N
11737	\N	1259	2
11738	81	1260	\N
11739	101	1260	\N
11740	15	1260	\N
11741	110	1260	\N
11742	27	1260	\N
11743	185	1260	\N
11744	63	1260	\N
11745	42	1260	\N
11746	45	1260	\N
11747	\N	1260	15
11748	81	1261	\N
11749	90	1261	\N
11750	15	1261	\N
11751	109	1261	\N
11752	27	1261	\N
11753	185	1261	\N
11754	63	1261	\N
11755	42	1261	\N
11756	45	1261	\N
11757	123	1261	\N
11758	\N	1261	7
11759	81	1262	\N
11760	90	1262	\N
11761	146	1262	\N
11762	110	1262	\N
11763	185	1262	\N
11764	63	1262	\N
11765	42	1262	\N
11766	\N	1262	233
11767	81	1263	\N
11768	90	1263	\N
11769	15	1263	\N
11770	110	1263	\N
11771	27	1263	\N
11772	185	1263	\N
11773	63	1263	\N
11774	42	1263	\N
11775	45	1263	\N
11776	123	1263	\N
11777	\N	1263	23
11778	81	1264	\N
11779	83	1264	\N
11780	15	1264	\N
11781	110	1264	\N
11782	27	1264	\N
11783	185	1264	\N
11784	63	1264	\N
11785	42	1264	\N
11786	45	1264	\N
11787	123	1264	\N
11788	\N	1264	2
11789	81	1265	\N
11790	91	1265	\N
11791	15	1265	\N
11792	110	1265	\N
11793	27	1265	\N
11794	185	1265	\N
11795	63	1265	\N
11796	42	1265	\N
11797	45	1265	\N
11798	123	1265	\N
11799	\N	1265	2
11800	81	1266	\N
11801	83	1266	\N
11802	15	1266	\N
11803	110	1266	\N
11804	27	1266	\N
11805	185	1266	\N
11806	63	1266	\N
11807	42	1266	\N
11808	45	1266	\N
11809	123	1266	\N
11810	\N	1266	23
11811	81	1267	\N
11812	90	1267	\N
11813	15	1267	\N
11814	111	1267	\N
11815	27	1267	\N
11816	185	1267	\N
11817	63	1267	\N
11818	42	1267	\N
11819	45	1267	\N
11820	123	1267	\N
11821	\N	1267	23
11822	81	1268	\N
11823	83	1268	\N
11824	15	1268	\N
11825	110	1268	\N
11826	27	1268	\N
11827	185	1268	\N
11828	63	1268	\N
11829	42	1268	\N
11830	45	1268	\N
11831	123	1268	\N
11832	\N	1268	2
11833	81	1269	\N
11834	90	1269	\N
11835	15	1269	\N
11836	110	1269	\N
11837	27	1269	\N
11838	185	1269	\N
11839	63	1269	\N
11840	42	1269	\N
11841	45	1269	\N
11842	123	1269	\N
11843	\N	1269	2
11844	81	1270	\N
11845	83	1270	\N
11846	157	1270	\N
11847	110	1270	\N
11848	185	1270	\N
11849	63	1270	\N
11850	42	1270	\N
11851	\N	1270	234
11852	81	1271	\N
11853	101	1271	\N
11854	146	1271	\N
11855	108	1271	\N
11856	185	1271	\N
11857	63	1271	\N
11858	42	1271	\N
11859	\N	1271	50
11860	81	1272	\N
11861	100	1272	\N
11862	15	1272	\N
11863	112	1272	\N
11864	27	1272	\N
11865	185	1272	\N
11866	63	1272	\N
11867	42	1272	\N
11868	\N	1272	10
11869	81	1273	\N
11870	95	1273	\N
11871	127	1273	\N
11872	110	1273	\N
11873	115	1273	\N
11874	185	1273	\N
11875	63	1273	\N
11876	42	1273	\N
11877	\N	1273	235
11878	81	1274	\N
11879	91	1274	\N
11880	15	1274	\N
11881	110	1274	\N
11882	27	1274	\N
11883	185	1274	\N
11884	63	1274	\N
11885	42	1274	\N
11886	45	1274	\N
11887	123	1274	\N
11888	\N	1274	8
11889	81	1275	\N
11890	95	1275	\N
11891	15	1275	\N
11892	110	1275	\N
11893	27	1275	\N
11894	185	1275	\N
11895	63	1275	\N
11896	42	1275	\N
11897	\N	1275	12
11898	81	1276	\N
11899	92	1276	\N
11900	174	1276	\N
11901	110	1276	\N
11902	185	1276	\N
11903	87	1276	\N
11904	42	1276	\N
11905	\N	1276	236
11906	81	1277	\N
11907	92	1277	\N
11908	15	1277	\N
11909	110	1277	\N
11910	27	1277	\N
11911	185	1277	\N
11912	63	1277	\N
11913	42	1277	\N
11914	45	1277	\N
11915	68	1277	\N
11916	\N	1277	9
11917	81	1278	\N
11918	83	1278	\N
11919	15	1278	\N
11920	110	1278	\N
11921	27	1278	\N
11922	185	1278	\N
11923	63	1278	\N
11924	42	1278	\N
11925	45	1278	\N
11926	123	1278	\N
11927	\N	1278	8
11928	81	1279	\N
11929	83	1279	\N
11930	15	1279	\N
11931	110	1279	\N
11932	27	1279	\N
11933	185	1279	\N
11934	63	1279	\N
11935	42	1279	\N
11936	45	1279	\N
11937	123	1279	\N
11938	\N	1279	23
11939	81	1280	\N
11940	101	1280	\N
11941	15	1280	\N
11942	110	1280	\N
11943	27	1280	\N
11944	185	1280	\N
11945	63	1280	\N
11946	42	1280	\N
11947	45	1280	\N
11948	\N	1280	15
11949	81	1281	\N
11950	101	1281	\N
11951	15	1281	\N
11952	110	1281	\N
11953	27	1281	\N
11954	185	1281	\N
11955	63	1281	\N
11956	42	1281	\N
11957	45	1281	\N
11958	123	1281	\N
11959	\N	1281	23
11960	81	1282	\N
11961	83	1282	\N
11962	15	1282	\N
11963	110	1282	\N
11964	27	1282	\N
11965	185	1282	\N
11966	63	1282	\N
11967	42	1282	\N
11968	45	1282	\N
11969	\N	1282	8
11970	81	1283	\N
11971	94	1283	\N
11972	57	1283	\N
11973	110	1283	\N
11974	185	1283	\N
11975	63	1283	\N
11976	42	1283	\N
11977	\N	1283	157
11978	81	1284	\N
11979	90	1284	\N
11980	15	1284	\N
11981	110	1284	\N
11982	27	1284	\N
11983	185	1284	\N
11984	63	1284	\N
11985	42	1284	\N
11986	45	1284	\N
11987	123	1284	\N
11988	\N	1284	8
11989	81	1285	\N
11990	149	1285	\N
11991	15	1285	\N
11992	112	1285	\N
11993	27	1285	\N
11994	185	1285	\N
11995	63	1285	\N
11996	42	1285	\N
11997	\N	1285	58
11998	81	1286	\N
11999	94	1286	\N
12000	15	1286	\N
12001	112	1286	\N
12002	117	1286	\N
12003	185	1286	\N
12004	63	1286	\N
12005	42	1286	\N
12006	\N	1286	237
12007	81	1287	\N
12008	90	1287	\N
12009	15	1287	\N
12010	110	1287	\N
12011	27	1287	\N
12012	185	1287	\N
12013	63	1287	\N
12014	42	1287	\N
12015	45	1287	\N
12016	123	1287	\N
12017	\N	1287	8
12018	81	1288	\N
12019	83	1288	\N
12020	15	1288	\N
12021	110	1288	\N
12022	27	1288	\N
12023	185	1288	\N
12024	63	1288	\N
12025	42	1288	\N
12026	45	1288	\N
12027	\N	1288	22
12028	81	1289	\N
12029	94	1289	\N
12030	57	1289	\N
12031	110	1289	\N
12032	185	1289	\N
12033	63	1289	\N
12034	42	1289	\N
12035	\N	1289	157
12036	81	1290	\N
12037	90	1290	\N
12038	15	1290	\N
12039	110	1290	\N
12040	27	1290	\N
12041	185	1290	\N
12042	63	1290	\N
12043	42	1290	\N
12044	45	1290	\N
12045	123	1290	\N
12046	\N	1290	23
12047	81	1291	\N
12048	94	1291	\N
12049	57	1291	\N
12050	110	1291	\N
12051	185	1291	\N
12052	63	1291	\N
12053	42	1291	\N
12054	\N	1291	157
12064	81	1292	\N
12065	100	1292	\N
12066	144	1292	\N
12067	110	1292	\N
12068	114	1292	\N
12069	185	1292	\N
12070	87	1292	\N
12071	42	1292	\N
12072	\N	1292	47
12073	81	1293	\N
12074	91	1293	\N
12075	144	1293	\N
12076	110	1293	\N
12077	114	1293	\N
12078	185	1293	\N
12079	87	1293	\N
12080	42	1293	\N
12081	\N	1293	47
12090	80	1295	\N
12091	134	1295	\N
12092	172	1295	\N
12093	110	1295	\N
12094	185	1295	\N
12095	63	1295	\N
12096	66	1295	\N
12097	\N	1295	140
12098	80	1296	\N
12099	134	1296	\N
12100	172	1296	\N
12101	110	1296	\N
12102	185	1296	\N
12103	63	1296	\N
12104	66	1296	\N
12105	\N	1296	140
12106	80	1297	\N
12107	134	1297	\N
12108	162	1297	\N
12109	110	1297	\N
12110	185	1297	\N
12111	63	1297	\N
12112	66	1297	\N
12113	\N	1297	116
12122	80	1294	\N
12123	134	1294	\N
12124	172	1294	\N
12125	110	1294	\N
12126	185	1294	\N
12127	63	1294	\N
12128	66	1294	\N
12129	\N	1294	140
12130	10	1298	\N
12131	106	1298	\N
12132	162	1298	\N
12133	110	1298	\N
12134	185	1298	\N
12135	63	1298	\N
12136	42	1298	\N
12137	\N	1298	238
12138	121	1299	\N
12139	106	1299	\N
12140	197	1299	\N
12141	108	1299	\N
12142	185	1299	\N
12143	63	1299	\N
12144	66	1299	\N
12145	\N	1299	239
12146	81	1300	\N
12147	105	1300	\N
12148	57	1300	\N
12149	108	1300	\N
12150	185	1300	\N
12151	63	1300	\N
12152	42	1300	\N
12153	\N	1300	75
12154	121	1301	\N
12155	134	1301	\N
12156	148	1301	\N
12157	110	1301	\N
12158	185	1301	\N
12159	63	1301	\N
12160	42	1301	\N
12161	\N	1301	56
12162	121	1302	\N
12163	134	1302	\N
12164	148	1302	\N
12165	110	1302	\N
12166	185	1302	\N
12167	63	1302	\N
12168	42	1302	\N
12169	\N	1302	56
12170	81	1303	\N
12171	91	1303	\N
12172	15	1303	\N
12173	110	1303	\N
12174	27	1303	\N
12175	185	1303	\N
12176	63	1303	\N
12177	42	1303	\N
12178	45	1303	\N
12179	123	1303	\N
12180	\N	1303	8
12181	81	1304	\N
12182	91	1304	\N
12183	198	1304	\N
12184	110	1304	\N
12185	185	1304	\N
12186	87	1304	\N
12187	42	1304	\N
12188	\N	1304	240
12189	81	1305	\N
12190	94	1305	\N
12191	150	1305	\N
12192	110	1305	\N
12193	185	1305	\N
12194	63	1305	\N
12195	42	1305	\N
12196	\N	1305	81
12206	81	1306	\N
12207	92	1306	\N
12208	199	1306	\N
12209	110	1306	\N
12210	200	1306	\N
12211	185	1306	\N
12212	87	1306	\N
12213	42	1306	\N
12214	\N	1306	241
12215	81	1307	\N
12216	90	1307	\N
12217	15	1307	\N
12218	110	1307	\N
12219	27	1307	\N
12220	185	1307	\N
12221	63	1307	\N
12222	42	1307	\N
12223	45	1307	\N
12224	123	1307	\N
12225	\N	1307	38
12226	81	1308	\N
12227	95	1308	\N
12228	15	1308	\N
12229	110	1308	\N
12230	27	1308	\N
12231	185	1308	\N
12232	63	1308	\N
12233	42	1308	\N
12234	45	1308	\N
12235	123	1308	\N
12236	\N	1308	38
12237	81	1309	\N
12238	83	1309	\N
12239	15	1309	\N
12240	110	1309	\N
12241	27	1309	\N
12242	185	1309	\N
12243	63	1309	\N
12244	42	1309	\N
12245	45	1309	\N
12246	123	1309	\N
12247	\N	1309	38
12248	81	1310	\N
12249	92	1310	\N
12250	138	1310	\N
12251	110	1310	\N
12252	61	1310	\N
12253	185	1310	\N
12254	87	1310	\N
12255	42	1310	\N
12256	\N	1310	40
12257	80	1311	\N
12258	106	1311	\N
12259	137	1311	\N
12260	110	1311	\N
12261	185	1311	\N
12262	87	1311	\N
12263	42	1311	\N
12264	\N	1311	39
12265	81	1312	\N
12266	101	1312	\N
12267	15	1312	\N
12268	110	1312	\N
12269	27	1312	\N
12270	185	1312	\N
12271	63	1312	\N
12272	42	1312	\N
12273	\N	1312	44
12274	81	1313	\N
12275	92	1313	\N
12276	15	1313	\N
12277	110	1313	\N
12278	27	1313	\N
12279	185	1313	\N
12280	63	1313	\N
12281	42	1313	\N
12282	45	1313	\N
12283	123	1313	\N
12284	\N	1313	80
12285	81	1314	\N
12286	83	1314	\N
12287	15	1314	\N
12288	110	1314	\N
12289	27	1314	\N
12290	185	1314	\N
12291	63	1314	\N
12292	42	1314	\N
12293	45	1314	\N
12294	123	1314	\N
12295	\N	1314	8
12296	81	1315	\N
12297	90	1315	\N
12298	15	1315	\N
12299	110	1315	\N
12300	27	1315	\N
12301	185	1315	\N
12302	63	1315	\N
12303	42	1315	\N
12304	45	1315	\N
12305	123	1315	\N
12306	\N	1315	38
12307	81	1316	\N
12308	90	1316	\N
12309	15	1316	\N
12310	110	1316	\N
12311	27	1316	\N
12312	185	1316	\N
12313	63	1316	\N
12314	42	1316	\N
12315	45	1316	\N
12316	123	1316	\N
12317	\N	1316	10
12318	81	1317	\N
12319	83	1317	\N
12320	15	1317	\N
12321	110	1317	\N
12322	27	1317	\N
12323	185	1317	\N
12324	63	1317	\N
12325	42	1317	\N
12326	45	1317	\N
12327	123	1317	\N
12328	\N	1317	23
12329	81	1318	\N
12330	92	1318	\N
12331	15	1318	\N
12332	110	1318	\N
12333	27	1318	\N
12334	185	1318	\N
12335	63	1318	\N
12336	42	1318	\N
12337	45	1318	\N
12338	123	1318	\N
12339	\N	1318	80
12340	81	1319	\N
12341	83	1319	\N
12342	15	1319	\N
12343	110	1319	\N
12344	27	1319	\N
12345	185	1319	\N
12346	63	1319	\N
12347	42	1319	\N
12348	45	1319	\N
12349	\N	1319	22
12350	81	1320	\N
12351	91	1320	\N
12352	15	1320	\N
12353	110	1320	\N
12354	27	1320	\N
12355	185	1320	\N
12356	63	1320	\N
12357	42	1320	\N
12358	45	1320	\N
12359	123	1320	\N
12360	\N	1320	8
12361	81	1321	\N
12362	83	1321	\N
12363	15	1321	\N
12364	110	1321	\N
12365	27	1321	\N
12366	185	1321	\N
12367	63	1321	\N
12368	42	1321	\N
12369	45	1321	\N
12370	123	1321	\N
12371	\N	1321	38
12372	81	1322	\N
12373	92	1322	\N
12374	15	1322	\N
12375	110	1322	\N
12376	27	1322	\N
12377	185	1322	\N
12378	63	1322	\N
12379	42	1322	\N
12380	45	1322	\N
12381	123	1322	\N
12382	\N	1322	80
12383	81	1323	\N
12384	90	1323	\N
12385	15	1323	\N
12386	110	1323	\N
12387	27	1323	\N
12388	185	1323	\N
12389	63	1323	\N
12390	42	1323	\N
12391	45	1323	\N
12392	123	1323	\N
12393	\N	1323	10
12394	81	1324	\N
12395	94	1324	\N
12396	57	1324	\N
12397	110	1324	\N
12398	185	1324	\N
12399	63	1324	\N
12400	42	1324	\N
12401	\N	1324	213
12402	81	1325	\N
12403	101	1325	\N
12404	15	1325	\N
12405	110	1325	\N
12406	27	1325	\N
12407	185	1325	\N
12408	63	1325	\N
12409	42	1325	\N
12410	\N	1325	16
12411	81	1326	\N
12412	90	1326	\N
12413	15	1326	\N
12414	110	1326	\N
12415	27	1326	\N
12416	185	1326	\N
12417	63	1326	\N
12418	42	1326	\N
12419	45	1326	\N
12420	123	1326	\N
12421	\N	1326	23
12422	81	1327	\N
12423	94	1327	\N
12424	57	1327	\N
12425	110	1327	\N
12426	185	1327	\N
12427	63	1327	\N
12428	42	1327	\N
12429	\N	1327	213
12430	80	1328	\N
12431	101	1328	\N
12432	132	1328	\N
12433	107	1328	\N
12434	185	1328	\N
12435	63	1328	\N
12436	66	1328	\N
12437	\N	1328	102
12438	81	1329	\N
12439	83	1329	\N
12440	15	1329	\N
12441	110	1329	\N
12442	27	1329	\N
12443	185	1329	\N
12444	63	1329	\N
12445	42	1329	\N
12446	45	1329	\N
12447	\N	1329	21
12448	81	1330	\N
12449	91	1330	\N
12450	15	1330	\N
12451	110	1330	\N
12452	27	1330	\N
12453	185	1330	\N
12454	63	1330	\N
12455	42	1330	\N
12456	45	1330	\N
12457	123	1330	\N
12458	\N	1330	10
12459	81	1331	\N
12460	90	1331	\N
12461	15	1331	\N
12462	110	1331	\N
12463	27	1331	\N
12464	185	1331	\N
12465	63	1331	\N
12466	42	1331	\N
12467	45	1331	\N
12468	123	1331	\N
12469	\N	1331	13
12470	81	19	\N
12471	83	19	\N
12472	15	19	\N
12473	122	19	\N
12474	110	19	\N
12475	63	19	\N
12476	42	19	\N
12477	\N	19	21
12478	81	26	\N
12479	90	26	\N
12480	15	26	\N
12481	24	26	\N
12482	27	26	\N
12483	185	26	\N
12484	63	26	\N
12485	42	26	\N
12486	45	26	\N
12487	123	26	\N
12488	\N	26	24
12489	81	1332	\N
12490	90	1332	\N
12491	15	1332	\N
12492	110	1332	\N
12493	27	1332	\N
12494	185	1332	\N
12495	63	1332	\N
12496	42	1332	\N
12497	45	1332	\N
12498	123	1332	\N
12499	\N	1332	13
12500	81	1333	\N
12501	90	1333	\N
12502	15	1333	\N
12503	110	1333	\N
12504	27	1333	\N
12505	185	1333	\N
12506	63	1333	\N
12507	42	1333	\N
12508	45	1333	\N
12509	123	1333	\N
12510	\N	1333	7
12511	81	1334	\N
12512	90	1334	\N
12513	126	1334	\N
12514	110	1334	\N
12515	27	1334	\N
12516	185	1334	\N
12517	63	1334	\N
12518	42	1334	\N
12519	45	1334	\N
12520	\N	1334	17
12521	80	1335	\N
12522	134	1335	\N
12523	135	1335	\N
12524	108	1335	\N
12525	185	1335	\N
12526	63	1335	\N
12527	42	1335	\N
12528	\N	1335	49
12529	81	1336	\N
12530	90	1336	\N
12531	15	1336	\N
12532	110	1336	\N
12533	27	1336	\N
12534	185	1336	\N
12535	63	1336	\N
12536	42	1336	\N
12537	45	1336	\N
12538	123	1336	\N
12539	\N	1336	8
12540	81	1337	\N
12541	131	1337	\N
12542	143	1337	\N
12543	110	1337	\N
12544	186	1337	\N
12545	63	1337	\N
12546	66	1337	\N
12547	\N	1337	242
12548	81	1338	\N
12549	83	1338	\N
12550	15	1338	\N
12551	110	1338	\N
12552	27	1338	\N
12553	185	1338	\N
12554	63	1338	\N
12555	42	1338	\N
12556	45	1338	\N
12557	\N	1338	22
12558	81	1339	\N
12559	90	1339	\N
12560	15	1339	\N
12561	110	1339	\N
12562	27	1339	\N
12563	185	1339	\N
12564	63	1339	\N
12565	42	1339	\N
12566	45	1339	\N
12567	123	1339	\N
12568	\N	1339	7
12569	81	1340	\N
12570	90	1340	\N
12571	132	1340	\N
12572	110	1340	\N
12573	185	1340	\N
12574	63	1340	\N
12575	42	1340	\N
12576	\N	1340	141
12577	81	1341	\N
12578	94	1341	\N
12579	137	1341	\N
12580	110	1341	\N
12581	185	1341	\N
12582	63	1341	\N
12583	42	1341	\N
12584	\N	1341	243
12596	81	1343	\N
12597	90	1343	\N
12598	126	1343	\N
12599	110	1343	\N
12600	27	1343	\N
12601	185	1343	\N
12602	63	1343	\N
12603	42	1343	\N
12604	45	1343	\N
12605	\N	1343	17
12606	81	1344	\N
12607	90	1344	\N
12608	15	1344	\N
12609	110	1344	\N
12610	27	1344	\N
12611	185	1344	\N
12612	63	1344	\N
12613	42	1344	\N
12614	45	1344	\N
12615	123	1344	\N
12616	\N	1344	13
12617	81	1345	\N
12618	56	1345	\N
12619	15	1345	\N
12620	110	1345	\N
12621	27	1345	\N
12622	185	1345	\N
12623	63	1345	\N
12624	42	1345	\N
12625	45	1345	\N
12626	123	1345	\N
12627	\N	1345	245
12628	81	1346	\N
12629	141	1346	\N
12630	144	1346	\N
12631	110	1346	\N
12632	185	1346	\N
12633	87	1346	\N
12634	42	1346	\N
12635	\N	1346	244
12636	81	1347	\N
12637	141	1347	\N
12638	148	1347	\N
12639	110	1347	\N
12640	185	1347	\N
12641	63	1347	\N
12642	42	1347	\N
12643	\N	1347	93
12644	81	1342	\N
12645	90	1342	\N
12646	15	1342	\N
12647	110	1342	\N
12648	27	1342	\N
12649	185	1342	\N
12650	63	1342	\N
12651	42	1342	\N
12652	45	1342	\N
12653	123	1342	\N
12654	\N	1342	23
12655	80	1348	\N
12656	101	1348	\N
12657	151	1348	\N
12658	112	1348	\N
12659	185	1348	\N
12660	63	1348	\N
12661	42	1348	\N
12662	\N	1348	100
12663	81	1349	\N
12664	131	1349	\N
12665	132	1349	\N
12666	110	1349	\N
12667	185	1349	\N
12668	63	1349	\N
12669	66	1349	\N
12670	\N	1349	141
12671	81	1350	\N
12672	90	1350	\N
12673	15	1350	\N
12674	110	1350	\N
12675	27	1350	\N
12676	185	1350	\N
12677	63	1350	\N
12678	42	1350	\N
12679	45	1350	\N
12680	123	1350	\N
12681	\N	1350	8
12682	121	1351	\N
12683	134	1351	\N
12684	148	1351	\N
12685	110	1351	\N
12686	185	1351	\N
12687	63	1351	\N
12688	42	1351	\N
12689	\N	1351	93
12690	81	1352	\N
12691	98	1352	\N
12692	15	1352	\N
12693	112	1352	\N
12694	27	1352	\N
12695	185	1352	\N
12696	63	1352	\N
12697	42	1352	\N
12698	45	1352	\N
12699	123	1352	\N
12700	\N	1352	13
12701	81	1353	\N
12702	101	1353	\N
12703	146	1353	\N
12704	128	1353	\N
12705	185	1353	\N
12706	63	1353	\N
12707	42	1353	\N
12708	\N	1353	50
12709	81	1354	\N
12710	83	1354	\N
12711	15	1354	\N
12712	110	1354	\N
12713	27	1354	\N
12714	185	1354	\N
12715	63	1354	\N
12716	42	1354	\N
12717	45	1354	\N
12718	123	1354	\N
12719	\N	1354	38
12720	81	132	\N
12721	56	132	\N
12722	126	132	\N
12723	110	132	\N
12724	27	132	\N
12725	185	132	\N
12726	63	132	\N
12727	42	132	\N
12728	45	132	\N
12729	\N	132	17
12730	81	133	\N
12731	83	133	\N
12732	15	133	\N
12733	110	133	\N
12734	27	133	\N
12735	185	133	\N
12736	63	133	\N
12737	42	133	\N
12738	45	133	\N
12739	123	133	\N
12740	\N	133	21
12741	81	1355	\N
12742	90	1355	\N
12743	15	1355	\N
12744	110	1355	\N
12745	27	1355	\N
12746	185	1355	\N
12747	63	1355	\N
12748	42	1355	\N
12749	45	1355	\N
12750	123	1355	\N
12751	\N	1355	2
12752	81	1356	\N
12753	83	1356	\N
12754	15	1356	\N
12755	110	1356	\N
12756	27	1356	\N
12757	185	1356	\N
12758	63	1356	\N
12759	42	1356	\N
12760	45	1356	\N
12761	\N	1356	21
12762	81	1357	\N
12763	90	1357	\N
12764	15	1357	\N
12765	110	1357	\N
12766	27	1357	\N
12767	185	1357	\N
12768	63	1357	\N
12769	42	1357	\N
12770	45	1357	\N
12771	123	1357	\N
12772	\N	1357	38
12773	81	1358	\N
12774	90	1358	\N
12775	15	1358	\N
12776	110	1358	\N
12777	27	1358	\N
12778	185	1358	\N
12779	63	1358	\N
12780	42	1358	\N
12781	45	1358	\N
12782	123	1358	\N
12783	\N	1358	7
12784	80	1359	\N
12785	134	1359	\N
12786	137	1359	\N
12787	108	1359	\N
12788	185	1359	\N
12789	63	1359	\N
12790	66	1359	\N
12791	\N	1359	143
12792	81	1360	\N
12793	90	1360	\N
12794	15	1360	\N
12795	110	1360	\N
12796	27	1360	\N
12797	185	1360	\N
12798	63	1360	\N
12799	42	1360	\N
12800	45	1360	\N
12801	123	1360	\N
12802	\N	1360	8
12803	81	1361	\N
12804	90	1361	\N
12805	15	1361	\N
12806	110	1361	\N
12807	27	1361	\N
12808	185	1361	\N
12809	63	1361	\N
12810	42	1361	\N
12811	45	1361	\N
12812	123	1361	\N
12813	\N	1361	13
12814	121	1362	\N
12815	101	1362	\N
12816	145	1362	\N
12817	110	1362	\N
12818	185	1362	\N
12819	63	1362	\N
12820	42	1362	\N
12821	\N	1362	48
12822	81	1363	\N
12823	90	1363	\N
12824	126	1363	\N
12825	110	1363	\N
12826	27	1363	\N
12827	185	1363	\N
12828	63	1363	\N
12829	42	1363	\N
12830	45	1363	\N
12831	\N	1363	17
12832	81	1364	\N
12833	94	1364	\N
12834	143	1364	\N
12835	110	1364	\N
12836	61	1364	\N
12837	185	1364	\N
12838	87	1364	\N
12839	36	1364	\N
12840	42	1364	\N
12841	\N	1364	246
12842	81	1365	\N
12843	94	1365	\N
12844	143	1365	\N
12845	110	1365	\N
12846	61	1365	\N
12847	185	1365	\N
12848	87	1365	\N
12849	36	1365	\N
12850	42	1365	\N
12851	\N	1365	246
12852	81	1366	\N
12853	94	1366	\N
12854	143	1366	\N
12855	110	1366	\N
12856	61	1366	\N
12857	185	1366	\N
12858	87	1366	\N
12859	36	1366	\N
12860	42	1366	\N
12861	\N	1366	246
12872	81	1368	\N
12873	90	1368	\N
12874	15	1368	\N
12875	110	1368	\N
12876	27	1368	\N
12877	185	1368	\N
12878	63	1368	\N
12879	42	1368	\N
12880	45	1368	\N
12881	123	1368	\N
12882	\N	1368	23
12883	81	1369	\N
12884	91	1369	\N
12885	15	1369	\N
12886	110	1369	\N
12887	27	1369	\N
12888	185	1369	\N
12889	63	1369	\N
12890	42	1369	\N
12891	45	1369	\N
12892	123	1369	\N
12893	\N	1369	51
12894	81	1370	\N
12895	95	1370	\N
12896	15	1370	\N
12897	110	1370	\N
12898	27	1370	\N
12899	185	1370	\N
12900	63	1370	\N
12901	42	1370	\N
12902	\N	1370	12
12903	81	1371	\N
12904	100	1371	\N
12905	15	1371	\N
12906	110	1371	\N
12907	27	1371	\N
12908	185	1371	\N
12909	63	1371	\N
12910	42	1371	\N
12911	\N	1371	15
12912	80	1372	\N
12913	101	1372	\N
12914	162	1372	\N
12915	24	1372	\N
12916	185	1372	\N
12917	63	1372	\N
12918	66	1372	\N
12919	\N	1372	116
12920	81	1373	\N
12921	101	1373	\N
12922	15	1373	\N
12923	110	1373	\N
12924	27	1373	\N
12925	185	1373	\N
12926	63	1373	\N
12927	42	1373	\N
12928	\N	1373	44
12929	81	1374	\N
12930	56	1374	\N
12931	15	1374	\N
12932	110	1374	\N
12933	27	1374	\N
12934	185	1374	\N
12935	63	1374	\N
12936	42	1374	\N
12937	45	1374	\N
12938	123	1374	\N
12939	\N	1374	15
12940	81	1375	\N
12941	90	1375	\N
12942	15	1375	\N
12943	110	1375	\N
12944	27	1375	\N
12945	185	1375	\N
12946	63	1375	\N
12947	42	1375	\N
12948	45	1375	\N
12949	123	1375	\N
12950	\N	1375	38
12951	81	1376	\N
12952	94	1376	\N
12953	57	1376	\N
12954	110	1376	\N
12955	185	1376	\N
12956	63	1376	\N
12957	42	1376	\N
12958	\N	1376	247
12959	121	1377	\N
12960	105	1377	\N
12961	57	1377	\N
12962	110	1377	\N
12963	185	1377	\N
12964	63	1377	\N
12965	42	1377	\N
12966	\N	1377	75
12967	81	1378	\N
12968	95	1378	\N
12969	57	1378	\N
12970	110	1378	\N
12971	185	1378	\N
12972	63	1378	\N
12973	42	1378	\N
12974	\N	1378	248
12975	80	1379	\N
12976	134	1379	\N
12977	195	1379	\N
12978	110	1379	\N
12979	185	1379	\N
12980	63	1379	\N
12981	66	1379	\N
12982	\N	1379	249
12983	121	1380	\N
12984	106	1380	\N
12985	137	1380	\N
12986	108	1380	\N
12987	185	1380	\N
12988	63	1380	\N
12989	42	1380	\N
12990	\N	1380	185
12991	81	1381	\N
12992	90	1381	\N
12993	15	1381	\N
12994	110	1381	\N
12995	27	1381	\N
12996	185	1381	\N
12997	63	1381	\N
12998	42	1381	\N
12999	45	1381	\N
13000	123	1381	\N
13001	\N	1381	2
13002	81	1382	\N
13003	90	1382	\N
13004	15	1382	\N
13005	110	1382	\N
13006	27	1382	\N
13007	185	1382	\N
13008	63	1382	\N
13009	42	1382	\N
13010	45	1382	\N
13011	123	1382	\N
13012	\N	1382	250
13013	81	1383	\N
13014	90	1383	\N
13015	15	1383	\N
13016	110	1383	\N
13017	27	1383	\N
13018	185	1383	\N
13019	63	1383	\N
13020	42	1383	\N
13021	45	1383	\N
13022	123	1383	\N
13023	\N	1383	2
13024	80	1384	\N
13025	106	1384	\N
13026	137	1384	\N
13027	110	1384	\N
13028	185	1384	\N
13029	87	1384	\N
13030	42	1384	\N
13031	\N	1384	39
13032	81	1385	\N
13033	90	1385	\N
13034	15	1385	\N
13035	110	1385	\N
13036	27	1385	\N
13037	185	1385	\N
13038	63	1385	\N
13039	42	1385	\N
13040	45	1385	\N
13041	123	1385	\N
13042	\N	1385	3
13043	81	1386	\N
13044	90	1386	\N
13045	57	1386	\N
13046	110	1386	\N
13047	185	1386	\N
13048	63	1386	\N
13049	42	1386	\N
13050	\N	1386	150
13051	81	1387	\N
13052	102	1387	\N
13053	146	1387	\N
13054	60	1387	\N
13055	115	1387	\N
13056	185	1387	\N
13057	87	1387	\N
13058	42	1387	\N
13059	45	1387	\N
13060	\N	1387	251
13061	81	1388	\N
13062	100	1388	\N
13063	57	1388	\N
13064	110	1388	\N
13065	185	1388	\N
13066	63	1388	\N
13067	42	1388	\N
13068	\N	1388	150
13069	82	1389	\N
13070	134	1389	\N
13071	137	1389	\N
13072	111	1389	\N
13073	185	1389	\N
13074	63	1389	\N
13075	66	1389	\N
13076	\N	1389	252
13077	121	1390	\N
13078	134	1390	\N
13079	148	1390	\N
13080	160	1390	\N
13081	185	1390	\N
13082	63	1390	\N
13083	42	1390	\N
13084	\N	1390	56
13085	121	1391	\N
13086	101	1391	\N
13087	148	1391	\N
13088	167	1391	\N
13089	185	1391	\N
13090	63	1391	\N
13091	42	1391	\N
13092	\N	1391	56
13093	80	1392	\N
13094	134	1392	\N
13095	135	1392	\N
13096	110	1392	\N
13097	185	1392	\N
13098	63	1392	\N
13099	66	1392	\N
13100	\N	1392	99
13104	111	1393	\N
13107	66	1393	\N
13120	81	1393	\N
13121	90	1393	\N
13122	15	1393	\N
13123	110	1393	\N
13124	27	1393	\N
13125	185	1393	\N
13126	63	1393	\N
13127	42	1393	\N
13128	45	1393	\N
13129	123	1393	\N
13130	\N	1393	13
13131	121	1394	\N
13132	101	1394	\N
13133	15	1394	\N
13134	111	1394	\N
13135	185	1394	\N
13136	63	1394	\N
13137	66	1394	\N
13138	\N	1394	178
13139	82	1395	\N
13140	134	1395	\N
13141	162	1395	\N
13142	107	1395	\N
13143	185	1395	\N
13144	63	1395	\N
13145	66	1395	\N
13146	\N	1395	253
13147	80	1396	\N
13148	134	1396	\N
13149	137	1396	\N
13150	108	1396	\N
13151	185	1396	\N
13152	87	1396	\N
13153	66	1396	\N
13154	\N	1396	254
13155	81	1397	\N
13156	90	1397	\N
13157	126	1397	\N
13158	110	1397	\N
13159	27	1397	\N
13160	185	1397	\N
13161	63	1397	\N
13162	42	1397	\N
13163	45	1397	\N
13164	\N	1397	17
13165	80	1398	\N
13166	134	1398	\N
13167	135	1398	\N
13168	108	1398	\N
13169	185	1398	\N
13170	63	1398	\N
13171	66	1398	\N
13172	\N	1398	99
13173	81	1399	\N
13174	91	1399	\N
13175	15	1399	\N
13176	110	1399	\N
13177	27	1399	\N
13178	185	1399	\N
13179	63	1399	\N
13180	42	1399	\N
13181	45	1399	\N
13182	123	1399	\N
13183	\N	1399	38
13184	81	1400	\N
13185	83	1400	\N
13186	15	1400	\N
13187	110	1400	\N
13188	27	1400	\N
13189	185	1400	\N
13190	63	1400	\N
13191	42	1400	\N
13192	45	1400	\N
13193	123	1400	\N
13194	\N	1400	38
13195	81	1401	\N
13196	90	1401	\N
13197	15	1401	\N
13198	110	1401	\N
13199	27	1401	\N
13200	185	1401	\N
13201	63	1401	\N
13202	42	1401	\N
13203	45	1401	\N
13204	123	1401	\N
13205	\N	1401	23
13206	81	1402	\N
13207	90	1402	\N
13208	126	1402	\N
13209	110	1402	\N
13210	27	1402	\N
13211	185	1402	\N
13212	63	1402	\N
13213	42	1402	\N
13214	45	1402	\N
13215	\N	1402	17
13216	121	1403	\N
13217	134	1403	\N
13218	148	1403	\N
13219	108	1403	\N
13220	185	1403	\N
13221	63	1403	\N
13222	42	1403	\N
13223	\N	1403	56
13224	81	1404	\N
13225	90	1404	\N
13226	15	1404	\N
13227	110	1404	\N
13228	27	1404	\N
13229	185	1404	\N
13230	63	1404	\N
13231	42	1404	\N
13232	45	1404	\N
13233	123	1404	\N
13234	\N	1404	13
13235	81	1405	\N
13236	90	1405	\N
13237	126	1405	\N
13238	110	1405	\N
13239	27	1405	\N
13240	185	1405	\N
13241	63	1405	\N
13242	42	1405	\N
13243	45	1405	\N
13244	\N	1405	17
13245	80	1406	\N
13246	134	1406	\N
13247	156	1406	\N
13248	108	1406	\N
13249	185	1406	\N
13250	63	1406	\N
13251	42	1406	\N
13252	\N	1406	128
13253	81	1407	\N
13254	90	1407	\N
13255	137	1407	\N
13256	110	1407	\N
13257	185	1407	\N
13258	63	1407	\N
13259	66	1407	\N
13260	\N	1407	174
13261	80	1408	\N
13262	101	1408	\N
13263	135	1408	\N
13264	108	1408	\N
13265	185	1408	\N
13266	63	1408	\N
13267	66	1408	\N
13268	\N	1408	49
13269	81	1409	\N
13270	90	1409	\N
13271	15	1409	\N
13272	110	1409	\N
13273	27	1409	\N
13274	185	1409	\N
13275	63	1409	\N
13276	42	1409	\N
13277	45	1409	\N
13278	123	1409	\N
13279	\N	1409	13
13280	81	1410	\N
13281	83	1410	\N
13282	15	1410	\N
13283	110	1410	\N
13284	27	1410	\N
13285	185	1410	\N
13286	63	1410	\N
13287	42	1410	\N
13288	45	1410	\N
13289	\N	1410	21
13290	81	1411	\N
13291	90	1411	\N
13292	137	1411	\N
13293	110	1411	\N
13294	185	1411	\N
13295	63	1411	\N
13296	42	1411	\N
13297	\N	1411	174
13298	81	1412	\N
13299	90	1412	\N
13300	15	1412	\N
13301	110	1412	\N
13302	27	1412	\N
13303	185	1412	\N
13304	63	1412	\N
13305	42	1412	\N
13306	45	1412	\N
13307	123	1412	\N
13308	\N	1412	8
13309	10	1413	\N
13310	56	1413	\N
13311	137	1413	\N
13312	110	1413	\N
13313	185	1413	\N
13314	63	1413	\N
13315	42	1413	\N
13316	\N	1413	255
13317	121	1414	\N
13318	134	1414	\N
13319	148	1414	\N
13320	107	1414	\N
13321	185	1414	\N
13322	63	1414	\N
13323	42	1414	\N
13324	\N	1414	56
13325	121	1415	\N
13326	101	1415	\N
13327	148	1415	\N
13328	112	1415	\N
13329	185	1415	\N
13330	63	1415	\N
13331	42	1415	\N
13332	\N	1415	93
13333	81	1416	\N
13334	83	1416	\N
13335	15	1416	\N
13336	110	1416	\N
13337	27	1416	\N
13338	185	1416	\N
13339	63	1416	\N
13340	42	1416	\N
13341	45	1416	\N
13342	\N	1416	21
13343	81	1417	\N
13344	90	1417	\N
13345	15	1417	\N
13346	110	1417	\N
13347	27	1417	\N
13348	185	1417	\N
13349	63	1417	\N
13350	42	1417	\N
13351	45	1417	\N
13352	123	1417	\N
13353	\N	1417	13
13354	81	1418	\N
13355	56	1418	\N
13356	194	1418	\N
13357	110	1418	\N
13358	185	1418	\N
13359	63	1418	\N
13360	66	1418	\N
13361	\N	1418	229
13362	81	1419	\N
13363	56	1419	\N
13364	132	1419	\N
13365	110	1419	\N
13366	185	1419	\N
13367	63	1419	\N
13368	66	1419	\N
13369	\N	1419	170
13370	81	1420	\N
13371	90	1420	\N
13372	15	1420	\N
13373	110	1420	\N
13374	27	1420	\N
13375	185	1420	\N
13376	63	1420	\N
13377	42	1420	\N
13378	45	1420	\N
13379	123	1420	\N
13380	\N	1420	8
13381	81	1421	\N
13382	83	1421	\N
13383	15	1421	\N
13384	110	1421	\N
13385	27	1421	\N
13386	185	1421	\N
13387	63	1421	\N
13388	42	1421	\N
13389	45	1421	\N
13390	\N	1421	21
13391	81	1422	\N
13392	90	1422	\N
13393	15	1422	\N
13394	110	1422	\N
13395	27	1422	\N
13396	185	1422	\N
13397	63	1422	\N
13398	42	1422	\N
13399	45	1422	\N
13400	123	1422	\N
13401	\N	1422	13
13402	121	1423	\N
13403	134	1423	\N
13404	15	1423	\N
13405	110	1423	\N
13406	185	1423	\N
13407	63	1423	\N
13408	42	1423	\N
13409	\N	1423	178
13410	81	1424	\N
13411	90	1424	\N
13412	126	1424	\N
13413	110	1424	\N
13414	27	1424	\N
13415	185	1424	\N
13416	63	1424	\N
13417	42	1424	\N
13418	45	1424	\N
13419	\N	1424	17
13420	121	1425	\N
13421	101	1425	\N
13422	135	1425	\N
13423	110	1425	\N
13424	185	1425	\N
13425	87	1425	\N
13426	66	1425	\N
13427	\N	1425	186
13428	81	1426	\N
13429	94	1426	\N
13430	15	1426	\N
13431	60	1426	\N
13432	117	1426	\N
13433	185	1426	\N
13434	63	1426	\N
13435	42	1426	\N
13436	\N	1426	11
13437	81	1427	\N
13438	90	1427	\N
13439	126	1427	\N
13440	110	1427	\N
13441	27	1427	\N
13442	185	1427	\N
13443	63	1427	\N
13444	42	1427	\N
13445	45	1427	\N
13446	\N	1427	17
13447	81	1428	\N
13448	90	1428	\N
13449	15	1428	\N
13450	110	1428	\N
13451	27	1428	\N
13452	185	1428	\N
13453	63	1428	\N
13454	42	1428	\N
13455	45	1428	\N
13456	123	1428	\N
13457	\N	1428	23
13458	81	9	\N
13459	101	9	\N
13460	125	9	\N
13461	85	9	\N
13462	110	9	\N
13463	117	9	\N
13464	63	9	\N
13465	42	9	\N
13466	\N	9	256
13467	81	1429	\N
13468	90	1429	\N
13469	125	1429	\N
13470	110	1429	\N
13471	117	1429	\N
13472	185	1429	\N
13473	87	1429	\N
13474	42	1429	\N
13475	\N	1429	256
13476	81	1430	\N
13477	101	1430	\N
13478	144	1430	\N
13479	110	1430	\N
13480	185	1430	\N
13481	87	1430	\N
13482	42	1430	\N
13483	\N	1430	86
13484	81	1431	\N
13485	90	1431	\N
13486	15	1431	\N
13487	110	1431	\N
13488	27	1431	\N
13489	185	1431	\N
13490	63	1431	\N
13491	42	1431	\N
13492	45	1431	\N
13493	123	1431	\N
13494	\N	1431	8
13495	121	1432	\N
13496	134	1432	\N
13497	148	1432	\N
13498	110	1432	\N
13499	185	1432	\N
13500	63	1432	\N
13501	42	1432	\N
13502	\N	1432	93
13503	81	1433	\N
13504	90	1433	\N
13505	15	1433	\N
13506	110	1433	\N
13507	27	1433	\N
13508	185	1433	\N
13509	63	1433	\N
13510	42	1433	\N
13511	45	1433	\N
13512	123	1433	\N
13513	\N	1433	13
13514	81	1434	\N
13515	90	1434	\N
13516	168	1434	\N
13517	110	1434	\N
13518	185	1434	\N
13519	63	1434	\N
13520	42	1434	\N
13521	\N	1434	257
13522	80	1435	\N
13523	134	1435	\N
13524	162	1435	\N
13525	110	1435	\N
13526	185	1435	\N
13527	63	1435	\N
13528	66	1435	\N
13529	\N	1435	116
13530	81	1436	\N
13531	83	1436	\N
13532	15	1436	\N
13533	110	1436	\N
13534	27	1436	\N
13535	185	1436	\N
13536	63	1436	\N
13537	42	1436	\N
13538	45	1436	\N
13539	\N	1436	21
13540	81	1437	\N
13541	90	1437	\N
13542	15	1437	\N
13543	110	1437	\N
13544	27	1437	\N
13545	185	1437	\N
13546	63	1437	\N
13547	42	1437	\N
13548	45	1437	\N
13549	\N	1437	13
13550	81	1438	\N
13551	56	1438	\N
13552	168	1438	\N
13553	110	1438	\N
13554	185	1438	\N
13555	63	1438	\N
13556	42	1438	\N
13557	\N	1438	258
13558	81	1439	\N
13559	56	1439	\N
13560	156	1439	\N
13561	110	1439	\N
13562	185	1439	\N
13563	63	1439	\N
13564	42	1439	\N
13565	\N	1439	84
13566	81	1440	\N
13567	91	1440	\N
13568	137	1440	\N
13569	110	1440	\N
13570	185	1440	\N
13571	63	1440	\N
13572	42	1440	\N
13573	\N	1440	174
13574	81	1441	\N
13575	91	1441	\N
13576	137	1441	\N
13577	110	1441	\N
13578	185	1441	\N
13579	63	1441	\N
13580	66	1441	\N
13581	\N	1441	174
13582	81	1442	\N
13583	56	1442	\N
13584	132	1442	\N
13585	110	1442	\N
13586	185	1442	\N
13587	63	1442	\N
13588	42	1442	\N
13589	\N	1442	29
13590	81	1443	\N
13591	93	1443	\N
13592	168	1443	\N
13593	110	1443	\N
13594	185	1443	\N
13595	63	1443	\N
13596	42	1443	\N
13597	\N	1443	258
13598	81	1444	\N
13599	90	1444	\N
13600	126	1444	\N
13601	110	1444	\N
13602	27	1444	\N
13603	185	1444	\N
13604	63	1444	\N
13605	42	1444	\N
13606	45	1444	\N
13607	\N	1444	17
13608	80	1445	\N
13609	106	1445	\N
13610	162	1445	\N
13611	110	1445	\N
13612	185	1445	\N
13613	63	1445	\N
13614	66	1445	\N
13615	\N	1445	116
13616	81	1446	\N
13617	101	1446	\N
13618	146	1446	\N
13619	111	1446	\N
13620	185	1446	\N
13621	63	1446	\N
13622	42	1446	\N
13623	\N	1446	50
13624	81	1447	\N
13625	90	1447	\N
13626	126	1447	\N
13627	110	1447	\N
13628	27	1447	\N
13629	185	1447	\N
13630	63	1447	\N
13631	42	1447	\N
13632	45	1447	\N
13633	\N	1447	17
13634	81	1448	\N
13635	90	1448	\N
13636	15	1448	\N
13637	110	1448	\N
13638	27	1448	\N
13639	185	1448	\N
13640	63	1448	\N
13641	42	1448	\N
13642	45	1448	\N
13643	123	1448	\N
13644	81	1449	\N
13645	83	1449	\N
13646	15	1449	\N
13647	110	1449	\N
13648	27	1449	\N
13649	185	1449	\N
13650	63	1449	\N
13651	42	1449	\N
13652	45	1449	\N
13653	\N	1449	21
13654	81	1450	\N
13655	90	1450	\N
13656	15	1450	\N
13657	110	1450	\N
13658	27	1450	\N
13659	185	1450	\N
13660	63	1450	\N
13661	42	1450	\N
13662	45	1450	\N
13663	123	1450	\N
13664	\N	1450	8
13665	81	58	\N
13666	83	58	\N
13667	15	58	\N
13668	110	58	\N
13669	27	58	\N
13670	63	58	\N
13671	42	58	\N
13672	45	58	\N
13673	123	58	\N
13674	\N	58	21
13675	81	1451	\N
13676	90	1451	\N
13677	15	1451	\N
13678	110	1451	\N
13679	27	1451	\N
13680	185	1451	\N
13681	63	1451	\N
13682	42	1451	\N
13683	45	1451	\N
13684	123	1451	\N
13685	\N	1451	8
13686	81	1452	\N
13687	90	1452	\N
13688	15	1452	\N
13689	110	1452	\N
13690	27	1452	\N
13691	185	1452	\N
13692	63	1452	\N
13693	42	1452	\N
13694	45	1452	\N
13695	123	1452	\N
13696	\N	1452	13
13697	81	1453	\N
13698	90	1453	\N
13699	15	1453	\N
13700	110	1453	\N
13701	27	1453	\N
13702	185	1453	\N
13703	63	1453	\N
13704	42	1453	\N
13705	45	1453	\N
13706	123	1453	\N
13707	\N	1453	3
13708	81	1454	\N
13709	90	1454	\N
13710	15	1454	\N
13711	110	1454	\N
13712	27	1454	\N
13713	185	1454	\N
13714	63	1454	\N
13715	42	1454	\N
13716	45	1454	\N
13717	123	1454	\N
13718	\N	1454	7
13719	81	1455	\N
13720	91	1455	\N
13721	137	1455	\N
13722	110	1455	\N
13723	185	1455	\N
13724	63	1455	\N
13725	66	1455	\N
13726	\N	1455	174
13727	81	1456	\N
13728	90	1456	\N
13729	15	1456	\N
13730	110	1456	\N
13731	27	1456	\N
13732	185	1456	\N
13733	63	1456	\N
13734	42	1456	\N
13735	45	1456	\N
13736	123	1456	\N
13737	\N	1456	13
13738	81	1457	\N
13739	101	1457	\N
13740	146	1457	\N
13741	110	1457	\N
13742	185	1457	\N
13743	63	1457	\N
13744	42	1457	\N
13745	\N	1457	50
13746	81	1458	\N
13747	90	1458	\N
13748	15	1458	\N
13749	110	1458	\N
13750	27	1458	\N
13751	185	1458	\N
13752	63	1458	\N
13753	42	1458	\N
13754	45	1458	\N
13755	123	1458	\N
13756	\N	1458	23
13757	81	1459	\N
13758	90	1459	\N
13759	15	1459	\N
13760	110	1459	\N
13761	27	1459	\N
13762	185	1459	\N
13763	63	1459	\N
13764	42	1459	\N
13765	45	1459	\N
13766	123	1459	\N
13767	\N	1459	13
13768	81	1460	\N
13769	90	1460	\N
13770	15	1460	\N
13771	110	1460	\N
13772	27	1460	\N
13773	185	1460	\N
13774	63	1460	\N
13775	42	1460	\N
13776	45	1460	\N
13777	123	1460	\N
13778	\N	1460	8
13779	81	1461	\N
13780	83	1461	\N
13781	15	1461	\N
13782	110	1461	\N
13783	27	1461	\N
13784	185	1461	\N
13785	63	1461	\N
13786	42	1461	\N
13787	45	1461	\N
13788	\N	1461	22
13789	80	1462	\N
13790	93	1462	\N
13791	137	1462	\N
13792	110	1462	\N
13793	185	1462	\N
13794	63	1462	\N
13795	42	1462	\N
13796	\N	1462	255
13797	81	1463	\N
13798	90	1463	\N
13799	126	1463	\N
13800	110	1463	\N
13801	27	1463	\N
13802	185	1463	\N
13803	63	1463	\N
13804	42	1463	\N
13805	45	1463	\N
13806	\N	1463	17
13807	80	1464	\N
13808	106	1464	\N
13809	132	1464	\N
13810	108	1464	\N
13811	185	1464	\N
13812	63	1464	\N
13813	66	1464	\N
13814	\N	1464	102
13815	121	1465	\N
13816	134	1465	\N
13817	148	1465	\N
13818	107	1465	\N
13819	184	1465	\N
13820	63	1465	\N
13821	42	1465	\N
13822	\N	1465	56
13823	81	1466	\N
13824	90	1466	\N
13825	15	1466	\N
13826	110	1466	\N
13827	27	1466	\N
13828	185	1466	\N
13829	63	1466	\N
13830	42	1466	\N
13831	45	1466	\N
13832	123	1466	\N
13833	\N	1466	2
13834	81	1467	\N
13835	83	1467	\N
13836	15	1467	\N
13837	110	1467	\N
13838	27	1467	\N
13839	185	1467	\N
13840	63	1467	\N
13841	42	1467	\N
13842	45	1467	\N
13843	\N	1467	22
13844	81	1468	\N
13845	90	1468	\N
13846	15	1468	\N
13847	110	1468	\N
13848	27	1468	\N
13849	185	1468	\N
13850	63	1468	\N
13851	42	1468	\N
13852	45	1468	\N
13853	123	1468	\N
13854	\N	1468	13
13855	81	1469	\N
13856	131	1469	\N
13857	132	1469	\N
13858	110	1469	\N
13859	185	1469	\N
13860	63	1469	\N
13861	66	1469	\N
13862	\N	1469	141
13863	81	1470	\N
13864	101	1470	\N
13865	137	1470	\N
13866	108	1470	\N
13867	185	1470	\N
13868	63	1470	\N
13869	66	1470	\N
13870	\N	1470	39
13871	81	1471	\N
13872	94	1471	\N
13873	135	1471	\N
13874	107	1471	\N
13875	184	1471	\N
13876	63	1471	\N
13877	42	1471	\N
13878	\N	1471	188
13879	81	1472	\N
13880	134	1472	\N
13881	132	1472	\N
13882	110	1472	\N
13883	185	1472	\N
13884	63	1472	\N
13885	66	1472	\N
13886	\N	1472	259
13887	81	1473	\N
13888	90	1473	\N
13889	15	1473	\N
13890	110	1473	\N
13891	27	1473	\N
13892	185	1473	\N
13893	63	1473	\N
13894	42	1473	\N
13895	45	1473	\N
13896	123	1473	\N
13897	\N	1473	13
13898	81	1474	\N
13899	90	1474	\N
13900	15	1474	\N
13901	110	1474	\N
13902	27	1474	\N
13903	185	1474	\N
13904	63	1474	\N
13905	42	1474	\N
13906	45	1474	\N
13907	123	1474	\N
13908	\N	1474	7
13909	81	1475	\N
13910	90	1475	\N
13911	15	1475	\N
13912	110	1475	\N
13913	27	1475	\N
13914	185	1475	\N
13915	63	1475	\N
13916	42	1475	\N
13917	45	1475	\N
13918	123	1475	\N
13919	\N	1475	3
13920	81	1476	\N
13921	90	1476	\N
13922	15	1476	\N
13923	110	1476	\N
13924	27	1476	\N
13925	185	1476	\N
13926	63	1476	\N
13927	42	1476	\N
13928	45	1476	\N
13929	123	1476	\N
13930	\N	1476	8
13931	81	1477	\N
13932	101	1477	\N
13933	15	1477	\N
13934	60	1477	\N
13935	185	1477	\N
13936	63	1477	\N
13937	42	1477	\N
13938	\N	1477	58
13939	81	1478	\N
13940	98	1478	\N
13941	146	1478	\N
13942	108	1478	\N
13943	185	1478	\N
13944	63	1478	\N
13945	42	1478	\N
13946	\N	1478	50
13947	80	1479	\N
13948	134	1479	\N
13949	132	1479	\N
13950	167	1479	\N
13951	185	1479	\N
13952	63	1479	\N
13953	66	1479	\N
13954	\N	1479	102
13955	81	1480	\N
13956	90	1480	\N
13957	15	1480	\N
13958	110	1480	\N
13959	27	1480	\N
13960	185	1480	\N
13961	63	1480	\N
13962	42	1480	\N
13963	45	1480	\N
13964	123	1480	\N
13965	\N	1480	7
13966	81	1481	\N
13967	90	1481	\N
13968	15	1481	\N
13969	110	1481	\N
13970	27	1481	\N
13971	185	1481	\N
13972	63	1481	\N
13973	42	1481	\N
13974	45	1481	\N
13975	123	1481	\N
13976	\N	1481	13
13977	81	1482	\N
13978	90	1482	\N
13979	15	1482	\N
13980	110	1482	\N
13981	27	1482	\N
13982	185	1482	\N
13983	63	1482	\N
13984	42	1482	\N
13985	45	1482	\N
13986	123	1482	\N
13987	\N	1482	13
13988	81	1483	\N
13989	90	1483	\N
13990	15	1483	\N
13991	110	1483	\N
13992	27	1483	\N
13993	185	1483	\N
13994	63	1483	\N
13995	42	1483	\N
13996	45	1483	\N
13997	123	1483	\N
13998	\N	1483	8
13999	81	1484	\N
14000	90	1484	\N
14001	126	1484	\N
14002	110	1484	\N
14003	27	1484	\N
14004	185	1484	\N
14005	63	1484	\N
14006	42	1484	\N
14007	45	1484	\N
14008	\N	1484	17
14009	121	1485	\N
14010	134	1485	\N
14011	162	1485	\N
14012	110	1485	\N
14013	185	1485	\N
14014	63	1485	\N
14015	66	1485	\N
14016	\N	1485	189
14017	81	1486	\N
14018	94	1486	\N
14019	57	1486	\N
14020	110	1486	\N
14021	185	1486	\N
14022	63	1486	\N
14023	42	1486	\N
14024	\N	1486	213
14034	81	1487	\N
14035	83	1487	\N
14036	15	1487	\N
14037	110	1487	\N
14038	27	1487	\N
14039	185	1487	\N
14040	30	1487	\N
14041	42	1487	\N
14042	\N	1487	21
14043	80	1488	\N
14044	134	1488	\N
14045	162	1488	\N
14046	160	1488	\N
14047	185	1488	\N
14048	63	1488	\N
14049	66	1488	\N
14050	\N	1488	260
14051	81	1489	\N
14052	90	1489	\N
14053	126	1489	\N
14054	110	1489	\N
14055	27	1489	\N
14056	185	1489	\N
14057	63	1489	\N
14058	42	1489	\N
14059	45	1489	\N
14060	\N	1489	17
14061	81	1490	\N
14062	90	1490	\N
14063	15	1490	\N
14064	110	1490	\N
14065	27	1490	\N
14066	185	1490	\N
14067	63	1490	\N
14068	42	1490	\N
14069	45	1490	\N
14070	123	1490	\N
14071	\N	1490	10
14072	81	1491	\N
14073	90	1491	\N
14074	15	1491	\N
14075	110	1491	\N
14076	27	1491	\N
14077	185	1491	\N
14078	63	1491	\N
14079	42	1491	\N
14080	45	1491	\N
14081	123	1491	\N
14082	\N	1491	13
14083	81	1492	\N
14084	90	1492	\N
14085	15	1492	\N
14086	110	1492	\N
14087	27	1492	\N
14088	185	1492	\N
14089	63	1492	\N
14090	42	1492	\N
14091	45	1492	\N
14092	123	1492	\N
14093	\N	1492	23
14094	81	1493	\N
14095	83	1493	\N
14096	15	1493	\N
14097	110	1493	\N
14098	27	1493	\N
14099	185	1493	\N
14100	63	1493	\N
14101	42	1493	\N
14102	45	1493	\N
14103	123	1493	\N
14104	\N	1493	2
14105	81	1494	\N
14106	90	1494	\N
14107	126	1494	\N
14108	110	1494	\N
14109	27	1494	\N
14110	185	1494	\N
14111	63	1494	\N
14112	42	1494	\N
14113	45	1494	\N
14114	\N	1494	17
14115	80	1495	\N
14116	134	1495	\N
14117	135	1495	\N
14118	107	1495	\N
14119	185	1495	\N
14120	63	1495	\N
14121	66	1495	\N
14122	\N	1495	99
14123	81	1496	\N
14124	90	1496	\N
14125	15	1496	\N
14126	110	1496	\N
14127	27	1496	\N
14128	185	1496	\N
14129	63	1496	\N
14130	42	1496	\N
14131	45	1496	\N
14132	123	1496	\N
14133	\N	1496	8
14134	81	1497	\N
14135	56	1497	\N
14136	168	1497	\N
14137	110	1497	\N
14138	185	1497	\N
14139	63	1497	\N
14140	42	1497	\N
14141	\N	1497	257
14142	81	1498	\N
14143	94	1498	\N
14144	201	1498	\N
14145	110	1498	\N
14146	185	1498	\N
14147	63	1498	\N
14148	42	1498	\N
14149	\N	1498	261
14150	121	1499	\N
14151	101	1499	\N
14152	156	1499	\N
14153	110	1499	\N
14154	185	1499	\N
14155	63	1499	\N
14156	66	1499	\N
14157	\N	1499	136
14158	121	1500	\N
14159	134	1500	\N
14160	148	1500	\N
14161	109	1500	\N
14162	185	1500	\N
14163	63	1500	\N
14164	66	1500	\N
14165	\N	1500	56
14166	82	1501	\N
14167	134	1501	\N
14168	15	1501	\N
14169	167	1501	\N
14170	185	1501	\N
14171	63	1501	\N
14172	66	1501	\N
14173	\N	1501	262
14174	81	1502	\N
14175	98	1502	\N
14176	15	1502	\N
14177	108	1502	\N
14178	27	1502	\N
14179	185	1502	\N
14180	63	1502	\N
14181	42	1502	\N
14182	45	1502	\N
14183	123	1502	\N
14184	\N	1502	13
14185	81	1503	\N
14186	101	1503	\N
14187	57	1503	\N
14188	110	1503	\N
14189	181	1503	\N
14190	185	1503	\N
14191	63	1503	\N
14192	42	1503	\N
14193	\N	1503	75
14194	81	1504	\N
14195	90	1504	\N
14196	15	1504	\N
14197	110	1504	\N
14198	27	1504	\N
14199	185	1504	\N
14200	63	1504	\N
14201	42	1504	\N
14202	45	1504	\N
14203	123	1504	\N
14204	\N	1504	38
14205	81	1505	\N
14206	90	1505	\N
14207	15	1505	\N
14208	110	1505	\N
14209	27	1505	\N
14210	185	1505	\N
14211	63	1505	\N
14212	42	1505	\N
14213	45	1505	\N
14214	123	1505	\N
14215	\N	1505	13
14216	81	1506	\N
14217	56	1506	\N
14218	162	1506	\N
14219	110	1506	\N
14220	185	1506	\N
14221	63	1506	\N
14222	42	1506	\N
14223	\N	1506	238
14224	80	1507	\N
14225	134	1507	\N
14226	135	1507	\N
14227	110	1507	\N
14228	185	1507	\N
14229	63	1507	\N
14230	66	1507	\N
14231	\N	1507	168
14232	81	1508	\N
14233	90	1508	\N
14234	15	1508	\N
14235	110	1508	\N
14236	27	1508	\N
14237	185	1508	\N
14238	63	1508	\N
14239	42	1508	\N
14240	45	1508	\N
14241	123	1508	\N
14242	\N	1508	13
14243	80	1509	\N
14244	134	1509	\N
14245	132	1509	\N
14246	108	1509	\N
14247	185	1509	\N
14248	63	1509	\N
14249	42	1509	\N
14250	\N	1509	55
14251	81	1510	\N
14252	90	1510	\N
14253	15	1510	\N
14254	110	1510	\N
14255	27	1510	\N
14256	185	1510	\N
14257	63	1510	\N
14258	42	1510	\N
14259	45	1510	\N
14260	123	1510	\N
14261	\N	1510	8
14262	81	1511	\N
14263	90	1511	\N
14264	15	1511	\N
14265	110	1511	\N
14266	27	1511	\N
14267	185	1511	\N
14268	63	1511	\N
14269	42	1511	\N
14270	45	1511	\N
14271	123	1511	\N
14272	\N	1511	13
14273	80	1512	\N
14274	134	1512	\N
14275	132	1512	\N
14276	110	1512	\N
14277	185	1512	\N
14278	63	1512	\N
14279	42	1512	\N
14280	\N	1512	55
14281	80	1513	\N
14282	134	1513	\N
14283	135	1513	\N
14284	167	1513	\N
14285	185	1513	\N
14286	63	1513	\N
14287	66	1513	\N
14288	\N	1513	168
14289	10	1514	\N
14290	94	1514	\N
14291	135	1514	\N
14292	108	1514	\N
14293	185	1514	\N
14294	63	1514	\N
14295	42	1514	\N
14296	\N	1514	263
14297	10	1515	\N
14298	94	1515	\N
14299	137	1515	\N
14300	107	1515	\N
14301	185	1515	\N
14302	63	1515	\N
14303	42	1515	\N
14304	\N	1515	264
14305	10	1516	\N
14306	93	1516	\N
14307	168	1516	\N
14308	110	1516	\N
14309	185	1516	\N
14310	63	1516	\N
14311	42	1516	\N
14312	\N	1516	265
14313	81	1517	\N
14314	141	1517	\N
14315	137	1517	\N
14316	108	1517	\N
14317	185	1517	\N
14318	63	1517	\N
14319	66	1517	\N
14320	\N	1517	45
14332	121	1519	\N
14333	141	1519	\N
14334	148	1519	\N
14335	110	1519	\N
14336	185	1519	\N
14337	63	1519	\N
14338	42	1519	\N
14339	\N	1519	93
14340	81	1520	\N
14341	101	1520	\N
14342	57	1520	\N
14343	108	1520	\N
14344	185	1520	\N
14345	63	1520	\N
14346	42	1520	\N
14347	\N	1520	75
14348	81	1518	\N
14349	90	1518	\N
14350	15	1518	\N
14351	110	1518	\N
14352	27	1518	\N
14353	185	1518	\N
14354	63	1518	\N
14355	42	1518	\N
14356	45	1518	\N
14357	123	1518	\N
14358	\N	1518	13
14359	81	1521	\N
14360	94	1521	\N
14361	132	1521	\N
14362	110	1521	\N
14363	185	1521	\N
14364	63	1521	\N
14365	42	1521	\N
14366	\N	1521	266
14367	80	1522	\N
14368	134	1522	\N
14369	132	1522	\N
14370	110	1522	\N
14371	185	1522	\N
14372	63	1522	\N
14373	42	1522	\N
14374	\N	1522	55
14382	81	1524	\N
14383	83	1524	\N
14384	15	1524	\N
14385	110	1524	\N
14386	27	1524	\N
14387	185	1524	\N
14388	63	1524	\N
14389	42	1524	\N
14390	45	1524	\N
14391	\N	1524	21
14392	121	1523	\N
14393	141	1523	\N
14394	137	1523	\N
14395	108	1523	\N
14396	184	1523	\N
14397	63	1523	\N
14398	42	1523	\N
14399	\N	1523	45
14400	81	1525	\N
14401	90	1525	\N
14402	15	1525	\N
14403	110	1525	\N
14404	27	1525	\N
14405	185	1525	\N
14406	63	1525	\N
14407	42	1525	\N
14408	45	1525	\N
14409	123	1525	\N
14410	\N	1525	13
14411	81	1526	\N
14412	83	1526	\N
14413	146	1526	\N
14414	60	1526	\N
14415	185	1526	\N
14416	63	1526	\N
14417	42	1526	\N
14418	\N	1526	208
14419	81	1527	\N
14420	90	1527	\N
14421	15	1527	\N
14422	110	1527	\N
14423	27	1527	\N
14424	185	1527	\N
14425	63	1527	\N
14426	42	1527	\N
14427	45	1527	\N
14428	123	1527	\N
14429	\N	1527	13
14430	81	1528	\N
14431	94	1528	\N
14432	57	1528	\N
14433	110	1528	\N
14434	185	1528	\N
14435	63	1528	\N
14436	42	1528	\N
14437	\N	1528	212
14438	81	1529	\N
14439	83	1529	\N
14440	15	1529	\N
14441	110	1529	\N
14442	27	1529	\N
14443	185	1529	\N
14444	63	1529	\N
14445	42	1529	\N
14446	45	1529	\N
14447	123	1529	\N
14448	\N	1529	8
14449	81	1530	\N
14450	101	1530	\N
14451	191	1530	\N
14452	112	1530	\N
14453	185	1530	\N
14454	87	1530	\N
14455	42	1530	\N
14456	\N	1530	218
14457	81	1531	\N
14458	91	1531	\N
14459	137	1531	\N
14460	110	1531	\N
14461	185	1531	\N
14462	63	1531	\N
14463	66	1531	\N
14464	\N	1531	175
14465	81	1532	\N
14466	92	1532	\N
14467	191	1532	\N
14468	110	1532	\N
14469	184	1532	\N
14470	87	1532	\N
14471	42	1532	\N
14472	\N	1532	218
14473	81	1533	\N
14474	90	1533	\N
14475	15	1533	\N
14476	110	1533	\N
14477	27	1533	\N
14478	185	1533	\N
14479	63	1533	\N
14480	42	1533	\N
14481	45	1533	\N
14482	123	1533	\N
14483	\N	1533	23
14484	81	1534	\N
14485	101	1534	\N
14486	191	1534	\N
14487	108	1534	\N
14488	185	1534	\N
14489	87	1534	\N
14490	42	1534	\N
14491	\N	1534	218
14492	81	1535	\N
14493	98	1535	\N
14494	15	1535	\N
14495	110	1535	\N
14496	27	1535	\N
14497	185	1535	\N
14498	63	1535	\N
14499	42	1535	\N
14500	45	1535	\N
14501	123	1535	\N
14502	\N	1535	10
14503	80	1536	\N
14504	134	1536	\N
14505	132	1536	\N
14506	110	1536	\N
14507	184	1536	\N
14508	63	1536	\N
14509	66	1536	\N
14510	\N	1536	29
14511	121	1537	\N
14512	101	1537	\N
14513	137	1537	\N
14514	128	1537	\N
14515	185	1537	\N
14516	87	1537	\N
14517	66	1537	\N
14518	\N	1537	267
14519	81	1538	\N
14520	92	1538	\N
14521	137	1538	\N
14522	112	1538	\N
14523	185	1538	\N
14524	63	1538	\N
14525	42	1538	\N
14526	\N	1538	268
14527	81	1539	\N
14528	56	1539	\N
14529	15	1539	\N
14530	110	1539	\N
14531	27	1539	\N
14532	185	1539	\N
14533	63	1539	\N
14534	42	1539	\N
14535	45	1539	\N
14536	123	1539	\N
14537	\N	1539	23
14549	81	1540	\N
14550	90	1540	\N
14551	15	1540	\N
14552	110	1540	\N
14553	27	1540	\N
14554	185	1540	\N
14555	63	1540	\N
14556	42	1540	\N
14557	45	1540	\N
14558	123	1540	\N
14559	\N	1540	2
14560	81	1541	\N
14561	90	1541	\N
14562	15	1541	\N
14563	110	1541	\N
14564	27	1541	\N
14565	185	1541	\N
14566	63	1541	\N
14567	42	1541	\N
14568	45	1541	\N
14569	123	1541	\N
14570	\N	1541	7
14571	81	55	\N
14572	91	55	\N
14573	15	55	\N
14574	110	55	\N
14575	27	55	\N
14576	185	55	\N
14577	63	55	\N
14578	42	55	\N
14579	45	55	\N
14580	123	55	\N
14581	\N	55	13
14582	81	1542	\N
14583	90	1542	\N
14584	15	1542	\N
14585	110	1542	\N
14586	27	1542	\N
14587	185	1542	\N
14588	63	1542	\N
14589	42	1542	\N
14590	45	1542	\N
14591	123	1542	\N
14592	\N	1542	2
14593	81	1543	\N
14594	90	1543	\N
14595	15	1543	\N
14596	110	1543	\N
14597	27	1543	\N
14598	185	1543	\N
14599	63	1543	\N
14600	42	1543	\N
14601	45	1543	\N
14602	123	1543	\N
14603	\N	1543	7
14604	121	1544	\N
14605	134	1544	\N
14606	148	1544	\N
14607	107	1544	\N
14608	185	1544	\N
14609	63	1544	\N
14610	42	1544	\N
14611	\N	1544	93
14612	81	1545	\N
14613	91	1545	\N
14614	125	1545	\N
14615	112	1545	\N
14616	185	1545	\N
14617	63	1545	\N
14618	66	1545	\N
14619	\N	1545	34
14620	80	1546	\N
14621	134	1546	\N
14622	195	1546	\N
14623	107	1546	\N
14624	185	1546	\N
14625	63	1546	\N
14626	66	1546	\N
14627	\N	1546	269
14628	80	1547	\N
14629	134	1547	\N
14630	135	1547	\N
14631	108	1547	\N
14632	185	1547	\N
14633	63	1547	\N
14634	66	1547	\N
14635	\N	1547	99
14636	121	1548	\N
14637	134	1548	\N
14638	145	1548	\N
14639	108	1548	\N
14640	185	1548	\N
14641	63	1548	\N
14642	42	1548	\N
14643	\N	1548	97
14644	81	1549	\N
14645	90	1549	\N
14646	15	1549	\N
14647	110	1549	\N
14648	27	1549	\N
14649	185	1549	\N
14650	63	1549	\N
14651	42	1549	\N
14652	45	1549	\N
14653	123	1549	\N
14654	\N	1549	13
14655	81	1550	\N
14656	90	1550	\N
14657	126	1550	\N
14658	112	1550	\N
14659	27	1550	\N
14660	185	1550	\N
14661	63	1550	\N
14662	42	1550	\N
14663	45	1550	\N
14664	\N	1550	17
14665	121	1551	\N
14666	134	1551	\N
14667	148	1551	\N
14668	108	1551	\N
14669	185	1551	\N
14670	63	1551	\N
14671	42	1551	\N
14672	\N	1551	93
14673	121	1552	\N
14674	134	1552	\N
14675	148	1552	\N
14676	108	1552	\N
14677	185	1552	\N
14678	63	1552	\N
14679	42	1552	\N
14680	\N	1552	56
14681	121	854	\N
14682	134	854	\N
14683	148	854	\N
14684	167	854	\N
14685	63	854	\N
14686	42	854	\N
14687	\N	854	56
14688	81	802	\N
14689	90	802	\N
14690	15	802	\N
14691	110	802	\N
14692	27	802	\N
14693	185	802	\N
14694	63	802	\N
14695	42	802	\N
14696	45	802	\N
14697	123	802	\N
14698	\N	802	2
14699	81	1553	\N
14700	90	1553	\N
14701	15	1553	\N
14702	110	1553	\N
14703	27	1553	\N
14704	185	1553	\N
14705	63	1553	\N
14706	42	1553	\N
14707	45	1553	\N
14708	123	1553	\N
14709	\N	1553	23
14710	81	1554	\N
14711	91	1554	\N
14712	137	1554	\N
14713	110	1554	\N
14714	185	1554	\N
14715	63	1554	\N
14716	42	1554	\N
14717	\N	1554	174
14718	81	1555	\N
14719	90	1555	\N
14720	15	1555	\N
14721	110	1555	\N
14722	27	1555	\N
14723	185	1555	\N
14724	63	1555	\N
14725	42	1555	\N
14726	45	1555	\N
14727	123	1555	\N
14728	\N	1555	13
14729	81	167	\N
14730	56	167	\N
14731	126	167	\N
14732	110	167	\N
14733	27	167	\N
14734	185	167	\N
14735	63	167	\N
14736	42	167	\N
14737	45	167	\N
14738	\N	167	20
14750	81	192	\N
14751	99	192	\N
14752	138	192	\N
14753	110	192	\N
14754	61	192	\N
14755	185	192	\N
14756	87	192	\N
14757	36	192	\N
14758	202	192	\N
14759	42	192	\N
14760	\N	192	40
14761	81	193	\N
14762	99	193	\N
14763	138	193	\N
14764	110	193	\N
14765	61	193	\N
14766	185	193	\N
14767	87	193	\N
14768	36	193	\N
14769	202	193	\N
14770	42	193	\N
14771	\N	193	40
14772	121	1556	\N
14773	101	1556	\N
14774	151	1556	\N
14775	110	1556	\N
14776	185	1556	\N
14777	63	1556	\N
14778	42	1556	\N
14779	\N	1556	79
14780	121	1557	\N
14781	101	1557	\N
14782	15	1557	\N
14783	110	1557	\N
14784	184	1557	\N
14785	63	1557	\N
14786	42	1557	\N
14787	\N	1557	178
14788	81	1558	\N
14789	56	1558	\N
14790	132	1558	\N
14791	110	1558	\N
14792	185	1558	\N
14793	63	1558	\N
14794	66	1558	\N
14795	\N	1558	29
14796	80	1559	\N
14797	134	1559	\N
14798	135	1559	\N
14799	110	1559	\N
14800	185	1559	\N
14801	63	1559	\N
14802	66	1559	\N
14803	\N	1559	270
14804	121	1560	\N
14805	134	1560	\N
14806	148	1560	\N
14807	167	1560	\N
14808	185	1560	\N
14809	63	1560	\N
14810	42	1560	\N
14811	\N	1560	56
14812	80	1561	\N
14813	134	1561	\N
14814	132	1561	\N
14815	167	1561	\N
14816	185	1561	\N
14817	87	1561	\N
14818	66	1561	\N
14819	\N	1561	271
14828	10	1562	\N
14829	93	1562	\N
14830	180	1562	\N
14831	110	1562	\N
14832	185	1562	\N
14833	63	1562	\N
14834	42	1562	\N
14835	\N	1562	187
14836	81	1563	\N
14837	90	1563	\N
14838	15	1563	\N
14839	110	1563	\N
14840	27	1563	\N
14841	185	1563	\N
14842	63	1563	\N
14843	42	1563	\N
14844	45	1563	\N
14845	123	1563	\N
14846	\N	1563	13
14847	81	1564	\N
14848	141	1564	\N
14849	143	1564	\N
14850	108	1564	\N
14851	203	1564	\N
14852	185	1564	\N
14853	87	1564	\N
14854	42	1564	\N
14855	\N	1564	172
14856	81	1565	\N
14857	90	1565	\N
14858	15	1565	\N
14859	110	1565	\N
14860	27	1565	\N
14861	185	1565	\N
14862	63	1565	\N
14863	42	1565	\N
14864	45	1565	\N
14865	123	1565	\N
14866	\N	1565	2
14867	121	1566	\N
14868	141	1566	\N
14869	156	1566	\N
14870	108	1566	\N
14871	185	1566	\N
14872	63	1566	\N
14873	66	1566	\N
14874	\N	1566	136
14875	81	1567	\N
14876	90	1567	\N
14877	15	1567	\N
14878	110	1567	\N
14879	27	1567	\N
14880	185	1567	\N
14881	63	1567	\N
14882	42	1567	\N
14883	45	1567	\N
14884	123	1567	\N
14885	\N	1567	2
14886	81	1568	\N
14887	101	1568	\N
14888	57	1568	\N
14889	110	1568	\N
14890	117	1568	\N
14891	185	1568	\N
14892	63	1568	\N
14893	42	1568	\N
14894	\N	1568	272
14895	81	1569	\N
14896	131	1569	\N
14897	126	1569	\N
14898	110	1569	\N
14899	27	1569	\N
14900	185	1569	\N
14901	63	1569	\N
14902	42	1569	\N
14903	45	1569	\N
14904	\N	1569	20
14905	81	1570	\N
14906	100	1570	\N
14907	143	1570	\N
14908	110	1570	\N
14909	61	1570	\N
14910	185	1570	\N
14911	87	1570	\N
14912	42	1570	\N
14913	\N	1570	273
14914	81	871	\N
14915	90	871	\N
14916	15	871	\N
14917	110	871	\N
14918	27	871	\N
14919	185	871	\N
14920	63	871	\N
14921	42	871	\N
14922	45	871	\N
14923	123	871	\N
14924	\N	871	13
14925	10	1571	\N
14926	94	1571	\N
14927	132	1571	\N
14928	110	1571	\N
14929	185	1571	\N
14930	63	1571	\N
14931	42	1571	\N
14932	\N	1571	266
14933	121	1572	\N
14934	134	1572	\N
14935	148	1572	\N
14936	108	1572	\N
14937	185	1572	\N
14938	63	1572	\N
14939	42	1572	\N
14940	\N	1572	93
14941	82	1573	\N
14942	134	1573	\N
14943	156	1573	\N
14944	108	1573	\N
14945	185	1573	\N
14946	63	1573	\N
14947	66	1573	\N
14948	\N	1573	139
14949	81	1574	\N
14950	90	1574	\N
14951	15	1574	\N
14952	110	1574	\N
14953	27	1574	\N
14954	185	1574	\N
14955	63	1574	\N
14956	42	1574	\N
14957	45	1574	\N
14958	123	1574	\N
14959	\N	1574	2
14960	121	1575	\N
14961	134	1575	\N
14962	148	1575	\N
14963	107	1575	\N
14964	185	1575	\N
14965	63	1575	\N
14966	42	1575	\N
14967	\N	1575	56
14968	81	1576	\N
14969	90	1576	\N
14970	15	1576	\N
14971	110	1576	\N
14972	27	1576	\N
14973	185	1576	\N
14974	63	1576	\N
14975	42	1576	\N
14976	45	1576	\N
14977	123	1576	\N
14978	\N	1576	8
14979	81	1577	\N
14980	90	1577	\N
14981	15	1577	\N
14982	110	1577	\N
14983	27	1577	\N
14984	185	1577	\N
14985	63	1577	\N
14986	42	1577	\N
14987	45	1577	\N
14988	123	1577	\N
14989	\N	1577	23
14990	81	1578	\N
14991	101	1578	\N
14992	137	1578	\N
14993	24	1578	\N
14994	185	1578	\N
14995	63	1578	\N
14996	42	1578	\N
14997	\N	1578	45
14998	81	1579	\N
14999	101	1579	\N
15000	57	1579	\N
15001	112	1579	\N
15002	185	1579	\N
15003	63	1579	\N
15004	42	1579	\N
15005	\N	1579	75
15006	81	1580	\N
15007	90	1580	\N
15008	57	1580	\N
15009	110	1580	\N
15010	185	1580	\N
15011	63	1580	\N
15012	42	1580	\N
15013	\N	1580	145
15014	81	1581	\N
15015	83	1581	\N
15016	15	1581	\N
15017	110	1581	\N
15018	27	1581	\N
15019	185	1581	\N
15020	63	1581	\N
15021	42	1581	\N
15022	45	1581	\N
15023	\N	1581	21
15024	121	1582	\N
15025	134	1582	\N
15026	148	1582	\N
15027	167	1582	\N
15028	185	1582	\N
15029	63	1582	\N
15030	42	1582	\N
15031	\N	1582	56
15032	81	1583	\N
15033	83	1583	\N
15034	15	1583	\N
15035	110	1583	\N
15036	27	1583	\N
15037	185	1583	\N
15038	63	1583	\N
15039	42	1583	\N
15040	45	1583	\N
15041	\N	1583	22
15042	10	1584	\N
15043	94	1584	\N
15044	135	1584	\N
15045	110	1584	\N
15046	185	1584	\N
15047	63	1584	\N
15048	66	1584	\N
15049	\N	1584	113
15050	121	1585	\N
15051	134	1585	\N
15052	145	1585	\N
15053	108	1585	\N
15054	185	1585	\N
15055	63	1585	\N
15056	42	1585	\N
15057	\N	1585	48
15058	81	1586	\N
15059	92	1586	\N
15060	15	1586	\N
15061	110	1586	\N
15062	27	1586	\N
15063	185	1586	\N
15064	63	1586	\N
15065	42	1586	\N
15066	45	1586	\N
15067	68	1586	\N
15068	\N	1586	9
15069	81	1587	\N
15070	98	1587	\N
15071	15	1587	\N
15072	110	1587	\N
15073	185	1587	\N
15074	63	1587	\N
15075	42	1587	\N
15076	\N	1587	52
15077	81	1588	\N
15078	90	1588	\N
15079	15	1588	\N
15080	110	1588	\N
15081	27	1588	\N
15082	185	1588	\N
15083	63	1588	\N
15084	42	1588	\N
15085	45	1588	\N
15086	\N	1588	11
15087	80	1589	\N
15088	134	1589	\N
15089	158	1589	\N
15090	110	1589	\N
15091	185	1589	\N
15092	63	1589	\N
15093	42	1589	\N
15094	\N	1589	96
15095	10	1590	\N
15096	134	1590	\N
15097	135	1590	\N
15098	110	1590	\N
15099	185	1590	\N
15100	63	1590	\N
15101	42	1590	\N
15102	\N	1590	49
15103	121	1591	\N
15104	134	1591	\N
15105	57	1591	\N
15106	110	1591	\N
15107	185	1591	\N
15108	63	1591	\N
15109	42	1591	\N
15110	\N	1591	75
15111	205	1592	\N
15112	134	1592	\N
15113	57	1592	\N
15114	128	1592	\N
15115	204	1592	\N
15116	185	1592	\N
15117	63	1592	\N
15118	42	1592	\N
15119	\N	1592	274
15120	121	1593	\N
15121	105	1593	\N
15122	146	1593	\N
15123	128	1593	\N
15124	185	1593	\N
15125	63	1593	\N
15126	42	1593	\N
15127	\N	1593	50
15128	121	1594	\N
15129	105	1594	\N
15130	169	1594	\N
15131	108	1594	\N
15132	185	1594	\N
15133	63	1594	\N
15134	42	1594	\N
15135	\N	1594	147
15136	80	1595	\N
15137	134	1595	\N
15138	148	1595	\N
15139	108	1595	\N
15140	185	1595	\N
15141	63	1595	\N
15142	66	1595	\N
15143	\N	1595	275
15144	121	1596	\N
15145	134	1596	\N
15146	148	1596	\N
15147	108	1596	\N
15148	185	1596	\N
15149	63	1596	\N
15150	42	1596	\N
15151	\N	1596	56
15152	80	1597	\N
15153	134	1597	\N
15154	135	1597	\N
15155	109	1597	\N
15156	185	1597	\N
15157	87	1597	\N
15158	66	1597	\N
15159	\N	1597	276
15160	82	810	\N
15161	134	810	\N
15162	174	810	\N
15163	110	810	\N
15164	87	810	\N
15165	66	810	\N
15166	\N	810	177
15167	121	1598	\N
15168	101	1598	\N
15169	145	1598	\N
15170	108	1598	\N
15171	185	1598	\N
15172	63	1598	\N
15173	42	1598	\N
15174	\N	1598	48
15175	121	1599	\N
15176	134	1599	\N
15177	15	1599	\N
15178	110	1599	\N
15179	185	1599	\N
15180	63	1599	\N
15181	42	1599	\N
15182	\N	1599	178
15183	80	1600	\N
15184	134	1600	\N
15185	162	1600	\N
15186	188	1600	\N
15187	185	1600	\N
15188	63	1600	\N
15189	42	1600	\N
15190	\N	1600	116
15191	81	1601	\N
15192	90	1601	\N
15193	126	1601	\N
15194	110	1601	\N
15195	27	1601	\N
15196	185	1601	\N
15197	63	1601	\N
15198	42	1601	\N
15199	45	1601	\N
15200	\N	1601	17
15201	81	175	\N
15202	90	175	\N
15203	126	175	\N
15204	110	175	\N
15205	27	175	\N
15206	185	175	\N
15207	63	175	\N
15208	42	175	\N
15209	45	175	\N
15210	\N	175	17
15211	81	1602	\N
15212	131	1602	\N
15213	137	1602	\N
15214	110	1602	\N
15215	186	1602	\N
15216	63	1602	\N
15217	66	1602	\N
15218	\N	1602	277
15219	81	1603	\N
15220	131	1603	\N
15221	132	1603	\N
15222	110	1603	\N
15223	185	1603	\N
15224	63	1603	\N
15225	66	1603	\N
15226	\N	1603	29
15227	80	1604	\N
15228	134	1604	\N
15229	135	1604	\N
15230	108	1604	\N
15231	185	1604	\N
15232	63	1604	\N
15233	66	1604	\N
15234	\N	1604	99
15235	80	1605	\N
15236	134	1605	\N
15237	135	1605	\N
15238	128	1605	\N
15239	185	1605	\N
15240	63	1605	\N
15241	66	1605	\N
15242	\N	1605	99
15243	121	1606	\N
15244	134	1606	\N
15245	146	1606	\N
15246	110	1606	\N
15247	185	1606	\N
15248	63	1606	\N
15249	42	1606	\N
15250	\N	1606	50
15251	81	1607	\N
15252	90	1607	\N
15253	15	1607	\N
15254	110	1607	\N
15255	27	1607	\N
15256	185	1607	\N
15257	63	1607	\N
15258	42	1607	\N
15259	45	1607	\N
15260	123	1607	\N
15261	\N	1607	13
15262	81	1608	\N
15263	101	1608	\N
15264	57	1608	\N
15265	110	1608	\N
15266	185	1608	\N
15267	63	1608	\N
15268	42	1608	\N
15269	\N	1608	75
15270	81	1609	\N
15271	90	1609	\N
15272	15	1609	\N
15273	110	1609	\N
15274	27	1609	\N
15275	185	1609	\N
15276	63	1609	\N
15277	42	1609	\N
15278	45	1609	\N
15279	123	1609	\N
15280	\N	1609	3
15281	81	1610	\N
15282	83	1610	\N
15283	15	1610	\N
15284	110	1610	\N
15285	27	1610	\N
15286	185	1610	\N
15287	63	1610	\N
15288	42	1610	\N
15289	45	1610	\N
15290	\N	1610	23
15291	81	1611	\N
15292	90	1611	\N
15293	126	1611	\N
15294	110	1611	\N
15295	27	1611	\N
15296	185	1611	\N
15297	63	1611	\N
15298	42	1611	\N
15299	45	1611	\N
15300	\N	1611	17
15301	80	1612	\N
15302	134	1612	\N
15303	137	1612	\N
15304	110	1612	\N
15305	185	1612	\N
15306	63	1612	\N
15307	42	1612	\N
15308	\N	1612	143
15309	81	1613	\N
15310	90	1613	\N
15311	15	1613	\N
15312	110	1613	\N
15313	27	1613	\N
15314	185	1613	\N
15315	63	1613	\N
15316	42	1613	\N
15317	45	1613	\N
15318	123	1613	\N
15319	\N	1613	7
15320	81	1614	\N
15321	91	1614	\N
15322	135	1614	\N
15323	112	1614	\N
15324	184	1614	\N
15325	63	1614	\N
15326	42	1614	\N
15327	\N	1614	188
15328	81	1615	\N
15329	90	1615	\N
15330	15	1615	\N
15331	110	1615	\N
15332	27	1615	\N
15333	185	1615	\N
15334	63	1615	\N
15335	42	1615	\N
15336	45	1615	\N
15337	123	1615	\N
15338	\N	1615	2
15339	81	1616	\N
15340	90	1616	\N
15341	126	1616	\N
15342	112	1616	\N
15343	27	1616	\N
15344	185	1616	\N
15345	63	1616	\N
15346	42	1616	\N
15347	45	1616	\N
15348	\N	1616	17
15349	81	1617	\N
15350	90	1617	\N
15351	15	1617	\N
15352	110	1617	\N
15353	27	1617	\N
15354	185	1617	\N
15355	63	1617	\N
15356	42	1617	\N
15357	45	1617	\N
15358	123	1617	\N
15359	\N	1617	7
15360	81	1618	\N
15361	90	1618	\N
15362	15	1618	\N
15363	110	1618	\N
15364	27	1618	\N
15365	185	1618	\N
15366	63	1618	\N
15367	42	1618	\N
15368	45	1618	\N
15369	123	1618	\N
15370	\N	1618	7
15371	81	1619	\N
15372	90	1619	\N
15373	57	1619	\N
15374	110	1619	\N
15375	185	1619	\N
15376	63	1619	\N
15377	42	1619	\N
15378	\N	1619	150
15379	81	1620	\N
15380	90	1620	\N
15381	126	1620	\N
15382	110	1620	\N
15383	27	1620	\N
15384	185	1620	\N
15385	63	1620	\N
15386	42	1620	\N
15387	45	1620	\N
15388	\N	1620	17
15389	81	1621	\N
15390	90	1621	\N
15391	57	1621	\N
15392	110	1621	\N
15393	185	1621	\N
15394	63	1621	\N
15395	42	1621	\N
15396	\N	1621	150
15397	121	1622	\N
15398	134	1622	\N
15399	148	1622	\N
15400	107	1622	\N
15401	185	1622	\N
15402	63	1622	\N
15403	42	1622	\N
15404	\N	1622	56
15405	81	1623	\N
15406	101	1623	\N
15407	15	1623	\N
15408	110	1623	\N
15409	27	1623	\N
15410	185	1623	\N
15411	63	1623	\N
15412	42	1623	\N
15413	\N	1623	26
15414	81	1624	\N
15415	91	1624	\N
15416	15	1624	\N
15417	110	1624	\N
15418	27	1624	\N
15419	185	1624	\N
15420	63	1624	\N
15421	42	1624	\N
15422	45	1624	\N
15423	123	1624	\N
15424	\N	1624	10
15425	81	1625	\N
15426	83	1625	\N
15427	57	1625	\N
15428	110	1625	\N
15429	184	1625	\N
15430	63	1625	\N
15431	42	1625	\N
15432	\N	1625	36
15433	80	1626	\N
15434	134	1626	\N
15435	162	1626	\N
15436	108	1626	\N
15437	185	1626	\N
15438	63	1626	\N
15439	42	1626	\N
15440	\N	1626	116
15441	81	1627	\N
15442	83	1627	\N
15443	15	1627	\N
15444	110	1627	\N
15445	27	1627	\N
15446	185	1627	\N
15447	63	1627	\N
15448	42	1627	\N
15449	45	1627	\N
15450	\N	1627	21
15451	81	1628	\N
15452	131	1628	\N
15453	132	1628	\N
15454	110	1628	\N
15455	185	1628	\N
15456	63	1628	\N
15457	42	1628	\N
15458	\N	1628	141
15459	81	1629	\N
15460	90	1629	\N
15461	15	1629	\N
15462	110	1629	\N
15463	27	1629	\N
15464	185	1629	\N
15465	63	1629	\N
15466	42	1629	\N
15467	45	1629	\N
15468	123	1629	\N
15469	\N	1629	38
15470	121	1630	\N
15471	101	1630	\N
15472	148	1630	\N
15473	108	1630	\N
15474	185	1630	\N
15475	63	1630	\N
15476	42	1630	\N
15477	\N	1630	56
15478	81	1631	\N
15479	83	1631	\N
15480	15	1631	\N
15481	110	1631	\N
15482	27	1631	\N
15483	185	1631	\N
15484	63	1631	\N
15485	42	1631	\N
15486	45	1631	\N
15487	\N	1631	21
15488	81	1632	\N
15489	90	1632	\N
15490	15	1632	\N
15491	110	1632	\N
15492	27	1632	\N
15493	185	1632	\N
15494	63	1632	\N
15495	42	1632	\N
15496	45	1632	\N
15497	123	1632	\N
15498	\N	1632	13
15499	81	1633	\N
15500	90	1633	\N
15501	15	1633	\N
15502	110	1633	\N
15503	27	1633	\N
15504	185	1633	\N
15505	63	1633	\N
15506	42	1633	\N
15507	45	1633	\N
15508	123	1633	\N
15509	\N	1633	8
15510	81	1634	\N
15511	83	1634	\N
15512	15	1634	\N
15513	110	1634	\N
15514	27	1634	\N
15515	185	1634	\N
15516	63	1634	\N
15517	42	1634	\N
15518	45	1634	\N
15519	\N	1634	21
15520	81	1635	\N
15521	90	1635	\N
15522	15	1635	\N
15523	110	1635	\N
15524	27	1635	\N
15525	185	1635	\N
15526	63	1635	\N
15527	42	1635	\N
15528	45	1635	\N
15529	123	1635	\N
15530	\N	1635	7
15531	81	1367	\N
15532	94	1367	\N
15533	143	1367	\N
15534	110	1367	\N
15535	61	1367	\N
15536	185	1367	\N
15537	87	1367	\N
15538	36	1367	\N
15539	202	1367	\N
15540	42	1367	\N
15541	\N	1367	246
15542	81	1636	\N
15543	90	1636	\N
15544	57	1636	\N
15545	110	1636	\N
15546	27	1636	\N
15547	185	1636	\N
15548	63	1636	\N
15549	42	1636	\N
15550	\N	1636	150
15551	81	1637	\N
15552	90	1637	\N
15553	15	1637	\N
15554	110	1637	\N
15555	27	1637	\N
15556	185	1637	\N
15557	63	1637	\N
15558	42	1637	\N
15559	45	1637	\N
15560	123	1637	\N
15561	\N	1637	13
15562	81	1638	\N
15563	131	1638	\N
15564	132	1638	\N
15565	110	1638	\N
15566	185	1638	\N
15567	63	1638	\N
15568	66	1638	\N
15569	\N	1638	141
15570	80	1639	\N
15571	134	1639	\N
15572	159	1639	\N
15573	108	1639	\N
15574	185	1639	\N
15575	63	1639	\N
15576	66	1639	\N
15577	\N	1639	169
15584	63	1640	\N
15589	81	1641	\N
15590	90	1641	\N
15591	137	1641	\N
15592	110	1641	\N
15593	179	1641	\N
15594	185	1641	\N
15595	63	1641	\N
15596	42	1641	\N
15597	\N	1641	268
15598	81	1640	\N
15599	90	1640	\N
15600	15	1640	\N
15601	110	1640	\N
15602	27	1640	\N
15603	185	1640	\N
15604	87	1640	\N
15605	42	1640	\N
15606	45	1640	\N
15607	123	1640	\N
15608	\N	1640	8
15609	81	1642	\N
15610	101	1642	\N
15611	143	1642	\N
15612	110	1642	\N
15613	61	1642	\N
15614	185	1642	\N
15615	87	1642	\N
15616	36	1642	\N
15617	202	1642	\N
15618	42	1642	\N
15619	\N	1642	172
15620	81	427	\N
15621	101	427	\N
15622	138	427	\N
15623	110	427	\N
15624	61	427	\N
15625	185	427	\N
15626	87	427	\N
15627	36	427	\N
15628	202	427	\N
15629	42	427	\N
15630	\N	427	40
15631	121	429	\N
15632	141	429	\N
15633	145	429	\N
15634	110	429	\N
15635	185	429	\N
15636	63	429	\N
15637	42	429	\N
15638	\N	429	48
15639	81	430	\N
15640	90	430	\N
15641	15	430	\N
15642	110	430	\N
15643	27	430	\N
15644	185	430	\N
15645	63	430	\N
15646	42	430	\N
15647	45	430	\N
15648	123	430	\N
15649	\N	430	23
15650	81	431	\N
15651	92	431	\N
15652	154	431	\N
15653	110	431	\N
15654	116	431	\N
15655	185	431	\N
15656	87	431	\N
15657	42	431	\N
15658	\N	431	119
15659	81	433	\N
15660	92	433	\N
15661	15	433	\N
15662	110	433	\N
15663	27	433	\N
15664	185	433	\N
15665	63	433	\N
15666	42	433	\N
15667	45	433	\N
15668	123	433	\N
15669	\N	433	3
15670	81	435	\N
15671	98	435	\N
15672	15	435	\N
15673	110	435	\N
15674	27	435	\N
15675	185	435	\N
15676	63	435	\N
15677	42	435	\N
15678	45	435	\N
15679	68	435	\N
15680	\N	435	9
15681	81	12	\N
15682	91	12	\N
15683	15	12	\N
15684	122	12	\N
15685	110	12	\N
15686	27	12	\N
15687	185	12	\N
15688	63	12	\N
15689	42	12	\N
15690	45	12	\N
15691	123	12	\N
15692	\N	12	10
15693	81	432	\N
15694	95	432	\N
15695	146	432	\N
15696	110	432	\N
15697	115	432	\N
15698	185	432	\N
15699	87	432	\N
15700	42	432	\N
15701	\N	432	251
15702	81	1643	\N
15703	141	1643	\N
15704	137	1643	\N
15705	110	1643	\N
15706	185	1643	\N
15707	87	1643	\N
15708	42	1643	\N
15709	\N	1643	39
15710	80	1644	\N
15711	134	1644	\N
15712	132	1644	\N
15713	110	1644	\N
15714	185	1644	\N
15715	63	1644	\N
15716	42	1644	\N
15717	\N	1644	55
15718	205	1645	\N
15719	134	1645	\N
15720	148	1645	\N
15721	108	1645	\N
15722	185	1645	\N
15723	63	1645	\N
15724	42	1645	\N
15725	\N	1645	278
15726	121	1646	\N
15727	106	1646	\N
15728	145	1646	\N
15729	110	1646	\N
15730	185	1646	\N
15731	63	1646	\N
15732	42	1646	\N
15733	\N	1646	48
15734	80	1647	\N
15735	106	1647	\N
15736	206	1647	\N
15737	110	1647	\N
15738	147	1647	\N
15739	185	1647	\N
15740	63	1647	\N
15741	42	1647	\N
15742	\N	1647	279
15743	81	1648	\N
15744	90	1648	\N
15745	57	1648	\N
15746	110	1648	\N
15747	185	1648	\N
15748	63	1648	\N
15749	42	1648	\N
15750	\N	1648	150
15751	81	1649	\N
15752	100	1649	\N
15753	138	1649	\N
15754	110	1649	\N
15755	61	1649	\N
15756	185	1649	\N
15757	87	1649	\N
15758	36	1649	\N
15759	202	1649	\N
15760	42	1649	\N
15761	\N	1649	40
15762	81	1650	\N
15763	90	1650	\N
15764	15	1650	\N
15765	110	1650	\N
15766	27	1650	\N
15767	185	1650	\N
15768	63	1650	\N
15769	42	1650	\N
15770	45	1650	\N
15771	123	1650	\N
15772	\N	1650	13
15773	80	1651	\N
15774	83	1651	\N
15775	135	1651	\N
15776	110	1651	\N
15777	185	1651	\N
15778	63	1651	\N
15779	42	1651	\N
15780	\N	1651	99
15781	81	1652	\N
15782	90	1652	\N
15783	15	1652	\N
15784	110	1652	\N
15785	27	1652	\N
15786	185	1652	\N
15787	63	1652	\N
15788	42	1652	\N
15789	45	1652	\N
15790	123	1652	\N
15791	\N	1652	13
15792	81	1653	\N
15793	90	1653	\N
15794	57	1653	\N
15795	110	1653	\N
15796	185	1653	\N
15797	63	1653	\N
15798	42	1653	\N
15799	\N	1653	150
15800	80	1654	\N
15801	134	1654	\N
15802	162	1654	\N
15803	110	1654	\N
15804	185	1654	\N
15805	63	1654	\N
15806	66	1654	\N
15807	\N	1654	116
15808	81	1655	\N
15809	94	1655	\N
15810	143	1655	\N
15811	110	1655	\N
15812	185	1655	\N
15813	63	1655	\N
15814	42	1655	\N
15815	\N	1655	281
15816	80	1656	\N
15817	101	1656	\N
15818	194	1656	\N
15819	110	1656	\N
15820	185	1656	\N
15821	63	1656	\N
15822	66	1656	\N
15823	81	1657	\N
15824	90	1657	\N
15825	15	1657	\N
15826	110	1657	\N
15827	27	1657	\N
15828	185	1657	\N
15829	63	1657	\N
15830	42	1657	\N
15831	45	1657	\N
15832	123	1657	\N
15833	\N	1657	80
15856	121	1659	\N
15857	141	1659	\N
15858	148	1659	\N
15859	110	1659	\N
15860	185	1659	\N
15861	63	1659	\N
15862	42	1659	\N
15863	\N	1659	93
15864	81	1658	\N
15865	83	1658	\N
15866	15	1658	\N
15867	110	1658	\N
15868	27	1658	\N
15869	185	1658	\N
15870	63	1658	\N
15871	42	1658	\N
15872	45	1658	\N
15873	123	1658	\N
15874	\N	1658	23
15875	81	17	\N
15876	90	17	\N
15877	15	17	\N
15878	122	17	\N
15879	110	17	\N
15880	27	17	\N
15881	63	17	\N
15882	42	17	\N
15883	\N	17	10
15884	121	1660	\N
15885	134	1660	\N
15886	195	1660	\N
15887	108	1660	\N
15888	185	1660	\N
15889	63	1660	\N
15890	66	1660	\N
15891	\N	1660	232
15892	10	1661	\N
15893	101	1661	\N
15894	57	1661	\N
15895	110	1661	\N
15896	185	1661	\N
15897	63	1661	\N
15898	42	1661	\N
15899	\N	1661	115
15900	81	1662	\N
15901	90	1662	\N
15902	15	1662	\N
15903	110	1662	\N
15904	27	1662	\N
15905	185	1662	\N
15906	63	1662	\N
15907	42	1662	\N
15908	45	1662	\N
15909	123	1662	\N
15910	\N	1662	8
15911	81	1663	\N
15912	98	1663	\N
15913	15	1663	\N
15914	110	1663	\N
15915	27	1663	\N
15916	185	1663	\N
15917	63	1663	\N
15918	42	1663	\N
15919	45	1663	\N
15920	123	1663	\N
15921	\N	1663	23
15922	80	1664	\N
15923	134	1664	\N
15924	135	1664	\N
15925	110	1664	\N
15926	184	1664	\N
15927	63	1664	\N
15928	66	1664	\N
15929	\N	1664	99
15930	81	1665	\N
15931	90	1665	\N
15932	15	1665	\N
15933	110	1665	\N
15934	27	1665	\N
15935	185	1665	\N
15936	63	1665	\N
15937	42	1665	\N
15938	45	1665	\N
15939	123	1665	\N
15940	\N	1665	13
15971	42	1669	\N
15995	42	1672	\N
16005	81	1674	\N
16006	90	1674	\N
16007	126	1674	\N
16008	110	1674	\N
16009	27	1674	\N
16010	185	1674	\N
16011	63	1674	\N
16012	42	1674	\N
16013	45	1674	\N
16014	\N	1674	17
16015	81	1673	\N
16016	56	1673	\N
16017	57	1673	\N
16018	110	1673	\N
16019	185	1673	\N
16020	63	1673	\N
16021	42	1673	\N
16022	\N	1673	284
16023	80	1675	\N
16024	134	1675	\N
16025	132	1675	\N
16026	110	1675	\N
16027	185	1675	\N
16028	63	1675	\N
16029	42	1675	\N
16030	\N	1675	55
16031	80	1676	\N
16032	101	1676	\N
16033	125	1676	\N
16034	112	1676	\N
16035	185	1676	\N
16036	87	1676	\N
16037	42	1676	\N
16038	\N	1676	231
16039	121	1677	\N
16040	134	1677	\N
16041	148	1677	\N
16042	108	1677	\N
16043	185	1677	\N
16044	63	1677	\N
16045	42	1677	\N
16046	\N	1677	56
16047	81	1678	\N
16048	90	1678	\N
16049	15	1678	\N
16050	110	1678	\N
16051	27	1678	\N
16052	185	1678	\N
16053	63	1678	\N
16054	42	1678	\N
16055	45	1678	\N
16056	123	1678	\N
16057	\N	1678	2
16058	81	1679	\N
16059	90	1679	\N
16060	178	1679	\N
16061	110	1679	\N
16062	185	1679	\N
16063	63	1679	\N
16064	42	1679	\N
16065	\N	1679	183
16066	80	1680	\N
16067	56	1680	\N
16068	137	1680	\N
16069	110	1680	\N
16070	185	1680	\N
16071	63	1680	\N
16072	66	1680	\N
16073	\N	1680	39
16074	80	1681	\N
16075	134	1681	\N
16076	135	1681	\N
16077	110	1681	\N
16078	185	1681	\N
16079	63	1681	\N
16080	66	1681	\N
16081	\N	1681	285
16082	80	1682	\N
16083	101	1682	\N
16084	125	1682	\N
16085	112	1682	\N
16086	185	1682	\N
16087	87	1682	\N
16088	42	1682	\N
16089	\N	1682	231
16090	81	1683	\N
16091	90	1683	\N
16092	15	1683	\N
16093	110	1683	\N
16094	27	1683	\N
16095	185	1683	\N
16096	63	1683	\N
16097	42	1683	\N
16098	45	1683	\N
16099	123	1683	\N
16100	\N	1683	13
16101	121	1684	\N
16102	141	1684	\N
16103	145	1684	\N
16104	108	1684	\N
16105	185	1684	\N
16106	63	1684	\N
16107	42	1684	\N
16108	\N	1684	48
16109	81	1685	\N
16110	101	1685	\N
16111	15	1685	\N
16112	60	1685	\N
16113	185	1685	\N
16114	87	1685	\N
16115	42	1685	\N
16116	\N	1685	58
16117	81	1686	\N
16118	90	1686	\N
16119	15	1686	\N
16120	110	1686	\N
16121	27	1686	\N
16122	185	1686	\N
16123	63	1686	\N
16124	42	1686	\N
16125	45	1686	\N
16126	123	1686	\N
16127	\N	1686	2
16128	81	1687	\N
16129	90	1687	\N
16130	126	1687	\N
16131	110	1687	\N
16132	27	1687	\N
16133	185	1687	\N
16134	63	1687	\N
16135	42	1687	\N
16136	45	1687	\N
16137	\N	1687	17
16138	81	1688	\N
16139	90	1688	\N
16140	15	1688	\N
16141	110	1688	\N
16142	27	1688	\N
16143	185	1688	\N
16144	63	1688	\N
16145	42	1688	\N
16146	45	1688	\N
16147	123	1688	\N
16148	\N	1688	8
16149	81	1689	\N
16150	83	1689	\N
16151	15	1689	\N
16152	110	1689	\N
16153	27	1689	\N
16154	185	1689	\N
16155	63	1689	\N
16156	42	1689	\N
16157	45	1689	\N
16158	\N	1689	21
16159	81	1690	\N
16160	90	1690	\N
16161	15	1690	\N
16162	110	1690	\N
16163	27	1690	\N
16164	185	1690	\N
16165	63	1690	\N
16166	42	1690	\N
16167	45	1690	\N
16168	123	1690	\N
16169	\N	1690	8
16170	80	1691	\N
16171	168	1691	\N
16172	110	1691	\N
16173	185	1691	\N
16174	63	1691	\N
16175	42	1691	\N
16176	\N	1691	156
16177	81	1692	\N
16178	90	1692	\N
16179	168	1692	\N
16180	110	1692	\N
16181	185	1692	\N
16182	63	1692	\N
16183	42	1692	\N
16184	\N	1692	156
16185	81	1693	\N
16186	95	1693	\N
16187	207	1693	\N
16188	110	1693	\N
16189	185	1693	\N
16190	63	1693	\N
16191	42	1693	\N
16192	\N	1693	286
16193	80	1694	\N
16194	101	1694	\N
16195	132	1694	\N
16196	110	1694	\N
16197	185	1694	\N
16198	63	1694	\N
16199	66	1694	\N
16200	\N	1694	287
16201	81	1695	\N
16202	90	1695	\N
16203	15	1695	\N
16204	110	1695	\N
16205	27	1695	\N
16206	185	1695	\N
16207	63	1695	\N
16208	42	1695	\N
16209	45	1695	\N
16210	123	1695	\N
16211	\N	1695	10
16212	81	1696	\N
16213	91	1696	\N
16214	15	1696	\N
16215	110	1696	\N
16216	27	1696	\N
16217	185	1696	\N
16218	63	1696	\N
16219	42	1696	\N
16220	45	1696	\N
16221	123	1696	\N
16222	\N	1696	2
16223	81	1697	\N
16224	90	1697	\N
16225	15	1697	\N
16226	110	1697	\N
16227	27	1697	\N
16228	185	1697	\N
16229	63	1697	\N
16230	42	1697	\N
16231	45	1697	\N
16232	123	1697	\N
16233	\N	1697	51
16234	81	1698	\N
16235	90	1698	\N
16236	15	1698	\N
16237	110	1698	\N
16238	27	1698	\N
16239	185	1698	\N
16240	63	1698	\N
16241	42	1698	\N
16242	45	1698	\N
16243	123	1698	\N
16244	\N	1698	10
16245	81	1699	\N
16246	90	1699	\N
16247	146	1699	\N
16248	110	1699	\N
16249	115	1699	\N
16250	185	1699	\N
16251	87	1699	\N
16252	42	1699	\N
16253	45	1699	\N
16254	\N	1699	251
16255	81	1700	\N
16256	90	1700	\N
16257	15	1700	\N
16258	110	1700	\N
16259	27	1700	\N
16260	185	1700	\N
16261	63	1700	\N
16262	42	1700	\N
16263	45	1700	\N
16264	123	1700	\N
16265	\N	1700	23
16266	81	1701	\N
16267	90	1701	\N
16268	15	1701	\N
16269	110	1701	\N
16270	27	1701	\N
16271	185	1701	\N
16272	63	1701	\N
16273	42	1701	\N
16274	45	1701	\N
16275	123	1701	\N
16276	\N	1701	23
16277	81	1702	\N
16278	90	1702	\N
16279	15	1702	\N
16280	110	1702	\N
16281	27	1702	\N
16282	185	1702	\N
16283	63	1702	\N
16284	42	1702	\N
16285	45	1702	\N
16286	123	1702	\N
16287	\N	1702	8
16288	81	1703	\N
16289	90	1703	\N
16290	15	1703	\N
16291	110	1703	\N
16292	27	1703	\N
16293	185	1703	\N
16294	63	1703	\N
16295	42	1703	\N
16296	45	1703	\N
16297	123	1703	\N
16298	\N	1703	10
16299	81	1704	\N
16300	83	1704	\N
16301	15	1704	\N
16302	110	1704	\N
16303	27	1704	\N
16304	185	1704	\N
16305	63	1704	\N
16306	42	1704	\N
16307	45	1704	\N
16308	123	1704	\N
16309	\N	1704	38
16310	81	1705	\N
16311	83	1705	\N
16312	15	1705	\N
16313	110	1705	\N
16314	27	1705	\N
16315	185	1705	\N
16316	63	1705	\N
16317	42	1705	\N
16318	45	1705	\N
16319	123	1705	\N
16320	\N	1705	23
16321	81	1706	\N
16322	91	1706	\N
16323	15	1706	\N
16324	110	1706	\N
16325	27	1706	\N
16326	185	1706	\N
16327	63	1706	\N
16328	42	1706	\N
16329	45	1706	\N
16330	123	1706	\N
16331	\N	1706	10
16343	81	1708	\N
16344	98	1708	\N
16345	144	1708	\N
16346	112	1708	\N
16347	114	1708	\N
16348	185	1708	\N
16349	87	1708	\N
16350	36	1708	\N
16351	202	1708	\N
16352	42	1708	\N
16353	\N	1708	47
16354	81	1707	\N
16355	92	1707	\N
16356	15	1707	\N
16357	110	1707	\N
16358	27	1707	\N
16359	185	1707	\N
16360	63	1707	\N
16361	42	1707	\N
16362	45	1707	\N
16363	68	1707	\N
16364	\N	1707	9
16365	81	1709	\N
16366	83	1709	\N
16367	15	1709	\N
16368	110	1709	\N
16369	27	1709	\N
16370	185	1709	\N
16371	63	1709	\N
16372	42	1709	\N
16373	45	1709	\N
16374	123	1709	\N
16375	\N	1709	38
16376	121	1710	\N
16377	134	1710	\N
16378	148	1710	\N
16379	110	1710	\N
16380	185	1710	\N
16381	63	1710	\N
16382	42	1710	\N
16383	\N	1710	93
16384	121	1711	\N
16385	134	1711	\N
16386	148	1711	\N
16387	110	1711	\N
16388	185	1711	\N
16389	63	1711	\N
16390	42	1711	\N
16391	\N	1711	93
16392	80	1712	\N
16393	134	1712	\N
16394	132	1712	\N
16395	110	1712	\N
16396	185	1712	\N
16397	63	1712	\N
16398	42	1712	\N
16399	\N	1712	55
16400	80	1713	\N
16401	134	1713	\N
16402	132	1713	\N
16403	110	1713	\N
16404	185	1713	\N
16405	63	1713	\N
16406	42	1713	\N
16407	\N	1713	55
16408	80	1714	\N
16409	106	1714	\N
16410	137	1714	\N
16411	24	1714	\N
16412	185	1714	\N
16413	63	1714	\N
16414	66	1714	\N
16415	\N	1714	143
16416	121	1715	\N
16417	106	1715	\N
16418	148	1715	\N
16419	110	1715	\N
16420	185	1715	\N
16421	63	1715	\N
16422	42	1715	\N
16423	\N	1715	93
16424	81	1716	\N
16425	100	1716	\N
16426	15	1716	\N
16427	110	1716	\N
16428	27	1716	\N
16429	185	1716	\N
16430	63	1716	\N
16431	42	1716	\N
16432	\N	1716	10
16433	81	1717	\N
16434	101	1717	\N
16435	143	1717	\N
16436	108	1717	\N
16437	185	1717	\N
16438	87	1717	\N
16439	42	1717	\N
16440	\N	1717	59
16451	81	1718	\N
16452	56	1718	\N
16453	15	1718	\N
16454	110	1718	\N
16455	27	1718	\N
16456	185	1718	\N
16457	63	1718	\N
16458	42	1718	\N
16459	45	1718	\N
16460	\N	1718	15
16461	81	1719	\N
16462	101	1719	\N
16463	137	1719	\N
16464	108	1719	\N
16465	185	1719	\N
16466	87	1719	\N
16467	42	1719	\N
16468	\N	1719	45
16469	81	1720	\N
16470	101	1720	\N
16471	137	1720	\N
16472	108	1720	\N
16473	185	1720	\N
16474	87	1720	\N
16475	42	1720	\N
16476	\N	1720	45
16477	81	1721	\N
16478	90	1721	\N
16479	15	1721	\N
16480	110	1721	\N
16481	27	1721	\N
16482	185	1721	\N
16483	63	1721	\N
16484	42	1721	\N
16485	45	1721	\N
16486	123	1721	\N
16487	\N	1721	8
16488	80	1722	\N
16489	106	1722	\N
16490	208	1722	\N
16491	108	1722	\N
16492	185	1722	\N
16493	63	1722	\N
16494	66	1722	\N
16495	\N	1722	288
16496	81	1723	\N
16497	101	1723	\N
16498	15	1723	\N
16499	110	1723	\N
16500	185	1723	\N
16501	63	1723	\N
16502	42	1723	\N
16503	\N	1723	16
16504	121	1724	\N
16505	106	1724	\N
16506	201	1724	\N
16507	110	1724	\N
16508	185	1724	\N
16509	63	1724	\N
16510	42	1724	\N
16511	\N	1724	289
16512	81	1725	\N
16513	94	1725	\N
16514	57	1725	\N
16515	110	1725	\N
16516	185	1725	\N
16517	63	1725	\N
16518	42	1725	\N
16519	\N	1725	290
16520	81	1726	\N
16521	94	1726	\N
16522	143	1726	\N
16523	110	1726	\N
16524	185	1726	\N
16525	63	1726	\N
16526	42	1726	\N
16527	\N	1726	246
16528	94	1727	\N
16529	137	1727	\N
16530	112	1727	\N
16531	185	1727	\N
16532	87	1727	\N
16533	42	1727	\N
16534	\N	1727	268
16535	81	1728	\N
16536	90	1728	\N
16537	15	1728	\N
16538	110	1728	\N
16539	27	1728	\N
16540	185	1728	\N
16541	63	1728	\N
16542	42	1728	\N
16543	45	1728	\N
16544	123	1728	\N
16545	\N	1728	23
16546	81	1729	\N
16547	90	1729	\N
16548	15	1729	\N
16549	110	1729	\N
16550	27	1729	\N
16551	185	1729	\N
16552	63	1729	\N
16553	42	1729	\N
16554	45	1729	\N
16555	123	1729	\N
16556	\N	1729	2
16557	81	1730	\N
16558	90	1730	\N
16559	15	1730	\N
16560	110	1730	\N
16561	27	1730	\N
16562	185	1730	\N
16563	63	1730	\N
16564	42	1730	\N
16565	45	1730	\N
16566	123	1730	\N
16567	\N	1730	10
16568	121	1731	\N
16569	134	1731	\N
16570	148	1731	\N
16571	108	1731	\N
16572	185	1731	\N
16573	63	1731	\N
16574	42	1731	\N
16575	\N	1731	56
16576	121	1732	\N
16577	101	1732	\N
16578	145	1732	\N
16579	108	1732	\N
16580	185	1732	\N
16581	63	1732	\N
16582	42	1732	\N
16583	\N	1732	48
16584	81	1733	\N
16585	90	1733	\N
16586	15	1733	\N
16587	110	1733	\N
16588	27	1733	\N
16589	185	1733	\N
16590	63	1733	\N
16591	42	1733	\N
16592	45	1733	\N
16593	123	1733	\N
16594	\N	1733	13
16595	81	1734	\N
16596	90	1734	\N
16597	15	1734	\N
16598	110	1734	\N
16599	27	1734	\N
16600	185	1734	\N
16601	63	1734	\N
16602	42	1734	\N
16603	45	1734	\N
16604	123	1734	\N
16605	\N	1734	13
16606	80	1735	\N
16607	134	1735	\N
16608	162	1735	\N
16609	110	1735	\N
16610	185	1735	\N
16611	63	1735	\N
16612	42	1735	\N
16613	\N	1735	116
16614	81	1736	\N
16615	90	1736	\N
16616	15	1736	\N
16617	110	1736	\N
16618	27	1736	\N
16619	185	1736	\N
16620	63	1736	\N
16621	42	1736	\N
16622	45	1736	\N
16623	123	1736	\N
16624	\N	1736	2
16625	81	1737	\N
16626	90	1737	\N
16627	15	1737	\N
16628	110	1737	\N
16629	27	1737	\N
16630	185	1737	\N
16631	63	1737	\N
16632	42	1737	\N
16633	45	1737	\N
16634	123	1737	\N
16635	\N	1737	13
16636	80	1738	\N
16637	101	1738	\N
16638	135	1738	\N
16639	108	1738	\N
16640	147	1738	\N
16641	185	1738	\N
16642	87	1738	\N
16643	66	1738	\N
16644	\N	1738	291
16645	81	1739	\N
16646	131	1739	\N
16647	137	1739	\N
16648	110	1739	\N
16649	186	1739	\N
16650	63	1739	\N
16651	66	1739	\N
16652	\N	1739	174
16653	121	1740	\N
16654	134	1740	\N
16655	156	1740	\N
16656	108	1740	\N
16657	185	1740	\N
16658	63	1740	\N
16659	42	1740	\N
16660	\N	1740	136
16661	81	1741	\N
16662	83	1741	\N
16663	15	1741	\N
16664	110	1741	\N
16665	27	1741	\N
16666	185	1741	\N
16667	63	1741	\N
16668	42	1741	\N
16669	45	1741	\N
16670	\N	1741	21
16671	81	1742	\N
16672	90	1742	\N
16673	15	1742	\N
16674	110	1742	\N
16675	27	1742	\N
16676	185	1742	\N
16677	63	1742	\N
16678	42	1742	\N
16679	45	1742	\N
16680	123	1742	\N
16681	\N	1742	13
16682	81	1743	\N
16683	90	1743	\N
16684	15	1743	\N
16685	110	1743	\N
16686	27	1743	\N
16687	185	1743	\N
16688	63	1743	\N
16689	42	1743	\N
16690	45	1743	\N
16691	123	1743	\N
16692	\N	1743	8
16693	81	1744	\N
16694	90	1744	\N
16695	125	1744	\N
16696	110	1744	\N
16697	185	1744	\N
16698	63	1744	\N
16699	42	1744	\N
16700	\N	1744	34
16701	80	1745	\N
16702	101	1745	\N
16703	135	1745	\N
16704	108	1745	\N
16705	147	1745	\N
16706	185	1745	\N
16707	87	1745	\N
16708	66	1745	\N
16709	\N	1745	291
16710	81	1746	\N
16711	90	1746	\N
16712	137	1746	\N
16713	110	1746	\N
16714	185	1746	\N
16715	63	1746	\N
16716	66	1746	\N
16717	\N	1746	174
16718	81	1747	\N
16719	90	1747	\N
16720	137	1747	\N
16721	110	1747	\N
16722	185	1747	\N
16723	63	1747	\N
16724	66	1747	\N
16725	\N	1747	174
16726	80	1748	\N
16727	134	1748	\N
16728	132	1748	\N
16729	110	1748	\N
16730	185	1748	\N
16731	63	1748	\N
16732	66	1748	\N
16733	\N	1748	102
16734	81	1749	\N
16735	90	1749	\N
16736	15	1749	\N
16737	110	1749	\N
16738	27	1749	\N
16739	185	1749	\N
16740	63	1749	\N
16741	42	1749	\N
16742	45	1749	\N
16743	123	1749	\N
16744	\N	1749	23
16745	81	1750	\N
16746	90	1750	\N
16747	15	1750	\N
16748	110	1750	\N
16749	27	1750	\N
16750	185	1750	\N
16751	63	1750	\N
16752	42	1750	\N
16753	45	1750	\N
16754	123	1750	\N
16755	\N	1750	2
16756	81	610	\N
16757	83	610	\N
16758	15	610	\N
16759	110	610	\N
16760	27	610	\N
16761	184	610	\N
16762	63	610	\N
16763	42	610	\N
16764	45	610	\N
16765	123	610	\N
16766	\N	610	21
16767	81	1751	\N
16768	90	1751	\N
16769	152	1751	\N
16770	110	1751	\N
16771	185	1751	\N
16772	63	1751	\N
16773	42	1751	\N
16774	\N	1751	292
16775	81	1752	\N
16776	90	1752	\N
16777	15	1752	\N
16778	110	1752	\N
16779	27	1752	\N
16780	185	1752	\N
16781	63	1752	\N
16782	42	1752	\N
16783	45	1752	\N
16784	123	1752	\N
16785	\N	1752	2
16786	81	1753	\N
16787	90	1753	\N
16788	126	1753	\N
16789	110	1753	\N
16790	27	1753	\N
16791	184	1753	\N
16792	63	1753	\N
16793	42	1753	\N
16794	45	1753	\N
16795	\N	1753	17
16807	81	1754	\N
16808	90	1754	\N
16809	15	1754	\N
16810	110	1754	\N
16811	27	1754	\N
16812	185	1754	\N
16813	63	1754	\N
16814	42	1754	\N
16815	45	1754	\N
16816	123	1754	\N
16817	\N	1754	13
16818	121	1755	\N
16819	141	1755	\N
16820	15	1755	\N
16821	110	1755	\N
16822	27	1755	\N
16823	185	1755	\N
16824	63	1755	\N
16825	42	1755	\N
16826	\N	1755	178
16827	81	1756	\N
16828	91	1756	\N
16829	127	1756	\N
16830	110	1756	\N
16831	115	1756	\N
16832	185	1756	\N
16833	63	1756	\N
16834	42	1756	\N
16835	\N	1756	204
16836	81	1757	\N
16837	90	1757	\N
16838	126	1757	\N
16839	110	1757	\N
16840	27	1757	\N
16841	184	1757	\N
16842	63	1757	\N
16843	42	1757	\N
16844	45	1757	\N
16845	\N	1757	17
16846	81	1758	\N
16847	90	1758	\N
16848	15	1758	\N
16849	110	1758	\N
16850	27	1758	\N
16851	185	1758	\N
16852	63	1758	\N
16853	42	1758	\N
16854	45	1758	\N
16855	123	1758	\N
16856	\N	1758	2
16857	81	166	\N
16858	83	166	\N
16859	15	166	\N
16860	110	166	\N
16861	27	166	\N
16862	185	166	\N
16863	63	166	\N
16864	42	166	\N
16865	45	166	\N
16866	123	166	\N
16867	\N	166	21
16868	81	1759	\N
16869	91	1759	\N
16870	15	1759	\N
16871	111	1759	\N
16872	27	1759	\N
16873	185	1759	\N
16874	63	1759	\N
16875	42	1759	\N
16876	45	1759	\N
16877	\N	1759	11
16878	80	1760	\N
16879	134	1760	\N
16880	135	1760	\N
16881	110	1760	\N
16882	185	1760	\N
16883	63	1760	\N
16884	42	1760	\N
16885	\N	1760	49
16886	81	1761	\N
16887	90	1761	\N
16888	15	1761	\N
16889	110	1761	\N
16890	27	1761	\N
16891	185	1761	\N
16892	63	1761	\N
16893	42	1761	\N
16894	45	1761	\N
16895	123	1761	\N
16896	\N	1761	13
16897	80	1762	\N
16898	134	1762	\N
16899	135	1762	\N
16900	108	1762	\N
16901	185	1762	\N
16902	63	1762	\N
16903	42	1762	\N
16904	\N	1762	49
16905	81	1763	\N
16906	90	1763	\N
16907	15	1763	\N
16908	110	1763	\N
16909	27	1763	\N
16910	185	1763	\N
16911	63	1763	\N
16912	42	1763	\N
16913	45	1763	\N
16914	123	1763	\N
16915	\N	1763	2
16916	81	1764	\N
16917	83	1764	\N
16918	15	1764	\N
16919	110	1764	\N
16920	27	1764	\N
16921	185	1764	\N
16922	63	1764	\N
16923	42	1764	\N
16924	45	1764	\N
16925	123	1764	\N
16926	\N	1764	38
16927	81	1765	\N
16928	90	1765	\N
16929	137	1765	\N
16930	110	1765	\N
16931	185	1765	\N
16932	63	1765	\N
16933	66	1765	\N
16934	\N	1765	174
16935	81	1766	\N
16936	90	1766	\N
16937	126	1766	\N
16938	110	1766	\N
16939	27	1766	\N
16940	185	1766	\N
16941	63	1766	\N
16942	42	1766	\N
16943	45	1766	\N
16944	\N	1766	17
16945	80	1767	\N
16946	134	1767	\N
16947	135	1767	\N
16948	110	1767	\N
16949	185	1767	\N
16950	63	1767	\N
16951	66	1767	\N
16952	\N	1767	99
16953	81	1768	\N
16954	90	1768	\N
16955	126	1768	\N
16956	110	1768	\N
16957	27	1768	\N
16958	185	1768	\N
16959	63	1768	\N
16960	42	1768	\N
16961	45	1768	\N
16962	\N	1768	17
16963	81	1769	\N
16964	90	1769	\N
16965	15	1769	\N
16966	110	1769	\N
16967	27	1769	\N
16968	185	1769	\N
16969	63	1769	\N
16970	42	1769	\N
16971	45	1769	\N
16972	123	1769	\N
16973	\N	1769	13
16974	81	1770	\N
16975	90	1770	\N
16976	15	1770	\N
16977	110	1770	\N
16978	27	1770	\N
16979	185	1770	\N
16980	63	1770	\N
16981	42	1770	\N
16982	45	1770	\N
16983	123	1770	\N
16984	\N	1770	2
16985	81	1771	\N
16986	91	1771	\N
16987	191	1771	\N
16988	110	1771	\N
16989	185	1771	\N
16990	87	1771	\N
16991	42	1771	\N
16992	\N	1771	222
16993	81	1772	\N
16994	83	1772	\N
16995	15	1772	\N
16996	110	1772	\N
16997	27	1772	\N
16998	185	1772	\N
16999	63	1772	\N
17000	42	1772	\N
17001	45	1772	\N
17002	\N	1772	22
17003	81	1773	\N
17004	98	1773	\N
17005	15	1773	\N
17006	110	1773	\N
17007	27	1773	\N
17008	185	1773	\N
17009	63	1773	\N
17010	42	1773	\N
17011	45	1773	\N
17012	123	1773	\N
17013	\N	1773	10
17014	80	1774	\N
17015	134	1774	\N
17016	162	1774	\N
17017	108	1774	\N
17018	185	1774	\N
17019	63	1774	\N
17020	42	1774	\N
17021	\N	1774	116
17022	81	1775	\N
17023	90	1775	\N
17024	15	1775	\N
17025	110	1775	\N
17026	27	1775	\N
17027	185	1775	\N
17028	63	1775	\N
17029	42	1775	\N
17030	45	1775	\N
17031	123	1775	\N
17032	\N	1775	2
17033	81	1776	\N
17034	90	1776	\N
17035	15	1776	\N
17036	110	1776	\N
17037	27	1776	\N
17038	185	1776	\N
17039	63	1776	\N
17040	42	1776	\N
17041	45	1776	\N
17042	123	1776	\N
17043	\N	1776	13
17044	81	1777	\N
17045	94	1777	\N
17046	137	1777	\N
17047	108	1777	\N
17048	185	1777	\N
17049	63	1777	\N
17050	42	1777	\N
17051	\N	1777	98
17052	81	1778	\N
17053	90	1778	\N
17054	57	1778	\N
17055	110	1778	\N
17056	185	1778	\N
17057	63	1778	\N
17058	42	1778	\N
17059	\N	1778	106
17060	81	1779	\N
17061	94	1779	\N
17062	57	1779	\N
17063	110	1779	\N
17064	185	1779	\N
17065	63	1779	\N
17066	42	1779	\N
17067	\N	1779	293
17068	81	1780	\N
17069	83	1780	\N
17070	15	1780	\N
17071	110	1780	\N
17072	27	1780	\N
17073	185	1780	\N
17074	63	1780	\N
17075	42	1780	\N
17076	45	1780	\N
17077	123	1780	\N
17078	\N	1780	38
17079	81	1781	\N
17080	90	1781	\N
17081	126	1781	\N
17082	111	1781	\N
17083	27	1781	\N
17084	185	1781	\N
17085	63	1781	\N
17086	42	1781	\N
17087	45	1781	\N
17088	\N	1781	17
17089	80	1782	\N
17090	134	1782	\N
17091	162	1782	\N
17092	110	1782	\N
17093	185	1782	\N
17094	63	1782	\N
17095	66	1782	\N
17096	\N	1782	116
17097	81	1783	\N
17098	90	1783	\N
17099	15	1783	\N
17100	110	1783	\N
17101	27	1783	\N
17102	185	1783	\N
17103	63	1783	\N
17104	42	1783	\N
17105	45	1783	\N
17106	123	1783	\N
17107	\N	1783	7
17108	81	8	\N
17109	91	8	\N
17110	15	8	\N
17111	122	8	\N
17112	110	8	\N
17113	27	8	\N
17114	185	8	\N
17115	63	8	\N
17116	42	8	\N
17117	45	8	\N
17118	123	8	\N
17119	\N	8	13
17120	81	78	\N
17121	83	78	\N
17122	15	78	\N
17123	110	78	\N
17124	27	78	\N
17125	185	78	\N
17126	63	78	\N
17127	42	78	\N
17128	45	78	\N
17129	\N	78	21
17130	81	1784	\N
17131	90	1784	\N
17132	15	1784	\N
17133	110	1784	\N
17134	27	1784	\N
17135	185	1784	\N
17136	63	1784	\N
17137	42	1784	\N
17138	45	1784	\N
17139	123	1784	\N
17140	\N	1784	2
17141	81	1785	\N
17142	94	1785	\N
17143	137	1785	\N
17144	110	1785	\N
17145	185	1785	\N
17146	63	1785	\N
17147	42	1785	\N
17148	\N	1785	98
17149	81	1786	\N
17150	90	1786	\N
17151	126	1786	\N
17152	110	1786	\N
17153	27	1786	\N
17154	185	1786	\N
17155	63	1786	\N
17156	42	1786	\N
17157	45	1786	\N
17158	\N	1786	17
17159	81	1787	\N
17160	90	1787	\N
17161	126	1787	\N
17162	110	1787	\N
17163	27	1787	\N
17164	185	1787	\N
17165	63	1787	\N
17166	42	1787	\N
17167	45	1787	\N
17168	\N	1787	17
17169	121	1788	\N
17170	101	1788	\N
17171	145	1788	\N
17172	108	1788	\N
17173	185	1788	\N
17174	63	1788	\N
17175	42	1788	\N
17176	\N	1788	48
17177	81	1789	\N
17178	90	1789	\N
17179	15	1789	\N
17180	110	1789	\N
17181	27	1789	\N
17182	185	1789	\N
17183	63	1789	\N
17184	42	1789	\N
17185	45	1789	\N
17186	123	1789	\N
17187	\N	1789	13
17188	81	1790	\N
17189	83	1790	\N
17190	15	1790	\N
17191	110	1790	\N
17192	27	1790	\N
17193	185	1790	\N
17194	63	1790	\N
17195	42	1790	\N
17196	45	1790	\N
17197	123	1790	\N
17198	\N	1790	2
17217	81	1666	\N
17218	91	1666	\N
17219	137	1666	\N
17220	110	1666	\N
17221	185	1666	\N
17222	63	1666	\N
17223	42	1666	\N
17224	\N	1666	268
17225	81	1667	\N
17226	94	1667	\N
17227	57	1667	\N
17228	110	1667	\N
17229	185	1667	\N
17230	63	1667	\N
17231	42	1667	\N
17232	\N	1667	282
17233	80	1668	\N
17234	56	1668	\N
17235	194	1668	\N
17236	110	1668	\N
17237	185	1668	\N
17238	63	1668	\N
17239	66	1668	\N
17240	\N	1668	229
17241	80	1669	\N
17242	90	1669	\N
17243	194	1669	\N
17244	110	1669	\N
17245	185	1669	\N
17246	63	1669	\N
17247	66	1669	\N
17248	\N	1669	229
17249	121	1670	\N
17250	134	1670	\N
17251	132	1670	\N
17252	110	1670	\N
17253	185	1670	\N
17254	63	1670	\N
17255	66	1670	\N
17256	\N	1670	283
17257	121	1671	\N
17258	101	1671	\N
17259	156	1671	\N
17260	110	1671	\N
17261	185	1671	\N
17262	63	1671	\N
17263	42	1671	\N
17264	\N	1671	136
17265	80	1672	\N
17266	94	1672	\N
17267	137	1672	\N
17268	108	1672	\N
17269	185	1672	\N
17270	63	1672	\N
17271	66	1672	\N
17272	\N	1672	39
17273	81	161	\N
17274	56	161	\N
17275	126	161	\N
17276	110	161	\N
17277	27	161	\N
17278	185	161	\N
17279	63	161	\N
17280	42	161	\N
17281	45	161	\N
17282	\N	161	17
17283	81	1791	\N
17284	90	1791	\N
17285	15	1791	\N
17286	110	1791	\N
17287	27	1791	\N
17288	185	1791	\N
17289	63	1791	\N
17290	42	1791	\N
17291	45	1791	\N
17292	123	1791	\N
17293	\N	1791	8
17294	81	1792	\N
17295	94	1792	\N
17296	57	1792	\N
17297	110	1792	\N
17298	185	1792	\N
17299	63	1792	\N
17300	42	1792	\N
17301	\N	1792	294
17302	81	882	\N
17303	90	882	\N
17304	15	882	\N
17305	110	882	\N
17306	27	882	\N
17307	185	882	\N
17308	63	882	\N
17309	42	882	\N
17310	45	882	\N
17311	123	882	\N
17312	\N	882	13
17313	80	1793	\N
17314	134	1793	\N
17315	162	1793	\N
17316	108	1793	\N
17317	185	1793	\N
17318	63	1793	\N
17319	42	1793	\N
17320	\N	1793	116
17321	80	1794	\N
17322	134	1794	\N
17323	151	1794	\N
17324	108	1794	\N
17325	185	1794	\N
17326	63	1794	\N
17327	42	1794	\N
17328	\N	1794	295
17329	80	1795	\N
17330	131	1795	\N
17331	190	1795	\N
17332	110	1795	\N
17333	186	1795	\N
17334	63	1795	\N
17335	66	1795	\N
17336	\N	1795	216
17337	81	1796	\N
17338	90	1796	\N
17339	15	1796	\N
17340	110	1796	\N
17341	27	1796	\N
17342	185	1796	\N
17343	63	1796	\N
17344	42	1796	\N
17345	45	1796	\N
17346	123	1796	\N
17347	\N	1796	2
17348	80	1797	\N
17349	134	1797	\N
17350	162	1797	\N
17351	167	1797	\N
17352	185	1797	\N
17353	63	1797	\N
17354	42	1797	\N
17355	\N	1797	116
17356	81	1798	\N
17357	90	1798	\N
17358	15	1798	\N
17359	110	1798	\N
17360	27	1798	\N
17361	185	1798	\N
17362	63	1798	\N
17363	42	1798	\N
17364	45	1798	\N
17365	123	1798	\N
17366	\N	1798	3
17367	81	1799	\N
17368	90	1799	\N
17369	15	1799	\N
17370	110	1799	\N
17371	27	1799	\N
17372	185	1799	\N
17373	63	1799	\N
17374	42	1799	\N
17375	45	1799	\N
17376	123	1799	\N
17377	\N	1799	2
17378	81	1800	\N
17379	131	1800	\N
17380	133	1800	\N
17381	110	1800	\N
17382	186	1800	\N
17383	63	1800	\N
17384	66	1800	\N
17385	\N	1800	296
17386	121	1801	\N
17387	141	1801	\N
17388	145	1801	\N
17389	108	1801	\N
17390	185	1801	\N
17391	63	1801	\N
17392	42	1801	\N
17393	\N	1801	48
17394	81	52	\N
17395	83	52	\N
17396	15	52	\N
17397	110	52	\N
17398	27	52	\N
17399	185	52	\N
17400	63	52	\N
17401	42	52	\N
17402	45	52	\N
17403	\N	52	21
17404	81	53	\N
17405	90	53	\N
17406	15	53	\N
17407	110	53	\N
17408	27	53	\N
17409	185	53	\N
17410	63	53	\N
17411	42	53	\N
17412	45	53	\N
17413	123	53	\N
17414	\N	53	13
17415	121	1802	\N
17416	134	1802	\N
17417	148	1802	\N
17418	160	1802	\N
17419	185	1802	\N
17420	63	1802	\N
17421	42	1802	\N
17422	\N	1802	56
17423	81	1803	\N
17424	90	1803	\N
17425	126	1803	\N
17426	110	1803	\N
17427	27	1803	\N
17428	185	1803	\N
17429	63	1803	\N
17430	42	1803	\N
17431	45	1803	\N
17432	\N	1803	17
17433	81	1804	\N
17434	90	1804	\N
17435	15	1804	\N
17436	27	1804	\N
17437	185	1804	\N
17438	63	1804	\N
17439	42	1804	\N
17440	45	1804	\N
17441	123	1804	\N
17442	\N	1804	13
17443	81	1805	\N
17444	90	1805	\N
17445	126	1805	\N
17446	110	1805	\N
17447	27	1805	\N
17448	185	1805	\N
17449	63	1805	\N
17450	42	1805	\N
17451	45	1805	\N
17452	\N	1805	17
17453	81	1806	\N
17454	90	1806	\N
17455	126	1806	\N
17456	110	1806	\N
17457	27	1806	\N
17458	185	1806	\N
17459	63	1806	\N
17460	42	1806	\N
17461	45	1806	\N
17462	\N	1806	17
17463	81	1807	\N
17464	90	1807	\N
17465	15	1807	\N
17466	110	1807	\N
17467	27	1807	\N
17468	185	1807	\N
17469	63	1807	\N
17470	42	1807	\N
17471	45	1807	\N
17472	123	1807	\N
17473	\N	1807	2
17474	81	1808	\N
17475	131	1808	\N
17476	137	1808	\N
17477	110	1808	\N
17478	185	1808	\N
17479	63	1808	\N
17480	42	1808	\N
17481	\N	1808	174
17482	121	1809	\N
17483	134	1809	\N
17484	148	1809	\N
17485	167	1809	\N
17486	185	1809	\N
17487	63	1809	\N
17488	42	1809	\N
17489	\N	1809	93
17490	81	1810	\N
17491	90	1810	\N
17492	15	1810	\N
17493	110	1810	\N
17494	27	1810	\N
17495	185	1810	\N
17496	63	1810	\N
17497	42	1810	\N
17498	45	1810	\N
17499	123	1810	\N
17500	\N	1810	13
17501	81	1811	\N
17502	131	1811	\N
17503	137	1811	\N
17504	110	1811	\N
17505	186	1811	\N
17506	63	1811	\N
17507	66	1811	\N
17508	\N	1811	297
17509	80	1812	\N
17510	134	1812	\N
17511	132	1812	\N
17512	110	1812	\N
17513	185	1812	\N
17514	63	1812	\N
17515	66	1812	\N
17516	\N	1812	55
17517	81	1813	\N
17518	92	1813	\N
17519	191	1813	\N
17520	110	1813	\N
17521	185	1813	\N
17522	63	1813	\N
17523	42	1813	\N
17524	\N	1813	222
17525	81	1814	\N
17526	90	1814	\N
17527	15	1814	\N
17528	110	1814	\N
17529	27	1814	\N
17530	185	1814	\N
17531	63	1814	\N
17532	42	1814	\N
17533	45	1814	\N
17534	123	1814	\N
17535	\N	1814	2
17536	81	1815	\N
17537	90	1815	\N
17538	137	1815	\N
17539	112	1815	\N
17540	155	1815	\N
17541	185	1815	\N
17542	63	1815	\N
17543	42	1815	\N
17544	\N	1815	298
17545	81	147	\N
17546	56	147	\N
17547	15	147	\N
17548	110	147	\N
17549	27	147	\N
17550	184	147	\N
17551	63	147	\N
17552	42	147	\N
17553	45	147	\N
17554	123	147	\N
17555	\N	147	13
17556	81	1816	\N
17557	92	1816	\N
17558	137	1816	\N
17559	112	1816	\N
17560	116	1816	\N
17561	185	1816	\N
17562	63	1816	\N
17563	42	1816	\N
17564	\N	1816	298
17565	121	1817	\N
17566	134	1817	\N
17567	168	1817	\N
17568	112	1817	\N
17569	185	1817	\N
17570	63	1817	\N
17571	66	1817	\N
17572	\N	1817	133
17573	81	1818	\N
17574	90	1818	\N
17575	126	1818	\N
17576	110	1818	\N
17577	27	1818	\N
17578	185	1818	\N
17579	63	1818	\N
17580	42	1818	\N
17581	45	1818	\N
17582	\N	1818	17
17583	81	1819	\N
17584	56	1819	\N
17585	168	1819	\N
17586	110	1819	\N
17587	185	1819	\N
17588	63	1819	\N
17589	42	1819	\N
17590	\N	1819	258
17591	81	1820	\N
17592	90	1820	\N
17593	126	1820	\N
17594	110	1820	\N
17595	27	1820	\N
17596	185	1820	\N
17597	63	1820	\N
17598	42	1820	\N
17599	45	1820	\N
17600	\N	1820	17
17601	81	1821	\N
17602	90	1821	\N
17603	15	1821	\N
17604	110	1821	\N
17605	27	1821	\N
17606	185	1821	\N
17607	63	1821	\N
17608	42	1821	\N
17609	45	1821	\N
17610	123	1821	\N
17611	\N	1821	13
17612	81	1822	\N
17613	90	1822	\N
17614	15	1822	\N
17615	110	1822	\N
17616	27	1822	\N
17617	185	1822	\N
17618	63	1822	\N
17619	42	1822	\N
17620	45	1822	\N
17621	123	1822	\N
17622	\N	1822	2
17623	80	1823	\N
17624	134	1823	\N
17625	162	1823	\N
17626	110	1823	\N
17627	185	1823	\N
17628	63	1823	\N
17629	66	1823	\N
17630	\N	1823	116
17631	81	1824	\N
17632	90	1824	\N
17633	15	1824	\N
17634	110	1824	\N
17635	27	1824	\N
17636	185	1824	\N
17637	63	1824	\N
17638	42	1824	\N
17639	45	1824	\N
17640	123	1824	\N
17641	\N	1824	2
17642	81	1825	\N
17643	83	1825	\N
17644	15	1825	\N
17645	110	1825	\N
17646	27	1825	\N
17647	185	1825	\N
17648	63	1825	\N
17649	42	1825	\N
17650	45	1825	\N
17651	\N	1825	21
17652	81	1826	\N
17653	56	1826	\N
17654	132	1826	\N
17655	110	1826	\N
17656	185	1826	\N
17657	63	1826	\N
17658	66	1826	\N
17659	\N	1826	141
17660	81	1827	\N
17661	131	1827	\N
17662	137	1827	\N
17663	110	1827	\N
17664	186	1827	\N
17665	63	1827	\N
17666	66	1827	\N
17667	\N	1827	299
17668	81	1828	\N
17669	83	1828	\N
17670	15	1828	\N
17671	110	1828	\N
17672	27	1828	\N
17673	185	1828	\N
17674	63	1828	\N
17675	42	1828	\N
17676	45	1828	\N
17677	123	1828	\N
17678	\N	1828	2
17679	81	1829	\N
17680	83	1829	\N
17681	15	1829	\N
17682	110	1829	\N
17683	27	1829	\N
17684	185	1829	\N
17685	30	1829	\N
17686	42	1829	\N
17687	\N	1829	21
17688	121	1830	\N
17689	101	1830	\N
17690	162	1830	\N
17691	108	1830	\N
17692	185	1830	\N
17693	63	1830	\N
17694	66	1830	\N
17695	\N	1830	189
17696	80	1831	\N
17697	134	1831	\N
17698	162	1831	\N
17699	167	1831	\N
17700	185	1831	\N
17701	63	1831	\N
17702	66	1831	\N
17703	\N	1831	116
17704	81	1832	\N
17705	90	1832	\N
17706	15	1832	\N
17707	110	1832	\N
17708	27	1832	\N
17709	185	1832	\N
17710	63	1832	\N
17711	42	1832	\N
17712	45	1832	\N
17713	123	1832	\N
17714	\N	1832	13
17715	81	1833	\N
17716	90	1833	\N
17717	15	1833	\N
17718	110	1833	\N
17719	27	1833	\N
17720	185	1833	\N
17721	63	1833	\N
17722	42	1833	\N
17723	45	1833	\N
17724	123	1833	\N
17725	\N	1833	2
17726	81	1834	\N
17727	90	1834	\N
17728	15	1834	\N
17729	110	1834	\N
17730	27	1834	\N
17731	185	1834	\N
17732	63	1834	\N
17733	42	1834	\N
17734	45	1834	\N
17735	123	1834	\N
17736	\N	1834	7
17737	81	1835	\N
17738	94	1835	\N
17739	137	1835	\N
17740	110	1835	\N
17741	185	1835	\N
17742	63	1835	\N
17743	42	1835	\N
17744	\N	1835	98
17745	81	1836	\N
17746	90	1836	\N
17747	15	1836	\N
17748	110	1836	\N
17749	27	1836	\N
17750	185	1836	\N
17751	63	1836	\N
17752	42	1836	\N
17753	45	1836	\N
17754	123	1836	\N
17755	\N	1836	23
17756	80	1837	\N
17757	134	1837	\N
17758	132	1837	\N
17759	108	1837	\N
17760	185	1837	\N
17761	63	1837	\N
17762	66	1837	\N
17763	\N	1837	102
17764	81	1838	\N
17765	90	1838	\N
17766	15	1838	\N
17767	110	1838	\N
17768	27	1838	\N
17769	185	1838	\N
17770	63	1838	\N
17771	42	1838	\N
17772	45	1838	\N
17773	123	1838	\N
17774	\N	1838	2
17775	81	1839	\N
17776	101	1839	\N
17777	15	1839	\N
17778	110	1839	\N
17779	27	1839	\N
17780	185	1839	\N
17781	63	1839	\N
17782	42	1839	\N
17783	\N	1839	16
17784	80	1840	\N
17785	101	1840	\N
17786	162	1840	\N
17787	110	1840	\N
17788	185	1840	\N
17789	63	1840	\N
17790	66	1840	\N
17791	\N	1840	189
17792	81	1841	\N
17793	90	1841	\N
17794	126	1841	\N
17795	110	1841	\N
17796	27	1841	\N
17797	185	1841	\N
17798	63	1841	\N
17799	42	1841	\N
17800	45	1841	\N
17801	\N	1841	17
17826	81	1843	\N
17827	94	1843	\N
17828	137	1843	\N
17829	110	1843	\N
17830	185	1843	\N
17831	63	1843	\N
17832	42	1843	\N
17833	\N	1843	301
17834	81	1842	\N
17835	92	1842	\N
17836	209	1842	\N
17837	110	1842	\N
17838	185	1842	\N
17839	63	1842	\N
17840	42	1842	\N
17841	\N	1842	300
17842	81	1844	\N
17843	94	1844	\N
17844	135	1844	\N
17845	110	1844	\N
17846	185	1844	\N
17847	63	1844	\N
17848	66	1844	\N
17849	\N	1844	188
17850	81	1845	\N
17851	83	1845	\N
17852	15	1845	\N
17853	110	1845	\N
17854	27	1845	\N
17855	185	1845	\N
17856	63	1845	\N
17857	42	1845	\N
17858	45	1845	\N
17859	\N	1845	21
17860	81	1846	\N
17861	90	1846	\N
17862	126	1846	\N
17863	110	1846	\N
17864	27	1846	\N
17865	185	1846	\N
17866	63	1846	\N
17867	42	1846	\N
17868	45	1846	\N
17869	\N	1846	20
17870	121	1847	\N
17871	134	1847	\N
17872	176	1847	\N
17873	108	1847	\N
17874	185	1847	\N
17875	63	1847	\N
17876	66	1847	\N
17877	\N	1847	167
17878	81	1848	\N
17879	90	1848	\N
17880	15	1848	\N
17881	110	1848	\N
17882	27	1848	\N
17883	185	1848	\N
17884	63	1848	\N
17885	42	1848	\N
17886	45	1848	\N
17887	123	1848	\N
17888	\N	1848	7
17889	81	1849	\N
17890	90	1849	\N
17891	15	1849	\N
17892	110	1849	\N
17893	27	1849	\N
17894	185	1849	\N
17895	63	1849	\N
17896	42	1849	\N
17897	45	1849	\N
17898	123	1849	\N
17899	\N	1849	13
17900	81	1850	\N
17901	90	1850	\N
17902	15	1850	\N
17903	110	1850	\N
17904	27	1850	\N
17905	185	1850	\N
17906	63	1850	\N
17907	42	1850	\N
17908	45	1850	\N
17909	123	1850	\N
17910	\N	1850	2
17911	81	1851	\N
17912	95	1851	\N
17913	132	1851	\N
17914	110	1851	\N
17915	185	1851	\N
17916	63	1851	\N
17917	42	1851	\N
17918	\N	1851	302
17919	121	1852	\N
17920	134	1852	\N
17921	148	1852	\N
17922	167	1852	\N
17923	185	1852	\N
17924	63	1852	\N
17925	42	1852	\N
17926	\N	1852	56
17927	81	1853	\N
17928	90	1853	\N
17929	15	1853	\N
17930	110	1853	\N
17931	27	1853	\N
17932	185	1853	\N
17933	63	1853	\N
17934	42	1853	\N
17935	45	1853	\N
17936	123	1853	\N
17937	\N	1853	13
17938	121	1854	\N
17939	141	1854	\N
17940	137	1854	\N
17941	108	1854	\N
17942	185	1854	\N
17943	87	1854	\N
17944	42	1854	\N
17945	\N	1854	45
17946	81	1855	\N
17947	141	1855	\N
17948	143	1855	\N
17949	108	1855	\N
17950	185	1855	\N
17951	87	1855	\N
17952	42	1855	\N
17953	\N	1855	59
17954	81	79	\N
17955	91	79	\N
17956	15	79	\N
17957	110	79	\N
17958	27	79	\N
17959	185	79	\N
17960	63	79	\N
17961	42	79	\N
17962	45	79	\N
17963	123	79	\N
17964	\N	79	10
17965	81	589	\N
17966	90	589	\N
17967	15	589	\N
17968	110	589	\N
17969	27	589	\N
17970	185	589	\N
17971	63	589	\N
17972	42	589	\N
17973	45	589	\N
17974	123	589	\N
17975	\N	589	13
17976	81	1856	\N
17977	90	1856	\N
17978	137	1856	\N
17979	24	1856	\N
17980	179	1856	\N
17981	185	1856	\N
17982	63	1856	\N
17983	66	1856	\N
17984	\N	1856	174
17985	81	1857	\N
17986	94	1857	\N
17987	132	1857	\N
17988	110	1857	\N
17989	185	1857	\N
17990	63	1857	\N
17991	42	1857	\N
17992	\N	1857	266
\.


--
-- Name: PK1; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT "PK1" PRIMARY KEY (rol_id);


--
-- Name: PK13; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT "PK13" PRIMARY KEY (categoria_id);


--
-- Name: PK14; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT "PK14" PRIMARY KEY (vehiculo_id);


--
-- Name: PK15; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY vehiculo_informacion_general
    ADD CONSTRAINT "PK15" PRIMARY KEY (vehiculo_informacion_general_id);


--
-- Name: PK16; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY vehiculo_fotografia
    ADD CONSTRAINT "PK16" PRIMARY KEY (vehiculo_fotografia_id);


--
-- Name: PK17; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY vehiculo_documento
    ADD CONSTRAINT "PK17" PRIMARY KEY (vehiculo_documento_id);


--
-- Name: PK18; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY chasis_mantencion
    ADD CONSTRAINT "PK18" PRIMARY KEY (chasis_mantencion_id);


--
-- Name: PK18_1; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY carrozado_mantencion
    ADD CONSTRAINT "PK18_1" PRIMARY KEY (carrozado_mantencion_id);


--
-- Name: PK18_2; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT "PK18_2" PRIMARY KEY (evento_id);


--
-- Name: PK2; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT "PK2" PRIMARY KEY (usuario_id);


--
-- Name: PK22; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY modelo
    ADD CONSTRAINT "PK22" PRIMARY KEY (modelo_id);


--
-- Name: PK23; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT "PK23" PRIMARY KEY (region_id);


--
-- Name: PK24; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY provincia
    ADD CONSTRAINT "PK24" PRIMARY KEY (provincia_id);


--
-- Name: PK25; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY comuna
    ADD CONSTRAINT "PK25" PRIMARY KEY (comuna_id);


--
-- Name: PK26; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY cuerpo
    ADD CONSTRAINT "PK26" PRIMARY KEY (cuerpo_id);


--
-- Name: PK27; Type: CONSTRAINT; Schema: public; Owner: carlos; Tablespace: 
--

ALTER TABLE ONLY compannia
    ADD CONSTRAINT "PK27" PRIMARY KEY (compannia_id);


--
-- Name: Refcarrozado_mantencion59; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT "Refcarrozado_mantencion59" FOREIGN KEY (carrozado_mantencion_id) REFERENCES carrozado_mantencion(carrozado_mantencion_id);


--
-- Name: Refcategoria44; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT "Refcategoria44" FOREIGN KEY (categoria_padre_id) REFERENCES categoria(categoria_id);


--
-- Name: Refcategoria45; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY vehiculo_informacion_general
    ADD CONSTRAINT "Refcategoria45" FOREIGN KEY (categoria_id) REFERENCES categoria(categoria_id);


--
-- Name: Refcategoria47; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY vehiculo_fotografia
    ADD CONSTRAINT "Refcategoria47" FOREIGN KEY (categoria_id) REFERENCES categoria(categoria_id);


--
-- Name: Refcategoria53; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT "Refcategoria53" FOREIGN KEY (categoria_id) REFERENCES categoria(categoria_id);


--
-- Name: Refcategoria55; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY modelo
    ADD CONSTRAINT "Refcategoria55" FOREIGN KEY (categoria_id) REFERENCES categoria(categoria_id);


--
-- Name: Refchasis_mantencion60; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY vehiculo
    ADD CONSTRAINT "Refchasis_mantencion60" FOREIGN KEY (chasis_mantencion_id) REFERENCES chasis_mantencion(chasis_mantencion_id);


--
-- Name: Refcompannia66; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY vehiculo_documento
    ADD CONSTRAINT "Refcompannia66" FOREIGN KEY (compannia_id) REFERENCES compannia(compannia_id);


--
-- Name: Refcomuna63; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY cuerpo
    ADD CONSTRAINT "Refcomuna63" FOREIGN KEY (comuna_id) REFERENCES comuna(comuna_id);


--
-- Name: Refcuerpo64; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY compannia
    ADD CONSTRAINT "Refcuerpo64" FOREIGN KEY (cuerpo_id) REFERENCES cuerpo(cuerpo_id);


--
-- Name: Refcuerpo65; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY vehiculo_documento
    ADD CONSTRAINT "Refcuerpo65" FOREIGN KEY (cuerpo_id) REFERENCES cuerpo(cuerpo_id);


--
-- Name: Refmodelo56; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY carrozado_mantencion
    ADD CONSTRAINT "Refmodelo56" FOREIGN KEY (modelo_id) REFERENCES modelo(modelo_id);


--
-- Name: Refmodelo57; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY chasis_mantencion
    ADD CONSTRAINT "Refmodelo57" FOREIGN KEY (modelo_id) REFERENCES modelo(modelo_id);


--
-- Name: Refmodelo58; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY vehiculo_informacion_general
    ADD CONSTRAINT "Refmodelo58" FOREIGN KEY (modelo_id) REFERENCES modelo(modelo_id);


--
-- Name: Refprovincia62; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY comuna
    ADD CONSTRAINT "Refprovincia62" FOREIGN KEY (provincia_id) REFERENCES provincia(provincia_id);


--
-- Name: Refregion61; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY provincia
    ADD CONSTRAINT "Refregion61" FOREIGN KEY (region_id) REFERENCES region(region_id);


--
-- Name: Refrol1; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT "Refrol1" FOREIGN KEY (rol_id) REFERENCES rol(rol_id);


--
-- Name: Refvehiculo46; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY vehiculo_informacion_general
    ADD CONSTRAINT "Refvehiculo46" FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(vehiculo_id);


--
-- Name: Refvehiculo48; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY vehiculo_fotografia
    ADD CONSTRAINT "Refvehiculo48" FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(vehiculo_id);


--
-- Name: Refvehiculo49; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY vehiculo_documento
    ADD CONSTRAINT "Refvehiculo49" FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(vehiculo_id);


--
-- Name: Refvehiculo54; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT "Refvehiculo54" FOREIGN KEY (vehiculo_id) REFERENCES vehiculo(vehiculo_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: carlos
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM carlos;
GRANT ALL ON SCHEMA public TO carlos;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: carrozado_mantencion; Type: ACL; Schema: public; Owner: carlos
--

REVOKE ALL ON TABLE carrozado_mantencion FROM PUBLIC;
REVOKE ALL ON TABLE carrozado_mantencion FROM carlos;
GRANT ALL ON TABLE carrozado_mantencion TO carlos;


--
-- Name: categoria; Type: ACL; Schema: public; Owner: carlos
--

REVOKE ALL ON TABLE categoria FROM PUBLIC;
REVOKE ALL ON TABLE categoria FROM carlos;
GRANT ALL ON TABLE categoria TO carlos;


--
-- Name: chasis_mantencion; Type: ACL; Schema: public; Owner: carlos
--

REVOKE ALL ON TABLE chasis_mantencion FROM PUBLIC;
REVOKE ALL ON TABLE chasis_mantencion FROM carlos;
GRANT ALL ON TABLE chasis_mantencion TO carlos;


--
-- Name: evento; Type: ACL; Schema: public; Owner: carlos
--

REVOKE ALL ON TABLE evento FROM PUBLIC;
REVOKE ALL ON TABLE evento FROM carlos;
GRANT ALL ON TABLE evento TO carlos;


--
-- Name: modelo; Type: ACL; Schema: public; Owner: carlos
--

REVOKE ALL ON TABLE modelo FROM PUBLIC;
REVOKE ALL ON TABLE modelo FROM carlos;
GRANT ALL ON TABLE modelo TO carlos;


--
-- Name: vehiculo; Type: ACL; Schema: public; Owner: carlos
--

REVOKE ALL ON TABLE vehiculo FROM PUBLIC;
REVOKE ALL ON TABLE vehiculo FROM carlos;
GRANT ALL ON TABLE vehiculo TO carlos;


--
-- Name: vehiculo_documento; Type: ACL; Schema: public; Owner: carlos
--

REVOKE ALL ON TABLE vehiculo_documento FROM PUBLIC;
REVOKE ALL ON TABLE vehiculo_documento FROM carlos;
GRANT ALL ON TABLE vehiculo_documento TO carlos;


--
-- Name: vehiculo_fotografia; Type: ACL; Schema: public; Owner: carlos
--

REVOKE ALL ON TABLE vehiculo_fotografia FROM PUBLIC;
REVOKE ALL ON TABLE vehiculo_fotografia FROM carlos;
GRANT ALL ON TABLE vehiculo_fotografia TO carlos;


--
-- Name: vehiculo_informacion_general; Type: ACL; Schema: public; Owner: carlos
--

REVOKE ALL ON TABLE vehiculo_informacion_general FROM PUBLIC;
REVOKE ALL ON TABLE vehiculo_informacion_general FROM carlos;
GRANT ALL ON TABLE vehiculo_informacion_general TO carlos;


--
-- PostgreSQL database dump complete
--

