# Thanks to http://blog.ianpreston.ca/2020/05/13/conda_envs.html for working some of this out!

# Oneshell means all lines in a recipe run in the same shell
.ONESHELL:

# Need to specify bash in order for conda activate to work
SHELL=/bin/bash

# Note that the extra activate is needed to ensure that the activate floats env to the front of PATH
CONDA_ACTIVATE=source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate

# Same name as in environment.yml
CONDA_ENV=conda-piptools-sample-project

all: conda-env-update pip-compile pip-sync

# Create or update conda env
conda-env-update:
	conda env update --prune

# Compile exact pip packages
pip-compile:
	$(CONDA_ACTIVATE) $(CONDA_ENV)
	pip-compile -v requirements/prod.in && pip-compile -v requirements/dev.in

# Install pip packages
pip-sync:
	$(CONDA_ACTIVATE) $(CONDA_ENV)
	pip-sync requirements/prod.txt requirements/dev.txt
