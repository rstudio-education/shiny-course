# Load packages ----------------------------------------------------------------

library(shiny)
library(ggplot2)
library(dplyr)
library(DT)

# Load data --------------------------------------------------------------------

load("movies.RData")
all_studios <- sort(unique(movies$studio))

# Define UI --------------------------------------------------------------------

ui <- fluidPage(
  sidebarLayout(

    # Input(s)
    sidebarPanel(
      selectInput(
        inputId = "studio",
        label = "Select studio:",
        choices = all_studios,
        selected = "20th Century Fox",
        multiple = TRUE
      )
    ),

    # Output(s)
    mainPanel(
      dataTableOutput(outputId = "moviestable")
    )
  )
)

# Server
server <- function(input, output, session) {

  # Create data table
  output$moviestable <- renderDataTable({
    req(input$studio)
    movies_from_selected_studios <- movies %>%
      filter(studio %in% input$studio) %>%
      select(title:studio)
    DT::datatable(
      data = movies_from_selected_studios,
      options = list(pageLength = 10),
      rownames = FALSE
    )
  })
}

# Create a Shiny app object ----------------------------------------------------

shinyApp(ui = ui, server = server)
