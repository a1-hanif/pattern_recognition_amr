// Chapter 2: Synthesis - The Methodological Gap
#import "../../template.typ": extended
// Identifies the research gap that the current study addresses

== Synthesis: The Methodological Gap

The foregoing review reveals a critical methodological gap at the intersection of computational approaches and environmental AMR surveillance.

=== Comparative Summary of Related Studies

A systematic comparison of related studies reveals distinct methodological approaches to AMR pattern recognition. Ardila et al. @ardila2025rfsystematic conducted a comprehensive systematic review of machine learning applications in AMR, finding that supervised methods (Random Forest, Gradient Boosting) achieve high predictive accuracy but require labeled training data. Parthasarathi et al. @parthasarathi2024mlstrategy demonstrated effective unsupervised clustering of AMR genes with silhouette scores reaching 0.82, establishing that clustering methods can discover meaningful resistance patterns. Kou et al. @kou2025spatial applied spatial epidemiology to _E. coli_ resistance patterns across Chinese provinces, revealing significant spatial autocorrelation but without phenotypic clustering. Abada et al. @abada2025ward employed Ward's hierarchical clustering for agricultural MDR bacteria, validating the method's applicability to resistance phenotyping. The INOHAC project @abamo2024inohac provided foundational multi-regional surveillance data but relied on conventional MDR classification without computational pattern discovery.

What distinguishes the present study is the systematic integration of unsupervised and supervised approaches within an environmental One Health context. While individual studies have employed either clustering or classification, none have combined Ward's hierarchical clustering for phenotype discovery with Random Forest validation specifically for multi-source environmental isolates spanning the water-fish-human nexus. This hybrid methodology addresses both the discovery challenge (identifying resistance archetypes without predefined labels) and the validation challenge (confirming that discovered patterns represent biologically coherent structures). The following table summarizes these methodological distinctions.

#rotate(-90deg, reflow: true)[
  #figure(
    table(
      columns: (1.2fr, 2.5fr, 0.5fr, 1.2fr, 1.2fr, 1.5fr, 1.5fr),
      align: (left, left, center, center, center, left, left),
      stroke: 0.5pt,
      inset: 6pt,

      // Header row
      [*Author*], [*Title*], [*Year*], [#box[*Unsupervised*]], [#box[*Supervised*]], [*Focus*], [*Contribution*],

      // Data rows
      [Ardila et al.], [Systematic Review of ML in AMR], [2025], [No], [Yes], [Systematic review], [RF/GBDT],
      [Parthasarathi et al.],
      [Clustering-Based AMR Gene Analysis],
      [2024],
      [Yes],
      [Yes],
      [AMR gene \ clustering],
      [Silhouette 0.82],

      [Kou et al.],
      [Spatial Epidemiology of E. coli],
      [2025],
      [No],
      [No],
      [Spatial \ epidemiology],
      [Spatial autocorrelation],

      [Abada et al.],
      [Ward's Clustering for Agricultural MDR],
      [2025],
      [Yes],
      [No],
      [Agricultural MDR],
      [Ward's clustering],

      [Abamo et al.],
      [INOHAC AMR Project Two],
      [2024],
      [No],
      [No],
      [Environmental \ surveillance],
      [Multi-regional dataset],

      // Current study row
      [*Current Study*],
      [*Pattern Recognition of AMR*],
      [*2026*],
      [*Yes*],
      [*Yes*],
      [*Water-fish-human \ nexus*],
      [*Hierarchical + RF*],
    ),
    caption: [Comparative Summary of Computational Approaches to AMR Analysis.#extended[ The current study integrates unsupervised and supervised approaches for environmental AMR surveillance.]],
  )

  _The current study integrates unsupervised and supervised approaches for environmental AMR surveillance._
]

Limitations of Existing Approaches. Supervised methods achieve high accuracy but cannot identify novel resistance patterns absent from training data. Unsupervised clustering, while effective in agricultural and clinical settings, has rarely been applied to multi-regional One Health surveillance. Spatial epidemiology operates on aggregated metrics rather than phenotypic profiles. Philippine surveillance has relied on conventional MDR classification, leaving the INOHAC dataset's pattern discovery potential unrealized.

The Present Study's Contribution. This study addresses these gaps through a hybrid unsupervised-supervised framework for environmental AMR surveillance. Ward's hierarchical clustering discovers resistance archetypes without predefined labels, while Random Forest classification validates whether clusters represent biologically coherent structures. Applying this methodology to isolates spanning multiple Philippine regions and ecological compartments (water, fish, human) enables characterization of resistance phenotypes specific to the One Health nexus. This integrated approach advances beyond purely supervised prediction or unsupervised clustering alone, offering a reproducible framework for future surveillance studies.
