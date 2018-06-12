--
-- Loading Omni's seed data into PostGIS
--
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;

--
-- Create temp tables for holding raw CSV data
--
CREATE TEMP TABLE temp_cli_halo(
  STORE_NUM        varchar (16) NOT NULL,
  BRAND            varchar (32),
  Region_ID        integer,
  Region           varchar (64),
  Store_sales      decimal (12, 2),
  Retail_Impact    decimal (12, 2),
  Whoelsale_Impact decimal (12, 2),
  Online_Impact    decimal (12, 2),
  Total_Impact     decimal (12, 2)
);

CREATE TEMP TABLE temp_cli_drivers(
  STORE_NUM varchar (16) NOT NULL,
  BRAND varchar(32),
  Region_ID integer,
  Region varchar(64),
  Driver_1_Raw decimal(12,2), Driver_1_Scaled decimal(12,11),
  Driver_2_Raw decimal(12,2), Driver_2_Scaled decimal(12,11),
  Driver_3_Raw decimal(12,2), Driver_3_Scaled decimal(12,11),
  Driver_4_Raw decimal(12,2), Driver_4_Scaled decimal(12,11),
  Driver_5_Raw decimal(12,2), Driver_5_Scaled decimal(12,11),
  Actual_Sales decimal(12,2), Predicted_Sales decimal(12,2),
  Diff integer, Diff_pct decimal(12,6),
  Color varchar(32)
);

CREATE TEMP TABLE temp_cli_store(
  STORE_NUM varchar (16) NOT NULL,
  BRAND varchar (32),
  TOT_SALES money,
  ADDRESS varchar(128),
  CITY varchar(64),
  STATE  varchar(5),
  ZIP varchar(10),
  DMA integer,
  DMA_NAME varchar(64),
  LAT numeric(9,6),
  LON numeric(9,6),
  OPEN_DATE timestamp,
  PHONE varchar(16),
  SQFT integer,
  MANAGER varchar(32),
  TYPE varchar(32),
  LEASE_HOLD varchar(64),
  LEASE_EXP date,
  RENT decimal(12,2),
  CONV_RATE	numeric(4,3),
  WD_FT_00 integer,WD_FT_01 integer,WD_FT_02 integer,WD_FT_03 integer,WD_FT_04 integer,WD_FT_05 integer,WD_FT_06 integer,WD_FT_07 integer,WD_FT_08 integer,WD_FT_09 integer,WD_FT_10 integer,WD_FT_11 integer,WD_FT_12 integer,WD_FT_13 integer,WD_FT_14 integer,WD_FT_15 integer,WD_FT_16 integer,WD_FT_17 integer,WD_FT_18 integer,WD_FT_19 integer,WD_FT_20 integer,WD_FT_21 integer,WD_FT_22 integer,WD_FT_23 integer,WD_NB_FT_00 integer,WD_NB_FT_01 integer,WD_NB_FT_02 integer,WD_NB_FT_03 integer,WD_NB_FT_04 integer,WD_NB_FT_05 integer,WD_NB_FT_06 integer,WD_NB_FT_07 integer,WD_NB_FT_08 integer,WD_NB_FT_09 integer,WD_NB_FT_10 integer,WD_NB_FT_11 integer,WD_NB_FT_12 integer,WD_NB_FT_13 integer,WD_NB_FT_14 integer,WD_NB_FT_15 integer,WD_NB_FT_16 integer,WD_NB_FT_17 integer,WD_NB_FT_18 integer,WD_NB_FT_19 integer,WD_NB_FT_20 integer,WD_NB_FT_21 integer,WD_NB_FT_22 integer,WD_NB_FT_23 integer,WD_DMA_FT_00 integer,WD_DMA_FT_01 integer,WD_DMA_FT_02 integer,WD_DMA_FT_03 integer,WD_DMA_FT_04 integer,WD_DMA_FT_05 integer,WD_DMA_FT_06 integer,WD_DMA_FT_07 integer,WD_DMA_FT_08 integer,WD_DMA_FT_09 integer,WD_DMA_FT_10 integer,WD_DMA_FT_11 integer,WD_DMA_FT_12 integer,WD_DMA_FT_13 integer,WD_DMA_FT_14 integer,WD_DMA_FT_15 integer,WD_DMA_FT_16 integer,WD_DMA_FT_17 integer,WD_DMA_FT_18 integer,WD_DMA_FT_19 integer,WD_DMA_FT_20 integer,WD_DMA_FT_21 integer,WD_DMA_FT_22 integer,WD_DMA_FT_23 integer,WE_FT_00 integer,WE_FT_01 integer,WE_FT_02 integer,WE_FT_03 integer,WE_FT_04 integer,WE_FT_05 integer,WE_FT_06 integer,WE_FT_07 integer,WE_FT_08 integer,WE_FT_09 integer,WE_FT_10 integer,WE_FT_11 integer,WE_FT_12 integer,WE_FT_13 integer,WE_FT_14 integer,WE_FT_15 integer,WE_FT_16 integer,WE_FT_17 integer,WE_FT_18 integer,WE_FT_19 integer,WE_FT_20 integer,WE_FT_21 integer,WE_FT_22 integer,WE_FT_23 integer,WE_NB_FT_00 integer,WE_NB_FT_01 integer,WE_NB_FT_02 integer,WE_NB_FT_03 integer,WE_NB_FT_04 integer,WE_NB_FT_05 integer,WE_NB_FT_06 integer,WE_NB_FT_07 integer,WE_NB_FT_08 integer,WE_NB_FT_09 integer,WE_NB_FT_10 integer,WE_NB_FT_11 integer,WE_NB_FT_12 integer,WE_NB_FT_13 integer,WE_NB_FT_14 integer,WE_NB_FT_15 integer,WE_NB_FT_16 integer,WE_NB_FT_17 integer,WE_NB_FT_18 integer,WE_NB_FT_19 integer,WE_NB_FT_20 integer,WE_NB_FT_21 integer,WE_NB_FT_22 integer,WE_NB_FT_23 integer,WE_DMA_FT_00 integer,WE_DMA_FT_01 integer,WE_DMA_FT_02 integer,WE_DMA_FT_03 integer,WE_DMA_FT_04 integer,WE_DMA_FT_05 integer,WE_DMA_FT_06 integer,WE_DMA_FT_07 integer,WE_DMA_FT_08 integer,WE_DMA_FT_09 integer,WE_DMA_FT_10 integer,WE_DMA_FT_11 integer,WE_DMA_FT_12 integer,WE_DMA_FT_13 integer,WE_DMA_FT_14 integer,WE_DMA_FT_15 integer,WE_DMA_FT_16 integer,WE_DMA_FT_17 integer,WE_DMA_FT_18 integer,WE_DMA_FT_19 integer,WE_DMA_FT_20 integer,WE_DMA_FT_21 integer,WE_DMA_FT_22 integer,WE_DMA_FT_23 integer,
  INC_BRKT_1 decimal(12,2),INC_BRKT_2 decimal(12,2),INC_BRKT_3 decimal(12,2),INC_BRKT_4 decimal(12,2),INC_BRKT_5 decimal(12,2),NB_INC_BRKT_1 decimal(12,2),NB_INC_BRKT_2 decimal(12,2),NB_INC_BRKT_3 decimal(12,2),NB_INC_BRKT_4 decimal(12,2),NB_INC_BRKT_5 decimal(12,2),DMA_INC_BRKT_1 decimal(12,2),DMA_INC_BRKT_2 decimal(12,2),DMA_INC_BRKT_3 decimal(12,2),DMA_INC_BRKT_4 decimal(12,2),DMA_INC_BRKT_5 decimal(12,2),
  Region_ID integer,
  Region varchar(64)
);

CREATE TEMP TABLE temp_comp_store(
  STORE_NUM varchar (16) NOT NULL,
  BRAND varchar (32),
  ADDRESS varchar(128),
  CITY varchar(64),
  STATE  varchar(5),
  ZIP varchar(10),
  DMA integer,
  DMA_NAME varchar(64),
  LAT numeric(9,6),
  LON numeric(9,6),
  TYPE varchar(32),
  WD_FT_00 integer,WD_FT_01 integer,WD_FT_02 integer,WD_FT_03 integer,WD_FT_04 integer,WD_FT_05 integer,WD_FT_06 integer,WD_FT_07 integer,WD_FT_08 integer,WD_FT_09 integer,WD_FT_10 integer,WD_FT_11 integer,WD_FT_12 integer,WD_FT_13 integer,WD_FT_14 integer,WD_FT_15 integer,WD_FT_16 integer,WD_FT_17 integer,WD_FT_18 integer,WD_FT_19 integer,WD_FT_20 integer,WD_FT_21 integer,WD_FT_22 integer,WD_FT_23 integer,WD_NB_FT_00 integer,WD_NB_FT_01 integer,WD_NB_FT_02 integer,WD_NB_FT_03 integer,WD_NB_FT_04 integer,WD_NB_FT_05 integer,WD_NB_FT_06 integer,WD_NB_FT_07 integer,WD_NB_FT_08 integer,WD_NB_FT_09 integer,WD_NB_FT_10 integer,WD_NB_FT_11 integer,WD_NB_FT_12 integer,WD_NB_FT_13 integer,WD_NB_FT_14 integer,WD_NB_FT_15 integer,WD_NB_FT_16 integer,WD_NB_FT_17 integer,WD_NB_FT_18 integer,WD_NB_FT_19 integer,WD_NB_FT_20 integer,WD_NB_FT_21 integer,WD_NB_FT_22 integer,WD_NB_FT_23 integer,WD_DMA_FT_00 integer,WD_DMA_FT_01 integer,WD_DMA_FT_02 integer,WD_DMA_FT_03 integer,WD_DMA_FT_04 integer,WD_DMA_FT_05 integer,WD_DMA_FT_06 integer,WD_DMA_FT_07 integer,WD_DMA_FT_08 integer,WD_DMA_FT_09 integer,WD_DMA_FT_10 integer,WD_DMA_FT_11 integer,WD_DMA_FT_12 integer,WD_DMA_FT_13 integer,WD_DMA_FT_14 integer,WD_DMA_FT_15 integer,WD_DMA_FT_16 integer,WD_DMA_FT_17 integer,WD_DMA_FT_18 integer,WD_DMA_FT_19 integer,WD_DMA_FT_20 integer,WD_DMA_FT_21 integer,WD_DMA_FT_22 integer,WD_DMA_FT_23 integer,WE_FT_00 integer,WE_FT_01 integer,WE_FT_02 integer,WE_FT_03 integer,WE_FT_04 integer,WE_FT_05 integer,WE_FT_06 integer,WE_FT_07 integer,WE_FT_08 integer,WE_FT_09 integer,WE_FT_10 integer,WE_FT_11 integer,WE_FT_12 integer,WE_FT_13 integer,WE_FT_14 integer,WE_FT_15 integer,WE_FT_16 integer,WE_FT_17 integer,WE_FT_18 integer,WE_FT_19 integer,WE_FT_20 integer,WE_FT_21 integer,WE_FT_22 integer,WE_FT_23 integer,WE_NB_FT_00 integer,WE_NB_FT_01 integer,WE_NB_FT_02 integer,WE_NB_FT_03 integer,WE_NB_FT_04 integer,WE_NB_FT_05 integer,WE_NB_FT_06 integer,WE_NB_FT_07 integer,WE_NB_FT_08 integer,WE_NB_FT_09 integer,WE_NB_FT_10 integer,WE_NB_FT_11 integer,WE_NB_FT_12 integer,WE_NB_FT_13 integer,WE_NB_FT_14 integer,WE_NB_FT_15 integer,WE_NB_FT_16 integer,WE_NB_FT_17 integer,WE_NB_FT_18 integer,WE_NB_FT_19 integer,WE_NB_FT_20 integer,WE_NB_FT_21 integer,WE_NB_FT_22 integer,WE_NB_FT_23 integer,WE_DMA_FT_00 integer,WE_DMA_FT_01 integer,WE_DMA_FT_02 integer,WE_DMA_FT_03 integer,WE_DMA_FT_04 integer,WE_DMA_FT_05 integer,WE_DMA_FT_06 integer,WE_DMA_FT_07 integer,WE_DMA_FT_08 integer,WE_DMA_FT_09 integer,WE_DMA_FT_10 integer,WE_DMA_FT_11 integer,WE_DMA_FT_12 integer,WE_DMA_FT_13 integer,WE_DMA_FT_14 integer,WE_DMA_FT_15 integer,WE_DMA_FT_16 integer,WE_DMA_FT_17 integer,WE_DMA_FT_18 integer,WE_DMA_FT_19 integer,WE_DMA_FT_20 integer,WE_DMA_FT_21 integer,WE_DMA_FT_22 integer,WE_DMA_FT_23 integer,
  INC_BRKT_1 decimal(12,2),INC_BRKT_2 decimal(12,2),INC_BRKT_3 decimal(12,2),INC_BRKT_4 decimal(12,2),INC_BRKT_5 decimal(12,2),NB_INC_BRKT_1 decimal(12,2),NB_INC_BRKT_2 decimal(12,2),NB_INC_BRKT_3 decimal(12,2),NB_INC_BRKT_4 decimal(12,2),NB_INC_BRKT_5 decimal(12,2),DMA_INC_BRKT_1 decimal(12,2),DMA_INC_BRKT_2 decimal(12,2),DMA_INC_BRKT_3 decimal(12,2),DMA_INC_BRKT_4 decimal(12,2),DMA_INC_BRKT_5 decimal(12,2),
  Region_ID integer,
  Region varchar(64)
);

CREATE TEMP TABLE temp_county_demo(
  ID varchar(10),
  NAME varchar(64),
  TOT_POP integer,
  TOT_HH integer,
  MED_INC money,
  PCT_WHITE decimal(4,2),
  PCT_BLACK decimal(4,2),
  PCT_HISP decimal(4,2),
  PCT_ASIAN decimal(4,2),
  PCT_OTHR decimal(4,2),
  PCT_BACH decimal(4,2),
  CON_EXP_1 money,
  CON_EXP_2 money,
  CON_EXP_3 money,
  RETAIL_DEM money,
  OQ smallint,
  TOT_SALES money,
  RET_SALES money,
  WS_SALES money,
  E_SALES money
);

CREATE TEMP TABLE temp_cws_halo(
  STORE_NUM        varchar (16) NOT NULL,
  BRAND            varchar(32),
  Region_ID        integer,
  Region           varchar(64),
  Store_sales      decimal (12, 2),
  Retail_Impact    decimal (12, 2),
  Whoelsale_Impact decimal (12, 2),
  Online_Impact    decimal (12, 2),
  Total_Impact     decimal (12, 2)
);

CREATE TEMP TABLE temp_cws_drivers(
  STORE_NUM varchar (16) NOT NULL,
  BRAND varchar(32),
  Region_ID integer,
  Region varchar(64),
  Driver_1_Raw decimal(12,2), Driver_1_Scaled decimal(12,11),
  Driver_2_Raw decimal(12,2), Driver_2_Scaled decimal(12,11),
  Driver_3_Raw decimal(12,2), Driver_3_Scaled decimal(12,11),
  Driver_4_Raw decimal(12,2), Driver_4_Scaled decimal(12,11),
  Driver_5_Raw decimal(12,2), Driver_5_Scaled decimal(12,11),
  Actual_Sales decimal(12,2), Predicted_Sales decimal(12,2),
  Diff integer, Diff_pct decimal(12,6),
  Color varchar(32)
);

CREATE TEMP TABLE temp_cws_store(
  STORE_NUM varchar (16) NOT NULL,
  BRAND varchar (32),
  TOT_SALES money,
  ADDRESS varchar(128),
  CITY varchar(64),
  ST varchar(5),
  ZIP varchar(10),
  DMA integer,
  DMA_NAME varchar(64),
  LAT numeric(9,6),
  LON numeric(9,6),
  MANAGER varchar(32),
  TYPE varchar(32),
  WD_FT_00 integer,WD_FT_01 integer,WD_FT_02 integer,WD_FT_03 integer,WD_FT_04 integer,WD_FT_05 integer,WD_FT_06 integer,WD_FT_07 integer,WD_FT_08 integer,WD_FT_09 integer,WD_FT_10 integer,WD_FT_11 integer,WD_FT_12 integer,WD_FT_13 integer,WD_FT_14 integer,WD_FT_15 integer,WD_FT_16 integer,WD_FT_17 integer,WD_FT_18 integer,WD_FT_19 integer,WD_FT_20 integer,WD_FT_21 integer,WD_FT_22 integer,WD_FT_23 integer,WD_NB_FT_00 integer,WD_NB_FT_01 integer,WD_NB_FT_02 integer,WD_NB_FT_03 integer,WD_NB_FT_04 integer,WD_NB_FT_05 integer,WD_NB_FT_06 integer,WD_NB_FT_07 integer,WD_NB_FT_08 integer,WD_NB_FT_09 integer,WD_NB_FT_10 integer,WD_NB_FT_11 integer,WD_NB_FT_12 integer,WD_NB_FT_13 integer,WD_NB_FT_14 integer,WD_NB_FT_15 integer,WD_NB_FT_16 integer,WD_NB_FT_17 integer,WD_NB_FT_18 integer,WD_NB_FT_19 integer,WD_NB_FT_20 integer,WD_NB_FT_21 integer,WD_NB_FT_22 integer,WD_NB_FT_23 integer,WD_DMA_FT_00 integer,WD_DMA_FT_01 integer,WD_DMA_FT_02 integer,WD_DMA_FT_03 integer,WD_DMA_FT_04 integer,WD_DMA_FT_05 integer,WD_DMA_FT_06 integer,WD_DMA_FT_07 integer,WD_DMA_FT_08 integer,WD_DMA_FT_09 integer,WD_DMA_FT_10 integer,WD_DMA_FT_11 integer,WD_DMA_FT_12 integer,WD_DMA_FT_13 integer,WD_DMA_FT_14 integer,WD_DMA_FT_15 integer,WD_DMA_FT_16 integer,WD_DMA_FT_17 integer,WD_DMA_FT_18 integer,WD_DMA_FT_19 integer,WD_DMA_FT_20 integer,WD_DMA_FT_21 integer,WD_DMA_FT_22 integer,WD_DMA_FT_23 integer,WE_FT_00 integer,WE_FT_01 integer,WE_FT_02 integer,WE_FT_03 integer,WE_FT_04 integer,WE_FT_05 integer,WE_FT_06 integer,WE_FT_07 integer,WE_FT_08 integer,WE_FT_09 integer,WE_FT_10 integer,WE_FT_11 integer,WE_FT_12 integer,WE_FT_13 integer,WE_FT_14 integer,WE_FT_15 integer,WE_FT_16 integer,WE_FT_17 integer,WE_FT_18 integer,WE_FT_19 integer,WE_FT_20 integer,WE_FT_21 integer,WE_FT_22 integer,WE_FT_23 integer,WE_NB_FT_00 integer,WE_NB_FT_01 integer,WE_NB_FT_02 integer,WE_NB_FT_03 integer,WE_NB_FT_04 integer,WE_NB_FT_05 integer,WE_NB_FT_06 integer,WE_NB_FT_07 integer,WE_NB_FT_08 integer,WE_NB_FT_09 integer,WE_NB_FT_10 integer,WE_NB_FT_11 integer,WE_NB_FT_12 integer,WE_NB_FT_13 integer,WE_NB_FT_14 integer,WE_NB_FT_15 integer,WE_NB_FT_16 integer,WE_NB_FT_17 integer,WE_NB_FT_18 integer,WE_NB_FT_19 integer,WE_NB_FT_20 integer,WE_NB_FT_21 integer,WE_NB_FT_22 integer,WE_NB_FT_23 integer,WE_DMA_FT_00 integer,WE_DMA_FT_01 integer,WE_DMA_FT_02 integer,WE_DMA_FT_03 integer,WE_DMA_FT_04 integer,WE_DMA_FT_05 integer,WE_DMA_FT_06 integer,WE_DMA_FT_07 integer,WE_DMA_FT_08 integer,WE_DMA_FT_09 integer,WE_DMA_FT_10 integer,WE_DMA_FT_11 integer,WE_DMA_FT_12 integer,WE_DMA_FT_13 integer,WE_DMA_FT_14 integer,WE_DMA_FT_15 integer,WE_DMA_FT_16 integer,WE_DMA_FT_17 integer,WE_DMA_FT_18 integer,WE_DMA_FT_19 integer,WE_DMA_FT_20 integer,WE_DMA_FT_21 integer,WE_DMA_FT_22 integer,WE_DMA_FT_23 integer,
  INC_BRKT_1 decimal(12,2),INC_BRKT_2 decimal(12,2),INC_BRKT_3 decimal(12,2),INC_BRKT_4 decimal(12,2),INC_BRKT_5 decimal(12,2),NB_INC_BRKT_1 decimal(12,2),NB_INC_BRKT_2 decimal(12,2),NB_INC_BRKT_3 decimal(12,2),NB_INC_BRKT_4 decimal(12,2),NB_INC_BRKT_5 decimal(12,2),DMA_INC_BRKT_1 decimal(12,2),DMA_INC_BRKT_2 decimal(12,2),DMA_INC_BRKT_3 decimal(12,2),DMA_INC_BRKT_4 decimal(12,2),DMA_INC_BRKT_5 decimal(12,2),
  Region_ID integer,
  Region varchar(64)
);

CREATE TEMP TABLE temp_ows_store(
  STORE_NUM varchar (16) NOT NULL,
  BRAND varchar (32),
  TOT_SALES money,
  ADDRESS varchar(128),
  CITY varchar(64),
  ST varchar(5),
  ZIP varchar(10),
  DMA integer,
  DMA_NAME varchar(64),
  LAT numeric(9,6),
  LON numeric(9,6),
  TYPE varchar(32),
  WD_FT_00 integer,WD_FT_01 integer,WD_FT_02 integer,WD_FT_03 integer,WD_FT_04 integer,WD_FT_05 integer,WD_FT_06 integer,WD_FT_07 integer,WD_FT_08 integer,WD_FT_09 integer,WD_FT_10 integer,WD_FT_11 integer,WD_FT_12 integer,WD_FT_13 integer,WD_FT_14 integer,WD_FT_15 integer,WD_FT_16 integer,WD_FT_17 integer,WD_FT_18 integer,WD_FT_19 integer,WD_FT_20 integer,WD_FT_21 integer,WD_FT_22 integer,WD_FT_23 integer,WD_NB_FT_00 integer,WD_NB_FT_01 integer,WD_NB_FT_02 integer,WD_NB_FT_03 integer,WD_NB_FT_04 integer,WD_NB_FT_05 integer,WD_NB_FT_06 integer,WD_NB_FT_07 integer,WD_NB_FT_08 integer,WD_NB_FT_09 integer,WD_NB_FT_10 integer,WD_NB_FT_11 integer,WD_NB_FT_12 integer,WD_NB_FT_13 integer,WD_NB_FT_14 integer,WD_NB_FT_15 integer,WD_NB_FT_16 integer,WD_NB_FT_17 integer,WD_NB_FT_18 integer,WD_NB_FT_19 integer,WD_NB_FT_20 integer,WD_NB_FT_21 integer,WD_NB_FT_22 integer,WD_NB_FT_23 integer,WD_DMA_FT_00 integer,WD_DMA_FT_01 integer,WD_DMA_FT_02 integer,WD_DMA_FT_03 integer,WD_DMA_FT_04 integer,WD_DMA_FT_05 integer,WD_DMA_FT_06 integer,WD_DMA_FT_07 integer,WD_DMA_FT_08 integer,WD_DMA_FT_09 integer,WD_DMA_FT_10 integer,WD_DMA_FT_11 integer,WD_DMA_FT_12 integer,WD_DMA_FT_13 integer,WD_DMA_FT_14 integer,WD_DMA_FT_15 integer,WD_DMA_FT_16 integer,WD_DMA_FT_17 integer,WD_DMA_FT_18 integer,WD_DMA_FT_19 integer,WD_DMA_FT_20 integer,WD_DMA_FT_21 integer,WD_DMA_FT_22 integer,WD_DMA_FT_23 integer,WE_FT_00 integer,WE_FT_01 integer,WE_FT_02 integer,WE_FT_03 integer,WE_FT_04 integer,WE_FT_05 integer,WE_FT_06 integer,WE_FT_07 integer,WE_FT_08 integer,WE_FT_09 integer,WE_FT_10 integer,WE_FT_11 integer,WE_FT_12 integer,WE_FT_13 integer,WE_FT_14 integer,WE_FT_15 integer,WE_FT_16 integer,WE_FT_17 integer,WE_FT_18 integer,WE_FT_19 integer,WE_FT_20 integer,WE_FT_21 integer,WE_FT_22 integer,WE_FT_23 integer,WE_NB_FT_00 integer,WE_NB_FT_01 integer,WE_NB_FT_02 integer,WE_NB_FT_03 integer,WE_NB_FT_04 integer,WE_NB_FT_05 integer,WE_NB_FT_06 integer,WE_NB_FT_07 integer,WE_NB_FT_08 integer,WE_NB_FT_09 integer,WE_NB_FT_10 integer,WE_NB_FT_11 integer,WE_NB_FT_12 integer,WE_NB_FT_13 integer,WE_NB_FT_14 integer,WE_NB_FT_15 integer,WE_NB_FT_16 integer,WE_NB_FT_17 integer,WE_NB_FT_18 integer,WE_NB_FT_19 integer,WE_NB_FT_20 integer,WE_NB_FT_21 integer,WE_NB_FT_22 integer,WE_NB_FT_23 integer,WE_DMA_FT_00 integer,WE_DMA_FT_01 integer,WE_DMA_FT_02 integer,WE_DMA_FT_03 integer,WE_DMA_FT_04 integer,WE_DMA_FT_05 integer,WE_DMA_FT_06 integer,WE_DMA_FT_07 integer,WE_DMA_FT_08 integer,WE_DMA_FT_09 integer,WE_DMA_FT_10 integer,WE_DMA_FT_11 integer,WE_DMA_FT_12 integer,WE_DMA_FT_13 integer,WE_DMA_FT_14 integer,WE_DMA_FT_15 integer,WE_DMA_FT_16 integer,WE_DMA_FT_17 integer,WE_DMA_FT_18 integer,WE_DMA_FT_19 integer,WE_DMA_FT_20 integer,WE_DMA_FT_21 integer,WE_DMA_FT_22 integer,WE_DMA_FT_23 integer,
  INC_BRKT_1 decimal(12,2),INC_BRKT_2 decimal(12,2),INC_BRKT_3 decimal(12,2),INC_BRKT_4 decimal(12,2),INC_BRKT_5 decimal(12,2),NB_INC_BRKT_1 decimal(12,2),NB_INC_BRKT_2 decimal(12,2),NB_INC_BRKT_3 decimal(12,2),NB_INC_BRKT_4 decimal(12,2),NB_INC_BRKT_5 decimal(12,2),DMA_INC_BRKT_1 decimal(12,2),DMA_INC_BRKT_2 decimal(12,2),DMA_INC_BRKT_3 decimal(12,2),DMA_INC_BRKT_4 decimal(12,2),DMA_INC_BRKT_5 decimal(12,2),
  Region_ID integer,
  Region varchar(64)
);

CREATE TEMP TABLE temp_dma_demo(
  ID varchar(10),
  NAME varchar(64),
  TOTAL_POP integer,
  TOT_HH integer,
  MED_INC money,
  PCT_WHITE decimal(4,2),
  PCT_BLACK decimal(4,2),
  PCT_HISP decimal(4,2),
  PCT_ASIAN decimal(4,2),
  PCT_OTHR decimal(4,2),
  PCT_BACH decimal(4,2),
  CON_EXP_1 money,
  CON_EXP_2 money,
  CON_EXP_3 money,
  RETAIL_DEM money,
  OQ smallint,
  TOT_SALES money,
  RET_SALES money,
  WS_SALES money,
  E_SALES money
);

CREATE TEMP TABLE temp_msa_demo(
  ID varchar (16) NOT NULL,
  MSA_Name varchar(64),
  Med_Age decimal(8,2),
  College_Educ integer,
  NoCollege_Educ integer,
  Prof_Educ integer,
  Inc_Over75 integer,
  Med_Inc integer,
  Asian_Pop integer,
  Black_Pop integer,
  Hisp_Pop integer,
  White_Pop integer,
  Tot_HH integer,
  Tot_Pop integer,
  OQ decimal(12, 8),
  TOT_SALES money,
  RET_SALES money,
  WS_SALES money,
  WEB_SALES money
);

CREATE TEMP TABLE temp_reg_demo(
  ID varchar (16) NOT NULL,
  Region varchar(64),
  Med_Age decimal(8,2),
  College_Educ decimal(12, 5),
  NoCollege_Educ decimal(12, 5),
  Prof_Educ decimal(12, 5),
  Inc_Over75 decimal(12, 5),
  Med_Inc decimal(12, 5),
  Asian_Pop decimal(12, 5),
  Black_Pop decimal(12, 5),
  Hisp_Pop decimal(12, 5),
  White_Pop decimal(12, 5),
  Tot_HH integer,
  Tot_Pop integer,
  OQ decimal(12, 5),
  TOT_SALES money,
  RET_SALES money,
  WS_SALES money,
  WEB_SALES money
);

CREATE TEMP TABLE temp_reg_driver(
  ID varchar (16) NOT NULL,
  REGION varchar(64),
  Driver_1_lbl varchar(64),Driver_1_Max money,Driver_1_MaxScaled decimal(12,7),Driver_1_Avg decimal(12,6),Driver_1_Avg_Scaled decimal(12,9),Driver_1_Unit varchar(32),
  Driver_2_lbl varchar(64),Driver_2_Max money,Driver_2_MaxScaled decimal(12,7),Driver_2_Avg decimal(12,6),Driver_2_Avg_Scaled decimal(12,9),Driver_2_Unit varchar(32),
  Driver_3_lbl varchar(64),Driver_3_Max money,Driver_3_MaxScaled decimal(12,7),Driver_3_Avg decimal(12,6),Driver_3_Avg_Scaled decimal(12,9),Driver_3_Unit varchar(32),
  Driver_4_lbl varchar(64),Driver_4_Max money,Driver_4_MaxScaled decimal(12,7),Driver_4_Avg decimal(12,6),Driver_4_Avg_Scaled decimal(12,9),Driver_4_Unit varchar(32),
  Driver_5_lbl varchar(64),Driver_5_Max money,Driver_5_MaxScaled decimal(12,7),Driver_5_Avg decimal(12,6),Driver_5_Avg_Scaled decimal(12,9),Driver_5_Unit varchar(32),
  TOT_Actual_Sales decimal(12, 2),TOT_Predicted_Sales decimal(12, 2),TOT_Diff decimal(12, 2),TOT_Diff_pct decimal(12, 9),TOT_Color varchar(32),
  RET_Actual_Sales decimal(12, 2),RET_Predicted_Sales decimal(12, 2),RET_Diff decimal(12, 2),RET_Diff_pct decimal(12, 9),RET_Color varchar(32),
  WS_Actual_Sales decimal(12, 2),WS_Predicted_Sales decimal(12, 2),WS_Diff decimal(12, 2),WS_Diff_pct decimal(12, 9),WS_Color varchar(32),
  WEB_Ret_Sales decimal(12, 2),WEB_Predicted_Sales decimal(12, 2),WEB_Diff decimal(12, 2),WEB_Diff_pct decimal(12, 9),WEB_Color varchar(32)
);

CREATE TEMP TABLE temp_state_demo(
  ID varchar(10),
  NAME varchar(64),
  TOTAL_POP integer,
  TOT_HH integer,
  MED_INC money,
  PCT_WHITE decimal(4,2),
  PCT_BLACK decimal(4,2),
  PCT_HISP decimal(4,2),
  PCT_ASIAN decimal(4,2),
  PCT_OTHR decimal(4,2),
  CON_EXP_1 money,
  CON_EXP_2 money,
  CON_EXP_3 money,
  RETAIL_DEM money,
  OQ smallint,
  TOT_SALES money,
  RET_SALES money,
  WS_SALES money,
  E_SALES money
);

CREATE TEMP TABLE temp_cli_store_zip_ft(
  STORE_NUM varchar (16) NOT NULL,
  ZIP varchar(10),
  DISTANCE numeric(18,14),
  FT_00 integer,FT_01 integer,FT_02 integer,FT_03 integer,FT_04 integer,FT_05 integer,FT_06 integer,FT_07 integer,FT_08 integer,FT_09 integer,FT_10 integer,FT_11 integer,FT_12 integer,FT_13 integer,FT_14 integer,FT_15 integer,FT_16 integer,FT_17 integer,FT_18 integer,FT_19 integer,FT_20 integer,FT_21 integer,FT_22 integer,FT_23 integer,FT_Daily integer
);

CREATE TEMP TABLE temp_cws_store_zip_ft(
  STORE_NUM varchar (16) NOT NULL,
  ZIP varchar(12),
  DISTANCE numeric(18,14),
  FT_00 integer,FT_01 integer,FT_02 integer,FT_03 integer,FT_04 integer,FT_05 integer,FT_06 integer,FT_07 integer,FT_08 integer,FT_09 integer,FT_10 integer,FT_11 integer,FT_12 integer,FT_13 integer,FT_14 integer,FT_15 integer,FT_16 integer,FT_17 integer,FT_18 integer,FT_19 integer,FT_20 integer,FT_21 integer,FT_22 integer,FT_23 integer,FT_Daily integer
);

CREATE TEMP TABLE temp_cli_store_zip_sales(
  STORE_NUM varchar (16) NOT NULL,
  ZIP varchar(10),
  DISTANCE numeric(18,14),
  PREDICTED_SALES decimal(12,2)
);

CREATE TEMP TABLE temp_cws_store_zip_sales(
  STORE_NUM varchar (16) NOT NULL,
  ZIP varchar(10),
  DISTANCE numeric(18,14),
  PREDICTED_SALES decimal(12,2)
);

CREATE TEMP TABLE temp_zip_demo(
  ID varchar (5) NOT NULL,
  Zipcode varchar(5),
  Med_Age decimal(8,2),
  College_Educ decimal(12, 5),
  NoCollege_Educ decimal(12, 5),
  Prof_Educ decimal(12, 5),
  Inc_Over75 decimal(12, 5),
  Med_Inc decimal(12, 5),
  Asian_Pop decimal(12, 5),
  Black_Pop decimal(12, 5),
  Hisp_Pop decimal(12, 5),
  White_Pop decimal(12, 5),
  Tot_HH integer,
  Tot_Pop integer,
  OQ decimal(12, 5),
  TOT_SALES money,
  RET_SALES money,
  WS_SALES money,
  WEB_SALES money
);

CREATE TEMP TABLE temp_zip_drivers(
  ID  varchar(5),
  Key varchar(5),
  Region_ID integer,
  Region varchar(64),
  Driver_1_Raw decimal(12,2), Driver_1_Scaled decimal(12,11),
  Driver_2_Raw decimal(12,2), Driver_2_Scaled decimal(12,11),
  Driver_3_Raw decimal(12,2), Driver_3_Scaled decimal(12,11),
  Driver_4_Raw decimal(12,2), Driver_4_Scaled decimal(12,11),
  Driver_5_Raw decimal(12,2), Driver_5_Scaled decimal(12,11),
  TOT_Actual_Sales varchar(20),TOT_Predicted_Sales varchar(20),TOT_Diff varchar(20),TOT_Diff_pct varchar(20),TOT_Color varchar(32),
  RET_Actual_Sales varchar(20),RET_Predicted_Sales varchar(20),RET_Diff varchar(20),RET_Diff_pct varchar(20),RET_Color varchar(32),
  WS_Actual_Sales varchar(20),WS_Predicted_Sales varchar(20),WS_Diff varchar(20),WS_Diff_pct varchar(20),WS_Color varchar(32),
  WEB_Ret_Sales varchar(20),WEB_Predicted_Sales varchar(20),WEB_Diff varchar(20),WEB_Diff_pct varchar(20),WEB_Color varchar(32)
);

--
-- Load raw data into temp tables
--
\copy temp_cli_halo            from /data/CLI_HALO.csv            with csv header null '';
\copy temp_cli_drivers         from /data/CLI_DRIVERS.csv         with csv header null '';
\copy temp_cli_store           from /data/CLI_STORE.csv           with csv header null '';
\copy temp_comp_store          from /data/COMP_STORE.csv          with csv header null '';
--\copy temp_county_demo         from /data/COUNTY_DEMO.csv         with csv header null '';
\copy temp_cws_halo            from /data/CWS_HALO.csv            with csv header null '';
\copy temp_cws_drivers         from /data/CWS_DRIVERS.csv         with csv header null '';
\copy temp_cws_store           from /data/CWS_STORE.csv           with csv header null '';
\copy temp_msa_demo            from /data/MSA_DEMO.csv            with csv header null '';
\copy temp_reg_demo            from /data/REG_DEMO.csv            with csv header null '';
\copy temp_reg_driver          from /data/REG_DRIVER.csv          with csv header null '';
--\copy temp_state_demo          from /data/STATE_DEMO.csv          with csv header null '';
\copy temp_cli_store_zip_ft    from /data/CLI_STORE_ZIP_FT.csv    with csv header null '';
\copy temp_cws_store_zip_ft    from /data/CWS_STORE_ZIP_FT.csv    with csv header null '';
\copy temp_cli_store_zip_sales from /data/CLI_STORE_ZIP_SALES.csv with csv header null '';
\copy temp_cws_store_zip_sales from /data/CWS_STORE_ZIP_SALES.csv with csv header null '';
\copy temp_zip_demo            from /data/ZIP_DEMO.csv            with csv header null '';
\copy temp_zip_drivers         from /data/ZIP_DRIVERS.csv         with csv header null '#DIV/0!';

--
-- Data cleanning
--
-- Left pad zip code to 5 digits
update temp_zip_demo set ID = LPAD(id, 5, '0'), Zipcode = LPAD(Zipcode, 5, '0');
update temp_cli_store_zip_ft set zip = LPAD(zip, 5, '0');
update temp_cws_store_zip_ft set zip = LPAD(zip, 5, '0');
update temp_cli_store_zip_sales set zip = LPAD(zip, 5, '0');
update temp_cws_store_zip_sales set zip = LPAD(zip, 5, '0');
update temp_zip_drivers set ID = LPAD(id, 5, '0');

-- SET Empty strings as NULL
update temp_zip_drivers set
  TOT_Actual_Sales = CASE WHEN TOT_Actual_Sales = '' THEN NULL ELSE TOT_Actual_Sales END ,
  TOT_Predicted_Sales = CASE WHEN TOT_Predicted_Sales = '' THEN NULL ELSE TOT_Predicted_Sales END ,
  TOT_Diff = CASE WHEN TOT_Diff = '' THEN NULL ELSE TOT_Diff END ,
  TOT_Diff_pct = CASE WHEN TOT_Diff_pct = '' THEN NULL ELSE TOT_Diff_pct END ,
  TOT_Color = CASE WHEN TOT_Color= '' THEN NULL ELSE TOT_Color END,
  RET_Actual_Sales = CASE WHEN RET_Actual_Sales = '' THEN NULL ELSE RET_Actual_Sales END ,
  RET_Predicted_Sales = CASE WHEN RET_Predicted_Sales = '' THEN NULL ELSE RET_Predicted_Sales END ,
  RET_Diff = CASE WHEN RET_Diff = '' THEN NULL ELSE RET_Diff END ,
  RET_Diff_pct = CASE WHEN RET_Diff_pct = '' THEN NULL ELSE RET_Diff_pct END ,
  RET_Color = CASE WHEN RET_Color= '' THEN NULL ELSE RET_Color END,
  WS_Actual_Sales = CASE WHEN WS_Actual_Sales = '' THEN NULL ELSE WS_Actual_Sales END ,
  WS_Predicted_Sales = CASE WHEN WS_Predicted_Sales = '' THEN NULL ELSE WS_Predicted_Sales END ,
  WS_Diff = CASE WHEN WS_Diff = '' THEN NULL ELSE WS_Diff END ,
  WS_Diff_pct = CASE WHEN WS_Diff_pct = '' THEN NULL ELSE WS_Diff_pct END ,
  WS_Color = CASE WHEN WS_Color= '' THEN NULL ELSE WS_Color END,
  WEB_Ret_Sales = CASE WHEN WEB_Ret_Sales = '' THEN NULL ELSE WEB_Ret_Sales END ,
  WEB_Predicted_Sales = CASE WHEN WEB_Predicted_Sales = '' THEN NULL ELSE WEB_Predicted_Sales END ,
  WEB_Diff = CASE WHEN WEB_Diff = '' THEN NULL ELSE WEB_Diff END ,
  WEB_Diff_pct = CASE WHEN WEB_Diff_pct = '' THEN NULL ELSE WEB_Diff_pct END ,
  WEB_Color = CASE WHEN WEB_Color= '' THEN NULL ELSE WEB_Color END;

--
-- Normalizing data as moving it from the temp tables into the
-- data tables.
--
DROP TABLE IF EXISTS area_demographics;
DROP TABLE IF EXISTS area_consumer_behavior;
DROP TABLE IF EXISTS area_sales;
DROP TABLE IF EXISTS area_drivers;
DROP TABLE IF EXISTS region_drivers;

DROP TABLE IF EXISTS store_location;
DROP TABLE IF EXISTS store_info;
DROP TABLE IF EXISTS store_sales;
DROP TABLE IF EXISTS store_med_inc;
DROP TABLE IF EXISTS store_ft;
DROP TABLE IF EXISTS store_customer_ft;
DROP TABLE IF EXISTS store_customer_sales;
DROP TABLE IF EXISTS store_cross_shopping;
DROP TABLE IF EXISTS store_drivers;
DROP TABLE IF EXISTS store_halo;
DROP TABLE IF EXISTS area;
DROP TABLE IF EXISTS store;

CREATE TABLE area (
  id serial PRIMARY KEY,
  area_type smallint NOT NULL, -- 0 for state, 1 for DMA, 2 for county, 3 for zipcode, 4 for Region, 5 for MSA
  code varchar(10),
  name varchar(64) NOT NULL
);

CREATE TABLE store (
    STORE_ID    varchar(16) PRIMARY KEY,
    brand      varchar(32) NOT NULL,
    wholesale   boolean NOT NULL,
    competitor  boolean NOT NULL,
    store_type varchar(32) NOT NULL
);

CREATE TABLE store_info (
    store_id varchar(16) UNIQUE REFERENCES store(store_id),
    open_date   date,
    phone       varchar(16),
    sqft        integer,
    manager     varchar(32),
    LEASE_HOLD  varchar(64),
    LEASE_EXP   date,
    RENT        money,
    CONV_RATE   money
);

CREATE TABLE store_location (
  store_id  varchar(16) UNIQUE REFERENCES store(store_id),
  ADDRESS   varchar(128) NOT NULL,
  CITY      varchar(64) NOT NULL,
  STATE     varchar(5) NOT NULL,
  ZIP       varchar(10) NOT NULL,
  DMA       varchar(10) NOT NULL,
  REGION    varchar(10) NOT NULL,
  MSA       varchar(10) NOT NULL,
  LOCATION  geography(point,4326)
);

CREATE TABLE store_sales (
  store_id varchar(16) UNIQUE REFERENCES store(store_id),
  SALES decimal(12,2) NOT NULL
);

CREATE TABLE store_med_inc (
  store_id varchar(16) REFERENCES store(store_id),
  category smallint NOT NULL,
  BRKT1 decimal(4,2),
  BRKT2 decimal(4,2),
  BRKT3 decimal(4,2),
  BRKT4 decimal(4,2),
  BRKT5 decimal(4,2)
);

CREATE TABLE store_ft (
  store_id varchar(16) UNIQUE REFERENCES store(store_id),
  WD_FT_00	integer,
  WD_FT_01	integer,
  WD_FT_02	integer,
  WD_FT_03	integer,
  WD_FT_04	integer,
  WD_FT_05	integer,
  WD_FT_06	integer,
  WD_FT_07	integer,
  WD_FT_08	integer,
  WD_FT_09	integer,
  WD_FT_10	integer,
  WD_FT_11	integer,
  WD_FT_12	integer,
  WD_FT_13	integer,
  WD_FT_14	integer,
  WD_FT_15	integer,
  WD_FT_16	integer,
  WD_FT_17	integer,
  WD_FT_18	integer,
  WD_FT_19	integer,
  WD_FT_20	integer,
  WD_FT_21	integer,
  WD_FT_22	integer,
  WD_FT_23	integer,
  WD_NB_FT_00 integer,
  WD_NB_FT_01 integer,
  WD_NB_FT_02 integer,
  WD_NB_FT_03 integer,
  WD_NB_FT_04 integer,
  WD_NB_FT_05 integer,
  WD_NB_FT_06 integer,
  WD_NB_FT_07 integer,
  WD_NB_FT_08 integer,
  WD_NB_FT_09 integer,
  WD_NB_FT_10 integer,
  WD_NB_FT_11 integer,
  WD_NB_FT_12 integer,
  WD_NB_FT_13 integer,
  WD_NB_FT_14 integer,
  WD_NB_FT_15 integer,
  WD_NB_FT_16 integer,
  WD_NB_FT_17 integer,
  WD_NB_FT_18 integer,
  WD_NB_FT_19 integer,
  WD_NB_FT_20 integer,
  WD_NB_FT_21 integer,
  WD_NB_FT_22 integer,
  WD_NB_FT_23 integer,
  WD_DMA_FT_00 integer,
  WD_DMA_FT_01 integer,
  WD_DMA_FT_02 integer,
  WD_DMA_FT_03 integer,
  WD_DMA_FT_04 integer,
  WD_DMA_FT_05 integer,
  WD_DMA_FT_06 integer,
  WD_DMA_FT_07 integer,
  WD_DMA_FT_08 integer,
  WD_DMA_FT_09 integer,
  WD_DMA_FT_10 integer,
  WD_DMA_FT_11 integer,
  WD_DMA_FT_12 integer,
  WD_DMA_FT_13 integer,
  WD_DMA_FT_14 integer,
  WD_DMA_FT_15 integer,
  WD_DMA_FT_16 integer,
  WD_DMA_FT_17 integer,
  WD_DMA_FT_18 integer,
  WD_DMA_FT_19 integer,
  WD_DMA_FT_20 integer,
  WD_DMA_FT_21 integer,
  WD_DMA_FT_22 integer,
  WD_DMA_FT_23 integer,
  WE_FT_00	integer,
  WE_FT_01	integer,
  WE_FT_02	integer,
  WE_FT_03	integer,
  WE_FT_04	integer,
  WE_FT_05	integer,
  WE_FT_06	integer,
  WE_FT_07	integer,
  WE_FT_08	integer,
  WE_FT_09	integer,
  WE_FT_10	integer,
  WE_FT_11	integer,
  WE_FT_12	integer,
  WE_FT_13	integer,
  WE_FT_14	integer,
  WE_FT_15	integer,
  WE_FT_16	integer,
  WE_FT_17	integer,
  WE_FT_18	integer,
  WE_FT_19	integer,
  WE_FT_20	integer,
  WE_FT_21	integer,
  WE_FT_22	integer,
  WE_FT_23	integer,
  WE_NB_FT_00 integer,
  WE_NB_FT_01 integer,
  WE_NB_FT_02 integer,
  WE_NB_FT_03 integer,
  WE_NB_FT_04 integer,
  WE_NB_FT_05 integer,
  WE_NB_FT_06 integer,
  WE_NB_FT_07 integer,
  WE_NB_FT_08 integer,
  WE_NB_FT_09 integer,
  WE_NB_FT_10 integer,
  WE_NB_FT_11 integer,
  WE_NB_FT_12 integer,
  WE_NB_FT_13 integer,
  WE_NB_FT_14 integer,
  WE_NB_FT_15 integer,
  WE_NB_FT_16 integer,
  WE_NB_FT_17 integer,
  WE_NB_FT_18 integer,
  WE_NB_FT_19 integer,
  WE_NB_FT_20 integer,
  WE_NB_FT_21 integer,
  WE_NB_FT_22 integer,
  WE_NB_FT_23 integer,
  WE_DMA_FT_00 integer,
  WE_DMA_FT_01 integer,
  WE_DMA_FT_02 integer,
  WE_DMA_FT_03 integer,
  WE_DMA_FT_04 integer,
  WE_DMA_FT_05 integer,
  WE_DMA_FT_06 integer,
  WE_DMA_FT_07 integer,
  WE_DMA_FT_08 integer,
  WE_DMA_FT_09 integer,
  WE_DMA_FT_10 integer,
  WE_DMA_FT_11 integer,
  WE_DMA_FT_12 integer,
  WE_DMA_FT_13 integer,
  WE_DMA_FT_14 integer,
  WE_DMA_FT_15 integer,
  WE_DMA_FT_16 integer,
  WE_DMA_FT_17 integer,
  WE_DMA_FT_18 integer,
  WE_DMA_FT_19 integer,
  WE_DMA_FT_20 integer,
  WE_DMA_FT_21 integer,
  WE_DMA_FT_22 integer,
  WE_DMA_FT_23 integer
);

CREATE TABLE store_customer_ft (
  store_id varchar(16) REFERENCES store(store_id),
  from_id integer REFERENCES area(id),
  distance numeric(18,14),
  FT_00 integer,
  FT_01 integer,
  FT_02 integer,
  FT_03 integer,
  FT_04 integer,
  FT_05 integer,
  FT_06 integer,
  FT_07 integer,
  FT_08 integer,
  FT_09 integer,
  FT_10 integer,
  FT_11 integer,
  FT_12 integer,
  FT_13 integer,
  FT_14 integer,
  FT_15 integer,
  FT_16 integer,
  FT_17 integer,
  FT_18 integer,
  FT_19 integer,
  FT_20 integer,
  FT_21 integer,
  FT_22 integer,
  FT_23 integer,
  FT_DAILY integer
);

CREATE TABLE store_customer_sales (
  store_id varchar(16) REFERENCES store(store_id),
  from_id integer REFERENCES area(id),
  distance numeric(18,14),
  predicted_sales integer
);

CREATE TABLE store_cross_shopping (
  store_id varchar(16) REFERENCES store(store_id),
  STORE_NAME  varchar(64),
  SALES_PCT  smallint,
  PRIMARY KEY (store_id,store_name)
);

CREATE TABLE area_demographics (
  area_id integer UNIQUE REFERENCES area(id),
  -- Version 1: Demographic values
  TOTAL_POP integer,
  TOT_HH  integer,
  MED_INC  decimal(12,2),
  PCT_WHITE decimal(4,2),
  PCT_BLACK  decimal(4,2),
  PCT_HISP decimal(4,2),
  PCT_ASIAN decimal(4,2),
  PCT_OTHR decimal(4,2),
  PCT_BACH decimal(4,2),
  -- Version 2: Demographic values
  Med_Age decimal(12,2),
  College_Educ decimal(12,2),
  NoCollege_Educ decimal(12,2),
  Prof_Educ decimal(12,2),
  Inc_Over75 decimal(12,2),
  Asian_Pop decimal(12,2),
  Black_Pop decimal(12,2),
  Hisp_Pop decimal(12,2),
  White_Pop decimal(12,2)
);

CREATE TABLE area_consumer_behavior (
  area_id   integer REFERENCES area(id),
  brand     varchar(32) NOT NULL,
  CON_EXP_1  money,
  CON_EXP_2  money,
  CON_EXP_3  money,
  OQ      	 smallint,
  RETAIL_DEM money
);

CREATE TABLE area_sales (
  area_id    integer REFERENCES area(id),
  brand     varchar(32) NOT NULL,
  TOT_SALES  decimal(12,2),
  RET_SALES  decimal(12,2),
  WS_SALES   decimal(12,2),
  E_SALES    decimal(12,2)
);

CREATE TABLE area_drivers (
  area_id          integer REFERENCES area(id),
  brand            varchar(32) NOT NULL,
  region_id        varchar(10),
  Driver_1_lbl     varchar(64),
  Driver_1_val     decimal(12,2),  -- There's a typo in the source csv file which spelt Drive_1_val
  Driver_1_val_raw decimal(12,2),
  Driver_1_avg     decimal(12,2),
  Driver_1_avg_raw decimal(12,2),
  Driver_1_unit    varchar(10),
  Driver_2_lbl     varchar(64),
  Driver_2_val     decimal(12,2),
  Driver_2_val_raw decimal(12,2),
  Driver_2_avg     decimal(12,2),
  Driver_2_avg_raw decimal(12,2),
  Driver_2_unit    varchar(10),
  Driver_3_lbl     varchar(64),
  Driver_3_val     decimal(12,2),
  Driver_3_val_raw decimal(12,2),
  Driver_3_avg     decimal(12,2),
  Driver_3_avg_raw decimal(12,2),
  Driver_3_unit    varchar(10),
  Driver_4_lbl     varchar(64),
  Driver_4_val     decimal(12,2),
  Driver_4_val_raw decimal(12,2),
  Driver_4_avg     decimal(12,2),
  Driver_4_avg_raw decimal(12,2),
  Driver_4_unit    varchar(10),
  Driver_5_lbl     varchar(64),
  Driver_5_val     decimal(12,2),
  Driver_5_val_raw decimal(12,2),
  Driver_5_avg     decimal(12,2),
  Driver_5_avg_raw decimal(12,2),
  Driver_5_unit    varchar(10),
  Total_Rank       integer,
  Total_Sales      decimal(12,2),
  Total_Predicted  decimal(12,2),
  Total_Diff       decimal(12,2),
  Total_Diff_Pct   decimal(12,4),
  Total_Color      varchar(32),
  RET_SALES_Rank   integer,
  RET_SALES        decimal(12,2),
  RET_Predicted    decimal(12,2),
  RET_Diff         decimal(12,2),
  RET_Diff_Pct     decimal(12,4),
  RET_Color        varchar(32),
  WS_SALES_Rank    integer,
  WS_SALES         decimal(12,2),
  WS_Predicted     decimal(12,2),
  WS_Diff          decimal(12,2),
  WS_Diff_Pct      decimal(12,4),
  WS_Color         varchar(32),
  E_SALES_Rank     integer,
  E_SALES          decimal(12,2),
  E_Predicted      decimal(12,2),
  E_Diff           decimal(12,2),
  E_Diff_Pct       decimal(12,4),
  E_Color          varchar(32)
);

CREATE TABLE region_drivers(

  id varchar(10) PRIMARY KEY,
  Driver_1_lbl     varchar(64),
  Driver_1_val     decimal(12,2),
  Driver_1_val_raw decimal(12,2),
  Driver_1_avg     decimal(12,2),
  Driver_1_avg_raw decimal(12,2),
  Driver_1_unit    varchar(10),
  Driver_2_lbl     varchar(64),
  Driver_2_val     decimal(12,2),
  Driver_2_val_raw decimal(12,2),
  Driver_2_avg     decimal(12,2),
  Driver_2_avg_raw decimal(12,2),
  Driver_2_unit    varchar(10),
  Driver_3_lbl     varchar(64),
  Driver_3_val     decimal(12,2),
  Driver_3_val_raw decimal(12,2),
  Driver_3_avg     decimal(12,2),
  Driver_3_avg_raw decimal(12,2),
  Driver_3_unit    varchar(10),
  Driver_4_lbl     varchar(64),
  Driver_4_val     decimal(12,2),
  Driver_4_val_raw decimal(12,2),
  Driver_4_avg     decimal(12,2),
  Driver_4_avg_raw decimal(12,2),
  Driver_4_unit    varchar(10),
  Driver_5_lbl     varchar(64),
  Driver_5_val     decimal(12,2),
  Driver_5_val_raw decimal(12,2),
  Driver_5_avg     decimal(12,2),
  Driver_5_avg_raw decimal(12,2),
  Driver_5_unit    varchar(10)
);


CREATE TABLE store_drivers (
  store_id         varchar(16) UNIQUE REFERENCES store(store_id),
  brand            varchar(32) NOT NULL,
  Total_Rank       integer,
  Total_Sales      decimal(12,2),
  Total_Predicted  decimal(12,2),
  Total_Diff       decimal(12,2),
  Total_Diff_Pct   decimal(12,6),
  Total_Color      varchar(32),
  Driver_1_lbl     varchar(64),
  Driver_1_val     decimal(12,2),
  Driver_1_val_raw decimal(12,2),
  Driver_1_unit    varchar(10),
  Driver_2_lbl     varchar(64),
  Driver_2_val     decimal(12,2),
  Driver_2_val_raw decimal(12,2),
  Driver_2_unit    varchar(10),
  Driver_3_lbl     varchar(64),
  Driver_3_val     decimal(12,2),
  Driver_3_val_raw decimal(12,2),
  Driver_3_unit    varchar(10),
  Driver_4_lbl     varchar(64),
  Driver_4_val     decimal(12,2),
  Driver_4_val_raw decimal(12,2),
  Driver_4_unit    varchar(10),
  Driver_5_lbl     varchar(64),
  Driver_5_val     decimal(12,2),
  Driver_5_val_raw decimal(12,2),
  Driver_5_unit    varchar(10),
  area_id          integer REFERENCES area(id)
);

CREATE TABLE store_halo (
  store_id         varchar(16) UNIQUE REFERENCES store(store_id),
  Store_sales      decimal (12, 2),
  Retail_Impact    decimal (12, 2),
  Whoelsale_Impact decimal (12, 2),
  Online_Impact    decimal (12, 2),
  Total_Impact     decimal (12, 2)
);

CREATE OR REPLACE FUNCTION randomBetween(min integer, max integer)
RETURNS integer AS $$
DECLARE r integer;
BEGIN
    select floor(random() * (max - min + 1)) + min into r;
    RETURN r;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION simulate_cross_shopping()
RETURNS integer AS $$
DECLARE
  pcts integer[];
  store_ids text[];
  cross_stores text[];
  id record;
  nn integer;
  cross_store text;
BEGIN
  select into pcts string_to_array('18,11,32,10,29,8,27',',');
  select into cross_stores string_to_array('Alder,Bamboo,Collard,Dindle,Fairymoss,Goldenglow,Harlequin,Ivy,Juneberry,Kousa,Leek,Mango,Nosebleed,Osage,Pellitory,Quercitron,Rantipole,Sanguinary,Trillium,Violet,Wintercress,Yarrow',',');
  for id in select store_id from store loop
    select randomBetween(1,5) into nn;
    for i in 1 .. nn loop
    --if storeId does not starts with ows or comp then skip
      IF substring(id.store_id from 1 for 3) NOT IN('OWS','COM') THEN
        cross_store := cross_stores[randomBetween(1,array_length(cross_stores,1))];
        insert into store_cross_shopping(store_id,store_name,sales_pct) values(id.store_id, cross_store, pcts[randomBetween(1,array_length(pcts,1))])
          on conflict (store_id,store_name) do nothing;
      END IF;
    end loop;
   end loop;
   RETURN 1;
END;
$$ LANGUAGE plpgsql;

--
-- Grant read/write access to omni's table to 'omni' user
--
GRANT SELECT,INSERT,UPDATE ON TABLE area_demographics TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE area_consumer_behavior TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE area_sales TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE area_drivers TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE region_drivers TO omni;

GRANT SELECT,INSERT,UPDATE ON TABLE store_location TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE store_info TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE store_sales TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE store_cross_shopping TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE store_drivers TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE store_med_inc TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE store_ft TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE store_customer_ft TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE store_customer_sales TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE store_halo TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE area TO omni;
GRANT SELECT,INSERT,UPDATE ON TABLE store TO omni;

ALTER USER omni WITH PASSWORD '$OMNI_USER_PASSWD';

--
--
-- state level
insert into area(area_type,code,name) select 0,ID,NAME from temp_state_demo;
insert into area_demographics(area_id, TOTAL_POP, TOT_HH, MED_INC, PCT_WHITE, PCT_BLACK, PCT_HISP, PCT_ASIAN, PCT_OTHR)
      select a.id,b.TOTAL_POP,b.TOT_HH,b.MED_INC,b.PCT_WHITE,b.PCT_BLACK,b.PCT_HISP,b.PCT_ASIAN,b.PCT_OTHR from area a, temp_state_demo b where a.code=b.id and a.area_type=0;
insert into area_sales select a.id,'',CAST(b.TOT_SALES AS DECIMAL(12,2)),CAST(b.RET_SALES AS DECIMAL(12,2)),CAST(b.WS_SALES AS DECIMAL(12,2)),CAST(b.E_SALES AS DECIMAL(12,2)) from area a, temp_state_demo b where a.code=b.id and a.area_type=0;
insert into area_consumer_behavior select a.id,'',b.CON_EXP_1, b.CON_EXP_2, b.CON_EXP_3,b.OQ,b.RETAIL_DEM from area a, temp_state_demo b where a.code=b.id and a.area_type=0;

-- DMA level
insert into area(area_type,code,name) select 1,ID,NAME from temp_dma_demo;
insert into area_demographics(area_id, TOTAL_POP, TOT_HH, MED_INC, PCT_WHITE, PCT_BLACK, PCT_HISP, PCT_ASIAN, PCT_OTHR, PCT_BACH)
      select a.id,b.TOTAL_POP,b.TOT_HH,b.MED_INC,b.PCT_WHITE,b.PCT_BLACK,b.PCT_HISP,b.PCT_ASIAN,b.PCT_OTHR,b.PCT_BACH from area a, temp_dma_demo b where a.code=b.id and a.area_type=1;
insert into area_sales select a.id,'',CAST(b.TOT_SALES AS DECIMAL(12,2)),CAST(b.RET_SALES AS DECIMAL(12,2)),CAST(b.WS_SALES AS DECIMAL(12,2)),CAST(b.E_SALES AS DECIMAL(12,2)) from area a, temp_dma_demo b where a.code=b.id and a.area_type=1;
insert into area_consumer_behavior select a.id,'',b.CON_EXP_1, b.CON_EXP_2, b.CON_EXP_3,b.OQ,b.RETAIL_DEM from area a, temp_dma_demo b where a.code=b.id and a.area_type=1;

-- county level
insert into area(area_type,code,name) select 2,ID,NAME from temp_county_demo;
insert into area_demographics(area_id, TOTAL_POP, TOT_HH, MED_INC, PCT_WHITE, PCT_BLACK, PCT_HISP, PCT_ASIAN, PCT_OTHR, PCT_BACH)
      select a.id,b.TOT_POP,b.TOT_HH,b.MED_INC,b.PCT_WHITE,b.PCT_BLACK,b.PCT_HISP,b.PCT_ASIAN,b.PCT_OTHR,b.PCT_BACH from area a, temp_county_demo b where a.code=b.id and a.area_type=2;
insert into area_sales select a.id,'',CAST(b.TOT_SALES AS DECIMAL(12,2)),CAST(b.RET_SALES AS DECIMAL(12,2)),CAST(b.WS_SALES AS DECIMAL(12,2)),CAST(b.E_SALES AS DECIMAL(12,2)) from area a, temp_county_demo b where a.code=b.id and a.area_type=2;
insert into area_consumer_behavior select a.id,'',b.CON_EXP_1, b.CON_EXP_2, b.CON_EXP_3,b.OQ,b.RETAIL_DEM from area a, temp_county_demo b where a.code=b.id and a.area_type=2;

-- region level
insert into area(area_type,code,name) select 4,ID,Region from temp_reg_demo;
insert into area_demographics(area_id, Med_Age, College_Educ, NoCollege_Educ, Prof_Educ, Inc_Over75, Med_Inc, Asian_Pop, Black_Pop, Hisp_Pop, White_Pop, TOT_HH, TOTAL_POP)
      select a.id,b.Med_Age,b.College_Educ,b.NoCollege_Educ,b.Prof_Educ,b.Inc_Over75,b.Med_Inc,b.Asian_Pop,b.Black_Pop,b.Hisp_Pop,b.White_Pop,b.Tot_HH,b.Tot_Pop from area a, temp_reg_demo b where a.code=b.id and a.area_type=4;
insert into area_sales select a.id,'',CAST(b.TOT_SALES AS DECIMAL(12,2)),CAST(b.RET_SALES AS DECIMAL(12,2)),CAST(b.WS_SALES AS DECIMAL(12,2)),CAST(b.WEB_SALES AS DECIMAL(12,2)) from area a, temp_reg_demo b where a.code=b.id and a.area_type=4;
insert into area_consumer_behavior (area_id, brand, oq) select a.id,'',b.OQ from area a, temp_reg_demo b where a.code=b.id and a.area_type=4;
insert into area_drivers select a.id, '', b.id,
    b.Driver_1_lbl, b.Driver_1_MaxScaled, b.Driver_1_Max, b.Driver_1_Avg_Scaled, b.Driver_1_Avg, b.Driver_1_Unit,
    b.Driver_2_lbl, b.Driver_2_MaxScaled, b.Driver_2_Max, b.Driver_2_Avg_Scaled, b.Driver_2_Avg, b.Driver_2_Unit,
    b.Driver_3_lbl, b.Driver_3_MaxScaled, b.Driver_3_Max, b.Driver_3_Avg_Scaled, b.Driver_3_Avg, b.Driver_3_Unit,
    b.Driver_4_lbl, b.Driver_4_MaxScaled, b.Driver_4_Max, b.Driver_4_Avg_Scaled, b.Driver_4_Avg, b.Driver_4_Unit,
    b.Driver_5_lbl, b.Driver_5_MaxScaled, b.Driver_5_Max, b.Driver_5_Avg_Scaled, b.Driver_5_Avg, b.Driver_5_Unit,
    row_number() over (order by  b.TOT_Diff_pct DESC nulls last) as Total_Rank, b.TOT_Actual_Sales, b.TOT_Predicted_Sales, b.TOT_Diff, b.TOT_Diff_pct, b.TOT_Color,
    row_number() over (order by  b.RET_Diff_pct DESC nulls last) as RET_Rank, b.RET_Actual_Sales, b.RET_Predicted_Sales, b.RET_Diff, b.RET_Diff_pct, b.RET_Color,
    row_number() over (order by  b.WS_Diff_pct DESC nulls last) as WS_Rank, b.WS_Actual_Sales, b.WS_Predicted_Sales, b.WS_Diff, b.WS_Diff_pct, b.WS_Color,
    row_number() over (order by  b.WEB_Diff_pct DESC nulls last) as WEB_Rank, b.WEB_Ret_Sales, b.WEB_Predicted_Sales, b.WEB_Diff, b.WEB_Diff_pct, b.WEB_Color
        from area a join temp_reg_driver b on a.code=b.id where a.area_type=4;

insert into region_drivers select b.id,
    b.Driver_1_lbl, b.Driver_1_MaxScaled, b.Driver_1_Max, b.Driver_1_Avg_Scaled, b.Driver_1_Avg, b.Driver_1_Unit,
    b.Driver_2_lbl, b.Driver_2_MaxScaled, b.Driver_2_Max, b.Driver_2_Avg_Scaled, b.Driver_2_Avg, b.Driver_2_Unit,
    b.Driver_3_lbl, b.Driver_3_MaxScaled, b.Driver_3_Max, b.Driver_3_Avg_Scaled, b.Driver_3_Avg, b.Driver_3_Unit,
    b.Driver_4_lbl, b.Driver_4_MaxScaled, b.Driver_4_Max, b.Driver_4_Avg_Scaled, b.Driver_4_Avg, b.Driver_4_Unit,
    b.Driver_5_lbl, b.Driver_5_MaxScaled, b.Driver_5_Max, b.Driver_5_Avg_Scaled, b.Driver_5_Avg, b.Driver_5_Unit
    from temp_reg_driver b ;

-- zip level
insert into area(area_type,code,name) select 3,ID,Zipcode from temp_zip_demo;
insert into area_demographics(area_id, Med_Age, College_Educ, NoCollege_Educ, Prof_Educ, Inc_Over75, Med_Inc, Asian_Pop, Black_Pop, Hisp_Pop, White_Pop, TOT_HH, TOTAL_POP)
      select a.id,b.Med_Age,b.College_Educ,b.NoCollege_Educ,b.Prof_Educ,b.Inc_Over75,b.Med_Inc,b.Asian_Pop,b.Black_Pop,b.Hisp_Pop,b.White_Pop,b.Tot_HH,b.Tot_Pop from area a, temp_zip_demo b where a.code=b.id and a.area_type=3;
insert into area_sales select a.id,'',CAST(b.TOT_SALES AS DECIMAL(12,2)),CAST(b.RET_SALES AS DECIMAL(12,2)),CAST(b.WS_SALES AS DECIMAL(12,2)),CAST(b.WEB_SALES AS DECIMAL(12,2)) from area a, temp_zip_demo b where a.code=b.id and a.area_type=3;
insert into area_consumer_behavior (area_id, brand, oq) select a.id,'',b.OQ from area a, temp_zip_demo b where a.code=b.id and a.area_type=3;
insert into area_drivers select zip.id, '', temp.Region_ID,
    '', temp.Driver_1_Scaled, temp.Driver_1_Raw, 0, 0, '',
    '', temp.Driver_2_Scaled, temp.Driver_2_Raw, 0, 0, '',
    '', temp.Driver_3_Scaled, temp.Driver_3_Raw, 0, 0, '',
    '', temp.Driver_4_Scaled, temp.Driver_4_Raw, 0, 0, '',
    '', temp.Driver_5_Scaled, temp.Driver_5_Raw, 0, 0, '',
    row_number() over (order by  CAST(temp.TOT_Diff_pct AS DECIMAL(12,2)) DESC nulls last) as Total_Rank, CAST(temp.TOT_Actual_Sales AS DECIMAL(12,2)), CAST(temp.TOT_Predicted_Sales AS DECIMAL(12,2)), CAST(temp.TOT_Diff  AS DECIMAL(12, 2)), CAST(temp.TOT_Diff_pct AS DECIMAL(12, 4)), temp.TOT_Color,
    row_number() over (order by  CAST(temp.RET_Diff_pct AS DECIMAL(12,2)) DESC nulls last) as RET_Rank,   CAST(temp.RET_Actual_Sales AS DECIMAL(12,2)), CAST(temp.RET_Predicted_Sales AS DECIMAL(12,2)), CAST(temp.RET_Diff  AS DECIMAL(12, 2)), CAST(temp.RET_Diff_pct AS DECIMAL(12, 4)), temp.RET_Color,
    row_number() over (order by  CAST(temp.WS_Diff_pct AS DECIMAL(12, 2)) DESC nulls last) as WS_Rank,    CAST(temp.WS_Actual_Sales AS DECIMAL(12,2)),  CAST(temp.WS_Predicted_Sales AS DECIMAL(12,2)), CAST(temp.WS_Diff AS DECIMAL(12, 2)), CAST(temp.WS_Diff_pct AS DECIMAL(12, 4)),  temp.WS_Color,
    row_number() over (order by  CAST(temp.WEB_Diff_pct  AS DECIMAL(12, 2)) DESC nulls last) as E_Rank,     CAST(temp.WEB_Ret_Sales AS DECIMAL(12,2)),    CAST(temp.WEB_Predicted_Sales AS DECIMAL(12,2)), CAST(temp.WEB_Diff  AS DECIMAL(12, 2)), CAST(temp.WEB_Diff_pct AS DECIMAL(12, 4)), temp.WEB_Color
        from area zip join temp_zip_drivers temp on zip.code=temp.id where zip.area_type=3;
-- Update zip drivers' labels and units from associated regions
-- CAUTION: Combining this query with above query will end up dead loop ...
update area_drivers as zipDrv
set
  Driver_1_lbl = regDrv.Driver_1_lbl,
  Driver_2_lbl = regDrv.Driver_2_lbl,
  Driver_3_lbl = regDrv.Driver_3_lbl,
  Driver_4_lbl = regDrv.Driver_4_lbl,
  Driver_5_lbl = regDrv.Driver_5_lbl,
  Driver_1_unit = regDrv.Driver_1_unit,
  Driver_2_unit = regDrv.Driver_2_unit,
  Driver_3_unit = regDrv.Driver_3_unit,
  Driver_4_unit = regDrv.Driver_4_unit,
  Driver_5_unit = regDrv.Driver_5_unit
from area a
join temp_zip_drivers temp on a.code = temp.id
join area reg on reg.code = cast(temp.Region_ID as varchar(10))
join area_drivers regDrv on reg.id = regDrv.area_id
where a.id = zipDrv.area_id and a.area_type = 3 and reg.area_type = 4;

-- msa level
insert into area(area_type,code,name) select 5,ID,MSA_Name from temp_msa_demo;
insert into area_demographics(area_id, Med_Age, College_Educ, NoCollege_Educ, Prof_Educ, Inc_Over75, Med_Inc, Asian_Pop, Black_Pop, Hisp_Pop, White_Pop, TOT_HH, TOTAL_POP)
      select a.id,b.Med_Age,b.College_Educ,b.NoCollege_Educ,b.Prof_Educ,b.Inc_Over75,b.Med_Inc,b.Asian_Pop,b.Black_Pop,b.Hisp_Pop,b.White_Pop,b.Tot_HH,b.Tot_Pop from area a, temp_msa_demo b where a.code=b.id and a.area_type=5;
insert into area_sales select a.id,'',CAST(b.TOT_SALES AS DECIMAL(12,2)),CAST(b.RET_SALES AS DECIMAL(12,2)),CAST(b.WS_SALES AS DECIMAL(12,2)),CAST(b.WEB_SALES AS DECIMAL(12,2)) from area a, temp_msa_demo b where a.code=b.id and a.area_type=5;
insert into area_consumer_behavior (area_id, brand, oq) select a.id,'',b.OQ from area a, temp_msa_demo b where a.code=b.id and a.area_type=5;


insert into store select STORE_NUM,lower(brand),false, false, type from temp_cli_store;
insert into store select STORE_NUM,lower(brand),false, true, type from temp_comp_store;
insert into store select STORE_NUM,lower(brand),true, false, type from temp_cws_store;
insert into store select STORE_NUM,lower(brand),true, true, type from temp_ows_store;

insert into store_info select STORE_NUM,open_date,phone,sqft,manager,LEASE_HOLD,LEASE_EXP,RENT,CONV_RATE from temp_cli_store;
insert into store_info (store_id, manager) select STORE_NUM,manager from temp_cws_store;

insert into store_location(store_id,ADDRESS,CITY,STATE,DMA,ZIP,REGION, MSA, location) select STORE_NUM,ADDRESS,CITY,STATE,'0',ZIP,REGION_ID, 0, ST_MakePoint(LON,LAT)::geography from temp_cli_store;
insert into store_location(store_id,ADDRESS,CITY,STATE,DMA,ZIP,REGION, MSA, location) select STORE_NUM,ADDRESS,CITY,STATE,'0',ZIP,REGION_ID, 0, ST_MakePoint(LON,LAT)::geography from temp_comp_store;
insert into store_location(store_id,ADDRESS,CITY,STATE,DMA,ZIP,REGION, MSA, location) select STORE_NUM,ADDRESS,CITY,ST,'0',ZIP,REGION_ID, 0, ST_MakePoint(LON,LAT)::geography from temp_cws_store;
insert into store_location(store_id,ADDRESS,CITY,STATE,DMA,ZIP,REGION, MSA, location) select STORE_NUM,ADDRESS,CITY,ST,'0',ZIP,REGION_ID, 0, ST_MakePoint(LON,LAT)::geography from temp_ows_store;

insert into store_sales select STORE_NUM,TOT_SALES from temp_cli_store;
insert into store_sales select STORE_NUM,TOT_SALES from temp_cws_store;

-- Income brackets for a given store,
insert into store_med_inc(store_id,category,brkt1,brkt2,brkt3,brkt4,brkt5) select STORE_NUM,0,INC_BRKT_1,INC_BRKT_2,INC_BRKT_3,INC_BRKT_4,INC_BRKT_5 from temp_cli_store;
insert into store_med_inc(store_id,category,brkt1,brkt2,brkt3,brkt4,brkt5) select STORE_NUM,1,NB_INC_BRKT_1,NB_INC_BRKT_2,NB_INC_BRKT_3,NB_INC_BRKT_4,NB_INC_BRKT_5 from temp_cli_store;
insert into store_med_inc(store_id,category,brkt1,brkt2,brkt3,brkt4,brkt5) select STORE_NUM,2,DMA_INC_BRKT_1,DMA_INC_BRKT_2,DMA_INC_BRKT_3,DMA_INC_BRKT_4,DMA_INC_BRKT_5 from temp_cli_store;

insert into store_med_inc(store_id,category,brkt1,brkt2,brkt3,brkt4,brkt5) select STORE_NUM,0,INC_BRKT_1,INC_BRKT_2,INC_BRKT_3,INC_BRKT_4,INC_BRKT_5 from temp_cws_store;
insert into store_med_inc(store_id,category,brkt1,brkt2,brkt3,brkt4,brkt5) select STORE_NUM,1,NB_INC_BRKT_1,NB_INC_BRKT_2,NB_INC_BRKT_3,NB_INC_BRKT_4,NB_INC_BRKT_5 from temp_cws_store;
insert into store_med_inc(store_id,category,brkt1,brkt2,brkt3,brkt4,brkt5) select STORE_NUM,2,DMA_INC_BRKT_1,DMA_INC_BRKT_2,DMA_INC_BRKT_3,DMA_INC_BRKT_4,DMA_INC_BRKT_5 from temp_cws_store;

insert into store_ft select STORE_NUM,WD_FT_00,WD_FT_01,WD_FT_02,WD_FT_03,WD_FT_04,WD_FT_05,WD_FT_06,WD_FT_07,WD_FT_08,WD_FT_09,WD_FT_10,WD_FT_11,WD_FT_12,WD_FT_13,WD_FT_14,WD_FT_15,WD_FT_16,WD_FT_17,WD_FT_18,WD_FT_19,WD_FT_20,WD_FT_21,WD_FT_22,WD_FT_23,WD_NB_FT_00,WD_NB_FT_01,WD_NB_FT_02,WD_NB_FT_03,WD_NB_FT_04,WD_NB_FT_05,WD_NB_FT_06,WD_NB_FT_07,WD_NB_FT_08,WD_NB_FT_09,WD_NB_FT_10,WD_NB_FT_11,WD_NB_FT_12,WD_NB_FT_13,WD_NB_FT_14,WD_NB_FT_15,WD_NB_FT_16,WD_NB_FT_17,WD_NB_FT_18,WD_NB_FT_19,WD_NB_FT_20,WD_NB_FT_21,WD_NB_FT_22,WD_NB_FT_23,WD_DMA_FT_00,WD_DMA_FT_01,WD_DMA_FT_02,WD_DMA_FT_03,WD_DMA_FT_04,WD_DMA_FT_05,WD_DMA_FT_06,WD_DMA_FT_07,WD_DMA_FT_08,WD_DMA_FT_09,WD_DMA_FT_10,WD_DMA_FT_11,WD_DMA_FT_12,WD_DMA_FT_13,WD_DMA_FT_14,WD_DMA_FT_15,WD_DMA_FT_16,WD_DMA_FT_17,WD_DMA_FT_18,WD_DMA_FT_19,WD_DMA_FT_20,WD_DMA_FT_21,WD_DMA_FT_22,WD_DMA_FT_23,WE_FT_00,WE_FT_01,WE_FT_02,WE_FT_03,WE_FT_04,WE_FT_05,WE_FT_06,WE_FT_07,WE_FT_08,WE_FT_09,WE_FT_10,WE_FT_11,WE_FT_12,WE_FT_13,WE_FT_14,WE_FT_15,WE_FT_16,WE_FT_17,WE_FT_18,WE_FT_19,WE_FT_20,WE_FT_21,WE_FT_22,WE_FT_23,WE_NB_FT_00,WE_NB_FT_01,WE_NB_FT_02,WE_NB_FT_03,WE_NB_FT_04,WE_NB_FT_05,WE_NB_FT_06,WE_NB_FT_07,WE_NB_FT_08,WE_NB_FT_09,WE_NB_FT_10,WE_NB_FT_11,WE_NB_FT_12,WE_NB_FT_13,WE_NB_FT_14,WE_NB_FT_15,WE_NB_FT_16,WE_NB_FT_17,WE_NB_FT_18,WE_NB_FT_19,WE_NB_FT_20,WE_NB_FT_21,WE_NB_FT_22,WE_NB_FT_23,WE_DMA_FT_00,WE_DMA_FT_01,WE_DMA_FT_02,WE_DMA_FT_03,WE_DMA_FT_04,WE_DMA_FT_05,WE_DMA_FT_06,WE_DMA_FT_07,WE_DMA_FT_08,WE_DMA_FT_09,WE_DMA_FT_10,WE_DMA_FT_11,WE_DMA_FT_12,WE_DMA_FT_13,WE_DMA_FT_14,WE_DMA_FT_15,WE_DMA_FT_16,WE_DMA_FT_17,WE_DMA_FT_18,WE_DMA_FT_19,WE_DMA_FT_20,WE_DMA_FT_21,WE_DMA_FT_22,WE_DMA_FT_23 from temp_cli_store;
insert into store_ft select STORE_NUM,WD_FT_00,WD_FT_01,WD_FT_02,WD_FT_03,WD_FT_04,WD_FT_05,WD_FT_06,WD_FT_07,WD_FT_08,WD_FT_09,WD_FT_10,WD_FT_11,WD_FT_12,WD_FT_13,WD_FT_14,WD_FT_15,WD_FT_16,WD_FT_17,WD_FT_18,WD_FT_19,WD_FT_20,WD_FT_21,WD_FT_22,WD_FT_23,WD_NB_FT_00,WD_NB_FT_01,WD_NB_FT_02,WD_NB_FT_03,WD_NB_FT_04,WD_NB_FT_05,WD_NB_FT_06,WD_NB_FT_07,WD_NB_FT_08,WD_NB_FT_09,WD_NB_FT_10,WD_NB_FT_11,WD_NB_FT_12,WD_NB_FT_13,WD_NB_FT_14,WD_NB_FT_15,WD_NB_FT_16,WD_NB_FT_17,WD_NB_FT_18,WD_NB_FT_19,WD_NB_FT_20,WD_NB_FT_21,WD_NB_FT_22,WD_NB_FT_23,WD_DMA_FT_00,WD_DMA_FT_01,WD_DMA_FT_02,WD_DMA_FT_03,WD_DMA_FT_04,WD_DMA_FT_05,WD_DMA_FT_06,WD_DMA_FT_07,WD_DMA_FT_08,WD_DMA_FT_09,WD_DMA_FT_10,WD_DMA_FT_11,WD_DMA_FT_12,WD_DMA_FT_13,WD_DMA_FT_14,WD_DMA_FT_15,WD_DMA_FT_16,WD_DMA_FT_17,WD_DMA_FT_18,WD_DMA_FT_19,WD_DMA_FT_20,WD_DMA_FT_21,WD_DMA_FT_22,WD_DMA_FT_23,WE_FT_00,WE_FT_01,WE_FT_02,WE_FT_03,WE_FT_04,WE_FT_05,WE_FT_06,WE_FT_07,WE_FT_08,WE_FT_09,WE_FT_10,WE_FT_11,WE_FT_12,WE_FT_13,WE_FT_14,WE_FT_15,WE_FT_16,WE_FT_17,WE_FT_18,WE_FT_19,WE_FT_20,WE_FT_21,WE_FT_22,WE_FT_23,WE_NB_FT_00,WE_NB_FT_01,WE_NB_FT_02,WE_NB_FT_03,WE_NB_FT_04,WE_NB_FT_05,WE_NB_FT_06,WE_NB_FT_07,WE_NB_FT_08,WE_NB_FT_09,WE_NB_FT_10,WE_NB_FT_11,WE_NB_FT_12,WE_NB_FT_13,WE_NB_FT_14,WE_NB_FT_15,WE_NB_FT_16,WE_NB_FT_17,WE_NB_FT_18,WE_NB_FT_19,WE_NB_FT_20,WE_NB_FT_21,WE_NB_FT_22,WE_NB_FT_23,WE_DMA_FT_00,WE_DMA_FT_01,WE_DMA_FT_02,WE_DMA_FT_03,WE_DMA_FT_04,WE_DMA_FT_05,WE_DMA_FT_06,WE_DMA_FT_07,WE_DMA_FT_08,WE_DMA_FT_09,WE_DMA_FT_10,WE_DMA_FT_11,WE_DMA_FT_12,WE_DMA_FT_13,WE_DMA_FT_14,WE_DMA_FT_15,WE_DMA_FT_16,WE_DMA_FT_17,WE_DMA_FT_18,WE_DMA_FT_19,WE_DMA_FT_20,WE_DMA_FT_21,WE_DMA_FT_22,WE_DMA_FT_23 from temp_comp_store;
insert into store_ft select STORE_NUM,WD_FT_00,WD_FT_01,WD_FT_02,WD_FT_03,WD_FT_04,WD_FT_05,WD_FT_06,WD_FT_07,WD_FT_08,WD_FT_09,WD_FT_10,WD_FT_11,WD_FT_12,WD_FT_13,WD_FT_14,WD_FT_15,WD_FT_16,WD_FT_17,WD_FT_18,WD_FT_19,WD_FT_20,WD_FT_21,WD_FT_22,WD_FT_23,WD_NB_FT_00,WD_NB_FT_01,WD_NB_FT_02,WD_NB_FT_03,WD_NB_FT_04,WD_NB_FT_05,WD_NB_FT_06,WD_NB_FT_07,WD_NB_FT_08,WD_NB_FT_09,WD_NB_FT_10,WD_NB_FT_11,WD_NB_FT_12,WD_NB_FT_13,WD_NB_FT_14,WD_NB_FT_15,WD_NB_FT_16,WD_NB_FT_17,WD_NB_FT_18,WD_NB_FT_19,WD_NB_FT_20,WD_NB_FT_21,WD_NB_FT_22,WD_NB_FT_23,WD_DMA_FT_00,WD_DMA_FT_01,WD_DMA_FT_02,WD_DMA_FT_03,WD_DMA_FT_04,WD_DMA_FT_05,WD_DMA_FT_06,WD_DMA_FT_07,WD_DMA_FT_08,WD_DMA_FT_09,WD_DMA_FT_10,WD_DMA_FT_11,WD_DMA_FT_12,WD_DMA_FT_13,WD_DMA_FT_14,WD_DMA_FT_15,WD_DMA_FT_16,WD_DMA_FT_17,WD_DMA_FT_18,WD_DMA_FT_19,WD_DMA_FT_20,WD_DMA_FT_21,WD_DMA_FT_22,WD_DMA_FT_23,WE_FT_00,WE_FT_01,WE_FT_02,WE_FT_03,WE_FT_04,WE_FT_05,WE_FT_06,WE_FT_07,WE_FT_08,WE_FT_09,WE_FT_10,WE_FT_11,WE_FT_12,WE_FT_13,WE_FT_14,WE_FT_15,WE_FT_16,WE_FT_17,WE_FT_18,WE_FT_19,WE_FT_20,WE_FT_21,WE_FT_22,WE_FT_23,WE_NB_FT_00,WE_NB_FT_01,WE_NB_FT_02,WE_NB_FT_03,WE_NB_FT_04,WE_NB_FT_05,WE_NB_FT_06,WE_NB_FT_07,WE_NB_FT_08,WE_NB_FT_09,WE_NB_FT_10,WE_NB_FT_11,WE_NB_FT_12,WE_NB_FT_13,WE_NB_FT_14,WE_NB_FT_15,WE_NB_FT_16,WE_NB_FT_17,WE_NB_FT_18,WE_NB_FT_19,WE_NB_FT_20,WE_NB_FT_21,WE_NB_FT_22,WE_NB_FT_23,WE_DMA_FT_00,WE_DMA_FT_01,WE_DMA_FT_02,WE_DMA_FT_03,WE_DMA_FT_04,WE_DMA_FT_05,WE_DMA_FT_06,WE_DMA_FT_07,WE_DMA_FT_08,WE_DMA_FT_09,WE_DMA_FT_10,WE_DMA_FT_11,WE_DMA_FT_12,WE_DMA_FT_13,WE_DMA_FT_14,WE_DMA_FT_15,WE_DMA_FT_16,WE_DMA_FT_17,WE_DMA_FT_18,WE_DMA_FT_19,WE_DMA_FT_20,WE_DMA_FT_21,WE_DMA_FT_22,WE_DMA_FT_23 from temp_cws_store;
insert into store_ft select STORE_NUM,WD_FT_00,WD_FT_01,WD_FT_02,WD_FT_03,WD_FT_04,WD_FT_05,WD_FT_06,WD_FT_07,WD_FT_08,WD_FT_09,WD_FT_10,WD_FT_11,WD_FT_12,WD_FT_13,WD_FT_14,WD_FT_15,WD_FT_16,WD_FT_17,WD_FT_18,WD_FT_19,WD_FT_20,WD_FT_21,WD_FT_22,WD_FT_23,WD_NB_FT_00,WD_NB_FT_01,WD_NB_FT_02,WD_NB_FT_03,WD_NB_FT_04,WD_NB_FT_05,WD_NB_FT_06,WD_NB_FT_07,WD_NB_FT_08,WD_NB_FT_09,WD_NB_FT_10,WD_NB_FT_11,WD_NB_FT_12,WD_NB_FT_13,WD_NB_FT_14,WD_NB_FT_15,WD_NB_FT_16,WD_NB_FT_17,WD_NB_FT_18,WD_NB_FT_19,WD_NB_FT_20,WD_NB_FT_21,WD_NB_FT_22,WD_NB_FT_23,WD_DMA_FT_00,WD_DMA_FT_01,WD_DMA_FT_02,WD_DMA_FT_03,WD_DMA_FT_04,WD_DMA_FT_05,WD_DMA_FT_06,WD_DMA_FT_07,WD_DMA_FT_08,WD_DMA_FT_09,WD_DMA_FT_10,WD_DMA_FT_11,WD_DMA_FT_12,WD_DMA_FT_13,WD_DMA_FT_14,WD_DMA_FT_15,WD_DMA_FT_16,WD_DMA_FT_17,WD_DMA_FT_18,WD_DMA_FT_19,WD_DMA_FT_20,WD_DMA_FT_21,WD_DMA_FT_22,WD_DMA_FT_23,WE_FT_00,WE_FT_01,WE_FT_02,WE_FT_03,WE_FT_04,WE_FT_05,WE_FT_06,WE_FT_07,WE_FT_08,WE_FT_09,WE_FT_10,WE_FT_11,WE_FT_12,WE_FT_13,WE_FT_14,WE_FT_15,WE_FT_16,WE_FT_17,WE_FT_18,WE_FT_19,WE_FT_20,WE_FT_21,WE_FT_22,WE_FT_23,WE_NB_FT_00,WE_NB_FT_01,WE_NB_FT_02,WE_NB_FT_03,WE_NB_FT_04,WE_NB_FT_05,WE_NB_FT_06,WE_NB_FT_07,WE_NB_FT_08,WE_NB_FT_09,WE_NB_FT_10,WE_NB_FT_11,WE_NB_FT_12,WE_NB_FT_13,WE_NB_FT_14,WE_NB_FT_15,WE_NB_FT_16,WE_NB_FT_17,WE_NB_FT_18,WE_NB_FT_19,WE_NB_FT_20,WE_NB_FT_21,WE_NB_FT_22,WE_NB_FT_23,WE_DMA_FT_00,WE_DMA_FT_01,WE_DMA_FT_02,WE_DMA_FT_03,WE_DMA_FT_04,WE_DMA_FT_05,WE_DMA_FT_06,WE_DMA_FT_07,WE_DMA_FT_08,WE_DMA_FT_09,WE_DMA_FT_10,WE_DMA_FT_11,WE_DMA_FT_12,WE_DMA_FT_13,WE_DMA_FT_14,WE_DMA_FT_15,WE_DMA_FT_16,WE_DMA_FT_17,WE_DMA_FT_18,WE_DMA_FT_19,WE_DMA_FT_20,WE_DMA_FT_21,WE_DMA_FT_22,WE_DMA_FT_23 from temp_ows_store;

insert into store_customer_ft
  select c.STORE_NUM,b.id,c.distance,c.FT_00,c.FT_01,c.FT_02,c.FT_03,c.FT_04,c.FT_05,c.FT_06,c.FT_07,c.FT_08,
  c.FT_09,c.FT_10,c.FT_11,c.FT_12,c.FT_13,c.FT_14,c.FT_15,c.FT_16,c.FT_17,c.FT_18,c.FT_19,c.FT_20,c.FT_21,c.FT_22,c.FT_23,c.FT_DAILY
  from temp_cws_store_zip_ft c, area b, store d, temp_zip_demo z
  where c.STORE_NUM=d.store_id and z.zipcode=c.zip and z.id=b.code and b.area_type=3;

insert into store_customer_ft
  select c.STORE_NUM,b.id,c.distance,c.FT_00,c.FT_01,c.FT_02,c.FT_03,c.FT_04,c.FT_05,c.FT_06,c.FT_07,c.FT_08,
  c.FT_09,c.FT_10,c.FT_11,c.FT_12,c.FT_13,c.FT_14,c.FT_15,c.FT_16,c.FT_17,c.FT_18,c.FT_19,c.FT_20,c.FT_21,c.FT_22,c.FT_23,c.FT_DAILY
  from temp_cli_store_zip_ft c, area b, store d, temp_zip_demo z
  where c.STORE_NUM=d.store_id and z.zipcode=c.zip and z.id=b.code and b.area_type=3;

insert into store_customer_sales
  select c.STORE_NUM,b.id,c.distance,c.predicted_sales
  from temp_cli_store_zip_sales c, area b, store d
  where c.STORE_NUM=d.store_id and c.zip=b.code and b.area_type=3;

insert into store_customer_sales
  select c.STORE_NUM,b.id,c.distance,c.predicted_sales
  from temp_cws_store_zip_sales c, area b, store d
  where c.STORE_NUM=d.store_id and c.zip=b.code and b.area_type=3;

insert into store_drivers
    select sd.STORE_NUM, '',
        row_number() over (order by sd.Diff_pct DESC nulls last) as Total_Rank,
        sd.Actual_Sales, sd.Predicted_Sales,
        sd.Diff, sd.Diff_pct,
        sd.Color,
        ad.Driver_1_lbl, sd.Driver_1_Scaled, sd.Driver_1_Raw, ad.Driver_1_unit,
        ad.Driver_2_lbl, sd.Driver_2_Scaled, sd.Driver_2_Raw, ad.Driver_2_unit,
        ad.Driver_3_lbl, sd.Driver_3_Scaled, sd.Driver_3_Raw, ad.Driver_3_unit,
        ad.Driver_4_lbl, sd.Driver_4_Scaled, sd.Driver_4_Raw, ad.Driver_4_unit,
        ad.Driver_5_lbl, sd.Driver_5_Scaled, sd.Driver_5_Raw, ad.Driver_5_unit,
        a.id as area_id
    from temp_cli_drivers as sd
    join store as s on sd.STORE_NUM = s.store_id
    join area as a on a.code = cast(sd.Region_ID as varchar(10))
    join area_drivers as ad on ad.area_id = a.id
    where s.wholesale = false and a.area_type = 4;

insert into store_drivers
    select sd.STORE_NUM, '',
        row_number() over (order by sd.Diff_pct DESC nulls last) as Total_Rank,
        sd.Actual_Sales,  sd.Predicted_Sales,
        sd.Diff, sd.Diff_pct,
        sd.Color,
        ad.Driver_1_lbl, sd.Driver_1_Scaled, sd.Driver_1_Raw, ad.Driver_1_unit,
        ad.Driver_2_lbl, sd.Driver_2_Scaled, sd.Driver_2_Raw, ad.Driver_2_unit,
        ad.Driver_3_lbl, sd.Driver_3_Scaled, sd.Driver_3_Raw, ad.Driver_3_unit,
        ad.Driver_4_lbl, sd.Driver_4_Scaled, sd.Driver_4_Raw, ad.Driver_4_unit,
        ad.Driver_5_lbl, sd.Driver_5_Scaled, sd.Driver_5_Raw, ad.Driver_5_unit,
        a.id as area_id
    from temp_cws_drivers as sd
    join store as s on sd.STORE_NUM = s.store_id
    join area as a on a.code = cast(sd.Region_ID as varchar(10))
    join area_drivers as ad on ad.area_id = a.id
    where s.wholesale = true and a.area_type = 4;

insert into store_halo
    select store_id, Store_sales, Retail_Impact, Whoelsale_Impact, Online_Impact, Total_Impact
    from temp_cli_halo as sd
    join store as s on sd.STORE_NUM = s.store_id
    where s.wholesale = false;

insert into store_halo
    select store_id, Store_sales, Retail_Impact, Whoelsale_Impact, Online_Impact, Total_Impact
    from temp_cws_halo as sd
    join store as s on sd.STORE_NUM = s.store_id
    where s.wholesale = true;
