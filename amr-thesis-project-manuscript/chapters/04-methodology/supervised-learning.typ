// Section: Supervised Validation
#import "../../template.typ": extended

== Supervised Learning Validation

Supervised learning models are used solely to validate the discriminative capacity of the discovered resistance patterns. This phase implements leakage-safe train–test splitting, macro-averaged evaluation metrics, confusion matrix analysis, feature importance extraction, and cross-seed stability checks.

=== Classification Task

Supervised classification is designed to validate the unsupervised clustering results by assessing whether the discovered clusters represent discriminable resistance phenotypes:

#figure(
  table(
    columns: 3,
    table.header[*Task*][*Target Variable*][*Purpose*],
    [Cluster Discrimination], [Cluster assignment], [Validate that clusters represent discriminable phenotypes],
  ),
  caption: [Supervised Classification Task.#extended[ The objective is to validate that clusters represent discriminable phenotypes using cluster assignment as the target variable.]],
) <tab:supervised-classification-tasks>

=== Leakage-Safe Data Splitting

To prevent information leakage between training and evaluation phases, the dataset is first partitioned into *training (80%) and test (20%) subsets* using stratified sampling to preserve class distributions. *Train–test splitting is performed prior to any preprocessing operations*, including missing value imputation and feature scaling.

All preprocessing steps are fitted *exclusively on the training data*, and the learned parameters are subsequently applied unchanged to both the training and test sets. This ensures that statistical properties of the test data do not influence model training, thereby preventing optimistic bias in supervised evaluation metrics.

=== Model Selection

Three classifier families are selected to represent different learning paradigms:

#figure(
  table(
    columns: 3,
    table.header[*Model*][*Category*][*Rationale*],
    [Logistic Regression], [Linear], [Baseline; interpretable coefficients],
    [Random Forest], [Tree-based], [Nonlinear; feature importance via Gini impurity],
    [k-Nearest Neighbors], [Distance-based], [Instance-based; consistency check against clustering],
  ),
  caption: [Supervised Model Selection.#extended[ Three distinct model families (Linear, Tree-based, Distance-based) were chosen to evaluate cluster robustness across different learning paradigms.]],
) <tab:supervised-model-selection>

// Model comparison visualization available in Chapter 6 Results (see validation-results.typ tables)

*Hyperparameter Configuration:*

#figure(
  table(
    columns: 2,
    table.header[*Model*][*Parameters*],
    [Logistic Regression], [`max_iter=1000`, `solver='lbfgs'`],
    [Random Forest], [`n_estimators=100`, `random_state=42`],
    [k-Nearest Neighbors], [`n_neighbors=5`],
  ),
  caption: [Model Hyperparameters.#extended[ Configuration settings for the three classifiers used in the validation phase.]],
) <tab:model-hyperparameters>

=== Evaluation Metrics

Performance is quantified using macro-averaged metrics to prevent class imbalance bias:

==== Macro-Averaged Precision, Recall, F1

$
  "Precision"_"macro" = 1 / (|C|) sum_(c in C) ("TP"_c) / ("TP"_c + "FP"_c)
$

$
  "Recall"_"macro" = 1 / (|C|) sum_(c in C) ("TP"_c) / ("TP"_c + "FN"_c)
$

$
  F_1 = (2 times "Precision" times "Recall") / ("Precision" + "Recall")
$

where $C$ is the set of classes and $"TP"$, $"FP"$, $"FN"$ are true positives, false positives, and false negatives respectively.

==== Accuracy

Overall classification correctness is measured as:

$
  "Accuracy" = ("TP" + "TN") / ("TP" + "TN" + "FP" + "FN")
$

==== Confusion Matrix

Per-class classification performance is visualized using confusion matrices to identify species-specific misclassification patterns.

=== Feature Importance Extraction

For Random Forest models, feature importance is extracted using Gini impurity:

$
  "Importance"(f) = sum_(t in T) Delta G_t dot bb(1)[f_t = f]
$

where $Delta G_t$ is the decrease in Gini impurity at node $t$ when feature $f$ is used for splitting.

*Language Discipline:* Feature importance reflects _associative_ relationships within the dataset. High importance indicates statistical association, not causal influence on resistance phenotype.

=== Stability Across Random Seeds

Model stability is validated across multiple random states to ensure that model performance is not dependent on a specific random initialization:

#figure(
  image("../../figures/cross_seed_stability_algorithm.png", width: 85%),
  caption: [Cross-Seed Stability Check Algorithm.#extended[ The process iterates through five distinct random seeds to generate a distribution of performance metrics ($v_s$), from which the mean ($mu$) and standard deviation ($sigma$) are calculated to quantify model stability.]],
) <alg:cross-seed-stability-visual>

Low standard deviation across seeds indicates robust model performance.

=== Sensitivity Analysis: Split Ratio and Cross-Validation

To justify the train–test split configuration, a sensitivity analysis is conducted comparing different partitioning strategies. Three split ratios (70/30, 80/20, 90/10) and two cross-validation schemes (5-fold, 10-fold) are evaluated across all three classifier models to determine the optimal balance between training adequacy and evaluation reliability.

==== Sensitivity Analysis Interpretation

The sensitivity analysis provides the following rationale for the chosen experimental configuration:

1. *Stability Assessment*: Standard deviations are analyzed across random seeds to ensure that the discriminative capacity is not an artifact of random initialization.

2. *80/20 Split Rationale*: The 80/20 split is selected as it provides a statistically reliable test set size (≈98 samples) while maintaining sufficient training data, balancing model learning capacity with robust evaluation.

3. *Cross-Validation Selection*: 5-fold and 10-fold cross-validation produce comparable stability. Given the computational efficiency of 5-fold CV, it is preferred for the full experimental pipeline.

4. *Model Selection*: Random Forest is selected as the primary validation model due to its consistently stable performance and its ability to provide interpretable feature importance through Gini impurity.

These findings support the use of the *80/20 train–test split with Random Forest and 5-fold cross-validation* as the robust standard configuration for supervised validation.

=== Supervised Validation Output

The output of this phase consists of:

- Classification performance metrics for each model and task
- Confusion matrices for per-class analysis
- Feature importance rankings from Random Forest
- Cross-seed stability statistics
- Sensitivity analysis results across split configurations
- Serialized model artifacts for deployment (`.joblib`)
- Structured feature importance data for dashboard integration (`.json`)

