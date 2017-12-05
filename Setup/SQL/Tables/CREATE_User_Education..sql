-- Table: "CALICO"."User_Education"

-- DROP TABLE "CALICO"."User_Education";

CREATE TABLE "CALICO"."User_Education"
(
  "Major" text, -- What is the user's major of studies.
  "Graduation Year" text, -- What year the user will graduate, should probably change to a datetime system.
  "Is In Accend" boolean NOT NULL DEFAULT false, -- Bool for if the user is in accend. Default is FALSE.
  "Is Undergraduate" boolean NOT NULL DEFAULT true, -- Is the user an undergraduate student.
  "User Key" integer PRIMARY KEY references "CALICO"."User"("User Key") -- Auto generated link to the User table.
)
WITH (
  OIDS=FALSE
);
ALTER 	   TABLE  "CALICO"."User_Education" OWNER TO postgres;
COMMENT ON TABLE  "CALICO"."User_Education" IS 'Table to contain basic education information of the members. Major, Graduation year, accend status, graduate/undergraduate status';
COMMENT ON COLUMN "CALICO"."User_Education"."Major" IS 'What is the user''s major of studies.';
COMMENT ON COLUMN "CALICO"."User_Education"."Graduation Year" IS 'What year the user will graduate, should probably change to a datetime system.';
COMMENT ON COLUMN "CALICO"."User_Education"."Is In Accend" IS 'Bool for if the user is in accend. Default is FALSE.';
COMMENT ON COLUMN "CALICO"."User_Education"."Is Undergraduate" IS 'Is the user an undergraduate student.';
COMMENT ON COLUMN "CALICO"."User_Education"."User Key" IS 'Auto generated link to the User table.';

