// Section 6.3: Supervised Learning Validation
#import "../../template.typ": extended
== Supervised Learning Validation <sec:validation-results>

The supervised validation approach evaluates whether the clusters identified through unsupervised hierarchical clustering represent reproducible, predictable patterns in the resistance data. By training a classifier to predict cluster membership from resistance features alone, we can assess whether the cluster assignments capture genuine structure rather than artifacts of the clustering algorithm.

=== Random Forest Classification

A Random Forest classifier was trained to predict cluster membership using the 22-dimensional encoded resistance data as input features @ardila2025rfsystematic. The model was evaluated on a held-out test set (20%) after stratified splitting to ensure robust performance estimates across all four clusters.

#figure(
  image("../../figures/combined_confusion_matrices.png", width: 100%),
  caption: [Confusion Matrices for Supervised Classifiers.#extended[ Comparison of confusion matrices for Logistic Regression, Random Forest, and k-Nearest Neighbors. The diagonal dominance across all models confirms robust cluster separability.]],
) <tab:confusion-matrix>

@tab:model-comparison compares the performance of the three classifiers. All models achieved greater than 96% macro F1-score, indicating that the clusters are robust and distinguishable regardless of the classification algorithm used.

#figure(
  table(
    columns: 4,
    table.header[*Model*][*Category*][*Accuracy*][*Macro F1-Score*],
    [Logistic Regression], [Linear], [99.0%], [0.99],
    [Random Forest], [Tree-based], [99.0%], [0.96],
    [k-Nearest Neighbors], [Distance-based], [98.0%], [0.98],
  ),
  caption: [Comparison of Supervised Learning Models.#extended[ All three model families (Linear, Tree-based, Distance-based) achieved >96% macro F1-score, confirming that cluster separability is a property of the data structure, not an artifact of a specific algorithm.]],
) <tab:model-comparison>

The exceptionally high classification accuracy (99.0%) demonstrates that cluster assignments are highly predictable from resistance data alone. This confirms that the four clusters represent distinct, reproducible resistance phenotypes rather than arbitrary groupings. The balanced macro F1-score (0.96) indicates excellent performance across all cluster sizes, including the smaller Cluster 1 (n=23).

=== Feature Importance

The Random Forest model also provides interpretable feature importance scores, indicating which antibiotics contribute most to cluster discrimination.

#figure(
  image("../../figures/feature_importance.png", width: 90%),
  caption: [Feature Importance for Random Forest Classifier.#extended[ Tetracycline (TE) and Doxycycline (DO) are the most discriminatory features, driving the separation of the MDR Archetype cluster. Importance scores represent the mean decrease in impurity.]],
) <fig:feature-importance>

Tetracycline, cephalothin, and amoxicillin-clavulanic acid emerge as the most discriminating features, with tetracycline (0.241) retaining its strong role in defining the MDR Archetype cluster (C3). The prominence of beta-lactams (cephalothin, AMC) and tetracyclines (TE, DO) confirms that these drug classes are the primary drivers of phenotypic separation.

=== Sensitivity Analysis: Split Ratio and Cross-Validation

To validate the robustness of the chosen experimental configuration (80/20 split, Random Forest), a sensitivity analysis was conducted comparing different partitioning strategies. Three split ratios (70/30, 80/20, 90/10) and two cross-validation schemes (5-fold, 10-fold) were evaluated across all three classifier models.

==== Split Ratio Comparison

#figure(
  table(
    columns: 5,
    table.header[*Split*][*Model*][*F1 Score*][*Accuracy*][*Stability (std)*],
    [70/30], [Logistic Regression], [0.984 ± 0.006], [0.985], [0.006],
    [70/30], [Random Forest], [0.984 ± 0.014], [0.993], [0.014],
    [70/30], [KNN], [0.979 ± 0.010], [0.977], [0.010],
    [80/20], [Logistic Regression], [0.987 ± 0.005], [0.986], [0.005],
    [80/20], [Random Forest], [0.982 ± 0.022], [0.994], [0.022],
    [80/20], [KNN], [0.984 ± 0.012], [0.982], [0.012],
    [90/10], [Logistic Regression], [0.992 ± 0.010], [0.992], [0.010],
    [90/10], [Random Forest], [0.960 ± 0.050], [0.988], [0.050],
    [90/10], [KNN], [0.989 ± 0.010], [0.988], [0.010],
  ),
  caption: [F1 Scores Across Different Train–Test Split Ratios (Cluster Discrimination)],
) <tab:split-ratio-comparison>

==== Cross-Validation Comparison

#figure(
  table(
    columns: 5,
    table.header[*CV Folds*][*Model*][*F1 Score*][*Accuracy*][*Stability (std)*],
    [5-fold], [Logistic Regression], [0.989 ± 0.009], [0.990], [0.009],
    [5-fold], [Random Forest], [0.989 ± 0.011], [0.994], [0.011],
    [5-fold], [KNN], [0.979 ± 0.009], [0.978], [0.009],
    [10-fold], [Logistic Regression], [0.989 ± 0.015], [0.990], [0.015],
    [10-fold], [Random Forest], [0.986 ± 0.027], [0.994], [0.027],
    [10-fold], [KNN], [0.982 ± 0.015], [0.982], [0.015],
  ),
  caption: [F1 Scores Across Different Cross-Validation Configurations],
) <tab:cv-comparison>

The analysis confirms *consistently high performance (>0.96 F1)* across all clusters, with Cluster 2 (Enterobacter-Penicillin) showing perfect recall. Cluster 1 (Salmonella-Aminoglycoside) had slightly lower precision (0.93), likely due to the broader spectrum of resistance patterns in that group. The 80/20 split with 5-fold cross-validation was confirmed as an optimal balance between training adequacy and evaluation reliability.

=== Validation Implications

The successful supervised validation provides several key insights:

1. *Cluster Reproducibility:* The 99.0% accuracy confirms that an independent learning algorithm can recover the same groupings with near-perfect precision, substantially reducing concerns about clustering artifacts.

2. *Phenotype Distinctiveness:* High precision and recall indicate clear boundaries between resistance phenotypes, supporting their use as meaningful epidemiological categories.

3. *Feature Interpretability:* The alignment between feature importance and known resistance mechanisms—particularly the strong discriminatory power of tetracycline-class antibiotics for MDR phenotypes—validates the biological coherence of the clustering solution.

=== Principal Component Analysis Visualization

To complement the supervised validation, Principal Component Analysis (PCA) was applied to visualize the high-dimensional resistance data in reduced dimensions. @fig:pca-scree shows the variance explained by each principal component.

#figure(
  image("../../figures/pca_scree_plot.png", width: 80%),
  caption: [PCA scree plot showing cumulative variance explained.#extended[ The first two principal components capture substantial variance, enabling meaningful 2D visualization of the resistance data structure.]],
) <fig:pca-scree>

The PCA biplot in @fig:pca-biplot reveals the contribution of individual antibiotics to the principal component space.

#figure(
  image("../../figures/pca_biplot.png", width: 100%),
  caption: [PCA biplot showing isolates (points) and antibiotic loadings (vectors) in the first two principal components.#extended[ Vector directions indicate antibiotic contributions to cluster separation. Tetracycline-class antibiotics (TE, DO) show strong loadings consistent with their importance in defining the MDR Archetype cluster.]],
) <fig:pca-biplot>

@fig:pca-by-cluster visualizes the cluster assignments in PCA space, demonstrating the separability of the four phenotype groups.

#figure(
  image("../../figures/pca_by_cluster.png", width: 90%),
  caption: [PCA visualization colored by cluster assignment.#extended[ The four clusters show distinct spatial distributions in the reduced-dimensional space, confirming that the clustering solution captures meaningful phenotypic structure. C3 (MDR Archetype) and C4 (Susceptible Majority) form clearly separated regions.]],
) <fig:pca-by-cluster>

The relationship between cluster structure and MDR status is visualized in @fig:pca-by-mdr.

#figure(
  image("../../figures/pca_by_mdr.png", width: 90%),
  caption: [PCA visualization colored by MDR status.#extended[ MDR isolates (red) cluster distinctly from susceptible isolates (blue), with the majority concentrated in the C3 (MDR Archetype) region of the plot. This confirms the phenotypic coherence of the MDR classification.]],
) <fig:pca-by-mdr>

=== Silhouette Analysis Detail

The detailed silhouette plot for the k=4 solution is presented in @fig:silhouette-k4, showing cluster cohesion and separation for each isolate.

#figure(
  image("../../figures/silhouette_detail_k4.png", width: 90%),
  caption: [Silhouette plot for k=4 cluster solution.#extended[ Each bar represents an isolate's silhouette coefficient; longer bars indicate better cluster fit. All four clusters show predominantly positive silhouette values, with C3 and C4 demonstrating the strongest internal cohesion (mean silhouette = 0.466).]],
) <fig:silhouette-k4>
