BUILD_PATH = build
DOCKER = docker
DOCKER_RUN_FLAGS = --rm
DOCKER_COMPOSE = docker-compose
STAMP = touch
RM = $(DOCKER_COMPOSE) run emcc rm

.PHONY: default clean container all wat

default: all

clean:
	$(RM) --recursive --force $(BUILD_PATH)
	$(DOCKER_COMPOSE) down --volumes --remove-orphans

container: $(BUILD_PATH)/container.stamp

$(BUILD_PATH)/container.stamp: $(BUILD_PATH) Dockerfile docker-compose.yml
	$(DOCKER_COMPOSE) build --force-rm
	$(STAMP) $@

all: container
	$(DOCKER_COMPOSE) run emcc bash -c "cmake -H. -Bbuild && cmake --build build"

$(BUILD_PATH):
	mkdir --parents $(BUILD_PATH)
