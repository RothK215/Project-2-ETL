create table "la_inspection_data" (
    "serial_number" varchar(255),
    "activity_date" text,
	"facility_address" text,
    "facility_name" text,
    "facility_city" text,
    "facility_state" text,
    "facility_zip" text,
    "facility_id" text,
    "grade" text,
    "score" int,
    "program_status" text,
    "record_id" text,
    "service_description" text,
    CONSTRAINT "pk_la_inspection_data" PRIMARY KEY (
        "serial_number"
     )
);

create table "la_violation_data" (
    "serial_number" varchar(255),
    "activity_date" text,
    "facility_name" text,
    "violation_code" text,
    "violation_description" text,
    "violation_status" text,
    "facility_id" text
);


create table chicago_inspection_data (
	"inspection_id" int primary key,
	"inspection_date" text,
	"dba_name" text,
	"license_number" text,
	"address" text,
	"city" text,
	"state" text,
	"zip" text,
	"latitude" text,
	"longitude" text,
	"inspection_type" text,
	"results" text,
	"violations" text
);

create table nyc_data(
	"CAMIS" text,
	"DBA" text,
	"BORO" text,
	"ADDRESS" text,
	"ZIPCODE" text,
	"PHONE" text,
	"CUISINE DESCRIPTION" text,
	"INSPECTION DATE" text,
	"ACTION" text,
	"VIOLATION CODE" text,
	"VIOLATION DESCRIPTION" text,
	"CRITICAL FLAG" text,
	"SCORE" int,
	"GRADE" text,
	"GRADE DATE" text,
	"RECORD DATE" text,
	"INSPECTION TYPE" text
);

create table sf_data(
	"business_id" text,
	"business_name" text,
	"address" text, 
	"city" text,
	"state" text, 
	"postal_code" text,
    "phone_number" text, 
	"inspection_id" text, 
	"inspection_date" text, 
	"inspection_score" int, 
	"inspection_type" text, 
	"violation_id" text, 
    "violation_description" text, 
	"risk_category" text
);

ALTER TABLE "la_violation_data" ADD CONSTRAINT "fk_la_violation_data_serial_number" FOREIGN KEY("serial_number")
REFERENCES "la_inspection_data" ("serial_number");