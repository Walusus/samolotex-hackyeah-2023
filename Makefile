FORCE: ;

ensure-env-local:
	touch .env-local

checks: ensure-env-local

pip-compile: checks
	docker-compose run --no-deps web bash -c "pip install pip-tools && pip-compile -v --no-emit-index-url requirements.in"

build: checks
	docker-compose build

build-no-cache: checks
	docker-compose build --no-cache

up: checks
	docker-compose up web

makemigrations: checks
	docker-compose run web ./manage.py makemigrations


migrate: checks
	docker-compose run web ./manage.py migrate

make-and-migrate: makemigrations migrate

bash: checks
	docker-compose run web bash

shell: checks
	docker-compose run web ./manage.py shell

test: checks
	docker-compose run web ./manage.py test

ruff:
	docker-compose run --no-deps web ruff check --fix .

black:
	docker-compose run --no-deps web black .

mypy:
	docker-compose run --no-deps web mypy

all: ruff black mypy test
