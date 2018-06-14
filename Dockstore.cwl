baseCommand: []
class: CommandLineTool
cwlVersion: v1.0
id: freebayes
inputs:
  bam:
    doc: Sorted aligned BAM
    inputBinding:
      position: 1
      prefix: --bam
    type: File
  bam_bai:
    doc: ''
    inputBinding:
      position: 6
      prefix: --bam_bai
    type: File
  bed:
    doc: BED file indicating regions to process. If unspecified, the whole genome
      would be processed.
    inputBinding:
      position: 4
      prefix: --bed
    type: File?
  freebayes_opts:
    doc: Use this to specify options other than reference, BAMs or BED regions
    inputBinding:
      position: 5
      prefix: --freebayes_opts
    type: string?
  num_threads:
    default: 1
    doc: Number of processes to use for FreeBayes parallelization
    inputBinding:
      position: 7
      prefix: --num_threads
    type: long?
  prefix:
    doc: Output files will be <prefix>.bam, <prefix>.vcf.gz, etc
    inputBinding:
      position: 3
      prefix: --prefix
    type: string
  refname:
    default: hs37d5
    doc: ''
    inputBinding:
      position: 2
      prefix: --refname
    type: string?
label: FreeBayes
outputs:
  variants_vcfgz:
    doc: Output variants as a bgzip-compressed VCF.
    outputBinding:
      glob: variants_vcfgz/*
    type: File
  variants_vcfgztbi:
    doc: Index file for output variants file.
    outputBinding:
      glob: variants_vcfgztbi/*
    type: File
requirements:
- class: DockerRequirement
  dockerOutputDirectory: /data/out
  dockerPull: pfda2dockstore/freebayes:14
s:author:
  class: s:Person
  s:name: Marghoob Mohiyuddin
