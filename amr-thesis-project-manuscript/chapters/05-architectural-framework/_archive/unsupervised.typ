// Detailed Architecture - Unsupervised Learning

== Unsupervised Learning Architecture

The clustering architecture discovers latent resistance patterns through hierarchical agglomerative clustering, implementing similarity-based grouping, optimal cluster selection, validation, and profile characterization without using outcome labels.

=== Optimal k Selection

Evaluates cluster quality across k=2 to k=10 using a combined method:

- *Within-Cluster Sum of Squares (WCSS):* Identifies the elbow point where diminishing returns occur
- *Silhouette Coefficient:* Measures cluster cohesion and separation

#figure(
  table(
    columns: 2,
    table.header[*Parameter*][*Value*],
    [K_RANGE], [2-10],
    [METHOD], [combined (elbow + silhouette)],
    [RANDOM_STATE], [42],
  ),
  caption: [Optimal k Selection Parameters],
) <tab:optimal-k-params>

The elbow point at k=4 aligns with stable silhouette scores, producing data-driven cluster selection without manual intervention.

*Output:* `cluster_validation.png`, elbow point k=4

=== Ward's Linkage Clustering

Computes Euclidean distance matrix (491 × 491 pairwise distances) and applies Ward's linkage criterion to minimize within-cluster variance. Hierarchical agglomeration builds a dendrogram, with k=4 selected via the combined elbow-silhouette method.

#figure(
  table(
    columns: 2,
    table.header[*Clustering Parameter*][*Value*],
    [Method], [Ward's Linkage],
    [Distance Metric], [Euclidean],
    [Optimal k], [4 (data-driven)],
    [RANDOM_STATE], [42],
  ),
  caption: [Hierarchical Clustering Parameters],
) <tab:clustering-params>

*Outputs:* `clustered_dataset.csv`, `dendrogram_highres.png`, cluster assignments (491 × 1)

=== Quality Metrics and Robustness

Clustering validity is evaluated through multiple internal metrics:

#figure(
  table(
    columns: 2,
    table.header[*Metric*][*Value / Interpretation*],
    [Silhouette Coefficient], [0.466 (moderate-to-reasonable structure)],
    [WCSS], [1482.9],
    [ARI (Manhattan vs Euclidean)], [>0.8 (stable across distance metrics)],
  ),
  caption: [Cluster Validation Metrics],
) <tab:cluster-metrics>

Silhouette Coefficient (0.466) indicates moderate-to-reasonable cluster structure per Rousseeuw (1987) interpretation guidelines. A Manhattan distance robustness check computes Adjusted Rand Index (ARI > 0.8) between Euclidean and Manhattan clusterings, confirming stable assignments across distance metrics.

=== Cluster Profiles

Cluster profiles are characterized by computing mean resistance per antibiotic and identifying signature patterns:

#figure(
  table(
    columns: 3,
    table.header[*Cluster*][*Size*][*Characteristics*],
    [C1], [n=23], [Salmonella-dominated, aminoglycoside resistance (AN, CN, GM)],
    [C2], [n=93], [Enterobacter-dominated, penicillin/cephalosporin resistance (AM, CF, CN)],
    [C3], [n=123], [MDR archetype, _E. coli_/_K. pneumoniae_, 53.7% MDR (TE, DO, AM)],
    [C4], [n=252], [Susceptible majority, low MDR (0.4%)],
  ),
  caption: [Cluster Profile Characteristics],
) <tab:cluster-profiles>

This unsupervised architecture discovers clinically interpretable resistance phenotypes without relying on prior labels, enabling hypothesis-free pattern discovery.
