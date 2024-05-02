# lordec-miniasm

# Usage

## Step 1 - install Snakemake and Snakedeploy

Snakemake and Snakedeploy are best installed via the [Mamba package manager](https://github.com/mamba-org/mamba) (a drop-in replacement for conda). If you have neither [Conda](https://conda.io/projects/conda/en/latest/user-guide/getting-started.html) [Miniconda](https://docs.anaconda.com/free/miniconda/) nor [Mamba](https://github.com/mamba-org/mamba), have a look here to install [Mamba](https://mamba.readthedocs.io/en/latest/installation/mamba-installation.html).

Given that Mamba is installed, run

```
mamba create -c conda-forge -c bioconda --name snakemake snakemake snakedeploy
```

to install both Snakemake and Snakedeploy in an isolated environment. For all following commands ensure that this environment is activated via

```
conda activate snakemake
```

## Step 2 - deploy workflow

Given that Snakemake and Snakedeploy are installed and available (see Step 1), the workflow can be deployed as follows.

First, create an appropriate project working directory on your system and enter it:

```
mkdir -p path/to/project-workdir
cd path/to/project-workdir
```

In all following steps, we will assume that you are inside of that directory.

Second, run

```
snakedeploy deploy-workflow https://github.com/kullrich/lordec-miniasm . --tag v0.0.1
```

Snakedeploy will create two folders workflow and config. The former contains the deployment of the chosen workflow as a Snakemake module, the latter contains configuration files which will be modified in the next step in order to configure the workflow to your needs. Later, when executing the workflow, Snakemake will automatically find the main Snakefile in the workflow subfolder.

Third, consider to put this directory under version control, e.g. by managing it via a (private) Github repository

### Step 3 - 
