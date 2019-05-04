# teleclinic

## Welcome to the TeleClinic Django Developer Hiring Test

#### Task

Set up a Django (2.2) API Server locally with all required dependencies and services. Each service should run in its **own Docker container**. Use docker-compose to orchestrate the containers. The following services should be running:

| Service  | Comment                                                 |
| -------- | ------------------------------------------------------- |
| Django   | Development Server on port 8080                         |
| Postgres | Set User/Password from os environment, expose port 5432 |

#### Additional Tasks

-   Make sure that Django is accessible
-   Make sure that the Django Admin is accessible, and all static files are collected
-   Create a very basic authentication views (login/register). I should be able to register as a user and then login to the application. Use the standard Django auth models for user management. Keep it simple - name, username, password
-   Add a view that is only accessible for authenticated users

### Useful Links

Here is a few links that might come in handy:

-   [Django Docs](https://docs.djangoproject.com/) - The official Django documentation
-   [Docker Docs](https://docs.docker.com//) - The official Docker documentation
-   [Postgres Documentation](https://www.postgresql.org/) - The official Postgres documentation
