# COMMON
startapp:
	docker-compose up -d --build
	docker-compose exec web python manage.py startapp $(APP)

# DEVELOPMENT

run-dev:
	docker-compose -f docker-compose.dev.yml up
	docker-compose -f docker-compose.dev.yml logs -f

build-dev:
	docker-compose -f docker-compose.dev.yml up -d --build

down-dev:
	docker-compose -f docker-compose.dev.yml down -v

migrate-dev:
	docker-compose -f docker-compose.dev.yml exec web python manage.py migrate --noinput

rebuild-dev: down-dev run-dev

collect-static-dev:
	docker-compose -f docker-compose.dev.yml exec web python manage.py collectstatic --no-input --clear

# PRODUCTION

run-prod:
	docker-compose -f docker-compose.prod.yml up
	docker-compose -f docker-compose.prod.yml logs -f

build-prod:
	docker-compose -f docker-compose.prod.yml up -d --build

down-prod:
	docker-compose -f docker-compose.prod.yml down -v

migrate-prod:
	docker-compose -f docker-compose.prod.yml exec web python manage.py migrate --noinput

rebuild-prod: down-prod run-prod

collect-static-prod:
	docker-compose -f docker-compose.prod.yml exec web python manage.py collectstatic --no-input --clear