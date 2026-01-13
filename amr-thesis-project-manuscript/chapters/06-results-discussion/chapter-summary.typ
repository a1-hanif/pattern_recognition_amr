// Section 6.8: Chapter Summary
== Chapter Summary

This chapter presented the results of the pattern recognition analysis on antimicrobial susceptibility data from 491 bacterial isolates across three Philippine regions. Key findings include:

1. *Optimal Clustering*: Hierarchical clustering with Ward's linkage identified k=4 as the optimal cluster solution, with silhouette score of 0.466 and biologically interpretable cluster profiles

2. *Cluster Characterization*: Four distinct resistance phenotypes were identified:
  - C1 (n=23): _Salmonella_-aminoglycoside phenotype (4.3% MDR)
  - C2 (n=93): _Enterobacter_-penicillin phenotype (2.2% MDR)
  - C3 (n=123): Multi-drug resistant archetype (53.7% MDR) - primary public health concern
  - C4 (n=252): Susceptible majority (0.4% MDR)

3. *MDR Concentration*: Cluster 3 contains \> 50-fold higher MDR prevalence than Cluster 4, despite overlapping species composition

4. *Dimensionality Reduction*: PCA captured 68.26% variance in 5 components, with PC1 correlating strongly with tetracycline resistance

5. *Co-resistance Patterns*: Strong associations identified between tetracyclines (Phi=0.81) and within antibiotic classes

6. *Regional Patterns*: BARMM exhibited highest concentration of MDR Cluster 3 isolates (66 of 123, 53.7%), warranting targeted surveillance

7. *Validation*: Random Forest classification achieved 99.0% test set accuracy (macro F1 = 0.96), confirming cluster stability and reproducibility

These findings support the utility of hybrid unsupervised-supervised machine learning frameworks for AMR surveillance and phenotype stratification in the Philippine water-fish-human nexus context @franklin2024onehealth.
