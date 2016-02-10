-- Drop the existing table (if any)

DROP TABLE "CS414S16"."SHORT_ANSWER";

--------------------------------------------------------
--  DDL for Table SHORT_ANSWER
--------------------------------------------------------

  CREATE TABLE "CS414S16"."SHORT_ANSWER" 
   (	"QUESTION_ID" NUMBER, 
	"BEFORE_TEXT" VARCHAR2(300 BYTE), 
	"AFTER_TEXT" VARCHAR2(300 BYTE), 
	"ANSWER" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table SHORT_ANSWER
--------------------------------------------------------

  ALTER TABLE "CS414S16"."SHORT_ANSWER" MODIFY ("ANSWER" NOT NULL ENABLE);
  ALTER TABLE "CS414S16"."SHORT_ANSWER" MODIFY ("QUESTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table SHORT_ANSWER
--------------------------------------------------------

  ALTER TABLE "CS414S16"."SHORT_ANSWER" ADD CONSTRAINT "SHORT_ANSWER_QUESTION_FK" FOREIGN KEY ("QUESTION_ID")
	  REFERENCES "CS414S16"."QUESTION" ("QUESTION_ID") ENABLE;
