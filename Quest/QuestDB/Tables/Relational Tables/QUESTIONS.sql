-- Drop the existing table (if any)

DROP TABLE "CS414S16"."QUESTION";

--------------------------------------------------------
--  DDL for Table QUESTION
--------------------------------------------------------

  CREATE TABLE "CS414S16"."QUESTION" 
   (	"QUESTION_ID" NUMBER, 
	"TEST_ID" NUMBER, 
	"WEIGHT" NUMBER, 
	"TYPE" NUMBER, 
	 CONSTRAINT "QUESTION_PK" PRIMARY KEY ("QUESTION_ID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 PCTTHRESHOLD 50;
--------------------------------------------------------
--  DDL for Index QUESTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CS414S16"."QUESTION_PK" ON "CS414S16"."QUESTION" ("QUESTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table QUESTION
--------------------------------------------------------

  ALTER TABLE "CS414S16"."QUESTION" ADD CONSTRAINT "QUESTION_PK" PRIMARY KEY ("QUESTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CS414S16"."QUESTION" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "CS414S16"."QUESTION" MODIFY ("WEIGHT" NOT NULL ENABLE);
  ALTER TABLE "CS414S16"."QUESTION" MODIFY ("TEST_ID" NOT NULL ENABLE);
  ALTER TABLE "CS414S16"."QUESTION" MODIFY ("QUESTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table QUESTION
--------------------------------------------------------

  ALTER TABLE "CS414S16"."QUESTION" ADD CONSTRAINT "QUESTION_TEST_FK" FOREIGN KEY ("TEST_ID")
	  REFERENCES "CS414S16"."TEST" ("TEST_ID") ENABLE;