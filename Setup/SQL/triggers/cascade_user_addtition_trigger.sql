-- Trigger: Cascade_User_Creation_Bind on "CALICO"."User"

-- DROP TRIGGER "Cascade_User_Creation_Bind" ON "CALICO"."User";

CREATE TRIGGER "Cascade_User_Creation_Bind"
  AFTER INSERT
  ON "CALICO"."User"
  FOR EACH ROW
  EXECUTE PROCEDURE "CALICO".cascade_user_addition();
COMMENT ON TRIGGER "Cascade_User_Creation_Bind" ON "CALICO"."User" IS 'This binds a call to cascade_user_addition() to an insertion on the user table';
