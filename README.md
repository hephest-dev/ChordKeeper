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

3. Use Makefile (see [Makefile commands](#makefile-commands)) to build & run your containers for local development, using `dev` environment commands

## Development

### Architecture (todo)

* Django
* PostgreSQL
* Guvicorn
* Nginx

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