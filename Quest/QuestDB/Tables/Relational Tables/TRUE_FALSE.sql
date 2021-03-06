-- Drop the existing table (if any)

DROP TABLE "CS414S16"."TRUE_FALSE";

--------------------------------------------------------
--  DDL for Table TRUE_FALSE
--------------------------------------------------------

  CREATE TABLE "CS414S16"."TRUE_FALSE" 
   (	"QUESTION_ID" NUMBER, 
	"QUESTION_TEXT" VARCHAR2(100 BYTE), 
	"ANSWER" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table TRUE_FALSE
--------------------------------------------------------

  ALTER TABLE "CS414S16"."TRUE_FALSE" ADD CONSTRAINT "TRUE_FALSE_ANSWER_CHK" CHECK (ANSWER = 'T' OR ANSWER = 'F') ENABLE;
  ALTER TABLE "CS414S16"."TRUE_FALSE" MODIFY ("ANSWER" NOT NULL ENABLE);
  ALTER TABLE "CS414S16"."TRUE_FALSE" MODIFY ("QUESTION_TEXT" NOT NULL ENABLE);
  ALTER TABLE "CS414S16"."TRUE_FALSE" MODIFY ("QUESTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TRUE_FALSE
--------------------------------------------------------

  ALTER TABLE "CS414S16"."TRUE_FALSE" ADD CONSTRAINT "TRUE_FALSE_QUESTION_FK" FOREIGN KEY ("QUESTION_ID")
	  REFERENCES "CS414S16"."QUESTION" ("QUESTION_ID") ENABLE;
