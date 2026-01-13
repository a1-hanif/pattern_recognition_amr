// Section: Conceptual Framework
// Section: Conceptual Framework
#import "../../template.typ": extended

== Conceptual Framework

The conceptual framework synthesizes the theoretical foundations and supporting concepts into an integrated model that guides the study's analytical design and implementation. This framework establishes the logical flow from abstract theoretical principles to concrete architectural decisions, ensuring methodological coherence throughout the research process.

#figure(
  image("figures/conceptual-framework.jpg", width: 100%),
  caption: [Conceptual Framework Diagram#extended[: Integration of Theoretical Foundation, Conceptual Domain, Implementation Framework, and Research Outputs]],
) <fig:conceptual-framework>

@fig:conceptual-framework illustrates four interconnected components that structure this study's analytical approach:

+ *Theoretical Foundation*: Pattern Recognition Theory provides the computational paradigm for discovering latent resistance structures, while the One Health framework situates AMR within the Water-Fish-Human nexus.

+ *Conceptual Domain*: Abstract principles are operationalized into methodological constraints—cluster validation, information leakage prevention through split-before-transform protocols, ordinal S/I/R encoding (0/1/2), and standardized MDR classification following Magiorakos et al.

+ *Implementation Framework*: A three-tier architecture (Data, Analysis, and Presentation Components) implements the validation pipeline: unsupervised discovery via Hierarchical Agglomerative Clustering with Ward's method, supervised validation using Logistic Regression, Random Forest, and k-NN classifiers, and stability assessment through Adjusted Rand Index and Silhouette scores.

+ *Research Outputs*: Validated resistance profiles, regional surveillance insights, and clinical workflow support.

The directional flow progresses from theoretical justification through operationalization to implementation, with outputs providing empirical validation that informs the theoretical understanding of AMR patterns.
