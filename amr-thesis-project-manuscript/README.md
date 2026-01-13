# AMR Thesis Manuscript

**Machine Learning-Based Antimicrobial Resistance Pattern Recognition in Environmental Bacterial Isolates from the Philippines**

A Typst-based thesis manuscript for antimicrobial resistance (AMR) pattern analysis using unsupervised machine learning techniques.

## 📁 Project Structure

```
amr-thesis-project-manuscript/
├── main.typ                    # Entry point - compile this file
├── main.pdf                    # Compiled thesis document
├── template.typ                # Document styling and formatting
├── references.bib              # Bibliography (~200+ citations)
├── chapters/
│   ├── 00-front-matter/        # Title page, abstract, TOC, etc.
│   ├── 01-introduction/        # Background, objectives, significance
│   ├── 02-literature-review/   # Related studies and concepts
│   ├── 03-theoretical-framework/  # Primary foundations, conceptual framework
│   ├── 04-methodology/         # Research design, phases 1-5
│   ├── 05-architectural-framework/  # System architecture, layers, deployment
│   ├── 06-results-discussion/  # Clustering results, validation, discussion
│   └── 07-conclusion/          # Conclusions, recommendations, future work
├── appendices/
│   ├── appendix-a.typ
│   └── appendix-b.typ
└── figures/
    ├── mermaid/                # Mermaid source files
    ├── rendered/               # Rendered diagrams
    └── screenshots/            # System screenshots
```

## 🔬 Research Overview

This thesis investigates antimicrobial resistance patterns in 491 bacterial isolates collected from environmental sources across three Philippine regions:

- **BARMM** (Bangsamoro Autonomous Region in Muslim Mindanao)
- **Region III** (Central Luzon)
- **Region VIII** (Eastern Visayas)

### Key Features

- **Hierarchical Clustering** with Ward's linkage method
- **PCA** for dimensionality reduction (61.2% variance explained with 4 components)
- **4 distinct resistance clusters** identified (k=4)
- **Silhouette score**: 0.466
- **Random Forest validation**: 99.0% accuracy (macro F1 = 0.96)

## 🚀 Compilation

1. **Install Typst**:

   ```bash
   winget install --id Typst.Typst
   ```

2. **Compile the thesis**:

   ```bash
   typst compile main.typ
   ```

3. **Watch for changes**:
   ```bash
   typst watch main.typ
   ```

## 📊 Related Repository

The computational analysis code is available at:

- [amr-thesis-project-main](https://github.com/queshue134-eng/amr-thesis-project-main)

## 📖 Citation Format

Uses BibTeX format with 200+ academic references covering:

- Antimicrobial resistance surveillance
- Machine learning in healthcare
- Clustering methodologies
- Philippine AMR studies
