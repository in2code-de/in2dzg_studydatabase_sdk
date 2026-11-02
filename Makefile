GENERATOR_VERSION := v7.27.0
GENERATOR_IMAGE   := openapitools/openapi-generator-cli:$(GENERATOR_VERSION)
DOCKER_RUN        := docker run --rm -u $(shell id -u):$(shell id -g) -v "$(CURDIR):/local" $(GENERATOR_IMAGE)

.PHONY: update-sdk validate-spec generator-options

## SDK aus .project/openapi.yaml neu generieren
update-sdk: validate-spec
	rm -rf lib docs/Api docs/Model
	$(DOCKER_RUN) generate -c /local/.project/openapi-generator.yaml

## OpenAPI-Spezifikation prüfen
validate-spec:
	$(DOCKER_RUN) validate -i /local/.project/openapi.yaml

## Alle Optionen des PHP-Generators anzeigen
generator-options:
	$(DOCKER_RUN) config-help -g php
