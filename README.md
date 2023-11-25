# ChordKeeper
Custom chord tracking web application

## Requirements

* Python 3.11
* venv
* Docker & docker-compose

## Installation

1. Clone repository into your local machine: 

    ```bash
    git clone git@github.com:hephest-dev/ChordKeeper.git
    ```

2. Create & activate `venv`:

    ```bash
    python -m venv venv/
    source venv/bin/activate
    ```
   
3. Create environment variable files inside root directory of project (see [Environmental variables](#environmental-variables))

4. Use Makefile (see [Makefile commands](#makefile-commands)) to build & run your containers for local development, using `dev` environment commands

## Development

### Architecture (todo)

* Django
* PostgreSQL
* Guvicorn
* Nginx

### Environmental variables

Each environment had separate `.env` file, both for application itself and for database.

Example of `.env.dev`:

```
DEBUG=1
SECRET_KEY=foo
DJANGO_ALLOWED_HOSTS=localhost 127.0.0.1 [::1] 0.0.0.0

SQL_ENGINE=django.db.backends.postgresql
SQL_DATABASE=hello_django_dev
SQL_USER=hello_django
SQL_PASSWORD=hello_django
SQL_HOST=db
SQL_PORT=5432

DATABASE=postgres
```

Example of `.env.dev.db`:

```
POSTGRES_USER=hello_django
POSTGRES_PASSWORD=hello_django
POSTGRES_DB=hello_django_dev
```

### Makefile commands

#### Common

Create new application inside ChordKeeper project:

```bash
make startapp <app_name>
```


#### Environment-based

> [!IMPORTANT]
> Currently, project uses `dev` environment for local development purposes and `prod` for production-ready tests & deploy.
> 
> Make sure that you chose right environment before applying any commands below!

Run containers for `<env>` w/ logs in terminal:

```bash
make run-<env>
```

Build containers for `<env>`:

```bash
make build-<env>
```

Shutdown running containers for `<env>` w/ volumes

```bash
make down-<env>
```

Rebuild and rerun containers for `<env>`:

```bash
make rebuild-<env>
```

Migrate database changes for `<env>`:

```bash
make migrate-<env>
```

Collect static files for `<env>`:

```bash
make collect-static-<env>
```