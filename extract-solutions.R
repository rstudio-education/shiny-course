library(parsermd)
library(tidyverse)

# Extract solutions ------------------------------------------------------------

extract_solutions <- function(rmd, out_dir = "solutions") {

  tutorial <- parse_rmd(rmd)
  solutions <- rmd_select(tutorial, by_label("*-solution"))
  solutions_code <- rmd_node_code(solutions)
  solutions_labels <- rmd_node_label(solutions)
  solutions_labels <- solutions_labels %>%
    str_remove("ex-") %>%
    str_remove("-solution")

  walk2(solutions_code, file.path(out_dir, paste0(solutions_labels, ".R")), writeLines)

}

extract_solutions(rmd = "01-hello/01-hello.Rmd")

extract_solutions(rmd = "02-flow/02-flow.Rmd")

extract_solutions(rmd = "03-reactivity/03-reactivity.Rmd")

extract_solutions(rmd = "04-ui/04-ui.Rmd")

# Extract exercises ------------------------------------------------------------

extract_exercises <- function(rmd, out_dir = "exercises") {

  tutorial <- parse_rmd(rmd)
  exercises <- rmd_select(tutorial, by_label("ex-*") & !by_label("*-solution"))
  exercises_code <- rmd_node_code(exercises)
  exercises_labels <- rmd_node_label(exercises)
  exercises_labels <- exercises_labels %>%
    str_remove("ex-")

  walk2(exercises_code, file.path(out_dir, paste0(exercises_labels, ".R")), writeLines)

}

extract_exercises(rmd = "01-hello/01-hello.Rmd")

extract_exercises(rmd = "02-flow/02-flow.Rmd")

extract_exercises(rmd = "03-reactivity/03-reactivity.Rmd")

extract_exercises(rmd = "04-ui/04-ui.Rmd")
