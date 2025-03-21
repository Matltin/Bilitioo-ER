ALTER TABLE "report" DROP CONSTRAINT "report_admin_id_fkey";
ALTER TABLE "profile" DROP CONSTRAINT "profile_user_id_fkey";
ALTER TABLE "profile" DROP CONSTRAINT "profile_city_id_fkey";

DROP TABLE IF EXISTS "report";
DROP TABLE IF EXISTS "profile";
DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS "city";

DROP TYPE IF EXISTS "role";
DROP TYPE IF EXISTS "user_status";