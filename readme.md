# Conda + Pip-Tools Sample Project

Quick demo of setting up a deep learning Python environment.

Our goals:

- Easily specify the exact Python, CUDA, CUDNN environment
- Humans should specify minimal constraints (`torch >= 1.7` and `numpy`), computer should figure out exact, mutually compatible versions (`torch==1.7.1; numpy==1.19.5`)
- Separate production (`torch`) from development (`black`) dependencies

We achieve this by:

- We specify our Python and CUDA versions in `environment.yml`
- We use the `conda` package manager to create our environment from this file
- We specify our requirements in `requirements/prod.in` and `requirements/dev.in`
- We use `pip-tools` to lock in mutually compatbile versions of all requirements
- We add a `Makefile` so we can simply run `make` to update everything

Try it out by running `docker run --rm -v`pwd`:/var/task -it continuumio/miniconda /bin/bash`, and then in the container:

```
apt-get install make
cd /var/task
make
```

This will set up the environment.

Don't forget to activate it by running `conda activate conda-piptools-sample-project`!
