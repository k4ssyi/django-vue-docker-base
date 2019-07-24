ALL: image
startapp:
	docker-compose run --rm django python3 manage.py startapp app
collectstatic:
	docker-compose run --rm django python3 manage.py collectstatic
createsuperuser:
	docker-compose run --rm django python3 manage.py createsuperuser
makemigrations:
	docker-compose run --rm django python3 manage.py makemigrations
migrate:
	docker-compose run --rm django python3 manage.py migrate
shell:
	docker-compose run --rm django python3 manage.py shell
test:
	docker-compose run -rm django python3 manage.py test --setting config.settings.test
psql:
	docker-compose exec db psql -U docker -h db -d sample
image:
	docker-compose -f docker-compose.yml build
container:
	docker-compose -f docker-compose.yml up
up:
	docker-compose -f docker-compose.yml up -d
stop:
	docker-compose -f docker-compose.yml stop
