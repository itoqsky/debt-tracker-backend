.SILENT:

build:
# go mod download && CGO_ENABLED=0 GOOS=linux go build -o ./.bin/app ./cmd/api/main.go
	docker-compose build todo-app

run: build
	docker-compose up --remove-orphans --build server

# create-migration:
# 	migrate create -ext sql -dir schema/ -seq $(NAME)

migrate:
	migrate -path ./schema -database "postgres://postgres:qwerty@192.168.56.1:5436/postgres?sslmode=disable" up

migrate-down:
	migrate -path ./schema -database "postgres://postgres:qwerty@192.168.56.1:5436/postgres?sslmode=disable" down 1

migrate-drop:
	migrate -path ./schema -database "postgres://postgres:qwerty@192.168.56.1:5436/postgres?sslmode=disable" drop
