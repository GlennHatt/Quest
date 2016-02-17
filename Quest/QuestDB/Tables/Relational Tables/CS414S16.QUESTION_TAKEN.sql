-- ****** Object: Table CS414S16.QUESTION_TAKEN Script Date: 2/16/2016 5:30:24 PM ******
  CREATE TABLE "QUESTION_TAKEN" 
   (	"QUESTION_TAKEN_ID" NUMBER NOT NULL ENABLE,
	"TEST_TAKEN_ID" NUMBER NOT NULL ENABLE,
	"QUESTION_ID" NUMBER NOT NULL ENABLE,
	"POINTS_EARNED" NUMBER NOT NULL ENABLE,
	CONSTRAINT "QUESTION_TAKEN_PK" PRIMARY KEY ("QUESTION_TAKEN_ID") ENABLE
   ) ORGANIZATION INDEX NOCOMPRESS
 ;