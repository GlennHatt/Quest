-- ****** Object: Constraint CS414S16.MULTIPLE_CHOICE_QUESTION_FK Script Date: 2/16/2016 5:30:24 PM ******
ALTER TABLE "MULTIPLE_CHOICE" ADD CONSTRAINT "MULTIPLE_CHOICE_QUESTION_FK" FOREIGN KEY ("QUESTION_ID") REFERENCES "QUESTION"("QUESTION_ID") ENABLE;
