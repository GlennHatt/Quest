-- ****** Object: Constraint CS414S16.QUESTION_TAKEN_TEST_TAKEN_FK Script Date: 2/16/2016 5:30:24 PM ******
ALTER TABLE "QUESTION_TAKEN" ADD CONSTRAINT "QUESTION_TAKEN_TEST_TAKEN_FK" FOREIGN KEY ("TEST_TAKEN_ID") REFERENCES "TEST_TAKEN"("TEST_TAKEN_ID") ENABLE;
