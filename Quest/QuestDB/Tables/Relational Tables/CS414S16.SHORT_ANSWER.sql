-- ****** Object: Table CS414S16.SHORT_ANSWER Script Date: 2/16/2016 5:30:24 PM ******
  CREATE TABLE "SHORT_ANSWER" 
   (	"QUESTION_ID" NUMBER NOT NULL ENABLE,
	"BEFORE_TEXT" VARCHAR2(300),
	"AFTER_TEXT" VARCHAR2(300),
	"ANSWER" VARCHAR2(100) NOT NULL ENABLE
   );