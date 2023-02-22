-- execute after load phase

ALTER TABLE warehouse ADD CONSTRAINT unique_warehouse_fkey UNIQUE(w_id);
ALTER TABLE district ADD CONSTRAINT  unique_district_fkey UNIQUE (d_w_id,d_id);
ALTER TABLE customer ADD CONSTRAINT unique_customer_fkey UNIQUE (c_w_id,c_d_id,c_id);
ALTER TABLE stock ADD CONSTRAINT unique_stock_fkey UNIQUE (s_w_id,s_i_id);
ALTER TABLE oorder ADD CONSTRAINT unique_oorder_fkey UNIQUE (o_w_id,o_d_id,o_id);
ALTER TABLE new_order ADD CONSTRAINT unique_new_order_fkey UNIQUE (no_w_id,no_d_id,no_o_id);
ALTER TABLE order_line ADD CONSTRAINT unique_order_line_fkey UNIQUE (ol_w_id,ol_d_id,ol_o_id,ol_number);

ALTER TABLE DISTRICT ADD CONSTRAINT D_FKEY_W FOREIGN KEY (D_W_ID) REFERENCES WAREHOUSE(W_ID) NOT VALID;
ALTER TABLE CUSTOMER ADD CONSTRAINT C_FKEY_D FOREIGN KEY (C_W_ID, C_D_ID) REFERENCES DISTRICT (D_W_ID, D_ID) NOT VALID;
ALTER TABLE STOCK ADD CONSTRAINT S_FKEY_W FOREIGN KEY(S_W_ID) REFERENCES WAREHOUSE(W_ID) NOT VALID;
ALTER TABLE STOCK ADD CONSTRAINT S_FKEY_I FOREIGN KEY(S_I_ID) REFERENCES ITEM(I_ID) NOT VALID;
ALTER TABLE OORDER ADD CONSTRAINT O_FKEY_C FOREIGN KEY (O_W_ID, O_D_ID, O_C_ID) REFERENCES CUSTOMER (C_W_ID, C_D_ID, C_ID) NOT VALID;
ALTER TABLE NEW_ORDER ADD CONSTRAINT NO_FKEY_O FOREIGN KEY (NO_W_ID, NO_D_ID, NO_O_ID) REFERENCES OORDER (O_W_ID, O_D_ID, O_ID) NOT VALID;
ALTER TABLE HISTORY ADD CONSTRAINT H_FKEY_C FOREIGN KEY (H_C_W_ID, H_C_D_ID, H_C_ID) REFERENCES CUSTOMER (C_W_ID, C_D_ID, C_ID) NOT VALID;
ALTER TABLE HISTORY ADD CONSTRAINT H_FKEY_D FOREIGN KEY (H_W_ID, H_D_ID) REFERENCES DISTRICT (D_W_ID, D_ID) NOT VALID;
ALTER TABLE ORDER_LINE ADD CONSTRAINT OL_FKEY_O FOREIGN KEY (OL_W_ID, OL_D_ID, OL_O_ID) REFERENCES OORDER (O_W_ID, O_D_ID, O_ID) NOT VALID;
ALTER TABLE ORDER_LINE ADD CONSTRAINT OL_FKEY_S FOREIGN KEY (OL_SUPPLY_W_ID, OL_I_ID) REFERENCES STOCK (S_W_ID, S_I_ID) NOT VALID;
