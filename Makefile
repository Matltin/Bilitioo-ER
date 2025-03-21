address=postgresql://root:secret@localhost:5432/postgres?sslmode=disable
path=./migrations

dbdocs:
	dbdocs build dbml/db.dbml

dockerup:
	docker-compose up -d

dockerstop:
	docker-compose down

migrateup:
	migrate -path $(path)/ -database  $(address) -verbose up

migrateup1:
	migrate -path $(path)/ -database  $(address) -verbose up 1

migratedown:
	migrate -path $(path)/ -database $(address) -verbose down

migratedown1:
	migrate -path $(path)/ -database $(address) -verbose down 1

new_migrate:
	migrate create -ext sql -dir $(path) -seq $(name)

docker_migrateup:
	docker run -v $(path):/migrations --network bilitioo-er_pg_network migrate/migrate -path=/migrations -database postgres://root:secret@postgres_pgadmin_yml:5432/postgres?sslmode=disable up 2

docker_migratedown:
	docker run -v $(path):/migrations --network bilitioo-er_pg_network migrate/migrate -path=/migrations -database postgres://root:secret@postgres_pgadmin_yml:5432/postgres?sslmode=disable down 2

.PHONY: dbdocs dockerup dockerstop migrateup migrateup1 migratedown migratedown1 new_migrate docker_migrateup docker_migratedown