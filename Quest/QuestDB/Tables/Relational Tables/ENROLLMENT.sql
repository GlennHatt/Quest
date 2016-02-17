-- Drop the existing table (if any)

DROP TABLE "CS414S16"."ENROLLMENT" 

-- Create a new Relational table with 3 columns

--------------------------------------------------------
--  DDL for Table ENROLLMENT
--------------------------------------------------------

  CREATE TABLE "CS414S16"."ENROLLMENT" 
   (	"ENROLLMENT_ID" NUMBER, 
	"STUDENT_ID" NUMBER, 
	"SECTION_ID" NUMBER, 
	 CONSTRAINT "ENROLLMENT_PK" PRIMARY KEY ("ENROLLMENT_ID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 PCTTHRESHOLD 50;
--------------------------------------------------------
--  DDL for Index ENROLLMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CS414S16"."ENROLLMENT_PK" ON "CS414S16"."ENROLLMENT" ("ENROLLMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table ENROLLMENT
--------------------------------------------------------

  ALTER TABLE "CS414S16"."ENROLLMENT" MODIFY ("SECTION_ID" NOT NULL ENABLE);
  ALTER TABLE "CS414S16"."ENROLLMENT" ADD CONSTRAINT "ENROLLMENT_PK" PRIMARY KEY ("ENROLLMENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CS414S16"."ENROLLMENT" MODIFY ("STUDENT_ID" NOT NULL ENABLE);
  ALTER TABLE "CS414S16"."ENROLLMENT" MODIFY ("ENROLLMENT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ENROLLMENT
--------------------------------------------------------

  ALTER TABLE "CS414S16"."ENROLLMENT" ADD CONSTRAINT "ENROLLMENT_SECTION_FK" FOREIGN KEY ("SECTION_ID")
	  REFERENCES "CS414S16"."SECTION" ("SECTION_ID") ENABLE;
  ALTER TABLE "CS414S16"."ENROLLMENT" ADD CONSTRAINT "ENROLLMENT_STUDENT_FK" FOREIGN KEY ("STUDENT_ID")
	  REFERENCES "CS414S16"."END_USER" ("USER_ID") ENABLE;
