// Section 7.1: Conclusion
== Conclusion

This study developed and validated a hybrid unsupervised-supervised machine learning framework for pattern recognition of antimicrobial resistance phenotypes in bacterial isolates from the Philippine water-fish-human nexus. The analysis of 491 isolates collected through the INOHAC AMR Project Two across three regions—BARMM, Central Luzon, and Eastern Visayas—yielded the following conclusions:

=== Objective 1: Resistance Phenotype Identification

Hierarchical agglomerative clustering using Ward's linkage method and Euclidean distance successfully identified four distinct resistance phenotype clusters:

1. *Cluster 1* (n=23, 4.7% of 491 isolates): A taxonomically homogeneous _Salmonella_-aminoglycoside phenotype with low MDR prevalence (1 of 23 isolates, 4.3%), geographically concentrated in Central Luzon (17 of 23, 73.9%) and predominantly water-associated (16 of 23, 69.6%).

2. *Cluster 2* (n=93, 18.9% of total): An _Enterobacter_-penicillin phenotype exhibiting intrinsic AmpC β-lactamase-mediated resistance with minimal MDR (2 of 93 isolates, 2.2%).

3. *Cluster 3* (n=123, 25.1% of total): The multi-drug resistant archetype dominated by _E. coli_ (95 of 123, 77.2%) and _K. pneumoniae_ (27 of 123, 22.0%), with striking MDR prevalence (66 of 123 isolates, 53.7%)—accounting for 94.3% of all 70 MDR isolates in the dataset.

4. *Cluster 4* (n=252, 51.3% of total): The susceptible majority representing the largest cluster with near-complete antibiotic susceptibility (only 1 of 252 isolates, 0.4% MDR) despite similar species composition to Cluster 3.

=== Objective 2: Cluster Validation

The four-cluster solution achieved a silhouette score of 0.466, indicating moderate cluster structure appropriate for complex biological phenotypes. Supervised validation using Random Forest classification achieved 99.0% test set accuracy (macro F1 = 0.96), confirming that cluster assignments represent reproducible, learnable patterns rather than algorithmic artifacts @ardila2025rfsystematic.

=== Objective 3: Spatial and Environmental Patterns

Significant geographic heterogeneity was observed, with BARMM exhibiting the highest concentration of MDR Cluster 3 isolates (66 of 123, 53.7%), identifying this region as the primary AMR hotspot requiring targeted surveillance intervention @ng2025philippines. Environmental analysis revealed distinct niche associations: _Salmonella_ with water sources, and MDR Enterobacteriaceae with fish samples, supporting the One Health framework for integrated AMR surveillance @franklin2024onehealth.

=== Objective 4: Co-resistance Networks

Strong co-resistance associations were identified, particularly between tetracyclines (Phi=0.81), reflecting shared resistance mechanisms via ribosomal protection proteins and efflux pumps @wang2022tetx4. These patterns have direct implications for empirical therapy selection and resistance prediction.

=== Overall Contribution

This study demonstrates that machine learning approaches can effectively stratify AMR phenotypes in resource-limited surveillance settings, providing actionable intelligence for public health intervention. The reproducible computational pipeline enables ongoing resistance monitoring and phenotype tracking as new data become available.
