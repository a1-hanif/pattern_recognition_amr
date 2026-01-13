// Section: High-Level System Architecture

== High-Level System Architecture

At the system level, execution is orchestrated through a unified command-line interface (`main.py`). All pipeline operations---data processing, analysis, validation, visualization, and dashboard deployment---are invoked via explicit CLI flags.

#figure(
  table(
    columns: 2,
    table.header[*CLI Flag*][*Description*],
    [`--pipeline`], [Execute full data preprocessing and clustering pipeline],
    [`--validate`], [Run supervised validation and stability checks],
    [`--analyze`], [Perform post-hoc statistical and regional analyses],
    [`--viz`], [Generate all figures and plots],
    [`--app`], [Launch interactive Streamlit dashboard],
    [`--all`], [Run everything in sequence],
  ),
  caption: [CLI Orchestration Commands],
) <tab:cli-commands>

This orchestration design ensures:

- consistent initialization across experiments,
- prevention of partial or misconfigured execution, and
- reproducible experiment setup.

Each layer communicates only through persisted artifacts or structured outputs, preventing hidden state sharing.

=== Configuration Module

All configurable parameters are defined in a single configuration module (`config.py`):

#figure(
  table(
    columns: 2,
    table.header[*Category*][*Parameters*],
    [Path Definitions], [PROJECT_ROOT, DATA_DIR, PROCESSED_DIR, FIGURES_DIR, MODELS_DIR],
    [Reproducibility], [RANDOM_STATE = 42],
    [Data Cleaning], [MIN_ANTIBIOTIC_COVERAGE, MAX_ISOLATE_MISSING],
    [Antibiotic Classes], [ANTIBIOTIC_CLASSES dict, MDR_CLASSES_BY_SPECIES dict],
    [Clustering], [Linkage Method, Distance Metric, K-Selection Criteria],
    [Machine Learning], [Train-Test Split Ratio, CV Folds, Model Parameters],
  ),
  caption: [Configuration Module Parameters],
) <tab:config-params>

// // Mermaid Diagram: High-Level System Architecture (for external rendering)
// #raw(
//   block: true,
//   lang: "mermaid",
//   "
// flowchart TB
//     subgraph CLI[\"CLI Orchestrator (main.py)\"]
//         direction LR
//         F1[\"--pipeline\"]
//         F2[\"--validate\"]
//         F3[\"--analyze\"]
//         F4[\"--viz\"]
//         F5[\"--app\"]
//     end

//     subgraph Config[\"Configuration Module\"]
//         CFG[\"config.py<br/>Random Seed: 42<br/>Thresholds<br/>Class Mappings<br/>Path Definitions\"]
//     end

//     subgraph Pipeline[\"Core Pipeline\"]
//         direction TB
//         ING[\"Data Ingestion\"] --> CLN[\"Data Cleaning\"]
//         CLN --> ENC[\"Resistance Encoding\"]
//         ENC --> FE[\"Feature Engineering<br/>(MAR, MDR)\"]
//         FE --> CLU[\"Hierarchical Clustering\"]
//         CLU --> VAL[\"Supervised Validation\"]
//         VAL --> VIZ[\"Visualization\"]
//     end

//     subgraph Outputs[\"Persisted Artifacts\"]
//         direction TB
//         O1[\"Datasets (CSV)\"]
//         O2[\"Figures (PNG)\"]
//         O3[\"Models (joblib)\"]
//         O4[\"Metrics (JSON)\"]
//     end

//     CLI --> Config
//     Config --> Pipeline
//     Pipeline --> Outputs

//     style CLI fill:#fff9c4,stroke:#f57f17
//     style F1 fill:#fff8e1,stroke:#ff8f00
//     style F2 fill:#fff8e1,stroke:#ff8f00
//     style F3 fill:#fff8e1,stroke:#ff8f00
//     style F4 fill:#fff8e1,stroke:#ff8f00
//     style F5 fill:#fff8e1,stroke:#ff8f00
//     style Config fill:#e8eaf6,stroke:#3f51b5
//     style CFG fill:#e1f5fe,stroke:#01579b
//     style Pipeline fill:#e8f5e9,stroke:#2e7d32
//     style ING fill:#c8e6c9,stroke:#388e3c
//     style CLN fill:#c8e6c9,stroke:#388e3c
//     style ENC fill:#c8e6c9,stroke:#388e3c
//     style FE fill:#c8e6c9,stroke:#388e3c
//     style CLU fill:#c8e6c9,stroke:#388e3c
//     style VAL fill:#c8e6c9,stroke:#388e3c
//     style VIZ fill:#c8e6c9,stroke:#388e3c
//     style Outputs fill:#fce4ec,stroke:#c2185b
//     style O1 fill:#f8bbd9,stroke:#d81b60
//     style O2 fill:#f8bbd9,stroke:#d81b60
//     style O3 fill:#f8bbd9,stroke:#d81b60
//     style O4 fill:#f8bbd9,stroke:#d81b60
// ",
// )

// UNCOMMENT AFTER EXPORTING MERMAID DIAGRAM:
#figure(
  image("figures/ch5-high-level-architecture.png", width: 80%),
  caption: [High-Level System Architecture],
) <fig:high-level-architecture>
