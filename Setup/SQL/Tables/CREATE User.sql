-- Table: "CALICO"."User"

-- DROP TABLE "CALICO"."User";

CREATE TABLE "CALICO"."User"
(
  "First Name" text, -- First Name of the User
  "Last Name" text, -- Last name of user.
  "ID" text, -- Simple ID of the user. Also referred to as 6+2 at UC.
  "ID Number" text, -- Longer ID of the user. Also known as M number at UC.
  "User Key"  integer PRIMARY KEY NOT NULL DEFAULT nextval('"CALICO_User_User Key_seq"'::regclass) -- Used by the DB to associate data with other tables
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "CALICO"."User"
  OWNER TO postgres;
COMMENT ON TABLE "CALICO"."User"
  IS 'Table that conatains basic user information.';
COMMENT ON COLUMN "CALICO"."User"."First Name" IS 'First Name of the User';
COMMENT ON COLUMN "CALICO"."User"."Last Name" IS 'Last name of user.';
COMMENT ON COLUMN "CALICO"."User"."ID" IS 'Simple ID of the user. Also referred to as 6+2 at UC.';
COMMENT ON COLUMN "CALICO"."User"."ID Number" IS 'Longer ID of the user. Also known as M number at UC.';
COMMENT ON COLUMN "CALICO"."User"."User Key" IS 'Used by the DB to associate data with other tables';

