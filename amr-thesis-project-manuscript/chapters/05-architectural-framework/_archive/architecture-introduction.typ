// Detailed Architectural Design - Introduction

== Introduction

This section presents the comprehensive architectural design of the implemented pattern recognition system for antimicrobial resistance (AMR) within the Water–Fish–Human nexus. The architecture corresponds to a fully implemented and operational system, processing antimicrobial susceptibility testing (AST) data from 491 bacterial isolates comprising six species: _Escherichia coli_ (46.2%), _Klebsiella pneumoniae_ (30.3%), _Enterobacter cloacae_ (13.8%), _Enterobacter aerogenes_ (4.7%), _Salmonella_ spp. (4.7%), and _Vibrio vulnificus_ (0.2%), collected across environmental and clinical sources from three Philippine regions.


=== Overall Architecture Style

The system adopts a *layered architectural style*, consisting of a Data Layer, Analysis Layer, and Presentation Layer. This structure mirrors the methodological progression from data preprocessing to pattern discovery and interpretation.

#figure(
  table(
    columns: 3,
    table.header[*Layer*][*Components*][*Data Flow*],
    [Presentation Layer], [Static Visualizations, Interactive Dashboard, PCA Projections], [Outputs to user],
    [Analysis Layer],
    [Hierarchical Clustering, Supervised Validation, Statistical Analysis],
    [Processes feature matrices],

    [Data Layer],
    [Data Ingestion, Quality Filtering, Resistance Encoding, Feature Engineering],
    [Receives raw AST data],
  ),
  caption: [Layered Architecture Overview],
) <tab:layered-architecture>

Layered architecture was selected because it naturally aligns with sequential ML workflows, enforces separation of concerns, prevents circular dependencies, and provides clear validation boundaries between phases.
