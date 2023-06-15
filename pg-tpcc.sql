-- timestamp fields have been changed to long so that we do not need any specific transformation anywhere

CREATE TABLE OORDER (
o_w_id int,
o_d_id int,
o_id int,
o_c_id int,
o_carrier_id int DEFAULT NULL,
o_ol_cnt decimal(2,0),
o_all_local decimal(1,0),
o_entry_d bigint,
PRIMARY KEY (o_w_id,o_d_id,o_id)
);

CREATE TABLE DISTRICT (
d_w_id int,
d_id int,
d_ytd decimal(12,2),
d_tax decimal(4,4),
d_next_o_id int,
d_name varchar(10),
d_street_1 varchar(20),
d_street_2 varchar(20),
d_city varchar(20),
d_state char(2),
d_zip char(9),
PRIMARY KEY (d_w_id,d_id)
);

CREATE TABLE ITEM (
i_id int,
i_name varchar(24),
i_price decimal(5,2),
i_data varchar(50),
i_im_id int,
PRIMARY KEY (i_id)
);

CREATE TABLE WAREHOUSE (
w_id int,
w_ytd decimal(12,2),
w_tax decimal(4,4),
w_name varchar(10),
w_street_1 varchar(20),
w_street_2 varchar(20),
w_city varchar(20),
w_state char(2),
w_zip char(9),
PRIMARY KEY (w_id)
);

CREATE TABLE CUSTOMER (
c_w_id int,
c_d_id int,
c_id int,
c_discount decimal(4,4),
c_credit char(2),
c_last varchar(16),
c_first varchar(16),
c_credit_lim decimal(12,2),
c_balance decimal(12,2),
c_ytd_payment float,
c_payment_cnt int,
c_delivery_cnt int,
c_street_1 varchar(20),
c_street_2 varchar(20),
c_city varchar(20),
c_state char(2),
c_zip char(9),
c_phone char(16),
c_since bigint,
c_middle char(2),
c_data varchar(500),
PRIMARY KEY (c_w_id,c_d_id,c_id)
);

CREATE TABLE ORDER_LINE (
ol_w_id int,
ol_d_id int,
ol_o_id int,
ol_number int,
ol_i_id int,
ol_delivery_d bigint NULL,
ol_amount decimal(6,2),
ol_supply_w_id int,
ol_quantity decimal(2,0),
ol_dist_info char(24),
PRIMARY KEY (ol_w_id,ol_d_id,ol_o_id,ol_number)
);

CREATE TABLE NEW_ORDER (
no_w_id int,
no_d_id int,
no_o_id int,
PRIMARY KEY (no_w_id,no_d_id,no_o_id)
);

CREATE TABLE STOCK (
s_w_id int,
s_i_id int,
s_quantity decimal(4,0),
s_ytd decimal(8,2),
s_order_cnt int,
s_remote_cnt int,
s_data varchar(50),
s_dist_01 char(24),
s_dist_02 char(24),
s_dist_03 char(24),
s_dist_04 char(24),
s_dist_05 char(24),
s_dist_06 char(24),
s_dist_07 char(24),
s_dist_08 char(24),
s_dist_09 char(24),
s_dist_10 char(24),
PRIMARY KEY (s_w_id,s_i_id)
);

CREATE TABLE HISTORY (
h_c_id int,
h_c_d_id int,
h_c_w_id int,
h_d_id int,
h_w_id int,
h_date bigint,
h_amount decimal(6,2),
h_data varchar(24)
);

CREATE INDEX idx_customer_name ON customer (c_w_id, c_d_id, c_last, c_first);
CREATE UNIQUE INDEX idx_order ON oorder (o_w_id, o_d_id, o_c_id, o_id DESC);

