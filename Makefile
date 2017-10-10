BUILD_PATH = build
DOCKER_COMPOSE = docker-compose
STAMP = touch

.PHONY: clean container

clean:
	rm -rf $(BUILD_PATH)

container: $(BUILD_PATH)/container.stamp

$(BUILD_PATH)/container.stamp: $(BUILD_PATH) Dockerfile docker-compose.yml
	$(DOCKER_COMPOSE) build
	$(STAMP) $@

$(BUILD_PATH):
	mkdir --parents $(BUILD_PATH)
