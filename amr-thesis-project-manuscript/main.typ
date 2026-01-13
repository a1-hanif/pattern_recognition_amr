// =============================================================================
// THESIS TEMPLATE - main.typ
// Entry point that imports template, bibliography, and assembles all chapters
// =============================================================================
//
// INSTRUCTIONS:
// 1. Update the metadata below with your thesis information
// 2. Add your content to the chapter files in chapters/
// 3. Add your figures to the figures/ folder
// 4. Update references.bib with your citations
// 5. Compile with: typst compile main.typ
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
// #include "chapters/00-front-matter/approval-sheet.typ"
// #include "chapters/00-front-matter/acknowledgement.typ"
// #include "chapters/00-front-matter/dedication.typ"
// #include "chapters/00-front-matter/abstract.typ"
#include "chapters/00-front-matter/table-of-contents.typ"
#include "chapters/00-front-matter/list-of-figures.typ"
#include "chapters/00-front-matter/list-of-tables.typ"

// =============================================================================
// MAIN CHAPTERS
// =============================================================================

#include "chapters/01-introduction/_index.typ"
#include "chapters/02-literature-review/_index.typ"
#include "chapters/03-theoretical-framework/_index.typ"
#include "chapters/04-methodology/_index.typ"
#include "chapters/05-architectural-framework/_index.typ"
#include "chapters/06-results-discussion/_index.typ"
#include "chapters/07-conclusion/_index.typ"

// =============================================================================
// BACK MATTER
// =============================================================================

// Disable chapter numbering for References
#{
  set heading(numbering: none)
  bibliography("references.bib", title: "References", style: "ieee")
}

#include "appendices/_index.typ"
