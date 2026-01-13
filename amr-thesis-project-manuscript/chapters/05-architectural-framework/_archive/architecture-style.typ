// Section: Overall Architecture Style

== Overall Architecture Style

The system adopts a *layered architectural style*, consisting of a Data Layer, Analysis Layer, and Presentation Layer. This structure mirrors the methodological progression from data preprocessing to pattern discovery and interpretation.

#figure(
  table(
    columns: 3,
    table.header[*Layer*][*Components*][*Data Flow*],
    [*Presentation Layer*], [Static Visualizations, Interactive Dashboard, PCA Projections], [Outputs to user],
    [*Analysis Layer*],
    [Hierarchical Clustering, Supervised Validation, Statistical Analysis],
    [Processes feature matrices],

    [*Data Layer*],
    [Data Ingestion, Quality Filtering, Resistance Encoding, Feature Engineering],
    [Receives raw AST data],
  ),
  caption: [Layered Architecture Overview],
) <tab:layered-architecture>

Layered architecture was selected because it:

- naturally aligns with sequential ML workflows,
- enforces separation of concerns,
- prevents circular dependencies, and
- provides clear validation boundaries between phases.

// // Mermaid Diagram: Layered Architecture (for external rendering)
// #raw(
//   block: true,
//   lang: "mermaid",
//   "
// flowchart TB
//     subgraph Layer3[\"Presentation Layer\"]
//         direction LR
//         P1[\"Static Visualizations\"]
//         P2[\"Interactive Dashboard\"]
//         P3[\"PCA Projections\"]
//     end

//     subgraph Layer2[\"Analysis Layer\"]
//         direction LR
//         A1[\"Hierarchical Clustering\"]
//         A2[\"Supervised Validation\"]
//         A3[\"Statistical Analysis\"]
//     end

//     subgraph Layer1[\"Data Layer\"]
//         direction LR
//         D1[\"Data Ingestion\"]
//         D2[\"Quality Filtering\"]
//         D3[\"Resistance Encoding\"]
//         D4[\"Feature Engineering\"]
//     end

//     subgraph External[\"External Data\"]
//         RAW[\"Raw AST Data (INOHAC Project 2)\"]
//     end

//     RAW --> Layer1
//     Layer1 --> Layer2
//     Layer2 --> Layer3
// ",
// )

// UNCOMMENT AFTER EXPORTING MERMAID DIAGRAM:
#figure(
  image("figures/ch5-layered-architecture.png", width: 80%),
  caption: [Layered Architecture Overview],
) <fig:layered-architecture>
