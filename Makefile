.PHONY: all extract validate transform build check publish clean clear

include config.mk
#include .env

EXT = xlsx

RESOURCE_NAMES := $(shell $(PYTHON) main.py resources)
OUTPUT_FILES := $(addsuffix .csv,$(addprefix data/,$(RESOURCE_NAMES)))

all: clear extract validate transform build check

extract:
	$(PYTHON) main.py extract

validate:
	$(PYTHON) main.py validate datapackage.yaml

transform: $(OUTPUT_FILES)

$(OUTPUT_FILES): data/%.csv: data-raw/%.$(EXT) schemas/raw.schema.yaml scripts/transform.py datapackage.yaml
	$(PYTHON) main.py transform $*

build: transform datapackage.json

datapackage.json: $(OUTPUT_FILES) scripts/build.py datapackage.yaml schemas/schema.yaml
	$(PYTHON) main.py build

check:
	frictionless validate datapackage.json
	dpm install
	Rscript checks/rstats/testthat.R

publish:
	git add -Af datapackage.json data/*.csv data-raw/*.$(EXT)
	git commit --author="Automated <actions@users.noreply.github.com>" -m "Update data package at: $$(date +%Y-%m-%dT%H:%M:%SZ)" || exit 0
	git push

clean:
	rm -f datapackage.json data/*.csv

clear:
	:> logfile.log
