// Chapter 5: Architectural Design
// Typst Document for AMR Pattern Recognition System

= Architectural Design

== Introduction

This chapter presents the architectural design of the Antimicrobial Resistance (AMR) Pattern Recognition System. The system follows a layered pipeline architecture that transforms raw Antimicrobial Susceptibility Testing (AST) data into actionable insights through a series of well-defined processing stages. The architecture emphasizes modularity, reproducibility, and scientific rigor—ensuring that each component can be independently validated and that the analytical pipeline produces defensible results for clinical and epidemiological applications.

The system architecture comprises four primary stages: (1) Raw Data Input, (2) Data Preprocessing, (3) Pattern Discovery, and (4) Output Visual Representation. Each stage is designed with clear inputs, outputs, and transformation logic, enabling traceability from raw laboratory data to final analytical conclusions.


== Overall System Architecture

The AMR Pattern Recognition System implements a pipeline architecture where data flows sequentially through preprocessing stages before branching into three parallel pattern discovery methods. The results from each analytical approach are then consolidated into unified visual representations for interpretation.

#figure(
  image("figures/figure_5_1_overall_architecture.jpg", width: 100%),
  caption: [Overall System Architecture],
) <fig-overall-architecture>


=== Architecture Components Overview

The overall architecture consists of the following major components:

#figure(
  table(
    columns: (1fr, 2fr, 2fr, 2fr),
    align: left,
    table.header([*Component*], [*Purpose*], [*Input*], [*Output*]),
    [Raw AST Data],
    [Source laboratory data from multiple regional surveillance sites],
    [CSV files containing isolate records with S/I/R interpretations],
    [Unprocessed antimicrobial susceptibility records],

    [Data Preprocessing],
    [Transform raw data into analysis-ready format through ingestion, cleaning, encoding, and feature engineering],
    [Raw CSV files],
    [Cleaned, encoded feature matrix with derived indicators],

    [Pattern Discovery],
    [Apply three complementary analytical methods to identify resistance patterns],
    [Analysis-ready dataset],
    [Cluster assignments, validation metrics, and association scores],

    [Output Visual Representation],
    [Consolidate and visualize findings through interactive dashboards],
    [Results from all pattern discovery methods],
    [Charts, heatmaps, and statistical summaries],
  ),
  caption: [Architecture Components Overview],
) <tbl-components>

The architecture employs a *fan-out pattern* at the Pattern Discovery stage, where the preprocessed data is simultaneously processed by three independent analytical methods. This design ensures that findings can be cross-validated across different methodological approaches, strengthening the scientific validity of conclusions.


== Data Preprocessing Stage

The Data Preprocessing stage transforms heterogeneous raw AST data into a standardized, analysis-ready dataset. This stage is critical for ensuring data quality, reproducibility, and downstream analytical validity. The preprocessing pipeline consists of four sequential sub-stages: Data Ingestion, Data Cleaning, Resistance Encoding, and Feature Engineering.

#figure(
  image("figures/figure_5_2_data_preprocessing.png", width: 100%),
  caption: [Data Preprocessing Stage Architecture],
) <fig-preprocessing>


=== Data Ingestion

The Data Ingestion sub-stage consolidates AST records from multiple regional surveillance sites into a unified dataset. The system processes CSV files from three Philippine regions: BARMM (Bangsamoro Autonomous Region in Muslim Mindanao), Region III (Central Luzon), and Region VIII (Eastern Visayas).

*Key Operations:*
- *Load Multiple CSV Files*: Iteratively reads all CSV files from the raw data directory using glob pattern matching
- *Unify Datasets*: Concatenates individual dataframes into a master dataset while preserving source metadata (region, facility, collection date)
- *Standardize Column Names*: Normalizes column naming conventions and applies species standardization mappings to ensure taxonomic consistency


=== Data Cleaning

The Data Cleaning sub-stage ensures data quality by addressing missing values, invalid entries, and format inconsistencies that could compromise analytical validity.

*Key Operations:*
- *Handle Missing Values*: Identifies and documents missing AST results; applies coverage thresholds to determine acceptable missingness levels
- *Remove Invalid Entries*: Excludes records with ambiguous species identification or incomplete metadata required for stratified analysis
- *Standardize Data Formats*: Normalizes date formats, categorical values, and text fields to ensure consistency
- *Filter by Coverage Thresholds*: Retains only antibiotics and isolates meeting minimum testing coverage requirements (≥70% antibiotic coverage, ≤30% missing values per isolate)


=== Resistance Encoding

The Resistance Encoding sub-stage transforms categorical AST interpretations into numerical values suitable for computational analysis.

*Key Operations:*
- *Convert S/I/R to Numerical*: Applies ordinal encoding where Susceptible (S) = 0, Intermediate (I) = 1, and Resistant (R) = 2
- *Create Encoded Columns*: Generates new columns with `_encoded` suffix containing numerical values while preserving original categorical data
- *Validate Encoding Range*: Verifies all encoded values fall within expected range [0, 1, 2] and flags anomalies


=== Feature Engineering

The Feature Engineering sub-stage derives clinically meaningful indicators from the encoded resistance profiles.

*Key Operations:*
- *Select Encoded Antibiotic Columns*: Identifies all `_encoded` columns to form the resistance fingerprint vector
- *Calculate MAR Index*: Computes the Multiple Antibiotic Resistance Index using the formula $"MAR" = a / b$, where _a_ = number of antibiotics to which the isolate is resistant, and _b_ = total antibiotics tested @krumperman1983mar
- *Determine MDR Status*: Classifies isolates as Multi-Drug Resistant (MDR) if resistant to at least one agent in ≥3 antimicrobial categories @magiorakos2011mdr
- *Create Feature Matrix*: Assembles the final feature matrix (X) containing encoded resistance values for all tested antibiotics


== Pattern Discovery Stage

The Pattern Discovery stage applies three complementary analytical methods to identify, validate, and characterize antimicrobial resistance patterns. Each method addresses a distinct analytical objective while providing cross-validation opportunities. The stage receives the analysis-ready dataset from preprocessing and produces cluster assignments, validation metrics, and association scores.


=== Unsupervised Clustering

The Unsupervised Clustering component identifies natural groupings in resistance patterns without predefined categories. This data-driven approach discovers resistance phenotypes—characteristic patterns of antibiotic susceptibility that may correspond to underlying biological or epidemiological phenomena.

#figure(
  image("figures/figure_5_3_unsupervised_clustering.jpg", width: 100%),
  caption: [Unsupervised Clustering Architecture],
) <fig-clustering>


==== Optimal k Selection

Before clustering, the optimal number of clusters (k) must be determined through systematic evaluation.

*Key Operations:*
- *Elbow Method Analysis*: Plots Within-Cluster Sum of Squares (WCSS) against cluster count; identifies the "elbow point" where additional clusters yield diminishing returns in variance reduction
- *Silhouette Score Analysis*: Computes silhouette coefficients for different k values; higher scores indicate better-defined cluster boundaries
- *Determine Best k Value*: Synthesizes elbow and silhouette analyses with domain knowledge to select the optimal cluster count


==== Hierarchical Clustering

The system employs Hierarchical Agglomerative Clustering (HAC) to group isolates based on resistance profile similarity.

*Key Operations:*
- *Apply Ward's Linkage Method*: Uses Ward's minimum variance criterion to minimize within-cluster variance at each merge step, producing compact and well-separated clusters @ward1963hierarchical
- *Use Euclidean Distance*: Computes pairwise distances between isolates using Euclidean metric, appropriate for numerical resistance vectors and required by Ward's linkage
- *Generate Cluster Assignments*: Cuts the dendrogram at the optimal level to assign each isolate to a specific cluster


==== Quality Metrics

Cluster quality is assessed through internal validation metrics that quantify cluster coherence and separation.

*Key Operations:*
- *Calculate Silhouette Score*: Measures how similar isolates are to their own cluster compared to other clusters; values range from -1 to +1, with higher values indicating better clustering
- *Calculate WCSS*: Computes total within-cluster sum of squares as a measure of cluster compactness
- *Validate Cluster Quality*: Evaluates metrics against established thresholds to confirm clustering validity


=== Supervised Validation

The Supervised Validation component tests whether discovered clusters represent meaningful, predictable patterns. By training machine learning classifiers to predict cluster membership from resistance profiles, this stage validates that clusters capture genuine structure rather than random variation.

#figure(
  image("figures/figure_5_4_supervised_validation.png", height: 100%),
  caption: [Supervised Validation Architecture],
) <fig-supervised>


==== Data Preparation

The clustered dataset is prepared for supervised learning by extracting features and encoding target labels.

*Key Operations:*
- *Filter Valid Samples*: Removes isolates with missing cluster assignments to ensure complete target labels
- *Extract Resistance Fingerprints*: Selects only `_encoded` antibiotic columns as features (X), explicitly excluding metadata to prevent data leakage
- *Encode Target Labels*: Converts categorical cluster identifiers to numerical labels using LabelEncoder for model compatibility


==== Train-Test Split

The dataset is partitioned into training and testing subsets to enable unbiased performance evaluation.

*Key Operations:*
- *80% Training Set*: Used for model fitting and hyperparameter tuning
- *20% Testing Set*: Held out for final performance evaluation; models never see this data during training
- *Stratified Splitting*: Ensures proportional representation of each cluster in both subsets


==== Preprocessing Pipeline

A leakage-safe preprocessing pipeline transforms features using statistics derived only from training data.

*Key Operations:*
- *Fit Imputer on Train*: Learns median values from training data to fill missing antibiotic results
- *Fit Scaler on Train*: Computes mean and standard deviation from training data for standardization
- *Transform Training Data*: Applies fitted transformations to training features
- *Transform Testing Data*: Applies the same transformations (using training statistics) to test features, preventing data leakage from test set into preprocessing


==== Model Training

Three classifier architectures are trained to predict cluster membership, each offering different analytical perspectives.

*Key Operations:*
- *Logistic Regression*: Linear baseline model providing interpretable coefficients and establishing minimum expected performance
- *Random Forest*: Ensemble of decision trees capturing non-linear patterns and providing feature importance rankings
- *K-Nearest Neighbors*: Distance-based classifier validating that clusters occupy distinct regions in feature space
- *Stratified K-Fold CV*: Cross-validation on training set to assess model stability and tune hyperparameters


==== Model Evaluation

All performance metrics are computed exclusively on the held-out test set to provide unbiased estimates of generalization performance.

*Key Operations:*
- *Calculate Accuracy*: Overall proportion of correct cluster predictions on test set
- *Calculate Macro Precision/Recall/F1-Score*: Per-cluster metrics averaged equally to prevent class imbalance bias
- *Generate Confusion Matrix*: Detailed breakdown showing which clusters are correctly classified or confused
- *Extract Feature Importance*: Identifies antibiotics most predictive of cluster membership (from Random Forest), revealing biological drivers of cluster separation


=== Statistical Analysis

The Statistical Analysis component quantifies pairwise relationships between antibiotic resistances through co-resistance analysis. This method identifies which antibiotics tend to co-occur in resistant isolates, potentially indicating shared resistance mechanisms, genetic linkage, or common selective pressures.

#figure(
  image("figures/figure_5_5_statistical_analysis.png", width: 100%),
  caption: [Statistical Analysis Architecture],
) <fig-statistical>


==== Pairwise Preparation

The analysis begins by systematically examining all possible pairs of antibiotics.

*Key Operations:*
- *Extract Antibiotic Pairs*: Generates all unique combinations of antibiotics from the encoded columns using combinatorial enumeration
- *Create Contingency Tables*: Constructs 2×2 tables for each antibiotic pair showing co-occurrence of resistance (R) and non-resistance (S/I) states


==== Statistical Tests

Rigorous statistical tests assess whether observed co-resistance patterns exceed chance expectations.

*Key Operations:*
- *Chi-Square Test*: Tests the null hypothesis that resistance to antibiotic A is independent of resistance to antibiotic B; applies Bonferroni correction to adjust significance threshold for multiple comparisons ($alpha "/" n$ tests)
- *Phi Coefficient*: Calculates effect size for 2×2 contingency tables using the formula $phi = (a d - b c) / sqrt((a+b)(c+d)(a+c)(b+d))$, where values range from -1 (perfect negative association) to +1 (perfect positive association)
- *P-value Matrix*: Compiles significance values for all pairwise tests into a symmetric matrix for visualization and filtering


==== Association Scoring

Significant associations are ranked and characterized to identify the strongest co-resistance relationships.

*Key Operations:*
- *Calculate Association Strength*: Combines statistical significance (p-value) with effect size (phi coefficient) to rank associations
- *Rank Co-resistance Patterns*: Orders antibiotic pairs by association strength to prioritize the most important relationships
- *Identify Significant Pairs*: Filters pairs meeting both significance threshold (Bonferroni-corrected $alpha < 0.05$) and minimum effect size ($phi >= 0.2$) criteria


== Output Visual Representation

The Output Visual Representation stage consolidates results from all three pattern discovery methods into an interactive dashboard for clinical and epidemiological interpretation. The system employs Streamlit for web-based visualization, enabling stakeholders to explore resistance patterns through multiple complementary views.

*Key Outputs:*
- *Cluster Distribution Charts*: Bar charts and pie charts showing isolate distribution across resistance phenotype clusters
- *Resistance Heatmaps*: Color-coded matrices displaying resistance rates by cluster and antibiotic
- *Validation Performance Tables*: Summary statistics from supervised validation including accuracy, precision, recall, and F1-scores
- *Confusion Matrices*: Visual representation of cluster prediction performance
- *Co-resistance Network Graphs*: Network visualization where nodes represent antibiotics and edges indicate significant co-resistance relationships
- *Feature Importance Rankings*: Bar charts showing which antibiotics most strongly differentiate clusters


// == 5.6 System User Interface

// The System User Interface presents the analytical outputs through an interactive web-based dashboard built with Streamlit. The interface organizes functionality into logical modules, enabling users to navigate between data exploration, pattern analysis, advanced analytics, and documentation sections.

// #figure(
//   image("figures/figure_5_6_system_ui.png", width: 100%),
//   caption: [System User Interface Architecture],
// ) <fig-ui>

// The dashboard interface consists of four primary sections:

// + *Header Section*: Displays the application title, subtitle indicating its exploratory purpose, and a prominent disclaimer banner clarifying that the tool is not intended for clinical decision support

// + *Sidebar Navigation*: Provides data status indicators and a radio button menu for selecting among 14 analysis modules

// + *Main Content Area*: Dynamically renders the selected analysis module with interactive visualizations, data tables, and computed metrics

// + *Footer Section*: Contains version information and thesis attribution


// == 5.7 Summary

// The AMR Pattern Recognition System architecture implements a rigorous, multi-method analytical pipeline for antimicrobial resistance surveillance. The design principles emphasize:

// + *Modularity*: Each stage operates independently with well-defined interfaces, enabling component-level testing and future enhancements

// + *Reproducibility*: Explicit parameter documentation and deterministic algorithms ensure results can be replicated

// + *Scientific Validity*: Multiple analytical methods provide cross-validation, while leakage-safe preprocessing ensures unbiased evaluation

// + *Traceability*: Data provenance is maintained from raw CSV files through final visualizations

// + *Usability*: The interactive dashboard interface enables stakeholders to explore resistance patterns through intuitive navigation and visualization

// The three-method Pattern Discovery approach—combining unsupervised clustering, supervised validation, and statistical analysis—provides complementary perspectives on resistance patterns. Unsupervised clustering discovers natural groupings, supervised validation confirms their predictability, and statistical analysis reveals the underlying antibiotic associations driving cluster formation. Together, these methods produce robust, defensible insights for AMR surveillance and intervention planning.

// The System User Interface bridges the gap between complex analytical outputs and end-user interpretation, presenting results through an organized, web-based dashboard that supports data exploration, pattern analysis, and scientific documentation.
