// Detailed Architecture - Data Preprocessing

== Data Preprocessing Architecture

The preprocessing architecture transforms raw laboratory AST data into analysis-ready matrices suitable for unsupervised and supervised learning, implementing data integration, quality control, encoding, and feature engineering operations while maintaining provenance and reproducibility.

=== Data Ingestion

Raw CSV files from multiple surveillance sites (BARMM, Central Luzon, Eastern Visayas) are loaded with schema validation. Each file contains isolate records with metadata (collection date, region, facility, species) and AST results for 22 antibiotics.

Operations include:
- Schema harmonization
- Column standardization
- Metadata extraction
- Duplicate resolution

*Output:* `unified_raw_dataset.csv`

=== Data Cleaning

Quality control operations remove isolates with less than 70% antibiotic coverage (ensuring sufficient data for pattern detection) and flag outliers in numerical metadata. Missing value patterns are analyzed to distinguish Missing Completely At Random (MCAR) from systematic missingness.

#figure(
  table(
    columns: 2,
    table.header[*Quality Threshold*][*Value*],
    [MIN_ANTIBIOTIC_COVERAGE], [70%],
    [MAX_ISOLATE_MISSING], [30%],
  ),
  caption: [Data Quality Thresholds],
) <tab:quality-thresholds>

*Outputs:* `cleaned_dataset.csv`, `cleaning_report.txt`

=== Resistance Encoding

Categorical AST results (S/I/R) are converted to numerical resistance scores using ordinal encoding preserving intermediate resistance states:

#figure(
  table(
    columns: 2,
    table.header[*Categorical Value*][*Encoded Value*],
    [Susceptible (S)], [0],
    [Intermediate (I)], [1],
    [Resistant (R)], [2],
  ),
  caption: [Resistance Encoding Scheme],
) <tab:resistance-encoding>

Missing values are imputed using median resistance per antibiotic (maintaining marginal distributions).

*Output:* `encoded_dataset.csv`

=== Feature Engineering

Derived features are computed including:

- *Multiple Antibiotic Resistance (MAR) Index:* Proportion of resistant antibiotics
- *Class-level Resistance Counts:* Number of antibiotic classes with resistance
- *MDR Classification:* Binary flag for isolates resistant to ≥3 antibiotic classes

#figure(
  table(
    columns: 2,
    table.header[*Feature*][*Definition*],
    [MAR Index], [$a slash b$ (resistant antibiotics / total tested)],
    [Resistant Classes], [Count of antibiotic classes with ≥1 resistant drug],
    [MDR Flag], [Classes ≥ 3 (per Magiorakos et al., 2012)],
  ),
  caption: [Engineered Feature Definitions],
) <tab:engineered-features>

Metadata (region, species, environment) are separated from resistance features to prevent leakage into clustering.

*Outputs:* `feature_matrix_X.csv` (491 × 22), `metadata.csv`

This architecture ensures reproducibility through explicit artifact persistence and maintains data lineage for audit trails.
