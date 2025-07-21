# Define SRA accession
SRA = "SRR1972739"

# Rule to download SRA file using prefetch
rule download_sra:
    output:
        f"{SRA}.sra"
    shell:
        "prefetch {output}"

 # Rule to convert SRA to FASTQ using fastq-dump
rule fastq_dump:
    input:
        f"{SRA}.sra"
    output:
        f"results/raw/{SRA}.fastq"
    shell:
        "fastq-dump -x 10000 {input} -O results/raw"

# Rule to run FastQC
rule run_fastqc:
    input:
        f"results/raw/{SRA}.fastq"
    output:
        f"results/qc/{SRA}_fastqc.html"
    shell:
        "fastqc -o results/qc {input}"
