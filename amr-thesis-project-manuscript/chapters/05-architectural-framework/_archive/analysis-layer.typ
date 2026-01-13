// Section: Analysis Layer

== Analysis Layer

The Analysis Layer implements three analytical modules: hierarchical clustering, supervised validation, and statistical analysis.

=== Hierarchical Clustering

Hierarchical agglomerative clustering using Ward's linkage and Euclidean distance is applied exclusively to resistance features. Ward's method minimizes within-cluster variance, which is appropriate for ordinal resistance data (0/1/2 encoding).

Cluster quality is assessed using:

- *Silhouette coefficient*: Measures how similar each isolate is to its own cluster compared to other clusters.
- *Within-cluster sum of squares (WCSS)*: Quantifies cluster compactness.
- *Gap statistic*: Compares clustering performance against null reference distributions.

Cluster robustness is validated through bootstrap resampling to assess stability under sampling variation.

=== Supervised Validation

Supervised classifiers are trained to evaluate the discriminative separability of discovered patterns. Three algorithms are employed:

#figure(
  table(
    columns: 2,
    table.header[*Classifier*][*Purpose*],
    [Logistic Regression], [Linear separability baseline],
    [Random Forest], [Non-linear pattern validation],
    [k-Nearest Neighbors], [Local neighborhood consistency],
  ),
  caption: [Supervised Classification Models],
) <tab:supervised-models-ch5>

Targets are derived from analytical outputs (e.g., cluster assignments or resistance categories), and evaluation is conducted exclusively on a held-out test set. This module does not influence clustering decisions and serves only as a validation mechanism.

=== Statistical Analysis

Statistical association measures are computed to characterize co-resistance patterns:

- *Phi coefficient*: Measures pairwise association between binary resistance outcomes.
- *Cramér's V*: Extends association testing to multi-class comparisons.
- *Chi-square tests*: Assesses statistical significance of observed associations.

// // Mermaid Diagram: Analysis Layer (for external rendering)
// #raw(
//   block: true,
//   lang: "mermaid",
//   "
// flowchart TB
//     subgraph Input[\"From Data Layer\"]
//         X[\"Feature Matrix (X)\"]
//     end

//     subgraph AnalysisLayer[\"Analysis Layer\"]
//         direction TB

//         subgraph Clustering[\"Hierarchical Clustering\"]
//             HC[\"Ward's Linkage + Euclidean Distance\"]
//             QUAL[\"Quality Metrics: Silhouette, WCSS, Gap\"]
//             BOOT[\"Bootstrap Robustness\"]
//         end

//         subgraph Supervised[\"Supervised Validation\"]
//             LR[\"Logistic Regression\"]
//             RF[\"Random Forest\"]
//             KNN[\"K-Nearest Neighbors\"]
//             EVAL[\"Evaluation: Accuracy, F1, Confusion Matrix\"]
//         end

//         subgraph Statistical[\"Statistical Analysis\"]
//             PHI[\"Phi Coefficient (Pairwise)\"]
//             CV[\"Cramér's V (Multi-class)\"]
//             CHI[\"Chi-Square Tests\"]
//         end
//     end

//     subgraph Output[\"Outputs\"]
//         CL[\"Cluster Labels\"]
//         MET[\"Validation Metrics\"]
//         ASSOC[\"Association Scores\"]
//     end

//     X --> Clustering
//     X --> Supervised
//     X --> Statistical
//     Clustering --> CL
//     Supervised --> MET
//     Statistical --> ASSOC
// ",
// )

// UNCOMMENT AFTER EXPORTING MERMAID DIAGRAM:
#figure(
  image("figures/ch5-analysis-layer.png", width: 70%),
  caption: [Analysis Layer Components],
) <fig:analysis-layer>
