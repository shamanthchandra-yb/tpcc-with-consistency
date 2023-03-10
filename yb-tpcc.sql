CREATE TABLE OORDER (
o_w_id int NOT NULL,
o_d_id int NOT NULL,
o_id int NOT NULL,
o_c_id int NOT NULL,
o_carrier_id int DEFAULT NULL,
o_ol_cnt decimal(2,0) NOT NULL,
o_all_local decimal(1,0) NOT NULL,
o_entry_d timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT oorder_pkey PRIMARY KEY ((o_w_id,o_d_id) HASH,o_id)
);

CREATE TABLE DISTRICT (
d_w_id int NOT NULL,
d_id int NOT NULL,
d_ytd decimal(12,2) NOT NULL,
d_tax decimal(4,4) NOT NULL,
d_next_o_id int NOT NULL,
d_name varchar(10) NOT NULL,
d_street_1 varchar(20) NOT NULL,
d_street_2 varchar(20) NOT NULL,
d_city varchar(20) NOT NULL,
d_state char(2) NOT NULL,
d_zip char(9) NOT NULL,
CONSTRAINT district_pkey PRIMARY KEY ((d_w_id,d_id) HASH)
);

CREATE TABLE ITEM (
i_id int NOT NULL,
i_name varchar(24) NOT NULL,
i_price decimal(5,2) NOT NULL,
i_data varchar(50) NOT NULL,
i_im_id int NOT NULL,
CONSTRAINT item_pkey PRIMARY KEY (i_id)
);

CREATE TABLE WAREHOUSE (
w_id int NOT NULL,
w_ytd decimal(12,2) NOT NULL,
w_tax decimal(4,4) NOT NULL,
w_name varchar(10) NOT NULL,
w_street_1 varchar(20) NOT NULL,
w_street_2 varchar(20) NOT NULL,
w_city varchar(20) NOT NULL,
w_state char(2) NOT NULL,
w_zip char(9) NOT NULL,
CONSTRAINT warehouse_pkey PRIMARY KEY (w_id)
);

CREATE TABLE CUSTOMER (
c_w_id int NOT NULL,
c_d_id int NOT NULL,
c_id int NOT NULL,
c_discount decimal(4,4) NOT NULL,
c_credit char(2) NOT NULL,
c_last varchar(16) NOT NULL,
c_first varchar(16) NOT NULL,
c_credit_lim decimal(12,2) NOT NULL,
c_balance decimal(12,2) NOT NULL,
c_ytd_payment float NOT NULL,
c_payment_cnt int NOT NULL,
c_delivery_cnt int NOT NULL,
c_street_1 varchar(20) NOT NULL,
c_street_2 varchar(20) NOT NULL,
c_city varchar(20) NOT NULL,
c_state char(2) NOT NULL,
c_zip char(9) NOT NULL,
c_phone char(16) NOT NULL,
c_since timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
c_middle char(2) NOT NULL,
c_data varchar(500) NOT NULL,
CONSTRAINT customer_pkey PRIMARY KEY ((c_w_id,c_d_id) HASH,c_id)
);

CREATE TABLE ORDER_LINE (
ol_w_id int NOT NULL,
ol_d_id int NOT NULL,
ol_o_id int NOT NULL,
ol_number int NOT NULL,
ol_i_id int NOT NULL,
ol_delivery_d timestamp NULL DEFAULT NULL,
ol_amount decimal(6,2) NOT NULL,
ol_supply_w_id int NOT NULL,
ol_quantity decimal(2,0) NOT NULL,
ol_dist_info char(24) NOT NULL,
CONSTRAINT order_line_pkey PRIMARY KEY ((ol_w_id,ol_d_id) HASH,ol_o_id,ol_number)
);

CREATE TABLE NEW_ORDER (
no_w_id int NOT NULL,
no_d_id int NOT NULL,
no_o_id int NOT NULL,
CONSTRAINT new_order_pkey PRIMARY KEY ((no_w_id,no_d_id) HASH,no_o_id)
);

CREATE TABLE STOCK (
s_w_id int NOT NULL,
s_i_id int NOT NULL,
s_quantity decimal(4,0) NOT NULL,
s_ytd decimal(8,2) NOT NULL,
s_order_cnt int NOT NULL,
s_remote_cnt int NOT NULL,
s_data varchar(50) NOT NULL,
s_dist_01 char(24) NOT NULL,
s_dist_02 char(24) NOT NULL,
s_dist_03 char(24) NOT NULL,
s_dist_04 char(24) NOT NULL,
s_dist_05 char(24) NOT NULL,
s_dist_06 char(24) NOT NULL,
s_dist_07 char(24) NOT NULL,
s_dist_08 char(24) NOT NULL,
s_dist_09 char(24) NOT NULL,
s_dist_10 char(24) NOT NULL,
CONSTRAINT stock_pkey PRIMARY KEY (s_w_id HASH, s_i_id ASC)
);

CREATE TABLE HISTORY (
h_c_id int NOT NULL,
h_c_d_id int NOT NULL,
h_c_w_id int NOT NULL,
h_d_id int NOT NULL,
h_w_id int NOT NULL,
h_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
h_amount decimal(6,2) NOT NULL,
h_data varchar(24) NOT NULL
);

CREATE INDEX idx_customer_name ON customer ((c_w_id,c_d_id) HASH,c_last,c_first);
CREATE UNIQUE INDEX idx_order ON oorder ((o_w_id,o_d_id) HASH,o_c_id,o_id DESC);
