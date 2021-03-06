-- Drop the existing table (if any)

DROP TABLE "CS414S16"."SECTION"

-- Create a new Relational table with 3 columns

--------------------------------------------------------
--  DDL for Table SECTION
--------------------------------------------------------

  CREATE TABLE "CS414S16"."SECTION" 
   (	"SECTION_ID" NUMBER, 
	"TEACHER_ID" NUMBER, 
	"CLASS_ID" NUMBER, 
	"SEMESTER" VARCHAR2(12 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SECTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CS414S16"."SECTION_PK" ON "CS414S16"."SECTION" ("SECTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table SECTION
--------------------------------------------------------

  ALTER TABLE "CS414S16"."SECTION" MODIFY ("CLASS_ID" NOT NULL ENABLE);
  ALTER TABLE "CS414S16"."SECTION" MODIFY ("TEACHER_ID" NOT NULL ENABLE);
  ALTER TABLE "CS414S16"."SECTION" MODIFY ("SEMESTER" NOT NULL ENABLE);
  ALTER TABLE "CS414S16"."SECTION" ADD CONSTRAINT "SECTION_PK" PRIMARY KEY ("SECTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CS414S16"."SECTION" MODIFY ("SECTION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table SECTION
--------------------------------------------------------

  ALTER TABLE "CS414S16"."SECTION" ADD CONSTRAINT "SECTION_CLASS_FK" FOREIGN KEY ("CLASS_ID")
	  REFERENCES "CS414S16"."CLASS" ("CLASS_ID") ENABLE;
  ALTER TABLE "CS414S16"."SECTION" ADD CONSTRAINT "SECTION_TEACHER_FK" FOREIGN KEY ("TEACHER_ID")
	  REFERENCES "CS414S16"."END_USER" ("USER_ID") ENABLE;
