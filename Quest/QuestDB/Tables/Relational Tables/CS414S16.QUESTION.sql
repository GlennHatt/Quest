-- ****** Object: Table CS414S16.QUESTION Script Date: 2/16/2016 5:30:24 PM ******
  CREATE TABLE "QUESTION" 
   (	"QUESTION_ID" NUMBER NOT NULL ENABLE,
	"TEST_ID" NUMBER NOT NULL ENABLE,
	"WEIGHT" NUMBER NOT NULL ENABLE,
	"TYPE" NUMBER NOT NULL ENABLE,
	CONSTRAINT "QUESTION_PK" PRIMARY KEY ("QUESTION_ID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS
 ;