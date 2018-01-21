BUILD_PATH = build
DOCKER = docker
DOCKER_RUN_FLAGS = --rm
DOCKER_COMPOSE = docker-compose
STAMP = touch
RM = $(DOCKER_COMPOSE) run emcc rm
WASM_2_WAST = $(DOCKER_COMPOSE) run emcc wasm2wat

.PHONY: default clean container all wat

default: all

clean:
	$(RM) --recursive --force $(BUILD_PATH)
	$(DOCKER_COMPOSE) down --volumes --remove-orphans

container: $(BUILD_PATH)/container.stamp

$(BUILD_PATH)/container.stamp: $(BUILD_PATH) Dockerfile docker-compose.yml
	$(DOCKER_COMPOSE) build
	$(STAMP) $@

all: container
	$(DOCKER_COMPOSE) run emcc bash -c "cmake -DCMAKE_BUILD_TYPE=Debug -H. -Bbuild && cmake --build build"

wat: $(BUILD_PATH)/hello_library/libhello.wat $(BUILD_PATH)/hello_world/getting_started.wat

%.wat: %.wasm container
	$(WASM_2_WAST) $< -o $@

$(BUILD_PATH):
	mkdir --parents $(BUILD_PATH)
