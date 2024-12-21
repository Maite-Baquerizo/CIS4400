CREATE SCHEMA id;

CREATE TABLE `id-homework`.id.County ( 
	County_Name string NOT NULL  
 );

ALTER TABLE `id-homework`.id.County ADD PRIMARY KEY ( County_Name )  NOT ENFORCED;

CREATE TABLE `id-homework`.id.Facility ( 
	Facility_Name string NOT NULL  ,
	Facility_Address int64  ,
	Facility_City string  ,
	Facility_County string  ,
	Facility_State string  ,
	Facility_zip int64  ,
	Facility_Latitude int64  ,
	Facility_Longitude int64  ,
	Facility_Total_Size int64  ,
	Facility_Total_Size_Unit int64  
 );

ALTER TABLE `id-homework`.id.Facility ADD PRIMARY KEY ( Facility_Name )  NOT ENFORCED;

CREATE TABLE `id-homework`.id.Facility_Contact ( 
	Contact_ID int64 NOT NULL  ,
	First_Name string  ,
	Last_Name string  ,
	Phone int64  ,
	Facility_Name string  
 );

ALTER TABLE `id-homework`.id.Facility_Contact ADD PRIMARY KEY ( Contact_ID )  NOT ENFORCED;

CREATE TABLE `id-homework`.id.Permit ( 
	Permit_Type string NOT NULL  ,
	status string  ,
	Noi_processed_data string  
 );

ALTER TABLE `id-homework`.id.Permit ADD PRIMARY KEY ( Permit_Type )  NOT ENFORCED;

CREATE TABLE `id-homework`.id.Application ( 
	App_ID int64 NOT NULL  ,
	WDID int64  ,
	Region_Board string  ,
	Permit_Type string  
 );

ALTER TABLE `id-homework`.id.Application ADD PRIMARY KEY ( App_ID )  NOT ENFORCED;

CREATE TABLE `id-homework`.id.Discharge ( 
	Discharge_ID int64 NOT NULL  ,
	Discharge_Date date  ,
	Discharge_Volume int64  ,
	Discharge_Type string  ,
	Facility_Name string  
 );

ALTER TABLE `id-homework`.id.Discharge ADD PRIMARY KEY ( Discharge_ID )  NOT ENFORCED;

ALTER TABLE `id-homework`.id.Application ADD CONSTRAINT fk_Application_Permit FOREIGN KEY ( Permit_Type ) REFERENCES `id-homework`.id.Permit( Permit_Type ) NOT ENFORCED;

ALTER TABLE `id-homework`.id.Discharge ADD CONSTRAINT fk_Discharge_Facility FOREIGN KEY ( Facility_Name ) REFERENCES `id-homework`.id.Facility( Facility_Name ) NOT ENFORCED;

ALTER TABLE `id-homework`.id.Facility ADD CONSTRAINT fk_Facility_County FOREIGN KEY ( Facility_County ) REFERENCES `id-homework`.id.County( County_Name ) NOT ENFORCED;

ALTER TABLE `id-homework`.id.Facility_Contact ADD CONSTRAINT fk_Facility_Contact_Facility FOREIGN KEY ( Facility_Name ) REFERENCES `id-homework`.id.Facility( Facility_Name ) NOT ENFORCED;

