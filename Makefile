

### PRODUCTION COMMANDS
prod-start:
	docker compose --file ./docker-compose.yml up -d
prod-rebuild:
	docker compose --file ./docker-compose.yml up -d --build
prod-restart:
	docker compose --file ./docker-compose.yml up -d --force-recreate	
prod-stop:
	docker compose --file ./docker-compose.yml down

nginx-init: prod-nginx-link

prod-nginx-link:
	ln -s ${shell pwd}/reverse-proxy/nginx/plausible /etc/nginx/sites-enabled/plausible.conf
	nginx -s reload

