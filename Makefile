SHELL:= /bin/bash

jl_folder = jupyterlite
jl_env_file = $(jl_folder)/dep/environment.yml
jl_env_name = jl$(word 1, $(shell md5sum $(jl_env_file)))
activate_conda = source /opt/conda/bin/activate && conda activate $(jl_env_name)

all: clean build page
    
clean:
	cd $(jl_folder) && \
	rm -rf _output .jupyterlite.doit.db

build:
	cd $(jl_folder) && \
	$(activate_conda) && \
	jupyter lite build --contents=../ipynb && \
	python kernel2pyodide.py
    
page:
	cd $(jl_folder) && \
	$(activate_conda) && \
	ghp-import -np _output

env:
	conda env create -p ${CONDA_DIR}/envs/$(jl_env_name) -f $(jl_env_file)

show:
	echo $(jl_env_name)

clean-env:
	conda remove -n $(jl_env_name) --all

myst:
	bash tomyst.sh

ipynb:
	bash toipynb.sh

modules := all env clean-env clean build page myst ipynb

.PHONY: $(modules)