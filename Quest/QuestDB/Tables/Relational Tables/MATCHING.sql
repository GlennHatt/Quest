-- Drop the existing table (if any)

DROP TABLE "CS414S16"."MATCHING";

-- Create a new Relational table with 3 columns

--------------------------------------------------------
--  DDL for Table MATCHING
--------------------------------------------------------

  CREATE TABLE "CS414S16"."MATCHING" 
   (	"QUESTION_ID" NUMBER, 
	"QUESTION_TEXT" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table MATCHING
--------------------------------------------------------

  ALTER TABLE "CS414S16"."MATCHING" MODIFY ("QUESTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table MATCHING
--------------------------------------------------------

  ALTER TABLE "CS414S16"."MATCHING" ADD CONSTRAINT "MATCHING_QUESTION_FK" FOREIGN KEY ("QUESTION_ID")
	  REFERENCES "CS414S16"."QUESTION" ("QUESTION_ID") ENABLE;

