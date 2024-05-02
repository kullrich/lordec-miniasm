rule merge_fastqs:
    input:
        fastqs=get_fastqs,
    output:
        "results/merged_fastqs/{sample}_{read}.fastq.gz",
    log:
        "logs/merge-fastqs/{sample}_{read}.log",
    wildcard_constraints:
        read="single|R1|R2",
    params:
        cmd=lambda wc: (
            "pigz -dc"
            if (any(map(lambda f: f.endswith(".gz"), get_fastqs(wc))))
            else "cat"
        ),
    conda:
        "../envs/pigz.yaml"
    shell:
        """{params.cmd} {input.fastqs} | pigz -c > {output} 2> {log}"""
