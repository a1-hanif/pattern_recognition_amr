// Section: Presentation Layer

== Presentation Layer

The Presentation Layer supports both static and interactive exploration of analytical results.

=== Static Visualizations

Static visualizations are generated for each analytical output:

- Dendrograms showing hierarchical cluster structure
- Heatmaps displaying resistance profiles ordered by cluster
- Distribution plots for MAR index and MDR status
- Confusion matrices for supervised validation
- Co-resistance network graphs

=== Dimensionality Reduction

Principal Component Analysis (PCA) is performed on resistance feature matrices to enable 2D visualization of high-dimensional patterns. PCA projections are colored by cluster assignment, region, or environment to support exploratory comparison.

=== Interactive Dashboard

An interactive dashboard implemented using Streamlit allows controlled exploration of clusters, regional distributions, individual isolates, and model evaluation summaries.

#figure(
  table(
    columns: 2,
    table.header[*Dashboard View*][*Description*],
    [Cluster Explorer], [Interactive dendrogram with selectable cut-points; cluster-level resistance heatmaps],
    [Regional Distribution], [Geographic breakdown with stacked bar charts showing proportional representation],
    [Co-Resistance Network], [Interactive phi-coefficient heatmap with threshold filtering],
    [Isolate Details], [Individual isolate lookup and resistance profile display],
    [Model Summaries], [Supervised validation metrics and confusion matrices],
  ),
  caption: [Dashboard Components],
) <tab:dashboard-components-ch5>

Metadata is introduced exclusively at this stage to support interpretation without affecting analytical outcomes.

// // Mermaid Diagram: Presentation Layer (for external rendering)
// #raw(
//   block: true,
//   lang: "mermaid",
//   "
// flowchart TB
//     subgraph Input[\"From Analysis Layer\"]
//         CL[\"Cluster Labels\"]
//         MET[\"Metrics\"]
//         X[\"Feature Matrix\"]
//         M[\"Metadata\"]
//     end

//     subgraph PresentationLayer[\"Presentation Layer\"]
//         direction TB

//         subgraph Static[\"Static Visualizations\"]
//             DEND[\"Dendrograms\"]
//             HEAT[\"Heatmaps\"]
//             DIST[\"Distribution Plots\"]
//             CONF[\"Confusion Matrices\"]
//             NET[\"Co-resistance Networks\"]
//         end

//         subgraph DimRed[\"Dimensionality Reduction\"]
//             PCA[\"PCA Analysis<br/>2D Projection<br/>Variance Explained<br/>Component Loading\"]
//         end

//         subgraph Interactive[\"Interactive Dashboard (Streamlit)\"]
//             DASH[\"Dashboard Features<br/>Cluster Explorer<br/>Regional Distribution<br/>Isolate Details<br/>Model Summaries\"]
//         end
//     end

//     subgraph MetadataOverlay[\"Metadata Introduction\"]
//         META[\"Region, Environment,<br/>Species overlaid for<br/>interpretation only\"]
//     end

//     Input --> Static
//     Input --> DimRed
//     Input --> Interactive

//     M --> MetadataOverlay
//     MetadataOverlay -.->|\"Post-hoc only\"| Interactive

//     style Input fill:#fff3e0,stroke:#e65100
//     style CL fill:#ffe0b2,stroke:#f57c00
//     style MET fill:#ffe0b2,stroke:#f57c00
//     style X fill:#ffe0b2,stroke:#f57c00
//     style M fill:#ffe0b2,stroke:#f57c00
//     style PresentationLayer fill:#e1f5fe,stroke:#01579b
//     style Static fill:#e3f2fd,stroke:#1565c0
//     style DEND fill:#bbdefb,stroke:#1976d2
//     style HEAT fill:#bbdefb,stroke:#1976d2
//     style DIST fill:#bbdefb,stroke:#1976d2
//     style CONF fill:#bbdefb,stroke:#1976d2
//     style NET fill:#bbdefb,stroke:#1976d2
//     style DimRed fill:#e8f5e9,stroke:#2e7d32
//     style PCA fill:#c8e6c9,stroke:#388e3c
//     style Interactive fill:#fce4ec,stroke:#c2185b
//     style DASH fill:#f8bbd9,stroke:#d81b60
//     style MetadataOverlay fill:#f3e5f5,stroke:#7b1fa2
//     style META fill:#e1bee7,stroke:#8e24aa
// ",
// )

// UNCOMMENT AFTER EXPORTING MERMAID DIAGRAM:
#figure(
  image("figures/ch5-presentation-layer.png", width: 80%),
  caption: [Presentation Layer Components],
) <fig:presentation-layer>
