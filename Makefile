DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
DATA_PATH = /home/user/data
DATABASE_DATA_PATH = /home/user/data/mysql
WB_DATA_PATH = /home/user/data/wordpress

.PHONY: all build run stop restart clean logs

all: build run

build: ensure_dirs
	@docker compose -f $(DOCKER_COMPOSE_FILE) build

run:
	@docker compose -f $(DOCKER_COMPOSE_FILE) up -d

stop:
	@docker compose -f $(DOCKER_COMPOSE_FILE) down

restart: stop run

clean: stop
	@docker system prune -af
	@docker volume rm $$(docker volume ls -q)
	@sudo rm -rf $(DATA_PATH)

logs:
	@docker compose -f $(DOCKER_COMPOSE_FILE) logs -f

ensure_dirs:
	@echo "Creating necessary directories if they don't exist..."
	@mkdir -p $(WB_DATA_PATH)
	@mkdir -p $(DATABASE_DATA_PATH)
	@mkdir -p $(DATA_PATH)  # Add this line to ensure DATA_PATH exists
	@chmod -R 755 $(DATA_PATH)
	@echo "Directories ready: /home/user/data/wordpress, /home/user/data/mysql, $(DATA_PATH)"

