// Section: Supporting Theoretical Concepts
#import "../../template.typ": extended

== Supporting Theoretical Concepts

=== Information Leakage Theory in Machine Learning

A critical supporting concept is *Information Leakage Theory*, which addresses the methodological risk of inadvertently incorporating information from test data into model training, leading to overoptimistic performance estimates @kaufman2012leakage. Leakage violates the fundamental assumption of independent and identically distributed (i.i.d.) training and evaluation sets.

The study operationalizes leakage prevention through architectural constraints derived from this theory. While three primary leakage types exist, two are directly addressed in this study:

#figure(
  table(
    columns: 3,
    table.header[*Leakage Type*][*Theoretical Risk*][*Architectural Mitigation*],
    [*Temporal Leakage*], [Future information influencing past predictions], [Not applicable (cross-sectional data)],
    [*Feature Leakage*],
    [Target-derived features in input],
    [Feature--metadata separation; metadata excluded from clustering],

    [*Preprocessing Leakage*],
    [Statistics computed on full dataset],
    [Split-before-transform protocol; fit on training data only],
  ),
  caption: [Leakage Types and Architectural Mitigations.#extended[ Feature-metadata separation and split-before-transform protocols are implemented to prevent information leakage.]],
) <tab:leakage-types>

These constraints are not merely procedural but reflect the theoretical requirement that evaluation metrics must estimate generalization error on truly unseen data.

=== Ordinal Data Representation Theory

The encoding of antimicrobial susceptibility results (Susceptible/Intermediate/Resistant) as ordinal numerical values (0/1/2) is grounded in *Ordinal Data Theory* @stevens1946theory. Ordinal variables possess natural ordering but lack equidistant intervals between categories.

The choice of Euclidean distance for clustering ordinal resistance data is justified by research demonstrating that, for low-dimensional ordinal spaces with consistent encoding, Euclidean distance approximates ordinal dissimilarity with acceptable distortion @podani1999extending. Alternative distance metrics (e.g., Gower distance, Manhattan distance) were considered; the study's stability analysis using Adjusted Rand Index (ARI) across alternative configurations validates the robustness of the Euclidean-based solution.

=== Multi-Drug Resistance Classification Theory

The classification of isolates as *multidrug-resistant (MDR)* follows the standardized definition established by Magiorakos et al. @magiorakos2011mdr:

#quote[
  An isolate is classified as MDR if it exhibits acquired non-susceptibility to at least one agent in three or more antimicrobial categories.
]

This definition provides a theoretically grounded, internationally recognized framework for categorizing resistance breadth. The study's computation of MDR status as a derived feature operationalizes this definition, enabling downstream analysis of resistance pattern associations.
