# Define SRA accession
SRA = "SRR1972739"

# Rule to download SRA file using prefetch
rule download_sra:
    output:
        f"{SRA}.sra"
    shell:
        "prefetch {output}"
