// Section: Data Flow and Control Flow

== Data Flow and Control Flow

The system enforces strict unidirectional data flow from raw input to final visualization. Once resistance features are separated from metadata, no reverse or lateral information flow is permitted.

=== Training--Evaluation Separation

The following constraints are structurally enforced:

#figure(
  table(
    columns: 2,
    table.header[*Protocol*][*Description*],
    [Split-Before-Transform], [Train--test split is performed on raw data before any transformations],
    [Fit-on-Train-Only], [All scalers, imputers, and encoders are fitted exclusively on training data],
    [Transform-Both], [Fitted transformers are applied to both sets using identical parameters],
    [Evaluate-on-Test-Only], [All performance metrics are computed exclusively on held-out test data],
  ),
  caption: [Training--Evaluation Separation Protocol],
) <tab:train-eval-protocol>

=== Pipeline Flow

The complete data flow follows this sequence:

+ Raw AST Data → Data Ingestion
+ Data Ingestion → Data Cleaning
+ Data Cleaning → Resistance Encoding
+ Resistance Encoding → Feature Engineering (MAR, MDR)
+ Feature Engineering → Train-Test Split
+ Training Set → Fit Transformers → Clustering + Classifiers
+ Test Set → Apply Transformers → Prediction → Evaluation Metrics
+ Cluster Labels + Metrics → Visualization

// // Mermaid Diagram: Data Flow (for external rendering)
// #raw(
//   block: true,
//   lang: "mermaid",
//   "
// flowchart LR
//     RAW[\"Raw AST Data\"] --> ING[\"Ingestion\"]
//     ING --> CLN[\"Cleaning\"]
//     CLN --> ENC[\"Encoding\"]
//     ENC --> FE[\"Feature Engineering\"]
//     FE --> SPLIT[\"Train-Test Split\"]

//     SPLIT --> TRAIN[\"Training Set\"]
//     SPLIT --> TEST[\"Test Set\"]

//     TRAIN --> CLUST[\"Clustering\"]
//     TRAIN --> FIT[\"Fit Classifiers\"]

//     CLUST --> LABELS[\"Cluster Labels\"]

//     FIT --> PRED[\"Predict on Test\"]
//     TEST --> PRED

//     PRED --> EVAL[\"Evaluation Metrics\"]

//     LABELS --> VIZ[\"Visualization\"]
//     EVAL --> VIZ

//     style RAW fill:#ffebee,stroke:#c62828
//     style ING fill:#e8f5e9,stroke:#2e7d32
//     style CLN fill:#e8f5e9,stroke:#2e7d32
//     style ENC fill:#e8f5e9,stroke:#2e7d32
//     style FE fill:#e8f5e9,stroke:#2e7d32
//     style SPLIT fill:#fff3e0,stroke:#e65100
//     style TRAIN fill:#e3f2fd,stroke:#1565c0
//     style TEST fill:#fce4ec,stroke:#c2185b
//     style CLUST fill:#e1f5fe,stroke:#01579b
//     style FIT fill:#e1f5fe,stroke:#01579b
//     style LABELS fill:#f3e5f5,stroke:#7b1fa2
//     style PRED fill:#fff8e1,stroke:#ff8f00
//     style EVAL fill:#e0f2f1,stroke:#00695c
//     style VIZ fill:#ede7f6,stroke:#512da8
// ",
// )

// UNCOMMENT AFTER EXPORTING MERMAID DIAGRAMS:
#figure(
  image("figures/ch5-data-flow.png", width: 70%),
  caption: [Unidirectional Data Flow],
) <fig:data-flow>

// // Mermaid Diagram: Training-Evaluation Separation Protocol (for external rendering)
// #raw(
//   block: true,
//   lang: "mermaid",
//   "
// flowchart TB
//     RAW[\"Raw Dataset\"] --> SPLIT[\"Split BEFORE Transform (80/20 ratio)\"]

//     SPLIT --> TRAIN[\"Training Set (80%)\"]
//     SPLIT --> TEST[\"Test Set (20%)\"]

//     TRAIN --> FIT[\"Fit Transformers: Scalers, Imputers, Encoders\"]

//     FIT --> TRANS_TRAIN[\"Transform Training\"]
//     FIT --> TRANS_TEST[\"Transform Test\"]
//     TEST --> TRANS_TEST

//     TRANS_TRAIN --> MODEL[\"Train Models: Clustering, Classifiers\"]

//     MODEL --> PREDICT[\"Predict on Test Set\"]
//     TRANS_TEST --> PREDICT

//     PREDICT --> METRICS[\"Compute Metrics: Accuracy, F1, Confusion Matrix\"]

//     style RAW fill:#ffebee,stroke:#c62828
//     style SPLIT fill:#fff3e0,stroke:#e65100
//     style TRAIN fill:#e3f2fd,stroke:#1565c0
//     style TEST fill:#fce4ec,stroke:#c2185b
//     style FIT fill:#e8f5e9,stroke:#2e7d32
//     style TRANS_TRAIN fill:#e1f5fe,stroke:#01579b
//     style TRANS_TEST fill:#f3e5f5,stroke:#7b1fa2
//     style MODEL fill:#e0f2f1,stroke:#00695c
//     style PREDICT fill:#fff8e1,stroke:#ff8f00
//     style METRICS fill:#ede7f6,stroke:#512da8
// ",
// )

// (Train-Test Separation figure)
#figure(
  image("figures/ch5-train-test-separation.png", width: 80%),
  caption: [Training-Evaluation Separation Protocol],
) <fig:train-test-separation>
