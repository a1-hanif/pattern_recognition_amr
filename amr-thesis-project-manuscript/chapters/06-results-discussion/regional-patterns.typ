// Section 6.7: Regional and Environmental Patterns
#import "../../template.typ": extended
== Regional and Environmental Distribution Analysis <sec:regional-patterns>

=== Regional Distribution Patterns

The four resistance clusters exhibited differential distribution across the three participating regions, revealing significant regional heterogeneity.

#figure(
  table(
    columns: 5,
    table.header[*Cluster*][*BARMM*][*Central Luzon*][*Eastern Visayas*][*Total*],
    [C1 (Salmonella)], [8.7%], [73.9%], [17.4%], [100%],
    [C2 (Enterobacter)], [41.9%], [52.7%], [5.4%], [100%],
    [C3 (MDR Archetype)], [53.7%], [26.8%], [19.5%], [100%],
    [C4 (Susceptible)], [56.7%], [15.9%], [27.4%], [100%],
    [*Total*], [*50.9%*], [*28.3%*], [*20.8%*], [*100%*],
  ),
  caption: [Regional distribution of resistance phenotype clusters (percentage of each cluster by region)],
) <tab:cluster-region>

*Central Luzon Dominance in C1:* Cluster 1 (_Salmonella_-Aminoglycoside phenotype) shows strong geographic localization to Region III – Central Luzon, with 17 of 23 isolates (73.9%) originating from this region. This concentration suggests localized _Salmonella_ circulation in Central Luzon water systems or region-specific aminoglycoside selection pressure from agricultural antibiotic use.

*BARMM Concentration of MDR:* The MDR Archetype cluster (C3) shows predominant representation in BARMM, with 66 of 123 isolates (53.7%) originating from this region, making BARMM the primary hotspot for multidrug-resistant _E. coli_ and _K. pneumoniae_ @ng2025philippines. BARMM also harbors 143 of 252 C4 isolates (56.7%), indicating both the highest MDR burden and largest reservoir of currently-susceptible isolates vulnerable to future resistance acquisition.

=== Environmental Niche Associations

#figure(
  table(
    columns: 5,
    table.header[*Cluster*][*Fish*][*Hospital*][*Water*][*Total*],
    [C1 (Salmonella)], [30.4%], [0.0%], [69.6%], [100%],
    [C2 (Enterobacter)], [53.8%], [0.0%], [46.2%], [100%],
    [C3 (MDR Archetype)], [56.1%], [7.3%], [36.6%], [100%],
    [C4 (Susceptible)], [58.7%], [12.7%], [28.6%], [100%],
    [*Total*], [*55.8%*], [*8.4%*], [*35.8%*], [*100%*],
  ),
  caption: [Environmental distribution of resistance phenotype clusters],
) <tab:cluster-environment>

*Water-Associated C1:* Cluster 1 shows the strongest water association, with 16 of 23 isolates (69.6%) from water samples, no hospital representation, and only 7 of 23 (30.4%) from fish samples—consistent with _Salmonella_ waterborne ecology.

*Hospital Penetration in C3/C4:* Clusters 3 and 4 are the only clusters with hospital-derived isolates (9 of 123 [7.3%] and 32 of 252 [12.7%] respectively). The higher hospital proportion in the susceptible C4 compared to MDR C3 may reflect that MDR acquisition occurs primarily in environmental reservoirs before clinical introduction.

*Fish Dominance:* Fish samples predominate in Clusters 2–4 (53.8%–58.7%), underscoring aquaculture systems as key resistance reservoirs consistent with the One Health framework @franklin2024onehealth.
