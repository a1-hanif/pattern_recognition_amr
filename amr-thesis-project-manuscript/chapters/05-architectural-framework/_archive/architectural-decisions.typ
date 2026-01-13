// Section: Architectural Decisions and Constraints

== Architectural Decisions and Constraints

Key architectural decisions were explicitly made to enforce methodological rigor:

#figure(
  table(
    columns: 3,
    table.header[*Decision*][*Goal Supported*][*Constraint*],
    [Clustering--Visualization Separation], [Reproducibility, Interpretability], [Artifact-based communication],
    [Centralized Configuration], [Reproducibility, Control], [Single parameter source],
    [Feature--Metadata Boundary], [Leakage Prevention], [Interface-level separation],
    [Artifact Persistence], [Reproducibility, Modularity], [File-based outputs],
    [Unified CLI], [Reproducibility, Control], [Single entry point],
    [Species-Specific MDR Mappings], [Interpretability], [Configurable class definitions],
  ),
  caption: [Architectural Decisions and Constraints],
) <tab:architectural-decisions-ch5>

// // Mermaid Diagram: Architectural Decisions (for external rendering)
// #raw(
//   block: true,
//   lang: "mermaid",
//   "
// flowchart LR
//     subgraph Decisions[\"Architectural Decisions\"]
//         D1[\"Clustering-Visualization<br/>Separation\"]
//         D2[\"Centralized<br/>Configuration\"]
//         D3[\"Feature-Metadata<br/>Boundary\"]
//         D4[\"Artifact<br/>Persistence\"]
//         D5[\"Unified CLI\"]
//         D6[\"Species-Specific<br/>MDR Mappings\"]
//     end

//     subgraph Goals[\"Supported Goals\"]
//         G1[\"Reproducibility\"]
//         G2[\"Leakage Prevention\"]
//         G3[\"Modularity\"]
//         G4[\"Interpretability\"]
//         G5[\"Experimental Control\"]
//     end

//     D1 --> G1
//     D1 --> G4
//     D2 --> G1
//     D2 --> G5
//     D3 --> G2
//     D4 --> G1
//     D4 --> G3
//     D5 --> G1
//     D5 --> G5
//     D6 --> G4
// ",
// )

// // Mermaid Diagram: Configuration Module (for external rendering)
// #raw(
//   block: true,
//   lang: "mermaid",
//   "
// flowchart TB
//     subgraph ConfigModule[\"Configuration Module (config.py)\"]
//         direction TB

//         subgraph Paths[\"Path Definitions\"]
//             P1[\"PROJECT_ROOT\"]
//             P2[\"DATA_DIR\"]
//             P3[\"PROCESSED_DIR\"]
//             P4[\"FIGURES_DIR\"]
//             P5[\"MODELS_DIR\"]
//         end

//         subgraph Repro[\"Reproducibility\"]
//             R1[\"RANDOM_STATE = 42\"]
//         end

//         subgraph Cleaning[\"Data Cleaning\"]
//             C1[\"MIN_ANTIBIOTIC_COVERAGE\"]
//             C2[\"MAX_ISOLATE_MISSING\"]
//         end

//         subgraph Classes[\"Antibiotic Classes\"]
//             CL1[\"ANTIBIOTIC_CLASSES dict\"]
//             CL2[\"MDR_CLASSES_BY_SPECIES dict\"]
//         end

//         subgraph Clustering_Cfg[\"Clustering\"]
//             CLU1[\"Linkage Method\"]
//             CLU2[\"Distance Metric\"]
//             CLU3[\"K-Selection Criteria\"]
//         end

//         subgraph ML[\"Machine Learning\"]
//             ML1[\"Train-Test Split Ratio\"]
//             ML2[\"CV Folds\"]
//             ML3[\"Model Parameters\"]
//         end
//     end
// ",
// )

#figure(
  image("figures/ch5-architectural-decisions.png", width: 80%),
  caption: [Architectural Decisions and Supported Goals],
) <fig:architectural-decisions>


#figure(
  image("figures/ch5-config-module.png", width: 80%),
  caption: [Configuration Module Structure],
) <fig:config-module>
