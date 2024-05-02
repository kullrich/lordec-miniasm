# lordec-miniasm

# Description

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

## Step 3 - configure workflow

### General settings

To configure this workflow, modify config/config.yaml according to your needs, following the explanations provided in the file.

### Sample sheet

Add samples to config/samples.tsv. For each sample, the columns sample_name, platform, and group have to be defined.

    Samples within the same group will be called jointly.
    The platform column needs to contain the used sequencing plaform ('illumina','nanopore'). Note that Illumina data is supplementary, i.e. circles will only be called for sample groups that have at at least 'nanopore' as their platform.

Missing values can be specified by empty columns or by writing NA. Lines can be commented out with #.

### Unit sheet

For each sample, add one or more sequencing units (runs, lanes or replicates) to the unit sheet config/units.tsv.

    Each unit has a unit name, which can be e.g. a running number, or an actual run, lane or replicate id.
    Each unit has a sample name, which associates it with the biological sample it comes from.
    For each unit, define either one (column fq1) or two (columns fq1, fq2) FASTQ files (these can point to anywhere in your system).
    Alternatively, you can define an SRA (sequence read archive) accession (starting with e.g. ERR or SRR) by using a column sra. In the latter case, the pipeline will automatically download the corresponding paired end reads from SRA. If both local files and SRA accession are available, the local files will be preferred.

Missing values can be specified by empty columns or by writing NA. Lines can be commented out with #.

## Step 4 - run workflow

 Given that the workflow has been properly deployed and configured, it can be executed as follows.

Fow running the workflow while deploying any necessary software via conda (using the Mamba package manager by default), run Snakemake with

```
snakemake --cores all --use-conda 
```

Snakemake will automatically detect the main Snakefile in the workflow subfolder and execute the workflow module that has been defined by the deployment in step 2.

For further options, e.g. for cluster and cloud execution, see the docs. 

## Step 5 - generate report
