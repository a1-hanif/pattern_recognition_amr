// Section: Architectural Design Goals

== Architectural Design Goals

The architecture was guided by five primary design goals: modularity, reproducibility, leakage prevention, interpretability, and experimental control. These goals reflect both software engineering best practices and methodological requirements specific to unsupervised and supervised machine learning workflows.

#figure(
  table(
    columns: 2,
    table.header[*Design Goal*][*Description*],
    [*Modularity*], [Loosely coupled components with clear responsibilities; independent replacement capability],
    [*Reproducibility*], [Centralized configuration, fixed random seeds, artifact persistence],
    [*Leakage Prevention*], [Train-test separation, feature-metadata boundary, fit-on-train only],
    [*Interpretability*], [Traceable assignments, feature importance, metadata post-hoc only],
    [*Experimental Control*], [Single config source, systematic comparison, baseline consistency],
  ),
  caption: [Architectural Design Goals],
) <tab:design-goals>

// // Mermaid Diagram: Design Goals (for external rendering)
// #raw(
//   block: true,
//   lang: "mermaid",
//   "
// flowchart TB
//     subgraph Goals[\"Architectural Design Goals\"]
//         direction TB
//         M[\"🧩 Modularity\"]
//         R[\"🔄 Reproducibility\"]
//         L[\"🛡️ Leakage Prevention\"]
//         I[\"🔍 Interpretability\"]
//         E[\"⚙️ Experimental Control\"]
//     end

//     subgraph Modularity_Details[\"Modularity\"]
//         M1[\"Loosely coupled components\"]
//         M2[\"Clear responsibilities\"]
//         M3[\"Independent replacement\"]
//     end

//     subgraph Reproducibility_Details[\"Reproducibility\"]
//         R1[\"Centralized configuration\"]
//         R2[\"Fixed random seeds\"]
//         R3[\"Artifact persistence\"]
//     end

//     subgraph Leakage_Details[\"Leakage Prevention\"]
//         L1[\"Train-test separation\"]
//         L2[\"Feature-metadata boundary\"]
//         L3[\"Fit-on-train only\"]
//     end

//     M --> Modularity_Details
//     R --> Reproducibility_Details
//     L --> Leakage_Details

//     style Goals fill:#e8eaf6,stroke:#3f51b5
//     style M fill:#e3f2fd,stroke:#1565c0
//     style R fill:#e8f5e9,stroke:#2e7d32
//     style L fill:#ffebee,stroke:#c62828
//     style I fill:#fff3e0,stroke:#e65100
//     style E fill:#f3e5f5,stroke:#7b1fa2
//     style Modularity_Details fill:#e1f5fe,stroke:#01579b
//     style M1 fill:#b3e5fc,stroke:#0288d1
//     style M2 fill:#b3e5fc,stroke:#0288d1
//     style M3 fill:#b3e5fc,stroke:#0288d1
//     style Reproducibility_Details fill:#c8e6c9,stroke:#388e3c
//     style R1 fill:#a5d6a7,stroke:#43a047
//     style R2 fill:#a5d6a7,stroke:#43a047
//     style R3 fill:#a5d6a7,stroke:#43a047
//     style Leakage_Details fill:#ffcdd2,stroke:#e53935
//     style L1 fill:#ef9a9a,stroke:#e57373
//     style L2 fill:#ef9a9a,stroke:#e57373
//     style L3 fill:#ef9a9a,stroke:#e57373
// ",
// )

// UNCOMMENT AFTER EXPORTING MERMAID DIAGRAM:
#figure(
  image("figures/ch5-design-goals.png", width: 70%),
  caption: [Architectural Design Goals Flowchart],
) <fig:design-goals>

=== Modularity

The system is decomposed into discrete, loosely coupled components with clearly defined responsibilities. Each module can be modified or replaced without affecting unrelated parts of the pipeline. For example, alternative clustering strategies can be introduced without modifying data ingestion or visualization logic.

=== Reproducibility

Reproducibility is ensured through:

- centralized configuration of all parameters,
- fixed random seeds for stochastic processes, and
- persistence of intermediate artifacts at every transformation stage.

These mechanisms ensure that experimental results can be independently replicated under identical conditions.

=== Leakage Prevention

The architecture enforces strict separation between training and evaluation data. Train--test splitting occurs before any preprocessing steps, and all preprocessing parameters are learned exclusively from training data. This separation is enforced structurally through module boundaries rather than relying on procedural discipline alone.

=== Interpretability

Interpretability is supported by:

- traceable cluster assignments,
- explicit feature importance extraction, and
- separation between pattern discovery and domain interpretation.

Metadata is intentionally excluded from clustering and validation processes and is introduced only during post-hoc visualization.

=== Experimental Control

All experimental parameters are defined in a centralized configuration module, enabling systematic comparison of alternative settings while maintaining consistent baselines. Intermediate artifacts are preserved to allow retrospective analysis without recomputation.
