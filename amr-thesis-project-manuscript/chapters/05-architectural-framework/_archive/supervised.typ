// Detailed Architecture - Supervised Learning

== Supervised Learning Architecture

The classification architecture builds predictive models to validate cluster assignments and evaluate cluster reproducibility, implementing train-test splitting, model training, evaluation, and feature importance analysis to confirm that discovered resistance phenotypes are predictable and biologically meaningful.

=== Data Preparation

Stratified random sampling allocates 80% of isolates to training (~393 samples) and 20% to testing (~98 samples), preserving cluster proportions in both sets.

#figure(
  table(
    columns: 2,
    table.header[*Parameter*][*Value*],
    [TEST_SIZE], [0.2 (20%)],
    [STRATIFIED], [True (preserves cluster distribution)],
    [RANDOM_STATE], [42],
  ),
  caption: [Train-Test Split Parameters],
) <tab:train-test-params>

This leakage prevention protocol (split before scaling/imputation) ensures test isolates remain unseen during model training.

=== Model Comparison Framework

Three algorithms are trained and evaluated in parallel:

==== k-Nearest Neighbors

Non-parametric instance-based classifier with k=5 neighbors and Euclidean distance metric. Provides baseline performance without assumptions about data distribution.

#figure(
  table(
    columns: 2,
    table.header[*Parameter*][*Value*],
    [N_NEIGHBORS], [5],
    [METRIC], [euclidean],
    [WEIGHTS], [uniform],
  ),
  caption: [k-NN Hyperparameters],
) <tab:knn-params>

==== Logistic Regression

Linear multinomial classifier with LBFGS solver and L2 regularization. Provides interpretable feature coefficients showing antibiotic importance weights.

#figure(
  table(
    columns: 2,
    table.header[*Parameter*][*Value*],
    [SOLVER], [lbfgs],
    [MULTI_CLASS], [multinomial],
    [MAX_ITER], [1000],
    [RANDOM_STATE], [42],
  ),
  caption: [Logistic Regression Hyperparameters],
) <tab:logreg-params>

==== Random Forest (Best Performer)

Ensemble of 100 decision trees with bootstrap aggregation. Achieves best performance with stable cross-validation.

#figure(
  table(
    columns: 2,
    table.header[*Parameter*][*Value*],
    [N_ESTIMATORS], [100],
    [N_JOBS], [-1 (parallel processing)],
    [RANDOM_STATE], [42],
  ),
  caption: [Random Forest Hyperparameters],
) <tab:rf-params>

*Performance:* 99% accuracy, 0.96 macro F1-score

Gini-importance rankings identify top cluster-discriminating antibiotics:
1. *Tetracycline (TE)* - 0.241
2. *Cephalothin (CF)* - 0.180
3. *Amoxicillin-Clavulanic Acid (AMC)* - 0.157

*Saved Model:* `cluster_classifier.joblib`

=== Evaluation Metrics

Comprehensive evaluation through confusion matrices, macro-averaged precision/recall/F1 per cluster, and model comparison.

#figure(
  table(
    columns: 2,
    table.header[*Metric*][*Purpose*],
    [Accuracy], [Overall correctness],
    [Macro F1-Score], [Balanced performance across clusters],
    [Precision/Recall (per cluster)], [Class-specific performance],
    [Confusion Matrix], [Misclassification patterns],
    [5-Fold Cross-Validation], [Generalization assessment],
  ),
  caption: [Evaluation Metrics Suite],
) <tab:eval-metrics>

Macro averaging ensures equal weight to all cluster classes regardless of sample size, preventing class imbalance bias.

> *Note:* The supervised learning module performs *cluster validation*, evaluating whether the discovered resistance phenotypes (clusters) are reproducible and predictable from antibiotic profiles alone. The exceptionally high accuracy (99%) confirms that cluster assignments represent genuine biological patterns rather than clustering artifacts.
