PYTHON ?= ./.venv/bin/python
PIP := $(PYTHON) -m pip

RUN_EXPERIMENT :=
ifeq (run,$(firstword $(MAKECMDGOALS)))
RUN_EXPERIMENT := $(word 2,$(MAKECMDGOALS))
ifneq ($(RUN_EXPERIMENT),)
$(eval $(RUN_EXPERIMENT):;@:)
endif
endif
RUN_NAME := $(or $(EXPERIMENT),$(RUN_EXPERIMENT))
RUN_PROJECT_ARG := $(if $(RUN_NAME),--project-name $(RUN_NAME),)
CONFIGS := $(sort $(wildcard configs/*.json))

.PHONY: help venv install test-static test-deterministic test-deterministic-all tests tests-all run run-all all clean

help:
	@echo "Targets:"
	@echo "  make venv         - create local virtual environment"
	@echo "  make install      - install package in editable mode with dev deps"
	@echo "  make test-static  - run static checks (ruff + mypy)"
	@echo "  make test-deterministic      - reproducibility check for configs/default.json"
	@echo "  make test-deterministic-all  - reproducibility checks for all configs/*.json"
	@echo "  make tests        - run normal tests (pytest + test-deterministic)"
	@echo "  make tests-all    - run all tests (test-static + tests + test-deterministic-all)"
	@echo "  make run [name]   - run sample experiment (optional result name)"
	@echo "                     examples: make run, make run experiment1"
	@echo "  make run-all      - run all configs/*.json experiments"
	@echo "  make all          - run-all + test-deterministic-all"
	@echo "  make clean        - remove generated artifacts"

venv:
	python3 -m venv .venv

install: venv

test-static:

test-deterministic:

test-deterministic-all:

tests:

tests-all: 

run:

run-all:

all: 

clean:
