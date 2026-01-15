// =============================================================================
// PARTIAL EXPORT - Cover Page to Introduction + Results & Discussion
// =============================================================================

#import "template.typ": thesis

// Apply thesis template with metadata
#show: thesis.with(
  title: [Pattern Recognition of Antibiotic Resistance from Water-Fish-Human Nexus],
  author: "Author Name(s)",
  date: "Month Year",
  institution: "University Name",
  department: "College/Department Name",
  degree: "Bachelor of Science in Computer Science",
  adviser: "Prof. Janice F. Wade, MSCS",
  co_adviser: "Mr. Llewelyn A. Elcana",
)

// =============================================================================
// FRONT MATTER
// =============================================================================

#include "chapters/00-front-matter/title-page.typ"
#include "chapters/00-front-matter/table-of-contents.typ"
#include "chapters/00-front-matter/list-of-figures.typ"
#include "chapters/00-front-matter/list-of-tables.typ"

// =============================================================================
// INTRODUCTION (Chapter 1)
// =============================================================================

#include "chapters/01-introduction/_index.typ"

// =============================================================================
// RESULTS AND DISCUSSION (Chapter 6)
// =============================================================================

#include "chapters/06-results-discussion/_index.typ"

// =============================================================================
// REFERENCES (needed for citations in Results & Discussion)
// =============================================================================

#{
  set heading(numbering: none)
  bibliography("references.bib", title: "References", style: "ieee")
}
