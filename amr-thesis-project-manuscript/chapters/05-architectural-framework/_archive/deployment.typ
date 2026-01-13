// Section: Deployment and Execution

== Deployment and Execution

=== Technology Stack

#figure(
  table(
    columns: 3,
    table.header[*Layer*][*Technology*][*Purpose*],
    [Data Processing], [pandas, numpy], [Data manipulation and transformation],
    [Clustering], [scipy.cluster.hierarchy], [Hierarchical agglomerative clustering],
    [Supervised Learning], [scikit-learn], [Classification and validation],
    [Statistical Analysis], [scipy.stats], [Association measures and significance testing],
    [Visualization], [matplotlib, seaborn], [Static figure generation],
    [Dashboard], [Streamlit], [Interactive exploration interface],
    [Artifact Management], [joblib, pickle], [Model and artifact serialization],
    [Configuration], [Python module], [Centralized parameter management],
  ),
  caption: [Technology Stack],
) <tab:technology-stack-ch5>

=== Command-Line Interface

All pipeline operations are invoked through a unified CLI (`main.py`):

#raw(
  block: true,
  lang: "bash",
  "
python main.py --pipeline   # Core data flow: Ingestion → Cleaning → Encoding → Clustering
python main.py --validate   # Run validation scripts
python main.py --analyze    # Run analysis modules
python main.py --viz        # Regenerate all visualizations
python main.py --app        # Launch Streamlit dashboard
python main.py --all        # Run everything in sequence
",
)

=== Dependencies

The system requires Python 3.9+ with dependencies specified in `requirements.txt`. Key dependencies include:

- pandas ≥ 1.3.0
- numpy ≥ 1.21.0
- scipy ≥ 1.7.0
- scikit-learn ≥ 0.24.0
- matplotlib ≥ 3.4.0
- seaborn ≥ 0.11.0
- streamlit ≥ 1.0.0

// // Mermaid Diagram: Complete System Architecture (for external rendering)
// #raw(
//   block: true,
//   lang: "mermaid",
//   "
// flowchart TB
//     subgraph External[\"External Data Sources\"]
//         INOHAC[\"INOHAC Project 2<br/>AST Data<br/>━━━━━━━━━━━━━<br/>• BARMM Region<br/>• Region III<br/>• Region VIII\"]
//     end

//     subgraph System[\"AMR Pattern Recognition System\"]
//         direction TB

//         subgraph Orchestration[\"CLI Orchestrator\"]
//             MAIN[\"main.py<br/>━━━━━━━━━━━━━<br/>--pipeline<br/>--validate<br/>--analyze<br/>--viz<br/>--app\"]
//         end

//         subgraph Configuration[\"Configuration\"]
//             CFG[\"config.py\"]
//         end

//         subgraph DataLayer[\"Data Layer\"]
//             DI[\"data_ingestion.py\"]
//             DC[\"data_cleaning.py\"]
//             RE[\"resistance_encoding.py\"]
//             FE[\"feature_engineering.py\"]
//         end

//         subgraph AnalysisLayer_Full[\"Analysis Layer\"]
//             HC[\"hierarchical_clustering.py\"]
//             SL[\"supervised_learning.py\"]
//             RE2[\"regional_environmental.py\"]
//             IS[\"integration_synthesis.py\"]
//         end

//         subgraph PresentationLayer_Full[\"Presentation Layer\"]
//             VZ[\"visualization.py\"]
//             ST[\"streamlit_app.py\"]
//         end
//     end

//     subgraph Outputs_Full[\"Output Artifacts\"]
//         direction TB
//         DS[\"📊 Processed Datasets\"]
//         FG[\"📈 Figures\"]
//         MD[\"🤖 Trained Models\"]
//         MT[\"📋 Metrics & Reports\"]
//         DB[\"🖥️ Interactive Dashboard\"]
//     end

//     External --> Orchestration
//     Orchestration --> Configuration
//     Configuration --> DataLayer
//     DataLayer --> AnalysisLayer_Full
//     AnalysisLayer_Full --> PresentationLayer_Full

//     DataLayer --> DS
//     AnalysisLayer_Full --> MD
//     AnalysisLayer_Full --> MT
//     PresentationLayer_Full --> FG
//     PresentationLayer_Full --> DB

//     style External fill:#ffebee,stroke:#c62828
//     style INOHAC fill:#fce4ec,stroke:#c2185b
//     style System fill:#fafafa,stroke:#424242
//     style Orchestration fill:#fff9c4,stroke:#f57f17
//     style MAIN fill:#fff8e1,stroke:#ff8f00
//     style Configuration fill:#e8eaf6,stroke:#3f51b5
//     style CFG fill:#e1f5fe,stroke:#01579b
//     style DataLayer fill:#e8f5e9,stroke:#2e7d32
//     style DI fill:#c8e6c9,stroke:#388e3c
//     style DC fill:#c8e6c9,stroke:#388e3c
//     style RE fill:#c8e6c9,stroke:#388e3c
//     style FE fill:#c8e6c9,stroke:#388e3c
//     style AnalysisLayer_Full fill:#fff3e0,stroke:#e65100
//     style HC fill:#ffe0b2,stroke:#f57c00
//     style SL fill:#ffe0b2,stroke:#f57c00
//     style RE2 fill:#ffe0b2,stroke:#f57c00
//     style IS fill:#ffe0b2,stroke:#f57c00
//     style PresentationLayer_Full fill:#e1f5fe,stroke:#01579b
//     style VZ fill:#b3e5fc,stroke:#0288d1
//     style ST fill:#b3e5fc,stroke:#0288d1
//     style Outputs_Full fill:#e0f2f1,stroke:#00695c
//     style DS fill:#b2dfdb,stroke:#00897b
//     style FG fill:#b2dfdb,stroke:#00897b
//     style MD fill:#b2dfdb,stroke:#00897b
//     style MT fill:#b2dfdb,stroke:#00897b
//     style DB fill:#b2dfdb,stroke:#00897b
// ",
// )

// UNCOMMENT AFTER EXPORTING MERMAID DIAGRAM:
#figure(
  image("figures/ch5-complete-system.png", width: 80%),
  caption: [Complete System Architecture],
) <fig:complete-system>
