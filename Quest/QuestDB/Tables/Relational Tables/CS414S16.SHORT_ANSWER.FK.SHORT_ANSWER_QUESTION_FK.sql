-- ****** Object: Constraint CS414S16.SHORT_ANSWER_QUESTION_FK Script Date: 2/16/2016 5:30:24 PM ******
ALTER TABLE "SHORT_ANSWER" ADD CONSTRAINT "SHORT_ANSWER_QUESTION_FK" FOREIGN KEY ("QUESTION_ID") REFERENCES "QUESTION"("QUESTION_ID") ENABLE;
