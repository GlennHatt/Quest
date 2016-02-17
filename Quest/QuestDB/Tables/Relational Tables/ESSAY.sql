-- Drop the existing table (if any)

DROP TABLE "CS414S16"."ESSAY";

--------------------------------------------------------
--  DDL for Table ESSAY
--------------------------------------------------------

  CREATE TABLE "CS414S16"."ESSAY" 
   (	"QUESTION_ID" NUMBER, 
	"QUESTION_TEXT" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table ESSAY
--------------------------------------------------------

  ALTER TABLE "CS414S16"."ESSAY" MODIFY ("QUESTION_TEXT" NOT NULL ENABLE);
  ALTER TABLE "CS414S16"."ESSAY" MODIFY ("QUESTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ESSAY
--------------------------------------------------------

  ALTER TABLE "CS414S16"."ESSAY" ADD CONSTRAINT "ESSAY_QUESTION_FK" FOREIGN KEY ("QUESTION_ID")
	  REFERENCES "CS414S16"."QUESTION" ("QUESTION_ID") ENABLE;
