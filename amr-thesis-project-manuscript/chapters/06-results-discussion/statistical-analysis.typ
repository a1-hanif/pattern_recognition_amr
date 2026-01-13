// Section 6.4: Statistical Analysis and Characterization
#import "../../template.typ": extended
== Statistical Analysis and Characterization <sec:statistical-analysis>

This section presents complementary statistical analyses that characterize the identified resistance phenotypes within their epidemiological context. These include dimensionality reduction via Principal Component Analysis (PCA), examination of regional and environmental distribution patterns, and co-resistance network relationships.

=== Principal Component Analysis

Principal Component Analysis (PCA) was performed on the 22-dimensional encoded resistance data to visualize the underlying structure and assess its dimensionality.

@tab:pca-variance details the contributions of the first five principal components (PC) to the total variance of the isolate profiles. In this table, *Component* identifies the PC axis, *Variance Explained (%)* indicates how much of the dataset's total information is captured by that specific component, and *Cumulative (%)* shows the total variance accounted for by all components up to that point.

#figure(
  table(
    columns: 3,
    table.header[*Component*][*Variance Explained (%)*][*Cumulative (%)*],
    [PC1], [23.53%], [23.53%],
    [PC2], [16.40%], [39.92%],
    [PC3], [11.57%], [51.49%],
    [PC4], [9.74%], [61.24%],
    [PC5], [7.02%], [68.26%],
  ),
  caption: [Variance explained by the first five principal components of the encoded resistance matrix],
) <tab:pca-variance>

The first two principal components capture 39.92% of the total variance, which is characteristic of high-dimensional phenotypic data where resistance patterns are influenced by multiple independent genetic determinants. Five components are required to exceed 68% cumulative variance, indicating substantial dimensionality in the resistance phenotype space. Despite the limited variance captured in two dimensions, the PCA projection reveals visually distinguishable cluster separation, particularly along PC1 which correlates strongly with the tetracycline–doxycycline resistance axis that defines the MDR Cluster 3 @selvam2024network.

#figure(
  image("../../figures/pca_by_cluster.png", width: 85%),
  caption: [PCA projection of 491 isolates colored by cluster assignment.#extended[ The scatter plot visualizes the separation of the four distinct resistance phenotypes along the first two principal components (PC1 and PC2).]],
) <fig:pca-clusters>

#figure(
  image("../../figures/pca_by_region.png", width: 85%),
  caption: [PCA projection colored by geographic region.#extended[ Isolates from BARMM, Region III (Central Luzon), and Region VIII (Eastern Visayas) show overlapping distributions with subtle regional clustering tendencies, particularly along PC2.]],
) <fig:pca-region>

#figure(
  image("../../figures/pca_by_environment.png", width: 85%),
  caption: [PCA projection colored by environmental source.#extended[ Fish, water, and hospital-derived isolates are distributed across the phenotypic space, with hospital isolates showing a tendency toward the susceptible region (C4 territory) on PC1.]],
) <fig:pca-environment>

=== Regional Distribution Patterns

The four resistance clusters exhibited differential distribution across the three participating regions, revealing significant regional heterogeneity.

#figure(
  table(
    columns: 5,
    table.header(
      table.cell(rowspan: 2, align: horizon)[*Cluster*],
      table.cell(colspan: 3, align: center)[*Region*],
      table.cell(rowspan: 2, align: horizon)[*Total*],
      [*BARMM*], [*Central Luzon*], [*Eastern Visayas*],
    ),
    [C1 (Salmonella)], [8.7%], [73.9%], [17.4%], [100%],
    [C2 (Enterobacter)], [41.9%], [52.7%], [5.4%], [100%],
    [C3 (MDR Archetype)], [53.7%], [26.8%], [19.5%], [100%],
    [C4 (Susceptible)], [56.7%], [15.9%], [27.4%], [100%],
    [*Total*], [*50.9%*], [*28.3%*], [*20.8%*], [*100%*],
  ),
  caption: [Regional distribution of resistance phenotype clusters (percentage of each cluster by region)],
) <tab:cluster-region>

*Central Luzon Dominance in C1:* Cluster 1 (_Salmonella_-Aminoglycoside phenotype) shows strong geographic localization to Region III – Central Luzon, with 17 of 23 isolates (73.9%) originating from this region. This concentration suggests localized _Salmonella_ circulation in Central Luzon water systems or region-specific aminoglycoside selection pressure from agricultural antibiotic use.

*BARMM Concentration of MDR:* The MDR Archetype cluster (C3) shows predominant representation in BARMM, with 66 of 123 isolates (53.7%) originating from this region, making BARMM the primary hotspot for multidrug-resistant _E. coli_ and _K. pneumoniae_ @ng2025philippines. BARMM also harbors 143 of 252 C4 isolates (56.7%), indicating both the highest MDR burden and largest reservoir of currently-susceptible isolates vulnerable to future resistance acquisition.

=== Environmental Niche Associations

#figure(
  table(
    columns: 5,
    table.header[*Cluster*][*Fish*][*Hospital*][*Water*][*Total*],
    [C1 (Salmonella)], [30.4%], [0.0%], [69.6%], [100%],
    [C2 (Enterobacter)], [53.8%], [0.0%], [46.2%], [100%],
    [C3 (MDR Archetype)], [56.1%], [7.3%], [36.6%], [100%],
    [C4 (Susceptible)], [58.7%], [12.7%], [28.6%], [100%],
    [*Total*], [*55.8%*], [*8.4%*], [*35.8%*], [*100%*],
  ),
  caption: [Environmental distribution of resistance phenotype clusters],
) <tab:cluster-environment>

*Water-Associated C1:* Cluster 1 shows the strongest water association, with 16 of 23 isolates (69.6%) from water samples, no hospital representation, and only 7 of 23 (30.4%) from fish samples—consistent with _Salmonella_ waterborne ecology.

*Hospital Penetration in C3/C4:* Clusters 3 and 4 are the only clusters with hospital-derived isolates (9 of 123 [7.3%] and 32 of 252 [12.7%] respectively). The higher hospital proportion in the susceptible C4 compared to MDR C3 may reflect that MDR acquisition occurs primarily in environmental reservoirs before clinical introduction.

*Fish Dominance:* Fish samples predominate in Clusters 2–4 (53.8%–58.7%), underscoring aquaculture systems as key resistance reservoirs consistent with the One Health framework @franklin2024onehealth.



=== Resistance Distribution Analysis

The distribution of resistance levels across the dataset is characterized by the Multiple Antibiotic Resistance (MAR) index and Multi-Drug Resistance (MDR) classification. @fig:mar-distribution shows the MAR index distribution across all isolates, while @fig:mdr-distribution illustrates MDR prevalence.

#figure(
  image("../../figures/mar_distribution.png", width: 90%),
  caption: [Distribution of Multiple Antibiotic Resistance (MAR) index across 491 isolates.#extended[ The histogram shows the proportion of antibiotics to which each isolate is resistant. Most isolates exhibit low MAR values (< 0.2), with a distinct high-MAR subpopulation corresponding to the MDR Archetype cluster (C3).]],
) <fig:mar-distribution>

#figure(
  image("../../figures/mdr_distribution.png", width: 90%),
  caption: [Multi-Drug Resistance (MDR) status distribution across clusters.#extended[ The bar chart shows the proportion of MDR (≥3 resistant classes) and non-MDR isolates within each cluster. C3 (MDR Archetype) contains 53.7% MDR isolates, while other clusters exhibit less than 5% MDR prevalence.]],
) <fig:mdr-distribution>

=== Antibiotic Clustering Analysis

Hierarchical clustering was also applied to antibiotics to identify groups with correlated resistance patterns. @fig:antibiotic-dendrogram presents the antibiotic dendrogram, revealing clusters of antibiotics that tend to co-occur in resistance profiles.

#figure(
  image("../../figures/antibiotic_dendrogram.png", width: 85%),
  caption: [Dendrogram of antibiotic clustering based on resistance co-occurrence patterns.#extended[ Antibiotics that cluster together exhibit similar resistance profiles across isolates. The tight grouping of tetracycline-class antibiotics (TE, DO) and fluoroquinolones (ENR, MRB, PRA) reflects mechanistically related resistance mechanisms.]],
) <fig:antibiotic-dendrogram>

#figure(
  image("../../figures/antibiotic_clustered_heatmap.png", width: 100%),
  caption: [Clustered heatmap of antibiotic resistance correlations.#extended[ Rows and columns represent antibiotics ordered by hierarchical clustering. Color intensity indicates correlation strength between resistance to antibiotic pairs. Strong positive correlations (red) identify potential co-selection targets, while negative correlations (blue) suggest inversely related resistance mechanisms.]],
) <fig:antibiotic-clustered-heatmap>
