CREATE TABLE "penalty" (
  "id" bigserial PRIMARY KEY,
  "vehicle_id" bigint NOT NULL,
  "penalty_text" text NOT NULL
);

ALTER TABLE "vehicle" 
ADD FOREIGN KEY ("id") 
REFERENCES "penalty" ("vehicle_id");