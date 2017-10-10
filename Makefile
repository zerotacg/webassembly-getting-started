BUILD_PATH = build
DOCKER = docker
DOCKER_RUN_FLAGS = --rm
DOCKER_COMPOSE = docker-compose
STAMP = touch

.PHONY: clean configure container

clean:
	rm -rf $(BUILD_PATH)

container: $(BUILD_PATH)/container.stamp

$(BUILD_PATH)/container.stamp: $(BUILD_PATH) Dockerfile docker-compose.yml
	$(DOCKER_COMPOSE) build
	$(STAMP) $@

$(BUILD_PATH):
	mkdir --parents $(BUILD_PATH)
