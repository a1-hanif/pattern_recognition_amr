// Detailed Architecture - Statistical Analysis

== Statistical Analysis Architecture

The validation architecture tests hypotheses about cluster-antibiotic associations, co-resistance networks, and metadata influences, implementing chi-square tests, correlation analysis, and regional comparisons.

=== Chi-Square Tests

For each antibiotic, contingency tables are constructed testing the independence between resistance status and cluster membership.

*Hypothesis:* H₀: Cluster assignment and resistance outcome are independent

#figure(
  table(
    columns: 2,
    table.header[*Parameter*][*Value*],
    [ALPHA], [0.05 (significance threshold)],
    [CORRECTION], [Bonferroni],
    [N_COMPARISONS], [22×4 (antibiotics × clusters)],
  ),
  caption: [Chi-Square Test Parameters],
) <tab:chisquare-params>

Bonferroni correction is applied to control family-wise error rate across multiple comparisons.

*Outputs:* χ² statistics per antibiotic, p-values (corrected), `chi_square_results.csv`

=== Phi Coefficient Analysis

Resistance profiles are binarized (R=1, S/I=0) and phi coefficients computed for all antibiotic pairs to identify co-resistance patterns.

#figure(
  table(
    columns: 3,
    table.header[*Antibiotic Pair*][*Phi Coefficient*][*Interpretation*],
    [Doxycycline ↔ Tetracycline], [φ=0.81], [Strongest: mobile _tet_ genes on common plasmids],
    [Chloramphenicol ↔ SXT], [φ=0.62], [Strong: Class 1 integrons carrying _floR_ + _sul1_],
    [Cefoxitin ↔ Ceftiofur], [φ=0.45], [Moderate: veterinary cephalosporin co-resistance],
    [Ampicillin ↔ AMC], [φ=0.38], [Weak-moderate: beta-lactamase production],
  ),
  caption: [Significant Co-Resistance Associations],
) <tab:phi-coefficients>

*Output:* Phi coefficient matrix (22×22), `phi_coefficients.csv`, `correlation_heatmap.png`

=== Cramér's V Analysis

Multi-level associations (S/I/R) are quantified using Cramér's V normalized by minimum dimension. This provides effect size measures for antibiotic-cluster associations.

#figure(
  table(
    columns: 2,
    table.header[*Strength Threshold*][*Interpretation*],
    [V < 0.1], [Negligible association],
    [V = 0.1-0.3], [Weak to moderate],
    [V > 0.3], [Strong association],
  ),
  caption: [Cramér's V Interpretation Guidelines],
) <tab:cramers-v-thresholds>

*Output:* Cramér's V matrix (22×22), `cramers_v_results.csv`, `association_strength.png`

=== Metadata Association Analysis

Chi-square tests evaluate independence between cluster assignments and categorical metadata:

#figure(
  table(
    columns: 2,
    table.header[*Metadata Variable*][*Analysis Method*],
    [Region (3 levels)], [χ² test],
    [Environment (clinical/community)], [χ² test],
    [Species (6 genera)], [χ² test],
    [MAR Index (continuous)], [ANOVA],
  ),
  caption: [Metadata Association Tests],
) <tab:metadata-tests>

*Key Finding:* C3 (MDR archetype) is concentrated in BARMM region, while Central Luzon shows elevated Salmonella-aminoglycoside patterns.

*Outputs:* `metadata_associations.csv`, `cluster_metadata_plots.png`, statistical significance report

This statistical architecture provides rigorous validation of cluster validity, interpretability, and epidemiological relevance.
