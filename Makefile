build:
	docker build -t roeldev/php-composer:local .

start:
	docker run --name php-composer roeldev/php-composer:local

login:
	docker exec -it php-composer bash
