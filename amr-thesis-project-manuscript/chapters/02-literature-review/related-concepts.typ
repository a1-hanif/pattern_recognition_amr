// Chapter 2: Related Concepts
// Defines unsupervised learning, spatial autocorrelation, and co-resistance networks in AMR context

== Related Concepts

This section establishes the conceptual foundations underlying the analytical framework, situating unsupervised machine learning and co-resistance analysis within antimicrobial resistance (AMR) surveillance.

=== Unsupervised Learning for Biological Pattern Discovery

The fundamental challenge in environmental AMR surveillance lies in the absence of predefined phenotype labels. Unlike clinical settings where treatment outcomes may provide ground truth for supervised learning, environmental isolates from the water-fish-human nexus lack such annotations @reverter2020aquaculture. This constraint necessitates unsupervised approaches that discover structure directly from data without labeled examples @hastie2017elements.

==== Hierarchical Agglomerative Clustering

Hierarchical clustering constructs a tree-like structure (dendrogram) that groups similar observations based on distance metrics, progressively merging clusters until a single root encompasses all data points @ward1963hierarchical. Among linkage methods, Ward's minimum variance approach minimizes within-cluster sum of squares at each merge step, producing compact, spherical clusters that often correspond to biologically meaningful groupings.

The choice of distance metric fundamentally shapes cluster geometry. Euclidean distance remains standard for continuous data and is required for Ward's method. While the ordinal nature of resistance encoding (Susceptible = 0, Intermediate = 1, Resistant = 2) introduces theoretical ambiguity, empirical evaluations demonstrate robust clustering performance with ordinal resistance data @abada2025ward. In the present study, Euclidean distance appropriateness was validated through silhouette analysis: high silhouette scores (≥0.40) confirm that the distance metric produces well-separated clusters, empirically justifying its use despite ordinal encoding.

This hierarchical approach influenced the present study's methodology by enabling discovery of resistance archetypes without requiring predefined phenotype labels.

==== Principal Component Analysis for Dimensionality Reduction

When analyzing resistance profiles across multiple antibiotics, visualization becomes impossible without dimensionality reduction. Principal Component Analysis (PCA) addresses this by projecting high-dimensional data onto orthogonal axes that maximize variance @jolliffe2016pca. The first principal component captures the direction of greatest variability—often correlated with overall resistance burden—while subsequent components reveal secondary patterns such as antibiotic class-specific resistance.

In AMR research, PCA serves dual purposes: enabling two-dimensional visualization of cluster separation and identifying resistance features that drive phenotypic differentiation @sakagianni2024datadriven. When clusters identified through hierarchical methods display separation in PCA space, this provides independent validation that the groupings capture genuine phenotypic structure.

This concept influenced the present study by providing a visualization mechanism to confirm that discovered clusters occupy distinct regions in reduced-dimensional space, offering independent validation of clustering results.

==== Cluster Validation via Silhouette Analysis

Determining optimal cluster number remains a persistent challenge in unsupervised learning @hastie2017elements. The silhouette coefficient addresses this by measuring the ratio of within-cluster cohesion to between-cluster separation @rousseeuw1987silhouette. Values range from -1 to +1, where scores ≥ 0.25 indicate weak structure, scores ≥ 0.40 indicate moderate-to-strong structure suitable for biological phenotype analysis, and scores ≥ 0.70 suggest exceptionally well-defined groupings @shahapure2020silhouette @jeon2025measuring.

This internal validation evaluates whether data genuinely contain clusterable structure at a given resolution. For AMR phenotyping, high silhouette scores indicate that isolates partition into distinct resistance archetypes rather than forming a continuous spectrum.

Silhouette analysis influenced the present study as the primary criterion for selecting optimal cluster count (k=4), ensuring discovered phenotypes represent genuine data structure rather than algorithmic artifacts.

=== Supervised Validation of Unsupervised Clusters

A critical methodological innovation involves using supervised classification not for prediction, but for validation. Once unsupervised clustering assigns isolates to phenotypic groups, Random Forest classification @breiman2001rf assesses whether these groupings are sufficiently distinct to be discriminated by an independent learning algorithm.

This hybrid unsupervised-supervised framework addresses a fundamental epistemological concern: how can one validate clusters without ground truth labels? By training a classifier on cluster assignments (treating them as provisional labels) and evaluating discrimination via cross-validation, the approach tests whether clusters represent coherent structures rather than noise. High classification accuracy combined with high silhouette scores provides convergent evidence for phenotypic validity @parthasarathi2024mlstrategy.

This concept directly shaped the present study's two-phase methodology: unsupervised clustering for pattern discovery followed by Random Forest classification to validate that discovered clusters are biologically coherent and discriminable.

=== Spatial Considerations in Resistance Epidemiology

Antimicrobial resistance does not distribute randomly across geographic space. Isolates from proximate sampling sites often exhibit correlated resistance profiles due to shared selection pressures or horizontal gene transfer @kou2025spatial. This phenomenon—spatial autocorrelation—has implications for surveillance design and statistical inference.

In multi-regional datasets spanning diverse geographic areas, isolates from the same sampling site share environmental and anthropogenic exposures. Geographic stratification of clustering results—examining whether resistance phenotypes distribute differently across regions—addresses this spatial dependence while revealing regional resistance signatures.

=== Co-Resistance Patterns

Co-resistance describes the phenomenon where resistance to one antibiotic is statistically associated with resistance to another @selvam2024network. Such associations may arise from genetic linkage, cross-resistance mechanisms, or shared selection pressure.

The clustering methods employed in this study implicitly capture co-resistance through phenotypic similarity. Isolates resistant to antibiotics A and B cluster together precisely because their joint resistance pattern differs from isolates resistant only to A or only to B. Visualizing cluster-specific resistance profiles as heatmaps reveals which antibiotic combinations define each phenotype @martiny2024coabundance.

=== The Multiple Antibiotic Resistance Index

The Multiple Antibiotic Resistance (MAR) index provides a scalar summary of resistance burden, calculated as the ratio of resistant antibiotics to total antibiotics tested @krumperman1983mar:

$ "MAR" = a / b $

where $a$ represents the number of antibiotics to which the isolate is resistant and $b$ represents the total number of antibiotics tested. Krumperman's original formulation established a threshold of 0.2, above which isolates likely originate from environments with significant antibiotic selection pressure. Clusters characterized by high mean MAR likely represent multidrug resistance (MDR) phenotypes with clinical relevance, providing external validation independent of the clustering algorithm.

=== Multidrug Resistance Classification

Multidrug resistance (MDR) is formally defined as acquired non-susceptibility to at least one agent in three or more antimicrobial categories @magiorakos2011mdr. This classification framework, established by an international expert proposal, provides standardized definitions for MDR, extensively drug-resistant (XDR), and pandrug-resistant (PDR) bacteria.

For Enterobacteriaceae such as _Escherichia coli_, _Salmonella_ spp., and _Shigella_ spp., MDR assessment considers resistance across antibiotic classes including penicillins, cephalosporins, carbapenems, aminoglycosides, fluoroquinolones, and folate pathway inhibitors. The MDR flag serves as an important clinical indicator of isolate pathogenic potential and treatment complexity.
