pip-compile:
	docker-compose run --no-deps jupyter bash -c "pip install pip-tools && pip-compile -v --no-emit-index-url requirements.in"

build:
	docker-compose build

build-no-cache:
	docker-compose build --no-cache

lab:
	docker-compose up
