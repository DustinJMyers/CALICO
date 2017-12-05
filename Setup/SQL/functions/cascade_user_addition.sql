-- Function: "CALICO".cascade_user_addition()

-- DROP FUNCTION "CALICO".cascade_user_addition();

CREATE OR REPLACE FUNCTION "CALICO".cascade_user_addition()
  RETURNS trigger AS
$BODY$
BEGIN
	INSERT INTO "CALICO"."User_Contact" 
		VALUES('','','',NEW."User Key");
	INSERT INTO "CALICO"."User_Education" 
		VALUES('','',false,true,NEW."User Key");
	
	RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION "CALICO".cascade_user_addition()
  OWNER TO postgres;
