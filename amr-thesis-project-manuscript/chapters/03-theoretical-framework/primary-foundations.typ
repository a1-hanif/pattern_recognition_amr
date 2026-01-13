// Section: Primary Theoretical Foundations
#import "../../template.typ": extended

== Primary Theoretical Foundations

=== Pattern Recognition Theory

The primary theoretical foundation of this study is *Pattern Recognition Theory*, as formalized by Duda, Hart, and Stork @duda2001pattern in their seminal work _Pattern Classification_. Pattern recognition is defined as the automatic discovery of regularities in data through the use of computational algorithms, with the aim of classifying or describing observations based on learned representations rather than explicit rules.

This theory is operationalized in the present study through the integration of *unsupervised* and *supervised* learning paradigms:

#figure(
  table(
    columns: 3,
    table.header[*Paradigm*][*Theoretical Basis*][*Application in Study*],
    [*Unsupervised Learning*],
    [Cluster Analysis Theory @jain1988algorithms],
    [Hierarchical Agglomerative Clustering discovers latent resistance structures without predefined labels],

    [*Supervised Learning*],
    [Statistical Learning Theory @hastie2009elements],
    [Logistic Regression, Random Forest, and k-Nearest Neighbors validate discriminative capacity of discovered patterns],
  ),
  caption: [Learning Paradigms in Pattern Recognition.#extended[ Unsupervised learning discovers structure; supervised learning validates discrimination.]],
) <tab:learning-paradigms>

The theoretical justification for combining both paradigms derives from the *cluster validation problem* articulated by Jain and Dubes @jain1988algorithms: unsupervised methods alone cannot guarantee that discovered structures are meaningful, coherent, or reproducible. Supervised validation provides an external mechanism for assessing whether clusters represent genuinely separable phenotypic categories.

==== Hierarchical Clustering Theory

Ward's minimum variance method, employed in this study, is grounded in the theoretical principle of *within-cluster homogeneity maximization* @abada2025ward. The method iteratively merges clusters to minimize the total within-cluster sum of squares, producing dendrograms that reveal multi-scale structure in high-dimensional data. This approach is particularly appropriate for ordinal resistance data (S/I/R encoded as 0/1/2), where Euclidean distance preserves the progressive nature of resistance severity.

=== One Health Framework

The *One Health Framework* provides the domain-specific theoretical context for situating antimicrobial resistance within interconnected environmental, animal, and human health systems. Endorsed by the World Health Organization (WHO), Food and Agriculture Organization (FAO), and World Organisation for Animal Health (WOAH), One Health recognizes that:

#quote[
  "The health of people is closely connected to the health of animals and our shared environment" @cdc2024onehealth.
]

The Water--Fish--Human nexus examined in this study represents a concrete instantiation of One Health principles, tracing antimicrobial resistance across:

- *Water systems* (drinking water, lake water, river water, effluent discharge)
- *Aquaculture* (fish species: _Banak_, _Gusaw_, _Tilapia_, _Kaolang_)
- *Anthropogenic interfaces* (treated/untreated effluent from healthcare facilities)

The One Health Framework justifies the study's focus on environmental reservoirs as sites of AMR emergence and dissemination, while simultaneously constraining the study's interpretive scope: the framework emphasizes _interconnection_ and _surveillance_ rather than _causal attribution_. This theoretical position aligns with the study's commitment to associational rather than causal language.
