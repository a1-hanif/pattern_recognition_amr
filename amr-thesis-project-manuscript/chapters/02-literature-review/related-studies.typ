// Chapter 2: Related Studies
// Narrative-driven review leading to thesis justification with comparative table

== Related Studies

This section examines the evolution of computational approaches to antimicrobial resistance (AMR) analysis, tracing the trajectory from supervised prediction paradigms toward unsupervised pattern discovery.

=== The Supervised Learning Era: Achievements and Limitations

The period from 2020 to 2024 witnessed advances in machine learning applications for AMR prediction, with Random Forest emerging as the predominant algorithmic choice. Machine learning models, particularly Random Forest and Neural Networks, have demonstrated high predictive accuracy (Area Under the Receiver Operating Characteristic or AUROC > 0.90) in distinguishing resistance phenotypes based on genomic features @gouareb2023gnn. However, these studies primarily rely on WGS data, which is often unavailable in resource-limited settings. This success obscures a fundamental limitation: supervised models require labeled training data that environmental surveillance programs rarely possess.

The dependency on pre-existing labels creates an epistemological paradox. High accuracy models for predicting resistance in _Mycobacterium tuberculosis_ and _Escherichia coli_ using genomic features could only classify isolates into categories already defined in training data @ardila2025rfsystematic. When confronted with novel resistance patterns not represented in historical datasets, supervised classifiers fail by design. This limitation proves especially problematic for environmental surveillance under the One Health framework, where resistance patterns in the water-fish-human nexus may differ from clinical reference datasets @reverter2020aquaculture.

The class imbalance problem further constrains supervised methods. Multidrug resistance (MDR) prevalence in surveillance datasets typically ranges from 10-20%, creating minority class prediction challenges that bias models toward susceptible classifications @widodo2022stratifiedcv. While stratified cross-validation partially addresses this issue, the underlying problem—insufficient representation of diverse resistance phenotypes—cannot be solved algorithmically when labels themselves are incomplete.

=== Unsupervised Approaches: Emerging Alternatives

Recognition of supervised limitations has prompted methodological diversification toward unsupervised pattern discovery. Affinity Propagation clustering on antibiotic resistance genomic data achieved silhouette coefficients of 0.82, demonstrating that meaningful phenotypic structure can be discovered algorithmically rather than assumed from clinical categories @parthasarathi2024mlstrategy.

These unsupervised approaches offer conceptual advantages beyond label independence. By clustering isolates based on resistance similarity rather than predefined categories, they can reveal "unknown unknowns"—resistance phenotypes that clinicians have not yet recognized as distinct entities. Hierarchical clustering with Ward's linkage has been applied to characterize MDR patterns in bacteria from agricultural sources, identifying resistance archetypes that spanned conventional species boundaries @abada2025ward. Such cross-species patterns may indicate horizontal gene transfer—a phenomenon invisible to species-specific supervised classifiers.

Spatial epidemiological approaches have emerged concurrently. Spatial panel data analysis of _E. coli_ resistance across 30 Chinese provinces demonstrated significant spatial autocorrelation in cephalosporin, carbapenem, and quinolone resistance @kou2025spatial. This finding suggests that resistance patterns cluster geographically, potentially reflecting shared anthropogenic pressures.

=== Regional Context: Southeast Asian Surveillance

A comprehensive meta-analysis synthesized 137 studies from 2013-2023, revealing disparities in Enterobacterales resistance across ecological compartments: ceftriaxone resistance reached 49.3% in human, 37.1% in environmental, and 11.2% in animal _E. coli_ isolates @xie2025seasia. These findings underscore the need for integrated One Health surveillance.

Within the Philippines, national surveillance data report _E. coli_ with 43% third-generation cephalosporin resistance and 46% fluoroquinolone resistance @arsp2024. Environmental studies documented MDR _E. coli_ in the Marikina River watershed @palmares2025marikina. Yet these studies employed conventional susceptibility categorization without clustering-based phenotype discovery.

The Inter-Regional Network Through One Health Approach to Combat Antimicrobial Resistance (INOHAC) AMR Project Two represents the first multi-regional environmental surveillance effort covering Bangsamoro Autonomous Region in Muslim Mindanao (BARMM), Central Luzon, and Eastern Visayas simultaneously @abamo2024inohac. With isolates tested against multiple antibiotics across water, fish, and human sources, this dataset provides unprecedented phenotypic resolution. However, resistance patterns remain characterized only through conventional metrics (MDR prevalence, Multiple Antibiotic Resistance indices) rather than unsupervised phenotype identification—a gap the present study directly addresses.

=== Network and Co-Resistance Perspectives

Network-based approaches have illuminated the genetic architecture of resistance. Gene network analysis identified hub genes that mediate interconnected resistance phenotypes @selvam2024network. At the metagenomic scale, antimicrobial resistance gene (ARG) co-abundance patterns across 214,095 datasets showed higher correlation in human and animal samples compared to environmental sources @martiny2024coabundance, suggesting that environmental samples may harbor distinct co-resistance architectures.

Ward's linkage dendrograms with heatmaps have been employed to characterize pan-resistant healthcare infections, demonstrating that hierarchical visualization reveals antibiotic groupings consistent with pharmacological class @luchian2025pdrheatmap. The present study extends this visualization paradigm to environmental isolates.
