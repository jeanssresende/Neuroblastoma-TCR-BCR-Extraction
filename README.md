TCR/BCR Extraction from Neuroblastoma RNA-Seq Data
<div align="center">

https://img.shields.io/badge/Status-In%20Progress-yellow?style=for-the-badge
https://img.shields.io/badge/Analysis-TCR%20%7C%20BCR-brightgreen?style=for-the-badge
https://img.shields.io/badge/Dataset-Neuroblastoma-blue?style=for-the-badge
https://img.shields.io/badge/Tools-MiXCR%20%7C%20TRUST4-purple?style=for-the-badge
https://img.shields.io/badge/Language-Python%20%7C%20Bash-red?style=for-the-badge
https://img.shields.io/badge/License-MIT-success?style=for-the-badge

</div>

📖 Overview
This repository contains a complete workflow for extracting T-cell receptor (TCR) and B-cell receptor (BCR) repertoires from Neuroblastoma RNA-Seq data using two widely adopted tools:

MiXCR (alignment-based extraction)

TRUST4 (assembly-based extraction)

The goal is to generate clonotype tables, CDR3 sequences, V(D)J gene usage, and immune repertoire metrics that can be integrated with downstream biological analyses.

This is not a benchmarking study.
The tools are used complementarily to maximize clonotype recovery and biological insight.

🎯 Objectives
Extract TCR and BCR clonotypes from Neuroblastoma RNA-Seq samples

Generate clonotype frequency tables and CDR3 sequences

Quantify V/J gene usage

Compare outputs between MiXCR and TRUST4 for biological interpretation

Integrate repertoire metrics with tumor phenotypes or expression signatures

Provide reproducible pipelines for future datasets

📂 Repository Structure
text
Neuroblastoma-TCR-BCR-Extraction/
│
├── README.md
├── LICENSE
├── .gitignore
├── environment.yml
│
├── data/
│   ├── raw/                     # Raw FASTQ or BAM files
│   ├── processed/
│   │   ├── mixcr_output/
│   │   ├── trust4_output/
│   │   └── merged/
│   └── metadata/
│       └── sample_metadata.csv
│
├── scripts/
│   ├── 01_preprocessing.sh      # QC, trimming, alignment (optional)
│   ├── 02_mixcr_tcr.sh          # MiXCR TCR extraction
│   ├── 03_mixcr_bcr.sh          # MiXCR BCR extraction
│   ├── 04_trust4_tcr.sh         # TRUST4 TCR extraction
│   ├── 05_trust4_bcr.sh         # TRUST4 BCR extraction
│   ├── 06_merge_results.py      # Merge MiXCR + TRUST4 outputs
│   ├── 07_repertoire_metrics.py # Diversity, clonality, V/J usage
│   └── 08_visualization.py      # Plots and summaries
│
├── results/
│   ├── clonotypes/
│   ├── gene_usage/
│   ├── diversity/
│   └── visualizations/
│
└── docs/
    ├── INSTALLATION.md
    ├── USAGE.md
    └── METHODS.md
🔬 Tools & Versions
Tool	Version	Purpose
MiXCR	4.3.2	TCR/BCR extraction (alignment-based)
TRUST4	1.1.7	TCR/BCR extraction (assembly-based)
FastQC	Latest	Quality control
STAR	2.7.x	RNA-Seq alignment (optional)
Python	3.10+	Analysis & visualization
R	4.2+	Statistical analysis


🚀 Quick Start
Installation
bash
git clone https://github.com/yourusername/Neuroblastoma-TCR-BCR-Extraction.git
cd Neuroblastoma-TCR-BCR-Extraction
conda env create -f environment.yml
conda activate neuroblastoma-repertoire
Run MiXCR (TCR)
bash
bash scripts/02_mixcr_tcr.sh sample.fastq.gz
Run TRUST4 (TCR)
bash
bash scripts/04_trust4_tcr.sh sample.fastq.gz
Merge Results
bash
python scripts/06_merge_results.py
📊 Expected Outputs
Clonotype tables (TCRβ, TCRα, BCR heavy/light chains)

CDR3 amino acid sequences

V/J gene usage matrices

Diversity metrics (Shannon, Simpson, clonality)

Plots:

V/J usage heatmaps

Clonotype frequency distributions

Diversity comparisons

Overlap between MiXCR and TRUST4

👨‍🔬 Author
Jean Resende  
PhD Student in Biotechnology | Bioinformatics
Immunoinformatics • TCR/BCR Analysis • RNA-Seq • ACC & Neuroblastoma Research

📄 License
MIT License — see LICENSE file.
