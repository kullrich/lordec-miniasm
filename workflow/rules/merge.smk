def get_fastqs(wildcards):
    if wildcards.read == "single":
        fq1 = units.loc[wildcards.sample]["fq1"]
        return list(fq1)
    elif wildcards.read == "R1":
        fq1 = units.loc[wildcards.sample]["fq1"]
        return list(fq1)
    elif wildcards.read == "R2":
        fq2 = units.loc[wildcards.sample]["fq2"]
        return list(fq2)
