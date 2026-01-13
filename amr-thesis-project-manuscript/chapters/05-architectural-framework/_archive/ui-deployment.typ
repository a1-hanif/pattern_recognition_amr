// Detailed Architecture - System UI and Deployment

== System UI Architecture

The system's interactive interface provides clinicians and researchers with direct access to pattern analysis results through a web-based dashboard, bridging the computational backend with end-user needs for data exploration, cluster visualization, model evaluation, and real-time isolate classification.

=== Dashboard Architecture

The Streamlit web framework provides six interactive pages accessed via navigation sidebar:

#figure(
  table(
    columns: 2,
    table.header[*Page*][*Functionality*],
    [Data Explorer], [Dataset browsing, filtering by region/species/cluster, paginated tables, summary statistics],
    [Cluster Analysis], [Dendrograms, PCA plots, profile heatmaps, quality metrics display],
    [Model Performance], [Confusion matrices, performance metrics comparison, feature importance],
    [Statistical Insights], [Chi-square results, co-resistance networks, association analysis],
    [Classification Tool], [Real-time isolate assignment, clinical guidance, treatment recommendations],
    [Home/Help], [System documentation, usage instructions],
  ),
  caption: [Dashboard Interactive Pages],
) <tab:dashboard-pages>

=== Backend Processing

Session-based caching optimizes performance by persisting loaded models and preprocessed data:

#figure(
  table(
    columns: 2,
    table.header[*Component*][*Technology*],
    [Session Cache], [`\@st.cache_data` decorator for data persistence],
    [Plotting Engines], [Matplotlib/Seaborn (static), Plotly (interactive)],
    [Export Tools], [CSV downloads, PNG exports, PDF reports],
  ),
  caption: [Backend Processing Components],
) <tab:backend-components>

=== Classification Tool Workflow

The classification tool provides point-of-care cluster assignment:

1. *Input:* Users enter AST results for 22 antibiotics via dropdown selectors (S/I/R/Not Tested)
2. *Processing:* Classification engine loads Random Forest model, encodes input, assigns cluster label
3. *Output:* Displays assigned cluster (C1-C4), confidence percentage, clinical guidance
4. *Clinical Guidance:* Treatment recommendations, antibiotics to avoid, infection control alerts for MDR cases

This real-time classification capability operationalizes the pattern recognition framework for clinical use, enabling evidence-based empirical therapy selection based on resistance profile similarity to historical patterns.

== Deployment Modes

The architectural components are integrated through three operational contexts:

#figure(
  table(
    columns: 3,
    table.header[*Mode*][*Use Case*][*Execution*],
    [Offline Analysis], [Batch processing of surveillance datasets], [CLI pipeline (~5 min on standard laptop)],
    [Interactive Exploration], [Data exploration, model evaluation], [Streamlit dashboard (localhost:8501)],
    [Clinical Decision Support], [Point-of-care cluster assignment], [Classification Tool (real-time, \<1s)],
  ),
  caption: [System Deployment Modes],
) <tab:deployment-modes>

=== CLI Orchestration and Configuration

At the system level, execution is orchestrated through a unified command-line interface (`main.py`). All pipeline operations are invoked via explicit CLI flags:

#figure(
  table(
    columns: 2,
    table.header[*CLI Flag*][*Description*],
    [`--pipeline`], [Execute full data preprocessing and clustering pipeline],
    [`--validate`], [Run cluster validation and stability checks],
    [`--sensitivity`], [Perform encoding and threshold sensitivity analysis],
    [`--analyze`], [Execute post-hoc statistical and regional analyses],
    [`--viz`], [Generate all figures and plots],
    [`--app`], [Launch interactive Streamlit dashboard],
    [`--all`], [Run everything in sequence],
    [`--k [n]`], [Override cluster count (optional)],
  ),
  caption: [CLI Orchestration Commands],
) <tab:cli-commands-detailed>

This orchestration design ensures consistent initialization across experiments, prevention of partial or misconfigured execution, and reproducible experiment setup.

=== Configuration Module

All configurable parameters are defined in a single configuration module (`config.py`):

#figure(
  table(
    columns: 2,
    table.header[*Category*][*Parameters*],
    [Path Definitions], [PROJECT_ROOT, DATA_DIR, PROCESSED_DIR, FIGURES_DIR, MODELS_DIR],
    [Reproducibility], [RANDOM_STATE = 42],
    [Data Cleaning], [MIN_ANTIBIOTIC_COVERAGE = 70%, MAX_ISOLATE_MISSING = 30%],
    [Resistance Encoding], [RESISTANCE_ENCODING = {S: 0, I: 1, R: 2}],
    [Antibiotic Classes], [ANTIBIOTIC_CLASSES dict, MDR_CLASSES_BY_SPECIES dict],
    [Clustering], [linkage_method='ward', distance_metric='euclidean', k_selection='combined'],
    [Machine Learning], [test_size=0.20, cv_folds=5, Model hyperparameters],
  ),
  caption: [Configuration Module Parameters],
) <tab:config-params-detailed>
