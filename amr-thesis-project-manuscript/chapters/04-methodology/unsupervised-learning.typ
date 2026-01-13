// Section: Unsupervised Structure Discovery

== Unsupervised Structure Discovery

The objective of this phase is to identify latent resistance structures based solely on phenotypic similarity in antimicrobial susceptibility profiles, without incorporating predefined biological, environmental, or geographic labels. All analyses in this section operate exclusively on the resistance feature matrix produced during preprocessing.

=== Clustering Algorithm Selection

*Hierarchical Agglomerative Clustering (HAC)* was selected as the primary unsupervised learning method due to the following properties:

- *Exploratory suitability:* Unlike partition-based methods (e.g., k-means) that require *a priori* specification of $k$, HAC constructs a complete hierarchical structure first, deferring cluster number selection to post-hoc analysis using data-driven validation metrics (silhouette coefficient, WCSS elbow analysis).
- *Multi-scale structure discovery:* The hierarchical representation enables examination of resistance patterns at multiple levels of granularity.
- *Interpretability:* Dendrograms provide transparent visualization of cluster formation and merge decisions.
- *Minimal structural assumptions:* HAC does not impose assumptions regarding cluster shape or distribution.

These characteristics make HAC appropriate for exploratory pattern recognition in high-dimensional resistance data.

=== Distance Metric

Euclidean distance is used as the primary measure of dissimilarity between resistance profiles:

$
  d(x, y) = sqrt(sum_(i=1)^n (x_i - y_i)^2)
$

where $x$ and $y$ are resistance vectors for two isolates and $n$ is the number of antibiotics.

This metric is selected because it preserves proportional differences introduced by ordinal resistance encoding (S = 0, I = 1, R = 2) and is compatible with variance-based linkage methods such as Ward's criterion. Given the 22-dimensional feature space—where the number of features is substantially smaller than the sample size—Euclidean distance remains effective without dimensionality reduction.

=== Linkage Method

Ward's *minimum variance linkage method* is used to guide cluster merging:

$
  Delta(A, B) = (n_A n_B) / (n_A + n_B) norm(c_A - c_B)^2
$

where:

- $n_A$ and $n_B$ denote the sizes of clusters $A$ and $B$,
- $c_A$ and $c_B$ represent their respective centroids.

Ward's method minimizes the increase in total within-cluster variance at each merge step, producing compact and relatively balanced clusters. This property is advantageous for identifying resistance phenotypes that are internally coherent and externally separable in feature space.

=== Determination of the Number of Clusters

The optimal number of clusters is determined using a *data-driven, multi-criteria approach* combining quantitative metrics with practical constraints, following established conventions for exploratory cluster analysis @ikotun2022kmeans @ling2025enhancing.

==== Silhouette Analysis

Cluster cohesion and separation were evaluated using the silhouette score @shahapure2020silhouette:

$
  s(i) = (b(i) - a(i)) / max(a(i), b(i))
$

where:

- $a(i)$ is the mean intra-cluster distance for isolate $i$,
- $b(i)$ is the mean distance to the nearest neighboring cluster.

Higher silhouette values indicate better-defined cluster structure, with scores ≥ 0.40 representing moderate-to-strong structure @jeon2025measuring. The average silhouette score across all isolates is computed for cluster solutions ranging from $k = 2$ to $k = 8$, a range consistent with recommendations for systematic cluster validation @ikotun2022kmeans.

==== Within-Cluster Sum of Squares (WCSS)

Cluster compactness is assessed using the within-cluster sum of squares:

$
  "WCSS" = sum_(k=1)^K sum_(x in C_k) norm(x - mu_k)^2
$

where $C_k$ denotes cluster $k$ and $mu_k$ its centroid. The elbow method is used to identify diminishing returns in compactness as the number of clusters increased @ling2025enhancing.

==== Practical Constraints

To ensure reproducibility and meaningful biological interpretation, the following methodological constraints guided cluster number selection:

- *Sample size requirement:* A minimum of 20 isolates per cluster was mandated to permit reliable estimation of cluster-level resistance profiles, consistent with recommendations for 20--30 samples per subgroup in clustering analysis @dolnicar2002review @qiu2006generation.
- *Granularity control:* Excessive partitioning was avoided to preserve phenotypically coherent resistance groupings amenable to downstream interpretation.

Final cluster selection employs a multi-objective decision framework, prioritizing the elbow point when it satisfied both silhouette and stability criteria, with parsimony as a secondary consideration when multiple solutions were statistically valid @jeon2025measuring.


=== Cluster-Level Profile Characterization

For each identified cluster, a *resistance profile* was computed summarizing the dominant phenotypic characteristics:

- *Mean resistance score* per antibiotic (0–2 scale)
- *Resistance prevalence* (proportion of isolates with R classification per antibiotic)
- *Class-level resistance summary* aggregating across antimicrobial categories

These profiles enable qualitative characterization of each cluster's resistance signature.

=== Unsupervised Discovery Output

The output of this phase consists of:

- Final cluster assignments for each isolate
- Hierarchical linkage matrices and dendrograms
- Cluster-level resistance profiles summarizing dominant phenotypic patterns

These outputs form the basis for supervised validation and interpretation, while remaining independent of external biological or contextual labels during discovery.
