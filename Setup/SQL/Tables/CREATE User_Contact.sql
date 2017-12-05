CREATE TABLE "CALICO"."User_Contact"
(
   "University Email" text UNIQUE, 
   "Preferred Email" text UNIQUE, 
   "Phone Number" text, 
   "User Key" integer PRIMARY KEY references "CALICO"."User"("User Key")
) 
WITH (
  OIDS = TRUE
)
;
ALTER TABLE "CALICO"."User_Contact" OWNER TO postgres;
COMMENT ON COLUMN "CALICO"."User_Contact"."University Email" IS 'User''s University provided mail address, just for catalogue. Send email to the preferred email address.';
COMMENT ON COLUMN "CALICO"."User_Contact"."Preferred Email" IS 'Email to be contacted by.';
COMMENT ON COLUMN "CALICO"."User_Contact"."Phone Number" IS 'Phone number for contacting user.';
COMMENT ON COLUMN "CALICO"."User_Contact"."User Key" IS 'Unique user key to link to user table entry.';
COMMENT ON TABLE "CALICO"."User_Contact"
  IS 'Contact information for users.';
