-- ****** Object: Table CS414S16.TEST_TAKEN Script Date: 2/16/2016 5:30:24 PM ******
  CREATE TABLE "TEST_TAKEN" 
   (	"TEST_TAKEN_ID" NUMBER NOT NULL ENABLE,
	"ENROLLMENT_ID" NUMBER NOT NULL ENABLE,
	"TEST_ID" NUMBER NOT NULL ENABLE,
	"POINTS_EARNED" NUMBER,
	"GRADE" VARCHAR2(20),
	CONSTRAINT "TEST_TAKEN_PK" PRIMARY KEY ("TEST_TAKEN_ID") ENABLE
   );