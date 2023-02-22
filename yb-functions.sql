-- Create functions in YugabyteDB before starting execute phase

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: getstockcounts(integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: yugabyte
--

CREATE FUNCTION public.getstockcounts(warehouse integer, district integer, min_o_id integer, max_o_id integer, max_quantity integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$ DECLARE item_ids integer[]; result integer; BEGIN SELECT ARRAY(SELECT DISTINCT(OL_I_ID) FROM ORDER_LINE WHERE OL_W_ID = $1 and OL_D_ID = $2 and OL_O_ID >= $3 and OL_O_ID < $4) INTO item_ids; SELECT COUNT(S_I_ID) INTO result FROM STOCK WHERE S_W_ID = $1 AND S_I_ID = ANY(item_ids) AND S_QUANTITY < $5; RETURN result; END; $_$;


ALTER FUNCTION public.getstockcounts(warehouse integer, district integer, min_o_id integer, max_o_id integer, max_quantity integer) OWNER TO postgres;

--
-- Name: updatestock1(integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock1(wid integer, i1 integer, q1 integer, y1 integer, r1 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;$$;


ALTER PROCEDURE public.updatestock1(wid integer, i1 integer, q1 integer, y1 integer, r1 integer) OWNER TO postgres;

--
-- Name: updatestock10(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock10(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer, i10 integer, q10 integer, y10 integer, r10 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;UPDATE STOCK SET S_QUANTITY = q4, S_YTD = y4, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r4 WHERE S_W_ID = wid AND S_I_ID = i4;UPDATE STOCK SET S_QUANTITY = q5, S_YTD = y5, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r5 WHERE S_W_ID = wid AND S_I_ID = i5;UPDATE STOCK SET S_QUANTITY = q6, S_YTD = y6, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r6 WHERE S_W_ID = wid AND S_I_ID = i6;UPDATE STOCK SET S_QUANTITY = q7, S_YTD = y7, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r7 WHERE S_W_ID = wid AND S_I_ID = i7;UPDATE STOCK SET S_QUANTITY = q8, S_YTD = y8, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r8 WHERE S_W_ID = wid AND S_I_ID = i8;UPDATE STOCK SET S_QUANTITY = q9, S_YTD = y9, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r9 WHERE S_W_ID = wid AND S_I_ID = i9;UPDATE STOCK SET S_QUANTITY = q10, S_YTD = y10, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r10 WHERE S_W_ID = wid AND S_I_ID = i10;$$;


ALTER PROCEDURE public.updatestock10(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer, i10 integer, q10 integer, y10 integer, r10 integer) OWNER TO postgres;

--
-- Name: updatestock11(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock11(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer, i10 integer, q10 integer, y10 integer, r10 integer, i11 integer, q11 integer, y11 integer, r11 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;UPDATE STOCK SET S_QUANTITY = q4, S_YTD = y4, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r4 WHERE S_W_ID = wid AND S_I_ID = i4;UPDATE STOCK SET S_QUANTITY = q5, S_YTD = y5, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r5 WHERE S_W_ID = wid AND S_I_ID = i5;UPDATE STOCK SET S_QUANTITY = q6, S_YTD = y6, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r6 WHERE S_W_ID = wid AND S_I_ID = i6;UPDATE STOCK SET S_QUANTITY = q7, S_YTD = y7, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r7 WHERE S_W_ID = wid AND S_I_ID = i7;UPDATE STOCK SET S_QUANTITY = q8, S_YTD = y8, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r8 WHERE S_W_ID = wid AND S_I_ID = i8;UPDATE STOCK SET S_QUANTITY = q9, S_YTD = y9, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r9 WHERE S_W_ID = wid AND S_I_ID = i9;UPDATE STOCK SET S_QUANTITY = q10, S_YTD = y10, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r10 WHERE S_W_ID = wid AND S_I_ID = i10;UPDATE STOCK SET S_QUANTITY = q11, S_YTD = y11, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r11 WHERE S_W_ID = wid AND S_I_ID = i11;$$;


ALTER PROCEDURE public.updatestock11(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer, i10 integer, q10 integer, y10 integer, r10 integer, i11 integer, q11 integer, y11 integer, r11 integer) OWNER TO postgres;

--
-- Name: updatestock12(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock12(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer, i10 integer, q10 integer, y10 integer, r10 integer, i11 integer, q11 integer, y11 integer, r11 integer, i12 integer, q12 integer, y12 integer, r12 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;UPDATE STOCK SET S_QUANTITY = q4, S_YTD = y4, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r4 WHERE S_W_ID = wid AND S_I_ID = i4;UPDATE STOCK SET S_QUANTITY = q5, S_YTD = y5, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r5 WHERE S_W_ID = wid AND S_I_ID = i5;UPDATE STOCK SET S_QUANTITY = q6, S_YTD = y6, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r6 WHERE S_W_ID = wid AND S_I_ID = i6;UPDATE STOCK SET S_QUANTITY = q7, S_YTD = y7, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r7 WHERE S_W_ID = wid AND S_I_ID = i7;UPDATE STOCK SET S_QUANTITY = q8, S_YTD = y8, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r8 WHERE S_W_ID = wid AND S_I_ID = i8;UPDATE STOCK SET S_QUANTITY = q9, S_YTD = y9, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r9 WHERE S_W_ID = wid AND S_I_ID = i9;UPDATE STOCK SET S_QUANTITY = q10, S_YTD = y10, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r10 WHERE S_W_ID = wid AND S_I_ID = i10;UPDATE STOCK SET S_QUANTITY = q11, S_YTD = y11, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r11 WHERE S_W_ID = wid AND S_I_ID = i11;UPDATE STOCK SET S_QUANTITY = q12, S_YTD = y12, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r12 WHERE S_W_ID = wid AND S_I_ID = i12;$$;


ALTER PROCEDURE public.updatestock12(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer, i10 integer, q10 integer, y10 integer, r10 integer, i11 integer, q11 integer, y11 integer, r11 integer, i12 integer, q12 integer, y12 integer, r12 integer) OWNER TO postgres;

--
-- Name: updatestock13(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock13(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer, i10 integer, q10 integer, y10 integer, r10 integer, i11 integer, q11 integer, y11 integer, r11 integer, i12 integer, q12 integer, y12 integer, r12 integer, i13 integer, q13 integer, y13 integer, r13 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;UPDATE STOCK SET S_QUANTITY = q4, S_YTD = y4, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r4 WHERE S_W_ID = wid AND S_I_ID = i4;UPDATE STOCK SET S_QUANTITY = q5, S_YTD = y5, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r5 WHERE S_W_ID = wid AND S_I_ID = i5;UPDATE STOCK SET S_QUANTITY = q6, S_YTD = y6, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r6 WHERE S_W_ID = wid AND S_I_ID = i6;UPDATE STOCK SET S_QUANTITY = q7, S_YTD = y7, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r7 WHERE S_W_ID = wid AND S_I_ID = i7;UPDATE STOCK SET S_QUANTITY = q8, S_YTD = y8, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r8 WHERE S_W_ID = wid AND S_I_ID = i8;UPDATE STOCK SET S_QUANTITY = q9, S_YTD = y9, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r9 WHERE S_W_ID = wid AND S_I_ID = i9;UPDATE STOCK SET S_QUANTITY = q10, S_YTD = y10, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r10 WHERE S_W_ID = wid AND S_I_ID = i10;UPDATE STOCK SET S_QUANTITY = q11, S_YTD = y11, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r11 WHERE S_W_ID = wid AND S_I_ID = i11;UPDATE STOCK SET S_QUANTITY = q12, S_YTD = y12, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r12 WHERE S_W_ID = wid AND S_I_ID = i12;UPDATE STOCK SET S_QUANTITY = q13, S_YTD = y13, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r13 WHERE S_W_ID = wid AND S_I_ID = i13;$$;


ALTER PROCEDURE public.updatestock13(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer, i10 integer, q10 integer, y10 integer, r10 integer, i11 integer, q11 integer, y11 integer, r11 integer, i12 integer, q12 integer, y12 integer, r12 integer, i13 integer, q13 integer, y13 integer, r13 integer) OWNER TO postgres;

--
-- Name: updatestock14(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock14(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer, i10 integer, q10 integer, y10 integer, r10 integer, i11 integer, q11 integer, y11 integer, r11 integer, i12 integer, q12 integer, y12 integer, r12 integer, i13 integer, q13 integer, y13 integer, r13 integer, i14 integer, q14 integer, y14 integer, r14 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;UPDATE STOCK SET S_QUANTITY = q4, S_YTD = y4, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r4 WHERE S_W_ID = wid AND S_I_ID = i4;UPDATE STOCK SET S_QUANTITY = q5, S_YTD = y5, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r5 WHERE S_W_ID = wid AND S_I_ID = i5;UPDATE STOCK SET S_QUANTITY = q6, S_YTD = y6, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r6 WHERE S_W_ID = wid AND S_I_ID = i6;UPDATE STOCK SET S_QUANTITY = q7, S_YTD = y7, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r7 WHERE S_W_ID = wid AND S_I_ID = i7;UPDATE STOCK SET S_QUANTITY = q8, S_YTD = y8, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r8 WHERE S_W_ID = wid AND S_I_ID = i8;UPDATE STOCK SET S_QUANTITY = q9, S_YTD = y9, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r9 WHERE S_W_ID = wid AND S_I_ID = i9;UPDATE STOCK SET S_QUANTITY = q10, S_YTD = y10, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r10 WHERE S_W_ID = wid AND S_I_ID = i10;UPDATE STOCK SET S_QUANTITY = q11, S_YTD = y11, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r11 WHERE S_W_ID = wid AND S_I_ID = i11;UPDATE STOCK SET S_QUANTITY = q12, S_YTD = y12, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r12 WHERE S_W_ID = wid AND S_I_ID = i12;UPDATE STOCK SET S_QUANTITY = q13, S_YTD = y13, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r13 WHERE S_W_ID = wid AND S_I_ID = i13;UPDATE STOCK SET S_QUANTITY = q14, S_YTD = y14, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r14 WHERE S_W_ID = wid AND S_I_ID = i14;$$;


ALTER PROCEDURE public.updatestock14(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer, i10 integer, q10 integer, y10 integer, r10 integer, i11 integer, q11 integer, y11 integer, r11 integer, i12 integer, q12 integer, y12 integer, r12 integer, i13 integer, q13 integer, y13 integer, r13 integer, i14 integer, q14 integer, y14 integer, r14 integer) OWNER TO postgres;

--
-- Name: updatestock15(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock15(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer, i10 integer, q10 integer, y10 integer, r10 integer, i11 integer, q11 integer, y11 integer, r11 integer, i12 integer, q12 integer, y12 integer, r12 integer, i13 integer, q13 integer, y13 integer, r13 integer, i14 integer, q14 integer, y14 integer, r14 integer, i15 integer, q15 integer, y15 integer, r15 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;UPDATE STOCK SET S_QUANTITY = q4, S_YTD = y4, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r4 WHERE S_W_ID = wid AND S_I_ID = i4;UPDATE STOCK SET S_QUANTITY = q5, S_YTD = y5, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r5 WHERE S_W_ID = wid AND S_I_ID = i5;UPDATE STOCK SET S_QUANTITY = q6, S_YTD = y6, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r6 WHERE S_W_ID = wid AND S_I_ID = i6;UPDATE STOCK SET S_QUANTITY = q7, S_YTD = y7, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r7 WHERE S_W_ID = wid AND S_I_ID = i7;UPDATE STOCK SET S_QUANTITY = q8, S_YTD = y8, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r8 WHERE S_W_ID = wid AND S_I_ID = i8;UPDATE STOCK SET S_QUANTITY = q9, S_YTD = y9, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r9 WHERE S_W_ID = wid AND S_I_ID = i9;UPDATE STOCK SET S_QUANTITY = q10, S_YTD = y10, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r10 WHERE S_W_ID = wid AND S_I_ID = i10;UPDATE STOCK SET S_QUANTITY = q11, S_YTD = y11, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r11 WHERE S_W_ID = wid AND S_I_ID = i11;UPDATE STOCK SET S_QUANTITY = q12, S_YTD = y12, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r12 WHERE S_W_ID = wid AND S_I_ID = i12;UPDATE STOCK SET S_QUANTITY = q13, S_YTD = y13, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r13 WHERE S_W_ID = wid AND S_I_ID = i13;UPDATE STOCK SET S_QUANTITY = q14, S_YTD = y14, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r14 WHERE S_W_ID = wid AND S_I_ID = i14;UPDATE STOCK SET S_QUANTITY = q15, S_YTD = y15, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r15 WHERE S_W_ID = wid AND S_I_ID = i15;$$;


ALTER PROCEDURE public.updatestock15(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer, i10 integer, q10 integer, y10 integer, r10 integer, i11 integer, q11 integer, y11 integer, r11 integer, i12 integer, q12 integer, y12 integer, r12 integer, i13 integer, q13 integer, y13 integer, r13 integer, i14 integer, q14 integer, y14 integer, r14 integer, i15 integer, q15 integer, y15 integer, r15 integer) OWNER TO postgres;

--
-- Name: updatestock2(integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock2(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;$$;


ALTER PROCEDURE public.updatestock2(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer) OWNER TO postgres;

--
-- Name: updatestock3(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock3(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;$$;


ALTER PROCEDURE public.updatestock3(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer) OWNER TO postgres;

--
-- Name: updatestock4(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock4(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;UPDATE STOCK SET S_QUANTITY = q4, S_YTD = y4, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r4 WHERE S_W_ID = wid AND S_I_ID = i4;$$;


ALTER PROCEDURE public.updatestock4(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer) OWNER TO postgres;

--
-- Name: updatestock5(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock5(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;UPDATE STOCK SET S_QUANTITY = q4, S_YTD = y4, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r4 WHERE S_W_ID = wid AND S_I_ID = i4;UPDATE STOCK SET S_QUANTITY = q5, S_YTD = y5, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r5 WHERE S_W_ID = wid AND S_I_ID = i5;$$;


ALTER PROCEDURE public.updatestock5(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer) OWNER TO postgres;

--
-- Name: updatestock6(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock6(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;UPDATE STOCK SET S_QUANTITY = q4, S_YTD = y4, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r4 WHERE S_W_ID = wid AND S_I_ID = i4;UPDATE STOCK SET S_QUANTITY = q5, S_YTD = y5, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r5 WHERE S_W_ID = wid AND S_I_ID = i5;UPDATE STOCK SET S_QUANTITY = q6, S_YTD = y6, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r6 WHERE S_W_ID = wid AND S_I_ID = i6;$$;


ALTER PROCEDURE public.updatestock6(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer) OWNER TO postgres;

--
-- Name: updatestock7(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock7(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;UPDATE STOCK SET S_QUANTITY = q4, S_YTD = y4, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r4 WHERE S_W_ID = wid AND S_I_ID = i4;UPDATE STOCK SET S_QUANTITY = q5, S_YTD = y5, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r5 WHERE S_W_ID = wid AND S_I_ID = i5;UPDATE STOCK SET S_QUANTITY = q6, S_YTD = y6, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r6 WHERE S_W_ID = wid AND S_I_ID = i6;UPDATE STOCK SET S_QUANTITY = q7, S_YTD = y7, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r7 WHERE S_W_ID = wid AND S_I_ID = i7;$$;


ALTER PROCEDURE public.updatestock7(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer) OWNER TO postgres;

--
-- Name: updatestock8(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock8(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;UPDATE STOCK SET S_QUANTITY = q4, S_YTD = y4, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r4 WHERE S_W_ID = wid AND S_I_ID = i4;UPDATE STOCK SET S_QUANTITY = q5, S_YTD = y5, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r5 WHERE S_W_ID = wid AND S_I_ID = i5;UPDATE STOCK SET S_QUANTITY = q6, S_YTD = y6, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r6 WHERE S_W_ID = wid AND S_I_ID = i6;UPDATE STOCK SET S_QUANTITY = q7, S_YTD = y7, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r7 WHERE S_W_ID = wid AND S_I_ID = i7;UPDATE STOCK SET S_QUANTITY = q8, S_YTD = y8, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r8 WHERE S_W_ID = wid AND S_I_ID = i8;$$;


ALTER PROCEDURE public.updatestock8(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer) OWNER TO postgres;

--
-- Name: updatestock9(integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer, integer); Type: PROCEDURE; Schema: public; Owner: yugabyte
--

CREATE PROCEDURE public.updatestock9(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer)
    LANGUAGE sql
    AS $$UPDATE STOCK SET S_QUANTITY = q1, S_YTD = y1, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r1 WHERE S_W_ID = wid AND S_I_ID = i1;UPDATE STOCK SET S_QUANTITY = q2, S_YTD = y2, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r2 WHERE S_W_ID = wid AND S_I_ID = i2;UPDATE STOCK SET S_QUANTITY = q3, S_YTD = y3, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r3 WHERE S_W_ID = wid AND S_I_ID = i3;UPDATE STOCK SET S_QUANTITY = q4, S_YTD = y4, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r4 WHERE S_W_ID = wid AND S_I_ID = i4;UPDATE STOCK SET S_QUANTITY = q5, S_YTD = y5, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r5 WHERE S_W_ID = wid AND S_I_ID = i5;UPDATE STOCK SET S_QUANTITY = q6, S_YTD = y6, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r6 WHERE S_W_ID = wid AND S_I_ID = i6;UPDATE STOCK SET S_QUANTITY = q7, S_YTD = y7, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r7 WHERE S_W_ID = wid AND S_I_ID = i7;UPDATE STOCK SET S_QUANTITY = q8, S_YTD = y8, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r8 WHERE S_W_ID = wid AND S_I_ID = i8;UPDATE STOCK SET S_QUANTITY = q9, S_YTD = y9, S_ORDER_CNT = S_ORDER_CNT + 1, S_REMOTE_CNT = r9 WHERE S_W_ID = wid AND S_I_ID = i9;$$;


ALTER PROCEDURE public.updatestock9(wid integer, i1 integer, q1 integer, y1 integer, r1 integer, i2 integer, q2 integer, y2 integer, r2 integer, i3 integer, q3 integer, y3 integer, r3 integer, i4 integer, q4 integer, y4 integer, r4 integer, i5 integer, q5 integer, y5 integer, r5 integer, i6 integer, q6 integer, y6 integer, r6 integer, i7 integer, q7 integer, y7 integer, r7 integer, i8 integer, q8 integer, y8 integer, r8 integer, i9 integer, q9 integer, y9 integer, r9 integer) OWNER TO postgres;
