library(parsermd)
library(tidyverse)

# Extract solutions ------------------------------------------------------------

extract_solutions <- function(rmd, out_dir) {

  tutorial <- parse_rmd(rmd)
  solutions <- rmd_select(tutorial, by_label("*-solution"))
  solutions_code <- rmd_node_code(solutions)
  solutions_labels <- rmd_node_label(solutions)
  solutions_labels <- solutions_labels %>%
    str_remove("ex-") %>%
    str_remove("-solution")

  walk2(solutions_code, file.path(out_dir, paste0(solutions_labels, ".R")), writeLines)

}

extract_solutions(
  rmd = "01-hello/01-hello.Rmd",
  out_dir = "01-hello/solutions"
)

extract_solutions(
  rmd = "02-flow/02-flow.Rmd",
  out_dir = "02-flow/solutions"
)

extract_solutions(
  rmd = "03-reactivity/03-reactivity.Rmd",
  out_dir = "03-reactivity/solutions"
)

extract_solutions(
  rmd = "04-ui/04-ui.Rmd",
  out_dir = "04-ui/solutions"
)

# Extract exercises ------------------------------------------------------------

extract_exercises <- function(rmd, out_dir) {

  tutorial <- parse_rmd(rmd)
  exercises <- rmd_select(tutorial, by_label("ex-*") & !by_label("*-solution"))
  exercises_code <- rmd_node_code(exercises)
  exercises_labels <- rmd_node_label(exercises)
  exercises_labels <- exercises_labels %>%
    str_remove("ex-")

  walk2(exercises_code, file.path(out_dir, paste0(exercises_labels, ".R")), writeLines)

}

extract_exercises(
  rmd = "01-hello/01-hello.Rmd",
  out_dir = "01-hello/exercises"
)

extract_exercises(
  rmd = "02-flow/02-flow.Rmd",
  out_dir = "02-flow/exercises"
)

extract_exercises(
  rmd = "03-reactivity/03-reactivity.Rmd",
  out_dir = "03-reactivity/exercises"
)

extract_exercises(
  rmd = "04-ui/04-ui.Rmd",
  out_dir = "04-ui/exercises"
)
