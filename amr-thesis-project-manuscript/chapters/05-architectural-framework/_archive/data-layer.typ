// Section: Data Layer

== Data Layer

The Data Layer is responsible for transforming raw antimicrobial susceptibility testing (AST) data into an analysis-ready feature matrix. It comprises five sequential processing stages.

=== Data Ingestion

Raw CSV files from multiple regional data sources (INOHAC--Project 2) are consolidated into a unified dataset. The ingestion module validates file formats, standardizes column names, and applies isolate code conventions for traceability.

=== Quality Filtering

Records failing quality thresholds are excluded based on:

- minimum antibiotic coverage per isolate (configurable threshold), and
- maximum missing values per isolate.

All filtering decisions are logged in a cleaning report for auditability.

=== Resistance Encoding

Categorical susceptibility values are encoded numerically following CLSI standards:

#figure(
  table(
    columns: 2,
    table.header[*Category*][*Encoded Value*],
    [Susceptible (S)], [0],
    [Intermediate (I)], [1],
    [Resistant (R)], [2],
  ),
  caption: [Resistance Encoding Scheme],
) <tab:resistance-encoding-ch5>

=== Feature Engineering

Beyond basic encoding, the Data Layer computes derived surveillance metrics:

- *MAR Index* (Multiple Antibiotic Resistance): Proportion of antibiotics showing resistance per isolate, calculated as the ratio of resistant antibiotics to total antibiotics tested @krumperman1983mar.
- *MDR Status*: Binary classification indicating multi-drug resistance, defined as resistance to ≥3 antibiotic classes @magiorakos2011mdr. Antibiotic-to-class mappings are defined in the centralized configuration module.

=== Feature--Metadata Separation

Crucially, resistance features and metadata attributes (region, environment, species) are physically separated into distinct matrices:

#figure(
  table(
    columns: 2,
    table.header[*Matrix*][*Contents*],
    [Feature Matrix (*X*)], [Encoded resistance values for 22 antibiotics],
    [Metadata Matrix (*M*)], [Region, site, source category, species, MDR status],
  ),
  caption: [Feature--Metadata Separation],
) <tab:feature-metadata-sep>

This ensures that downstream analytical modules cannot access contextual information that could bias pattern discovery.

// // Mermaid Diagram: Data Layer Processing (for external rendering)
// #raw(
//   block: true,
//   lang: "mermaid",
//   "
// flowchart LR
//     subgraph Input[\"Raw Data\"]
//         CSV[\"Regional CSV Files\"]
//     end

//     subgraph DataLayer[\"Data Layer Processing\"]
//         direction TB
//         ING[\"📥 Data Ingestion\"] --> QF[\"🔍 Quality Filtering\"]
//         QF --> ENC[\"🔢 Resistance Encoding\"]
//         ENC --> FE[\"⚙️ Feature Engineering\"]
//         FE --> SEP[\"📂 Feature-Metadata Separation\"]
//     end

//     subgraph Output[\"Outputs\"]
//         X[\"Feature Matrix (X)\"]
//         M[\"Metadata Matrix (M)\"]
//     end

//     CSV --> ING
//     SEP --> X
//     SEP --> M

//     style Input fill:#ffebee,stroke:#c62828
//     style CSV fill:#fce4ec,stroke:#c2185b
//     style DataLayer fill:#e8f5e9,stroke:#2e7d32
//     style ING fill:#e3f2fd,stroke:#1565c0
//     style QF fill:#e1f5fe,stroke:#01579b
//     style ENC fill:#fff3e0,stroke:#e65100
//     style FE fill:#fff8e1,stroke:#ff8f00
//     style SEP fill:#f3e5f5,stroke:#7b1fa2
//     style Output fill:#e0f2f1,stroke:#00695c
//     style X fill:#ede7f6,stroke:#512da8
//     style M fill:#ede7f6,stroke:#512da8
// ",
// )

// UNCOMMENT AFTER EXPORTING MERMAID DIAGRAM:
#figure(
  image("figures/ch5-data-layer.png", width: 70%),
  caption: [Data Layer Processing Flow],
) <fig:data-layer>

