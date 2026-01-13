// Detailed Architecture - Summary and Contributions

== Architectural Contributions

The AMR Pattern Recognition System's architecture makes five key contributions:

=== Methodological Rigor

Explicit leakage prevention protocols (split-before-transform, fit-on-train-only) ensure valid performance estimates and prevent overfitting. Structural enforcement through module boundaries prevents accidental data contamination.

=== Reproducibility

Artifact-based communication, configuration management, and comprehensive logging enable exact replication of analyses, supporting scientific transparency and audit requirements.

#figure(
  table(
    columns: 2,
    table.header[*Reproducibility Feature*][*Implementation*],
    [Fixed Random Seeds], [RANDOM_STATE = 42 across all stochastic operations],
    [Centralized Configuration], [Single `config.py` parameter source],
    [Artifact Persistence], [CSV, joblib, JSON, PNG outputs at every stage],
    [Version Control], [Git integration for code and configuration tracking],
  ),
  caption: [Reproducibility Mechanisms],
) <tab:reproducibility-mechanisms>

=== Modularity

Loosely coupled components enable independent development, testing, and replacement without cascading changes. For example, alternative clustering algorithms can be substituted by modifying only the clustering module.

=== Interpretability

Statistical validation, feature importance analysis, and clinical profiling ensure results are explainable to non-technical stakeholders. The separation between pattern discovery (unsupervised) and validation (supervised) provides dual evidence for biological significance.

=== Operationalizability

The dual-mode architecture (offline batch processing + interactive dashboard) bridges research and clinical practice, enabling translation from academic findings to actionable insights.

== Architectural Decisions and Constraints

Key architectural decisions were explicitly made to enforce methodological rigor:

#figure(
  table(
    columns: 3,
    table.header[*Decision*][*Goal Supported*][*Constraint*],
    [Clustering–Visualization Separation], [Reproducibility, Interpretability], [Artifact-based communication],
    [Centralized Configuration], [Reproducibility, Control], [Single parameter source (`config.py`)],
    [Feature–Metadata Boundary], [Leakage Prevention], [Interface-level separation],
    [Artifact Persistence], [Reproducibility, Modularity], [File-based outputs (CSV, PNG, joblib)],
    [Unified CLI], [Reproducibility, Control], [Single entry point (`main.py`)],
    [Species-Specific MDR Mappings], [Interpretability], [Configurable class definitions],
  ),
  caption: [Key Architectural Decisions],
) <tab:architectural-decisions-detailed>

== System Outputs

The implemented system successfully processes INOHAC–Project 2 AST data (491 isolates, 22 antibiotics) and produces:

#figure(
  table(
    columns: 2,
    table.header[*Output Type*][*Files Generated*],
    [Processed Data], [`cleaned_dataset.csv`, `encoded_dataset.csv`, `clustered_dataset.csv`],
    [Clustering Results], [4 clusters (Silhouette=0.466), `cluster_summary_table.csv`],
    [ML Models], [`cluster_classifier.joblib` (99% accuracy)],
    [Visualizations], [41 figures (dendrograms, heatmaps, PCA plots, networks)],
    [Statistical Reports], [Co-resistance matrix, chi-square results],
  ),
  caption: [System Output Artifacts],
) <tab:system-outputs>

== Chapter Summary

This detailed architectural documentation presented the complete, implemented AMR pattern recognition system for the Water–Fish–Human nexus. The architecture enforces separation between preprocessing, analysis, validation, and interpretation, while explicitly addressing machine learning–specific risks such as data leakage and irreproducibility.

=== Key Architectural Principles

1. *Layered Architecture:* Clear separation of Data, Analysis, and Presentation layers with artifact-based communication
2. *Leakage Prevention:* Structural enforcement of train–test separation and feature–metadata boundaries
3. *Reproducibility:* Centralized configuration, fixed random seeds, comprehensive artifact persistence
4. *Interpretability:* Explicit separation between pattern discovery and domain interpretation
5. *Experimental Control:* Unified CLI orchestration and single-source configuration management

The architecture ensures reproducibility through explicit artifact persistence and maintains data lineage for audit trails, supporting surveillance-oriented pattern recognition research. The dual-mode deployment (batch analysis + interactive dashboard) enables both research and clinical applications, demonstrating the feasibility of translating computational AMR surveillance into practice.
