library(parsermd)
library(tidyverse)

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
