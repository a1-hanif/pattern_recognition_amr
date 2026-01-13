// Section: Statistical Association Analysis
#import "../../template.typ": extended

== Statistical Association Analysis

To characterize the relationships between resistance patterns and external variables, rigorous statistical association methods are employed.

=== Co-Resistance Analysis

Antibiotic co-resistance patterns are quantified using the *phi coefficient (φ)*, calculated from binary resistance co-occurrence tables:

$
  phi = (a d - b c) / sqrt((a+b)(c+d)(a+c)(b+d))
$

where $a$, $b$, $c$, and $d$ represent the counts in a 2×2 contingency table of resistance presence and absence between two antibiotics.

#figure(
  table(
    columns: 3,
    table.header[][*Antibiotic B: R*][*Antibiotic B: S*],
    [Antibiotic A: R], [$a$], [$b$],
    [Antibiotic A: S], [$c$], [$d$],
  ),
  caption: [Phi Coefficient Contingency Table Structure.#extended[ The 2×2 table defines the co-occurrence counts used to calculate the pairwise association between resistance traits.]],
) <tab:phi-coefficient-contingency-table>

Antibiotic clustering based on co-resistance similarity is subsequently performed using hierarchical clustering with distance defined as $1 - phi$.

=== Metadata Association Analysis

Associations between resistance clusters and metadata variables are evaluated using *Cramér's V*, computed as:

$
  V = sqrt(chi^2 / (n dot min(r-1, c-1)))
$

where $chi^2$ is the chi-square statistic, $n$ is the sample size, and $r$ and $c$ are the dimensions of the contingency table. Interpretation thresholds follow established guidelines @cohen1988statistical.

#figure(
  table(
    columns: 2,
    table.header[*Cramér's V Value*][*Association Strength*],
    [< 0.10], [Negligible],
    [0.10 – 0.30], [Small],
    [0.30 – 0.50], [Moderate],
    [> 0.50], [Strong],
  ),
  caption: [Cramér's V Interpretation Guidelines.#extended[ Interpretation thresholds for effect size based on Cohen's standards for contingency table analysis.]],
) <tab:cramers-v-interpretation>

=== Interpretation Protocol

Interpretation follows a strict *staged interpretation strategy* to maintain analytical integrity:

1. Clusters are generated using resistance features only (Unsupervised Discovery)
2. Metadata are overlaid after clustering for descriptive analysis
3. Statistical associations are reported using associational language only
4. No causal claims are made regarding resistance emergence or transmission

This protocol ensures that interpretive conclusions remain within the methodological scope of the study.
