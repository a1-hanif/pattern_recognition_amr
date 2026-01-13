// Section: Reproducibility and Experiment Management

== Reproducibility and Experiment Management

Reproducibility is achieved through three complementary mechanisms:

- fixed random seeds for all stochastic operations,
- centralized configuration of parameters and thresholds, and
- persistence of intermediate datasets, models, metrics, and figures.

=== Artifact Persistence

All intermediate outputs are persisted to enable:

- *Partial Re-execution*: Resume from any pipeline stage without recomputation.
- *Auditability*: Trace final results back to intermediate transformations.
- *Comparison*: Compare results across different experimental configurations.

Persisted artifacts include:

#figure(
  table(
    columns: 3,
    table.header[*Artifact Type*][*Format*][*Purpose*],
    [Cleaned datasets], [CSV], [Auditable data lineage],
    [Feature matrices], [CSV], [Input to analysis],
    [Linkage matrices], [pickle], [Clustering structure],
    [Trained models], [joblib], [Model serialization],
    [Metrics], [JSON/CSV], [Performance tracking],
    [Figures], [PNG], [Publication-ready visuals],
  ),
  caption: [Persisted Artifacts],
) <tab:artifacts-ch5>

// // Mermaid Diagram: Reproducibility Mechanisms (for external rendering)
// #raw(
//   block: true,
//   lang: "mermaid",
//   "
// flowchart TB
//     subgraph Reproducibility[\"Reproducibility Mechanisms\"]
//         direction TB

//         subgraph Seeds[\"Fixed Random Seeds\"]
//             S1[\"numpy.random.seed(42)\"]
//             S2[\"sklearn random_state=42\"]
//             S3[\"Consistent initialization\"]
//         end

//         subgraph Config_Rep[\"Centralized Config\"]
//             C1[\"Single config.py file\"]
//             C2[\"All thresholds defined\"]
//             C3[\"Version controlled\"]
//         end

//         subgraph Artifacts_Rep[\"Artifact Persistence\"]
//             A1[\"Datasets (CSV)\"]
//             A2[\"Models (joblib)\"]
//             A3[\"Metrics (JSON)\"]
//             A4[\"Figures (PNG)\"]
//             A5[\"Linkage Matrix (pickle)\"]
//         end
//     end

//     subgraph Benefits[\"Benefits\"]
//         B1[\"Partial re-execution\"]
//         B2[\"Auditability\"]
//         B3[\"Experiment comparison\"]
//         B4[\"Independent replication\"]
//     end

//     Seeds --> Benefits
//     Config_Rep --> Benefits
//     Artifacts_Rep --> Benefits

//     style Reproducibility fill:#e8f5e9,stroke:#2e7d32
//     style Seeds fill:#fff3e0,stroke:#e65100
//     style S1 fill:#ffe0b2,stroke:#f57c00
//     style S2 fill:#ffe0b2,stroke:#f57c00
//     style S3 fill:#ffe0b2,stroke:#f57c00
//     style Config_Rep fill:#e3f2fd,stroke:#1565c0
//     style C1 fill:#bbdefb,stroke:#1976d2
//     style C2 fill:#bbdefb,stroke:#1976d2
//     style C3 fill:#bbdefb,stroke:#1976d2
//     style Artifacts_Rep fill:#f3e5f5,stroke:#7b1fa2
//     style A1 fill:#e1bee7,stroke:#8e24aa
//     style A2 fill:#e1bee7,stroke:#8e24aa
//     style A3 fill:#e1bee7,stroke:#8e24aa
//     style A4 fill:#e1bee7,stroke:#8e24aa
//     style A5 fill:#e1bee7,stroke:#8e24aa
//     style Benefits fill:#e0f2f1,stroke:#00695c
//     style B1 fill:#b2dfdb,stroke:#00897b
//     style B2 fill:#b2dfdb,stroke:#00897b
//     style B3 fill:#b2dfdb,stroke:#00897b
//     style B4 fill:#b2dfdb,stroke:#00897b
// ",
// )

// UNCOMMENT AFTER EXPORTING MERMAID DIAGRAM:
#figure(
  image("figures/ch5-reproducibility.png", width: 70%),
  caption: [Reproducibility Mechanisms],
) <fig:reproducibility>
