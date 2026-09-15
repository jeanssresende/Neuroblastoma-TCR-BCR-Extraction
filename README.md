# TCR/BCR Extraction from Neuroblastoma RNA-Seq Data

<div align="center">

<div align="center">

![Status](https://img.shields.io/badge/Status-In%20Progress-yellow?style=for-the-badge)
![Research](https://img.shields.io/badge/Research-Neuroblastoma-red?style=for-the-badge)
![Analysis](https://img.shields.io/badge/Analysis-TCR%20%7C%20BCR-blueviolet?style=for-the-badge)
![MiXCR](https://img.shields.io/badge/MiXCR-4.3.2-orange?style=for-the-badge)
![TRUST4](https://img.shields.io/badge/TRUST4-1.1.7-purple?style=for-the-badge)
![R](https://img.shields.io/badge/R-%3E%3D4.2-276DC3?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-success?style=for-the-badge)

</div>

</div>

---

## 📖 Overview

This repository contains a reproducible workflow for extracting **T-cell receptor (TCR)** and **B-cell receptor (BCR)** repertoires from **Neuroblastoma RNA-Seq data** using two widely adopted repertoire extraction tools:

* **MiXCR** — alignment-based repertoire extraction
* **TRUST4** — assembly-based repertoire reconstruction

The workflow is designed to generate comprehensive immune repertoire profiles from RNA-Seq data, including:

* TCR and BCR clonotype tables
* CDR3 amino acid and nucleotide sequences
* V(D)J gene usage profiles
* Clonotype frequencies and abundance distributions
* Repertoire diversity and clonality metrics
* Visualization of immune repertoire features
* Optional comparison of results obtained with MiXCR and TRUST4

The two tools are used **complementarily**, allowing the recovery and characterization of immune receptor sequences using different computational strategies.

---

## 🎯 Objectives

The main objectives of this project are to:

1. Extract TCR and BCR clonotypes from Neuroblastoma RNA-Seq samples.
2. Recover CDR3 amino acid and nucleotide sequences.
3. Quantify V/J gene usage across TCR and BCR chains.
4. Characterize clonotype frequencies and abundance distributions.
5. Calculate repertoire diversity and clonality metrics.
6. Integrate repertoire features with tumor phenotypes and/or gene-expression signatures.
7. Compare and integrate complementary results from MiXCR and TRUST4.
8. Provide reproducible pipelines that can be applied to additional datasets.

---

## 🔬 Key Features

### Repertoire Extraction

The workflow supports extraction of:

* TCR α chain (`TRA`)
* TCR β chain (`TRB`)
* BCR heavy chains (`IGH`)
* BCR light chains (`IGK`, `IGL`)

### Sequence-Level Outputs

The pipeline generates:

* CDR3 amino acid sequences
* CDR3 nucleotide sequences
* V gene assignments
* J gene assignments
* C gene assignments when available
* Clonotype frequencies
* Read/support counts

### Repertoire-Level Analysis

Planned downstream analyses include:

* Shannon diversity
* Simpson diversity
* Clonality
* Richness
* Evenness
* V/J gene usage
* Clonotype abundance distributions
* Expanded clonotype identification

### Comparative Analysis

When applicable, MiXCR and TRUST4 results can be compared to evaluate:

* Shared clonotypes
* Tool-specific clonotypes
* CDR3 sequence overlap
* Chain recovery
* V/J gene assignment concordance

---

## 📂 Repository Structure

```text
Neuroblastoma-TCR-BCR-Extraction/
│
├── README.md
├── LICENSE
├── .gitignore
├── environment.yml
├── requirements.txt
│
├── data/
│   ├── raw/
│   │   └── # Raw FASTQ/BAM files
│   │
│   ├── processed/
│   │   ├── mixcr_output/
│   │   ├── trust4_output/
│   │   └── merged/
│   │
│   └── metadata/
│       └── sample_metadata.csv
│
├── scripts/
│   ├── 01_preprocessing.sh
│   ├── 02_mixcr_tcr.sh
│   ├── 03_mixcr_bcr.sh
│   ├── 04_trust4_tcr.sh
│   ├── 05_trust4_bcr.sh
│   ├── 06_merge_results.py
│   ├── 07_repertoire_metrics.py
│   └── 08_visualization.py
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
```

---

## 🚧 Project Status

| Component                     |     Status     | Notes                                           |
| ----------------------------- | :------------: | ----------------------------------------------- |
| 🧬 TCR Extraction — MiXCR     | 🟡 In Progress | Initial runs completed                          |
| 🧬 BCR Extraction — MiXCR     | 🟡 In Progress | Heavy/light chain processing                    |
| 🧬 TCR Extraction — TRUST4    | 🟡 In Progress | Assembly-based extraction                       |
| 🧬 BCR Extraction — TRUST4    | 🟡 In Progress | Chain reconstruction                            |
| 📊 Diversity Metrics          |    ⏳ Planned   | Shannon, Simpson, clonality                     |
| 🔥 V/J Gene Usage             |    ⏳ Planned   | Frequency tables and heatmaps                   |
| 📈 Visualizations             |    ⏳ Planned   | Clonotype distributions and repertoire profiles |
| 🔗 MiXCR × TRUST4 Integration |    ⏳ Planned   | Overlap and concordance analysis                |
| 💻 Analysis Scripts           | 🟡 In Progress | Bash and Python workflows                       |
| 📑 Documentation              |    ⏳ Planned   | Installation, methods and usage guides          |

---

## 🧬 Workflow

The general workflow is organized into the following stages:

```text
RNA-Seq Data
     │
     ▼
Quality Control
     │
     ▼
Optional Trimming
     │
     ▼
TCR/BCR Extraction
     │
     ├───────────────┐
     ▼               ▼
   MiXCR          TRUST4
     │               │
     └───────┬───────┘
             ▼
      Result Integration
             │
             ▼
     Clonotype Analysis
             │
       ┌─────┴─────┐
       ▼           ▼
   Gene Usage   Diversity
       │           │
       └─────┬─────┘
             ▼
      Visualization
             │
             ▼
    Biological Interpretation
```

---

## 🛠️ Tools & Versions

| Tool       | Version | Purpose                                  |
| ---------- | ------: | ---------------------------------------- |
| **MiXCR**  |   4.3.2 | Alignment-based TCR/BCR extraction       |
| **TRUST4** |   1.1.7 | Assembly-based repertoire reconstruction |
| **FastQC** |  Latest | Sequencing quality control               |
| **STAR**   |   2.7.x | RNA-Seq alignment (optional)             |
| **Python** |  ≥ 3.10 | Data processing and visualization        |
| **R**      |   ≥ 4.2 | Statistical analysis                     |
| **Conda**  |  Latest | Environment management                   |

---

## 🚀 Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/jeanssresende/Neuroblastoma-TCR-BCR-Extraction.git

cd Neuroblastoma-TCR-BCR-Extraction
```

### 2. Create the Conda environment

```bash
conda env create -f environment.yml

conda activate neuroblastoma-repertoire
```

### 3. Install Python dependencies

```bash
pip install -r requirements.txt
```

---

## ▶️ Running the Extraction Pipelines

### MiXCR — TCR

```bash
bash scripts/02_mixcr_tcr.sh sample.fastq.gz
```

### MiXCR — BCR

```bash
bash scripts/03_mixcr_bcr.sh sample.fastq.gz
```

### TRUST4 — TCR

```bash
bash scripts/04_trust4_tcr.sh sample.fastq.gz
```

### TRUST4 — BCR

```bash
bash scripts/05_trust4_bcr.sh sample.fastq.gz
```

---

## 🔗 Merge Results

After completing the extraction steps, MiXCR and TRUST4 outputs can be integrated using:

```bash
python scripts/06_merge_results.py
```

The resulting files are stored in:

```text
data/processed/merged/
```

---

## 📊 Repertoire Analysis

Diversity and repertoire-level metrics can be calculated using:

```bash
python scripts/07_repertoire_metrics.py
```

Expected metrics include:

* Shannon diversity
* Simpson diversity
* Clonality
* Richness
* Evenness
* Clonotype abundance

---

## 📈 Visualization

Generate repertoire plots using:

```bash
python scripts/08_visualization.py
```

Expected visualizations include:

* Clonotype frequency distributions
* V/J gene usage heatmaps
* Diversity comparisons
* Expanded clonotype profiles
* CDR3 length distributions
* MiXCR × TRUST4 overlap plots

---

## 📊 Expected Outputs

### Figures

The project is expected to generate:

* Clonotype frequency distributions
* V/J gene usage heatmaps
* Repertoire diversity plots
* Clonality profiles
* CDR3 length distributions
* MiXCR × TRUST4 overlap plots
* Chain-specific repertoire summaries

### Data Tables

Expected tables include:

* TCR clonotype tables
* BCR clonotype tables
* CDR3 sequences
* V/J gene usage matrices
* Clonotype frequencies
* Diversity metrics
* Integrated MiXCR/TRUST4 results

---

## 🧪 Data Organization

Raw sequencing data should be placed in:

```text
data/raw/
```

Processed results should be organized under:

```text
data/processed/
```

Sample-level metadata should be provided in:

```text
data/metadata/sample_metadata.csv
```

A recommended metadata structure is:

```text
sample_id,patient_id,tumor_type,age,sex
sample01,patient01,Neuroblastoma,5,M
sample02,patient02,Neuroblastoma,7,F
```

> **Note:** Raw sequencing data should not be committed to GitHub. Large files and sensitive patient-level data should be stored separately.

---

## 📅 Roadmap

* [x] Create GitHub repository
* [x] Define TCR/BCR extraction workflow
* [ ] Run MiXCR on Neuroblastoma samples
* [ ] Run TRUST4 on Neuroblastoma samples
* [ ] Integrate clonotype outputs
* [ ] Compute repertoire diversity metrics
* [ ] Analyze V/J gene usage
* [ ] Generate repertoire visualizations
* [ ] Perform biological interpretation
* [ ] Complete documentation
* [ ] Prepare manuscript
* [ ] Publish results

---

## 📚 Documentation

Additional documentation will be provided in the `docs/` directory:

* [`INSTALLATION.md`](docs/INSTALLATION.md) — Installation and environment setup
* [`USAGE.md`](docs/USAGE.md) — Pipeline usage and examples
* [`METHODS.md`](docs/METHODS.md) — Computational methodology and analysis strategy

---

## 📖 Citation

Citation information will be added after publication.

If you use this repository or workflow in your research before publication, please contact the authors for appropriate citation information.

---

## 👨‍🔬 Author

**Jean Resende**

PhD Student in Biotechnology | Bioinformatics

**Research interests:**
Immunoinformatics • TCR/BCR Repertoire Analysis • RNA-Seq • Cancer Bioinformatics • Neuroblastoma Research

---

## 📄 License

This project is distributed under the **MIT License**.

See the [`LICENSE`](LICENSE) file for details.

---

<div align="center">

**Neuroblastoma • Immunoinformatics • TCR/BCR Repertoire Analysis**

</div>
