# Load packages ----------------------------------------------------------------

library(shiny)
library(ggplot2)
options("shiny.sanitize.errors" = FALSE) # Turn off error sanitization

# Load data --------------------------------------------------------------------

load("movies.RData")
n_total <- nrow(movies)

# Define UI --------------------------------------------------------------------

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      HTML(paste("Enter a value between 1 and", n_total)),

      numericInput(
        inputId = "n",
        label = "Sample size:",
        value = 30,
        min = 1, max = n_total,
        step = 1
      )
    ),

    mainPanel(
      dataTableOutput(outputId = "moviestable")
    )
  )
)

# Define server ----------------------------------------------------------------

server <- function(input, output, session) {
  output$moviestable <- renderDataTable({
    req(input$n)
    movies_sample <- movies %>%
      sample_n(input$n) %>%
      select(title:studio)
    datatable(
      data = movies_sample,
      options = list(pageLength = 10),
      rownames = FALSE
    )
  })
}

# Create a Shiny app object ----------------------------------------------------

shinyApp(ui = ui, server = server)
