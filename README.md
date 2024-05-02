# lordec-miniasm

# Usage

## step1

Snakemake and Snakedeploy are best installed via the [Mamba package manager](https://github.com/mamba-org/mamba) (a drop-in replacement for conda). If you have neither [Conda](https://conda.io/projects/conda/en/latest/user-guide/getting-started.html) [Miniconda](https://docs.anaconda.com/free/miniconda/) nor [Mamba](https://github.com/mamba-org/mamba), have a look here to install [Mamba](https://mamba.readthedocs.io/en/latest/installation/mamba-installation.html).

Given that Mamba is installed, run

```
mamba create -c conda-forge -c bioconda --name snakemake snakemake snakedeploy
```

to install both Snakemake and Snakedeploy in an isolated environment. For all following commands ensure that this environment is activated via

```
conda activate snakemake
```

## step2

