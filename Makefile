dbdocs:
	dbdocs build dbml/db.dbml

dockerup:
	docker-compose up -d

dockerstop:
	docker-compose down

.PHONY: dbdocs dockerup dockerstop