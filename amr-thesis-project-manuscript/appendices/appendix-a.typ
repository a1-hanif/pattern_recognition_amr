// Appendix A

== Appendix A. Supplementary Figures
#import "../template.typ": extended

This appendix contains additional figures supporting the sensitivity analysis and detailed cluster profiles discussed in the methodology and results sections.

#heading(level: 3, outlined: false)[Sensitivity Analysis: k=5 and k=6]

The silhouette plots below illustrate the cluster validity metrics for alternative k-values (k=5 and k=6), which were compared against the selected optimal k=4 solution.

#figure(
  image("../figures/silhouette_detail_k5.png", width: 90%),
  caption: [Silhouette Analysis for k=5.#extended[ Cluster cohesion remains high, but separation decreases compared to k=4.]],
) <fig:silhouette-k5>

#figure(
  image("../figures/silhouette_detail_k6.png", width: 90%),
  caption: [Silhouette Analysis for k=6.#extended[ The emergence of smaller, less distinct clusters indicates over-segmentation.]],
) <fig:silhouette-k6>


