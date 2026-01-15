// Chapter 2: Related Concepts
// Defines unsupervised learning, spatial autocorrelation, and co-resistance networks in AMR context

== Related Concepts

This section establishes the conceptual foundations underlying the analytical framework, situating unsupervised machine learning and co-resistance analysis within antimicrobial resistance (AMR) surveillance.

=== Antibiotic Resistance

Antibiotic resistance refers to the ability of bacteria to survive and proliferate in the presence of antimicrobial agents that would normally inhibit their growth or cause cell death @who2021amr. This phenomenon represents one of the most pressing global health challenges of the 21st century, threatening the efficacy of treatments for infectious diseases and undermining decades of medical advancement @oneill2016amr.

==== Mechanisms of Resistance

Bacteria acquire resistance through two primary pathways: intrinsic and acquired mechanisms @blair2015mechanisms. Intrinsic resistance arises from inherent structural or functional characteristics of the organism, such as the impermeability of the outer membrane in Gram-negative bacteria or the expression of efflux pumps that actively expel antimicrobial compounds @nikaido2009multidrug. Acquired resistance develops through genetic changes, either via spontaneous chromosomal mutations or through horizontal gene transfer (HGT) mechanisms including conjugation, transformation, and transduction @munita2016mechanisms.

The molecular mechanisms underlying resistance can be categorized into four main strategies: (1) enzymatic inactivation or modification of the antibiotic, exemplified by β-lactamases that hydrolyze β-lactam antibiotics; (2) alteration of the drug target site, reducing antibiotic binding affinity; (3) reduced intracellular accumulation through decreased permeability or increased efflux; and (4) bypass of the inhibited pathway through alternative metabolic routes @blair2015mechanisms.

==== Environmental Reservoirs and Dissemination

The aquatic environment serves as a critical reservoir for antibiotic-resistant bacteria and resistance genes @marti2014roles. Agricultural runoff, hospital effluents, and wastewater treatment plants contribute antimicrobial residues and resistant organisms to water bodies, creating selection pressure for resistance development @berendonk2015tackling. The water-fish-human nexus represents a particularly important pathway for resistance dissemination, as aquaculture practices often involve antibiotic use for disease prevention and growth promotion, leading to the enrichment of resistant bacteria in farmed fish and their surrounding environment @reverter2020aquaculture.

Horizontal gene transfer in aquatic environments facilitates the spread of resistance determinants between bacterial species, including transfer from environmental organisms to human pathogens @gillings2018dna. Mobile genetic elements such as plasmids, transposons, and integrons serve as vehicles for resistance gene dissemination, enabling rapid adaptation to antimicrobial selection pressure across diverse bacterial populations @partridge2018mobile.

==== Clinical and Public Health Implications

The emergence and spread of antibiotic resistance has profound implications for clinical medicine and public health @laxminarayan2013antibiotic. Infections caused by resistant organisms are associated with increased morbidity, mortality, and healthcare costs compared to susceptible infections. The World Health Organization has identified antimicrobial resistance as one of the top ten global public health threats, projecting that drug-resistant infections could cause 10 million deaths annually by 2050 if current trends continue @who2021amr.

Understanding the patterns and mechanisms of antibiotic resistance in environmental and clinical isolates is essential for developing effective surveillance strategies and intervention measures. This study contributes to this effort by applying pattern recognition techniques to characterize resistance phenotypes and identify co-resistance patterns in bacterial isolates from the water-fish-human nexus.

=== Pattern Recognition in Antimicrobial Resistance

Pattern recognition encompasses computational techniques designed to automatically identify regularities, structures, and meaningful relationships within complex datasets @bishop2006pattern. In the context of antimicrobial resistance, pattern recognition methods enable researchers to discover hidden structures in resistance profiles that may not be apparent through traditional epidemiological approaches @macesic2017machine.

==== Computational Approaches to Resistance Phenotyping

The application of pattern recognition to AMR data has emerged as a powerful paradigm for understanding resistance dynamics @sakagianni2024datadriven. Traditional phenotypic characterization relies on minimum inhibitory concentration (MIC) testing and categorical susceptibility classifications. However, these approaches often fail to capture the multidimensional nature of resistance profiles across multiple antibiotics. Pattern recognition methods address this limitation by analyzing resistance data as high-dimensional vectors, enabling the identification of resistance archetypes that share common phenotypic signatures @hendriksen2019using.

Clustering algorithms, in particular, have proven valuable for grouping isolates with similar resistance profiles into biologically meaningful phenotypes @sakagianni2024datadriven. These unsupervised approaches do not require prior knowledge of the expected groupings, making them particularly suitable for exploratory analysis of novel resistance patterns in environmental surveillance contexts.

==== Feature Extraction and Dimensionality Reduction

A critical step in pattern recognition involves transforming raw resistance data into informative features suitable for analysis @jolliffe2016pca. For phenotypic resistance data, this typically involves encoding susceptibility test results as ordinal or binary variables representing resistance states. Dimensionality reduction techniques such as Principal Component Analysis enable visualization of high-dimensional resistance profiles in lower-dimensional spaces, revealing cluster structures and outlier phenotypes @sakagianni2024datadriven.

Feature importance analysis further enhances interpretability by identifying which antibiotics contribute most significantly to phenotype differentiation. This information can guide targeted surveillance efforts and inform antibiotic stewardship programs by highlighting resistance markers with the greatest discriminatory power @parthasarathi2024mlstrategy.

==== Integration with Epidemiological Surveillance

Pattern recognition approaches complement traditional surveillance methods by providing systematic frameworks for phenotype classification and trend analysis @macesic2017machine. When applied to multi-regional datasets, these methods can reveal geographic patterns in resistance distribution, identify emerging phenotypes requiring attention, and track the evolution of resistance profiles over time @kou2025spatial.

The integration of pattern recognition with One Health surveillance frameworks represents a particularly promising direction, as computational methods can synthesize resistance data across human, animal, and environmental compartments to identify cross-sectoral transmission patterns @franklin2024onehealth. This study applies pattern recognition techniques to characterize resistance phenotypes in bacterial isolates from the water-fish-human nexus, contributing to this emerging paradigm.

=== Water–Fish–Human Nexus

The water–fish–human nexus describes the interconnected pathways through which antimicrobial resistance can emerge, persist, and disseminate across aquatic environments, aquaculture systems, and human populations @reverter2020aquaculture. This conceptual framework recognizes that water bodies serve as both reservoirs and conduits for resistant bacteria and resistance genes, creating complex transmission dynamics that transcend traditional boundaries between environmental, animal, and human health sectors @berendonk2015tackling.

==== Aquaculture as a Resistance Reservoir

Aquaculture represents a significant contributor to the global emergence of antimicrobial resistance @cabello2016aquaculture. The intensive farming of fish and shellfish often involves prophylactic and therapeutic use of antibiotics to prevent and treat bacterial infections, creating selection pressure that favors the proliferation of resistant organisms @schar2020global. Antibiotics administered in aquaculture systems are frequently released into surrounding water bodies through uneaten feed, fish excreta, and farm effluents, establishing environmental reservoirs of antimicrobial agents and resistant bacteria @done2015contamination.

The Philippines, as one of the world's major aquaculture producers, faces particular challenges in managing antibiotic use in fish farming operations @ng2025philippines. Common practices include the use of tetracyclines, sulfonamides, and quinolones for disease prevention, contributing to the emergence of resistance patterns that mirror those observed in human clinical isolates @xie2025seasia.

==== Environmental Transmission Pathways

Water serves as a critical medium for the horizontal transfer of resistance genes between bacterial species @marti2014roles. Aquatic environments provide conditions conducive to genetic exchange through conjugation, transformation, and transduction, enabling the spread of mobile genetic elements carrying resistance determinants across taxonomically diverse bacterial populations @gillings2018dna. This horizontal gene transfer can occur between commensal organisms, environmental bacteria, and human pathogens, creating pathways for resistance genes to move from agricultural to clinical settings.

Municipal wastewater, hospital effluents, and agricultural runoff converge in water bodies, creating hotspots where resistant bacteria from multiple sources interact and exchange genetic material @berendonk2015tackling. These mixing zones represent critical points for the emergence of novel resistance combinations and the amplification of resistance genes in environmental reservoirs.

==== Human Health Implications

The consumption of fish and seafood from contaminated aquaculture systems represents a direct route for human exposure to antibiotic-resistant bacteria @reverter2020aquaculture. Resistant organisms can colonize the human gut, potentially transferring resistance genes to the resident microbiota and serving as reservoirs for future infections. Additionally, occupational exposure among aquaculture workers, fish processors, and vendors creates pathways for resistant bacteria to enter human communities.

Water used for drinking, recreation, and irrigation provides additional exposure routes, particularly in regions with limited water treatment infrastructure @punch2025wastewater. The interconnection of water sources with human activities underscores the importance of understanding resistance dynamics across the entire water–fish–human continuum rather than focusing on individual compartments in isolation.

==== One Health Framework

The One Health approach provides an integrative framework for understanding and addressing antimicrobial resistance across the water–fish–human nexus @cdc2024onehealth. This perspective recognizes that human health, animal health, and environmental health are inextricably linked, and that effective AMR surveillance and intervention strategies must consider all three domains simultaneously @franklin2024onehealth.

For the Philippines and other countries with significant aquaculture industries, adopting a One Health approach to AMR surveillance requires coordinated monitoring of resistance patterns in clinical isolates, aquaculture systems, and environmental samples @ng2025philippines. This study contributes to this objective by characterizing resistance phenotypes in bacterial isolates collected from water, fish, and human sources across multiple regions, providing insights into the interconnected nature of resistance dynamics within the water–fish–human nexus.

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
