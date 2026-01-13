// Section 6.7: Discussion
== Discussion of Results <sec:discussion>

=== Interpretation of Clustering Results

The four-cluster solution identified by hierarchical clustering reveals distinct antimicrobial resistance phenotypes within the Philippine isolate collection. The emergence of a high-MDR cluster (C3) dominated by _E. coli_ and _K. pneumoniae_ aligns with global reports of problematic Enterobacteriaceae strains exhibiting extensive drug resistance @zhao2025mdroinfection.

The clustering approach employed in this study offers advantages over single-gene molecular characterization by capturing the complete phenotypic resistance profile. This holistic view enables identification of clinically relevant resistance patterns that may arise from multiple underlying mechanisms @tolan2025mdr.

=== Methodological Validation

The supervised validation approach using Random Forest classification addresses a key limitation of unsupervised learning: the lack of ground truth labels. By demonstrating that cluster assignments are reproducible via an independent learning algorithm, this study provides evidence that the identified patterns represent genuine biological groupings rather than algorithmic artifacts @ardila2025rfsystematic.

The high macro F1-Score (0.96) indicates excellent discriminative ability, suggesting that resistance profiles within each cluster share common characteristics distinguishable from other clusters. This finding supports the utility of phenotypic clustering for AMR surveillance stratification.

=== Comparison with Parent Project Data

This study builds upon the extensive surveillance data collected by the parent project (INOHAC Project 2), shifting the analytical focus from descriptive statistics to multivariate pattern recognition. @tab:parent-comparison details the similarities and key methodological advancements distinguishing this thesis from the primary surveillance reports.

#figure(
  table(
    columns: (16%, 1fr, 1fr, 1fr),
    table.header[*Comparison Aspect*][*Parent Project (Surveillance)*][*Current Study (Clustering)*][*Synthesis*],
    [Scope & Population],
    [Surveillance of >1,300 presumptive isolates across BARMM & other regions.],
    [Analytical subset of 491 confirmed isolates with complete profiles.],
    [Focuses on high-integrity data to ensure robust pattern recognition, filtering surveillance noise.],

    [Methodology],
    [Univariate analysis: prevalence rates & species-specific MDR counts.],
    [Multivariate clustering (HAC) & Random Forest (RF) validation.],
    [Parent project identifies *where* resistance exists; this study explains *how* resistance traits cluster.],

    [MDR Findings],
    [Identified BARMM & hospitals as MDR hotspots (MDR vs Non-MDR).],
    [Defined 'Cluster 3' (MDR Archetype) linked to BARMM (53.7%) & tetracycline.],
    [Validates geographical risks by defining the specific antibiotic signature (TE-DO-beta-lactam).],

    [Species vs. Phenotype],
    [Analyzed resistance by species (separate tables).],
    [Cluster 3 (MDR) spans multiple species; Cluster 1 is species-specific (*Salmonella*).],
    [Demonstrates MDR as a convergent phenotype across species in high-risk environments.],
  ),
  caption: [Comparative analysis between Parent Project surveillance data and Thesis Clustering results],
) <tab:parent-comparison>

The integration of data from the parent project @abamo2024inohac provides the necessary volume to detect these patterns, while the clustering approach elucidates the underlying structure of resistance that descriptive counts alone cannot reveal. Specifically, the "MDR Archetype" (Cluster 3) unifies the high MDR counts observed in BARMM *E. coli* and *K. pneumoniae* into a single, trackable phenotypic entity.

=== Limitations

Several limitations warrant consideration:

1. *Retrospective design*: Analysis was conducted on historical AST data, limiting the ability to capture temporal trends
2. *Phenotypic focus*: Genotypic resistance mechanisms were not characterized, precluding direct linkage of clusters to specific resistance genes
3. *Regional scope*: Results may not generalize to other Philippine regions or international contexts
4. *Missing data*: Some isolates lacked complete antibiotic panels, potentially affecting cluster assignments

Despite these limitations, the study demonstrates the feasibility and utility of machine learning approaches for AMR pattern recognition in resource-limited surveillance settings.
