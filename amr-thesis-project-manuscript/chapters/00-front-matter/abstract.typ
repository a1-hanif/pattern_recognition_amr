// Abstract
// A concise summary of your research (usually 150-300 words)

#page(numbering: "i")[
  #align(center, text(weight: "bold", size: 14pt)[ABSTRACT])
  #v(0.5cm)

  #set par(first-line-indent: 0pt)

  // Citation format for abstract header (two authors)
  Last Name, First Name & Last Name, First Name. "PATTERN RECOGNITION OF ANTIBIOTIC RESISTANCE IN _ESCHERICHIA COLI_, _SALMONELLA_ SPP., _SHIGELLA_ SPP., AND _VIBRIO CHOLERAE_ FROM WATER-FISH-HUMAN NEXUS". Undergraduate thesis, Department of Computer Science, Mindanao State University - Marawi City Campus. #datetime.today().display("[month repr:long] [year]").

  #v(0.5cm)

  Antimicrobial resistance (AMR) poses a critical global health threat, yet current surveillance frameworks rely on predefined categorical labels that limit discovery of latent resistance patterns. This study developed a hybrid unsupervised-supervised machine learning framework for pattern recognition of AMR phenotypes in the Philippine Water–Fish–Human nexus using phenotypic antimicrobial susceptibility testing (AST) data from the INOHAC–Project 2.

  Hierarchical agglomerative clustering with Ward's linkage was applied to 491 bacterial isolates from three regions—BARMM, Central Luzon, and Eastern Visayas—identifying four distinct resistance phenotype clusters. Cluster 3 (n=123) represented the multi-drug resistant archetype, with 66 of 123 isolates (53.7%) classified as MDR—accounting for 94.3% of all 70 MDR isolates—dominated by _Escherichia coli_ and _Klebsiella pneumoniae_. In contrast, Cluster 4 (n=252) exhibited near-complete susceptibility, with only 1 of 252 isolates (0.4%) classified as MDR. The k=4 solution achieved a silhouette score of 0.466, and supervised validation using Random Forest classification attained 99.0% test set accuracy (macro F1 = 0.96), confirming cluster reproducibility.

  Geographic analysis revealed that 66 of 123 Cluster 3 isolates (53.7%) originate from BARMM, identifying this region as the primary MDR hotspot. Environmental analysis showed that 69 of 123 C3 isolates (56.1%) were derived from fish samples, highlighting aquaculture systems as significant resistance reservoirs. Strong co-resistance associations were observed between tetracyclines (Phi=0.81), with implications for empirical therapy selection.

  The validated framework demonstrates the feasibility of machine learning approaches for AMR surveillance in resource-limited settings, providing actionable intelligence for targeted public health intervention within the One Health paradigm.

  #v(0.5cm)

  *Keywords:* antimicrobial resistance, machine learning, hierarchical clustering, One Health, surveillance, Philippines
]
