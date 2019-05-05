COMPOSE=docker-compose
DOCKER_RUN=${COMPOSE} run --rm

start:
	${COMPOSE} up -d

stop:
	${COMPOSE} down

logs:
	${COMPOSE} logs -f api

show-urls:
	${DOCKER_RUN} api python manage.py show_urls

migrate:
	${DOCKER_RUN} api python manage.py migrate

migrations:
	${DOCKER_RUN} api python manage.py makemigrations

collectstatic:
	${DOCKER_RUN} api python manage.py collectstatic

dockershell:
	${DOCKER_RUN} api ash

only-test:
	${DOCKER_RUN} api pytest

pep8:
	${DOCKER_RUN} api flake8

black:
	${DOCKER_RUN} api black --target-version py36 .

test: pep8 only-test

superuser:
	${DOCKER_RUN} api python manage.py createsuperuser

createuser:
	curl --header "Content-Type: application/json" \
		--request POST \
		--data '{"username":"test","password":"test", "email":"test@gmail.com"}' \
		http://localhost:8080/users/

getusers:
	curl http://localhost:8080/users/

clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +
clean-python: clean-build clean-pyc
