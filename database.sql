--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-03-29 14:54:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16402)
-- Name: lectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectors (
    idlector integer NOT NULL,
    first_name text,
    last_name text,
    birthday date,
    subject integer
);


ALTER TABLE public.lectors OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16421)
-- Name: marks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marks (
    idstudent integer NOT NULL,
    idcredits integer NOT NULL,
    date_examination date NOT NULL,
    examinator integer,
    mark integer
);


ALTER TABLE public.marks OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16409)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    idstudent integer NOT NULL,
    first_name text,
    last_name text,
    birthday date,
    mentor integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16436)
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    idcredit integer NOT NULL,
    credit_name text
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- TOC entry 3326 (class 0 OID 16402)
-- Dependencies: 209
-- Data for Name: lectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lectors VALUES (101, 'Natalia', 'Kiseleva', '1978-04-21', 301);
INSERT INTO public.lectors VALUES (102, 'Vadim', 'Turlapov', '1953-08-16', 304);
INSERT INTO public.lectors VALUES (103, 'Dmitry', 'Shaposhnikov', '1972-03-30', 302);
INSERT INTO public.lectors VALUES (104, 'Elena', 'Kuvykina', '1962-12-05', 303);
INSERT INTO public.lectors VALUES (105, 'Alexandra', 'Getmanskaya', '1991-11-11', 304);
INSERT INTO public.lectors VALUES (106, 'Evgeniy', 'Grinev', '1986-09-16', 301);


--
-- TOC entry 3328 (class 0 OID 16421)
-- Dependencies: 211
-- Data for Name: marks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.marks VALUES (204, 304, '2022-01-25', 102, 2);
INSERT INTO public.marks VALUES (204, 304, '2022-02-25', 102, 0);
INSERT INTO public.marks VALUES (204, 304, '2022-03-25', 102, 4);
INSERT INTO public.marks VALUES (201, 304, '2022-01-25', 102, 4);
INSERT INTO public.marks VALUES (202, 301, '2022-01-15', 101, 4);
INSERT INTO public.marks VALUES (204, 301, '2022-01-15', 101, 3);
INSERT INTO public.marks VALUES (202, 302, '2022-01-30', 103, 4);
INSERT INTO public.marks VALUES (202, 303, '2022-01-05', 104, 2);
INSERT INTO public.marks VALUES (202, 303, '2022-02-05', 104, 5);
INSERT INTO public.marks VALUES (203, 303, '2022-01-05', 104, 0);
INSERT INTO public.marks VALUES (203, 303, '2022-02-05', 104, 3);
INSERT INTO public.marks VALUES (203, 301, '2022-01-15', 101, 4);
INSERT INTO public.marks VALUES (204, 302, '2022-01-30', 103, 5);
INSERT INTO public.marks VALUES (204, 303, '2022-01-05', 104, 0);
INSERT INTO public.marks VALUES (204, 303, '2022-02-05', 104, 4);


--
-- TOC entry 3327 (class 0 OID 16409)
-- Dependencies: 210
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.students VALUES (206, 'Nikita', 'Kudryavtsev', '2002-10-30', 104);
INSERT INTO public.students VALUES (201, 'Anatoliy ', 'Pankov', '2002-11-13', 105);
INSERT INTO public.students VALUES (202, 'Anna', 'Anoshenkova', '2001-12-17', 105);
INSERT INTO public.students VALUES (203, 'Dmitry', 'Yablonsky', '2002-04-17', 106);
INSERT INTO public.students VALUES (204, 'Dmitry', 'Varyzgin', '2002-11-03', 104);
INSERT INTO public.students VALUES (205, 'Nikita', 'Kuchin', '2001-03-02', 103);


--
-- TOC entry 3329 (class 0 OID 16436)
-- Dependencies: 212
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.subjects VALUES (301, 'Differencial equations');
INSERT INTO public.subjects VALUES (302, 'Data bases');
INSERT INTO public.subjects VALUES (303, 'Theory of variaty');
INSERT INTO public.subjects VALUES (304, 'Computer graphics');


--
-- TOC entry 3176 (class 2606 OID 16408)
-- Name: lectors lectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectors
    ADD CONSTRAINT lectors_pkey PRIMARY KEY (idlector);


--
-- TOC entry 3180 (class 2606 OID 16425)
-- Name: marks marks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_pkey PRIMARY KEY (idstudent, idcredits, date_examination);


--
-- TOC entry 3178 (class 2606 OID 16415)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (idstudent);


--
-- TOC entry 3182 (class 2606 OID 16442)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (idcredit);


--
-- TOC entry 3186 (class 2606 OID 16443)
-- Name: marks credit_depend; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT credit_depend FOREIGN KEY (idcredits) REFERENCES public.subjects(idcredit) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3183 (class 2606 OID 16416)
-- Name: students depends; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT depends FOREIGN KEY (mentor) REFERENCES public.lectors(idlector) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3185 (class 2606 OID 16431)
-- Name: marks examinator_depend; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT examinator_depend FOREIGN KEY (examinator) REFERENCES public.lectors(idlector) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3184 (class 2606 OID 16426)
-- Name: marks student_depend; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT student_depend FOREIGN KEY (idstudent) REFERENCES public.students(idstudent) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


-- Completed on 2022-03-29 14:54:23

--
-- PostgreSQL database dump complete
--

