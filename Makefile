SHELL := /bin/bash
SHA=$(shell git rev-parse HEAD)
DATE=$(shell date +%Y.%m.%d)

.PHONY: build
build:
	$(info Make: Building docker images: TAG=${SHA})
	@TAG=${SHA} docker-compose build

.PHONY: clean
clean:
	$(info Make: Clean docker containers)
	@TAG=${SHA} docker-compose down -v --remove-orphans

.PHONY: run
run:
	$(info Make: Bring local docker cluster up)
	@TAG=${SHA} docker-compose up -d

.PHONY: publish-tagged
publish-tagged:
	$(info Make: Build & Publish docker images: TAG=${SHA})
	@make build
	@TAG=${SHA} docker-compose push perf-test
