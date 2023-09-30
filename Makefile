FORCE: ;

ensure-env-local:
	touch .env-local

checks: ensure-env-local

pip-compile: checks
	docker-compose run --no-deps backend bash -c "pip install pip-tools && pip-compile -v --no-emit-index-url requirements.in"

build: checks
	docker-compose build

build-no-cache: checks
	docker-compose build --no-cache

up: checks
	docker-compose up

up-no-frontend: checks
	docker-compose up backend

makemigrations: checks
	docker-compose run backend ./manage.py makemigrations

migrate: checks
	docker-compose run backend ./manage.py migrate

make-and-migrate: makemigrations migrate

bash: checks
	docker-compose run backend bash

shell: checks
	docker-compose run backend ./manage.py shell

test: checks
	docker-compose run backend ./manage.py test

ruff:
	docker-compose run --no-deps backend ruff check --fix .

black:
	docker-compose run --no-deps backend black .

mypy:
	docker-compose run --no-deps backend mypy

all: ruff black mypy test
