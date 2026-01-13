// Appendix B

== Appendix B. Data Availability & Reproducibility

This research encompasses a comprehensive data science pipeline for AMR surveillance. The full source code, datasets, and documentation are available in the project repository.

=== Project Codebase

The analytical pipeline (`amr_thesis_project_code`) implements the following phases:

- *Data Processing*: Ingestion, cleaning, encoding, and feature engineering of environmental and clinical isolate data.
- *Unsupervised Learning*: Hierarchical clustering to identify resistance patterns.
- *Supervised Learning*: Random Forest models for pattern discrimination.
- *Visualization*: Generation of heatmaps, dendrograms, and PCAs.
- *Interactive Dashboard*: A Streamlit application for exploring results.

=== Directory Structure

The project is organized as follows:

- `src/`: Core source code for preprocessing, clustering, and analysis.
- `data/`: Contains raw CSV inputs and processed outputs.
- `experiments/`: Output logs and artifacts from model runs.
- `figures/`: Generated visualizations used in this manuscript.
- `docs/`: Technical references and user manuals.

=== Data Sources

The antimicrobial susceptibility testing (AST) data used in this study was collected and provided by the *INOHAC AMR Project Two* research team. The dataset comprises bacterial isolates from the Water-Fish-Human nexus across three Philippine regions.
