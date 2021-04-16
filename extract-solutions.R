extract_solutions <- function(rmd, out_dir) {

  tutorial <- parse_rmd(rmd)
  solutions <- rmd_select(tutorial, by_label("*-solution"))
  solutions_code <- rmd_node_code(solutions)
  solutions_labels <- rmd_node_label(solutions)

  walk2(solutions_code, file.path(out_dir, paste0(solutions_labels, ".R")), writeLines)

}

extract_solutions(
  rmd = "03-reactivity/03-reactivity.Rmd",
  out_dir = "03-reactivity/solutions/"
  )
