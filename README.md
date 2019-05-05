# Welcome to the TeleClinic Django Developer Hiring Test

[![Build Status](https://travis-ci.com/eduzen/teleclinic.svg?token=DKEphQqLfK6FXyH2VKsg&branch=master)](https://travis-ci.com/eduzen/teleclinic)

## Task

Set up a Django (2.2) API Server locally with all required dependencies and services. Each service should run in its **own Docker container**. Use docker-compose to orchestrate the containers. The following services should be running:

| Service  | Comment                                                 |
| -------- | ------------------------------------------------------- |
| Django   | Development Server on port 8080                         |
| Postgres | Set User/Password from os environment, expose port 5432 |

**1) Just run `make start` to launch each service in its own containers. And `make stop` to stop and remove containers.**

### Additional Tasks

- Make sure that Django is accessible

**2) You can check logs doing `make logs` or you just go to http://localhost:8080/. But I also added test to be sure that everything is working**

- Make sure that the Django Admin is accessible, and all static files are collected

**3) We added some tests for views. You can run `make only-test` or `make test` for also do linting check. Statics and migrations are inside of start-runserver.sh. For production, its necessary some adjustments for example its better to use gunicorn.**

- Create a very basic authentication views (login/register). I should be able to register as a user and then login to the application. Use the standard Django auth models for user management. Keep it simple - name, username, password
- Add a view that is only accessible for authenticated users

**4) I used standard Django auth models with djangrestframework for registering: `make createuser` and for login http://localhost:8080/api-auth/login/. These views are public, but if you want to see all the users registered or just one we have a view that is only accessible for authenticated users: `make getuser` or go to http://localhost:8080/users/**

### Useful Links

Here is a few links that might come in handy:

- [Django Docs](https://docs.djangoproject.com/) - The official Django documentation
- [Docker Docs](https://docs.docker.com//) - The official Docker documentation
- [Postgres Documentation](https://www.postgresql.org/) - The official Postgres documentation
