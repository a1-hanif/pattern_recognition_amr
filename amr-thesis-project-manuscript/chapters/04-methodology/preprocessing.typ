// Section: Data Preprocessing and Feature Engineering
#import "../../template.typ": extended

== Data Preprocessing and Feature Engineering

The objective of this phase is to transform heterogeneous raw antimicrobial susceptibility testing (AST) records into a structured numerical form that supports similarity-based analysis while preserving biologically meaningful resistance information. All preprocessing decisions are explicitly parameterized to ensure reproducibility and to prevent information leakage in downstream analyses.

=== Data Ingestion and Harmonization

Raw phenotypic AST data are consolidated from multiple source files provided by the INOHAC–Project 2. These files, supplied as comma-separated value (CSV) datasets corresponding to different collection sites, are integrated into a single unified dataset.

The ingestion process includes the following steps:

- *Schema harmonization:* Column names, data types, and value encodings are standardized across source files to ensure structural consistency.
- *Metadata extraction:* Structured isolate identifiers are parsed to extract contextual variables such as geographic region, local site, source category, replicate number, and colony number.
- *Duplicate resolution:* Duplicate isolate records are identified and removed to ensure a one-to-one correspondence between isolates and resistance profiles.

This step ensures that all downstream analyses operate on a coherent and internally consistent dataset.

=== Data Quality Filtering

To ensure sufficient data completeness for reliable pattern recognition, threshold-based filtering criteria were applied at both the antibiotic and isolate levels.

- *Antibiotic-level filtering:* Antibiotics tested on fewer than *70% of isolates* were excluded to ensure adequate representation across resistance profiles.
- *Isolate-level filtering:* Isolates with more than *30% missing susceptibility values* were removed to avoid excessive reliance on imputation.

These thresholds balance data retention with analytical reliability and are consistent with exploratory machine learning practices applied to high-dimensional biological data. All thresholds are established beforehand to avoid after-the-fact adjustments based on results.

Application of these filtering criteria resulted in the following data reduction:

#figure(
  table(
    columns: 2,
    table.header[*Filtering Step*][*Count*],
    [Initial unified dataset], [583 isolates],
    [Duplicates removed], [−2 isolates],
    [Isolates removed (>30% missing data)], [−90 isolates],
    [*Final analysis-ready dataset*], [*491 isolates*],
  ),
  caption: [Data Filtering Summary.#extended[ (84.2% Retention Rate). Quality control filters removed duplicates and low-quality isolates, retaining 491 analysis-ready samples.]],
) <tab:filtering-summary>

Additionally, 9 antibiotics were excluded for failing to meet the 70% coverage threshold: AMI, CFA, CFV, CPT, CTF, GEN, IME, MAR, and `ORIGINAL_SPECIES`. The final antimicrobial panel comprises 21 antibiotics with adequate test coverage.

=== Resistance Encoding

Phenotypic AST outcomes recorded as categorical values—Susceptible (S), Intermediate (I), and Resistant (R)—are converted into ordinal numerical representations to support quantitative analysis.

#figure(
  table(
    columns: 3,
    table.header[*Phenotype*][*Encoded Value*][*Interpretation*],
    [Susceptible (S)], [0], [No resistance observed],
    [Intermediate (I)], [1], [Reduced susceptibility],
    [Resistant (R)], [2], [Clinical resistance],
  ),
  caption: [Ordinal Encoding of Phenotypic AST Results.#extended[ (0 = Susceptible, 1 = Intermediate, 2 = Resistant). Susceptible (0), Intermediate (1), and Resistant (2) values preserve the progressive nature of resistance severity.]],
) <tab:resistance-encoding>

This ordinal encoding preserves the progressive nature of resistance severity while enabling distance-based computations. Sample encoded resistance values are presented in @tab:sample-encoded.

#rotate(-90deg, reflow: true)[
  #figure(
    table(
      columns: (
        0.6fr,
        1.2fr,
        1fr,
        0.8fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.6fr,
      ),
      align: center,
      stroke: 0.5pt,
      inset: 3pt,

      // Header row
      [*Isolate No.*],
      [*Species*],
      [*Region*],
      [*Source*],
      [*AM*],
      [*AMC*],
      [*CF*],
      [*CN*],
      [*IPM*],
      [*GM*],
      [*AN*],
      [*TE*],
      [*DO*],
      [*C*],
      [*SXT*],

      [*MAR*],

      // Data rows - 15 isolates showing encoded values (0=S, 1=I, 2=R)
      [1], [_E. coli_], [BARMM], [EWU], [2], [1], [0], [0], [0], [0], [0], [0], [0], [0], [2], [0.09],
      [2], [_E. coli_], [BARMM], [EWU], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0.00],
      [3], [_K. pneumoniae_], [BARMM], [EWU], [2], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0.05],
      [4], [_E. coli_], [BARMM], [EWU], [0], [0], [0], [0], [0], [0], [0], [2], [2], [0], [0], [0.09],
      [5], [_E. coli_], [BARMM], [EWU], [2], [1], [1], [1], [0], [0], [0], [0], [0], [0], [2], [0.09],
      [6], [_K. pneumoniae_], [BARMM], [DW], [2], [0], [2], [2], [0], [2], [0], [2], [2], [0], [2], [0.38],
      [7], [_K. pneumoniae_], [BARMM], [LW], [2], [2], [2], [2], [0], [2], [0], [2], [2], [0], [2], [0.50],
      [8], [_E. coli_], [Region III], [RW], [2], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0.05],
      [9], [_K. pneumoniae_], [Region III], [RW], [2], [0], [0], [0], [0], [0], [0], [2], [2], [2], [2], [0.23],
      [10], [_E. coli_], [Region III], [FT], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0.00],
      [11], [_E. coli_], [Region III], [FT], [2], [0], [0], [0], [0], [2], [0], [0], [0], [0], [0], [0.09],
      [12], [_K. pneumoniae_], [Region III], [FG], [2], [0], [0], [0], [0], [0], [0], [2], [2], [2], [2], [0.23],
      [13], [_E. coli_], [Region VIII], [DW], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0.00],
      [14], [_E. coli_], [Region VIII], [FG], [0], [0], [0], [0], [0], [0], [0], [2], [2], [0], [2], [0.18],
      [15], [_E. coli_], [Region VIII], [FG], [2], [0], [0], [0], [0], [0], [0], [2], [2], [2], [2], [0.18],
      [16], [_K. pneumoniae_], [Region VIII], [FG], [2], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0.05],
      [17], [_E. coli_], [Region VIII], [FG], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0.00],
      [18], [_E. coli_], [BARMM], [EWT], [0], [0], [0], [0], [0], [0], [0], [2], [0], [0], [0], [0.14],
      [19], [_K. pneumoniae_], [Region III], [FG], [2], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0.05],
      [20], [_E. coli_], [Region III], [RW], [2], [0], [0], [0], [0], [2], [0], [0], [0], [0], [0], [0.09],
    ),
    caption: [Sample Encoded Resistance Values.#extended[ (0 = Susceptible, 1 = Intermediate, 2 = Resistant). AM: Ampicillin, AMC: Amoxicillin/Clavulanic Acid, CF: Cefalotin, CN: Cefalexin, IPM: Imipenem, GM: Gentamicin, AN: Amikacin, TE: Tetracycline, DO: Doxycycline, C: Chloramphenicol, SXT: Trimethoprim/Sulfamethoxazole.]],
  ) <tab:sample-encoded>
]

=== Missing Value Imputation

Following threshold-based exclusion, remaining missing susceptibility values are imputed using *median imputation*, applied independently to each antibiotic feature:

$
  hat(x)_(i,j) = "median"({x_(k,j) | x_(k,j) "is observed"})
$

where $hat(x)_(i,j)$ is the imputed resistance value for isolate $i$ and antibiotic $j$, and $x_(k,j)$ represents observed resistance values for antibiotic $j$.

Median imputation is robust to outliers and preserves the ordinal nature of resistance data. Alternative strategies such as mean or mode imputation are considered; however, the median provides a conservative central estimate suitable for exploratory pattern recognition.

=== Derived Resistance Feature Computation

To support downstream interpretation and epidemiological contextualization, several derived resistance descriptors are computed. These features are *not included as inputs* to unsupervised clustering to prevent bias during pattern discovery.

==== Multiple Antibiotic Resistance (MAR) Index

The MAR index quantifies the proportion of antibiotics to which an isolate exhibits resistance:

$
  "MAR" = a / b
$

where $a$ is the number of antibiotics for which resistance is observed (encoded value = 2), and $b$ is the total number of antibiotics tested for the isolate.

*Interpretation:*

- MAR ≤ 0.2: Low-risk source
- MAR > 0.2: High-risk source, indicative of antibiotic selection pressure


==== Resistant Classes Count

The breadth of resistance across antimicrobial classes was computed as:

$
  "Resistant Classes" = |{c | exists a in c, "resistance"(a) = "true"}|
$

where $c$ denotes an antimicrobial class and $a$ denotes an antibiotic belonging to that class.

This metric captures class-level resistance diversity rather than resistance to individual agents.

==== Multidrug Resistance (MDR) Classification

An isolate is classified as multidrug-resistant (MDR) if resistance is observed in *three or more antimicrobial classes*, consistent with established definitions @magiorakos2011mdr:

$
  "MDR" = cases(
    1\, & "if Resistant Classes" >= 3,
    0\, & "otherwise"
  )
$



=== Feature–Metadata Separation

To prevent *information leakage* and circular reasoning, the analysis-ready dataset is explicitly partitioned into two components:

- *Feature Matrix ($bold(X)$):* Encoded resistance values for the 22 antibiotics, used exclusively for unsupervised clustering and supervised validation.
- *Metadata Matrix ($bold(M)$):* Contextual variables (e.g., region, site, species, source category, MDR status), reserved solely for post-discovery interpretation.

This separation ensures that resistance patterns are discovered strictly from phenotypic similarity and are not influenced by external labels or contextual information.

=== Preprocessing Component Output

The output of the preprocessing component consists of:

- Analysis-ready resistance feature matrix with encoded susceptibility values
- Derived resistance indicators (MAR, Resistant Classes, MDR status)
- Separated metadata matrix for post-hoc interpretation
- Data quality documentation including filtering statistics

Following preprocessing, the analysis-ready dataset comprises 491 isolates with standardized species names and complete resistance profiles. Sample records from the preprocessed dataset are presented in @tab:sample-isolates-clean.

#rotate(-90deg, reflow: true)[
  #figure(
    table(
      columns: (
        0.6fr,
        1.2fr,
        1fr,
        0.8fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.4fr,
        0.5fr,
        0.6fr,
      ),
      align: center,
      stroke: 0.5pt,
      inset: 3pt,

      // Header row
      [*Isolate No.*],
      [*Species*],
      [*Region*],
      [*Source*],
      [*AM*],
      [*AMC*],
      [*CF*],
      [*CN*],
      [*IPM*],
      [*GM*],
      [*AN*],
      [*TE*],
      [*DO*],
      [*C*],
      [*SXT*],
      [*MDR*],

      [*MAR*],

      // Data rows - 20 diverse isolates from analysis_ready_dataset (n=491)
      // Encoded values: 0=Susceptible, 1=Intermediate, 2=Resistant
      // BARMM - Hospital Effluent
      [1], [_E. coli_], [BARMM], [EWU], [2], [1], [0], [0], [0], [0], [0], [0], [0], [0], [2], [No], [0.09],
      [2], [_K. pneumoniae_], [BARMM], [EWU], [2], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [No], [0.05],
      [3], [_E. coli_], [BARMM], [EWT], [2], [0], [0], [0], [0], [0], [0], [2], [2], [0], [2], [Yes], [0.14],
      // BARMM - Water sources
      [4], [_E. coli_], [BARMM], [DW], [2], [0], [0], [0], [0], [0], [0], [2], [2], [0], [2], [Yes], [0.18],
      [5], [_K. pneumoniae_], [BARMM], [DW], [2], [0], [2], [2], [0], [2], [0], [2], [2], [0], [2], [Yes], [0.38],
      [6], [_K. pneumoniae_], [BARMM], [LW], [2], [2], [2], [2], [0], [2], [0], [2], [2], [0], [2], [Yes], [0.50],
      [7], [_E. coli_], [BARMM], [LW], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [No], [0.00],
      // Region III - Water
      [8], [_E. coli_], [Region III], [RW], [2], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [No], [0.05],
      [9], [_K. pneumoniae_], [Region III], [RW], [2], [0], [0], [0], [0], [0], [0], [2], [2], [2], [2], [Yes], [0.23],
      [10], [_E. coli_], [Region III], [RW], [2], [0], [0], [0], [0], [2], [0], [0], [0], [0], [0], [No], [0.09],
      // Region III - Fish
      [11], [_E. coli_], [Region III], [FT], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [No], [0.00],
      [12], [_E. coli_], [Region III], [FT], [2], [0], [0], [0], [0], [2], [0], [0], [0], [0], [0], [No], [0.09],
      [13], [_K. pneumoniae_], [Region III], [FG], [2], [0], [0], [0], [0], [0], [0], [2], [2], [2], [2], [Yes], [0.23],
      [14], [_K. pneumoniae_], [Region III], [FG], [2], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [No], [0.05],
      // Region VIII - Water
      [15], [_E. coli_], [Region VIII], [DW], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [No], [0.00],
      [16], [_E. coli_], [Region VIII], [DW], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [No], [0.00],
      // Region VIII - Fish
      [17], [_E. coli_], [Region VIII], [FG], [0], [0], [0], [0], [0], [0], [0], [2], [2], [0], [2], [Yes], [0.18],
      [18], [_E. coli_], [Region VIII], [FG], [2], [0], [0], [0], [0], [0], [0], [2], [2], [2], [2], [Yes], [0.18],
      [19], [_K. pneumoniae_], [Region VIII], [FG], [2], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [No], [0.05],
      [20], [_E. coli_], [Region VIII], [FG], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [No], [0.00],
    ),
    caption: [Sample Isolate Records from the Analysis-Ready Dataset.#extended[ (n = 491). Resistance values encoded as: 0 = Susceptible, 1 = Intermediate, 2 = Resistant. AM: Ampicillin, AMC: Amoxicillin/Clavulanic Acid, CF: Cefalotin, CN: Cefalexin, IPM: Imipenem, GM: Gentamicin, AN: Amikacin, TE: Tetracycline, DO: Doxycycline, C: Chloramphenicol, SXT: Trimethoprim/Sulfamethoxazole. MDR: Multidrug-resistant (≥3 classes). Source codes: DW: Drinking Water, LW: Lake Water, RW: River Water, EWU/EWT: Effluent Water, FT: Fish Tilapia, FG: Fish Gusaw.]],
  ) <tab:sample-isolates-clean>
]
