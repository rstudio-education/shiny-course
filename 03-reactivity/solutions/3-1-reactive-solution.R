# Load packages ----------------------------------------------------------------

library(shiny)
library(dplyr)
library(readr)

# Load data --------------------------------------------------------------------

load("movies.RData")

# Define UI --------------------------------------------------------------------

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        inputId = "filetype",
        label = "Select filetype:",
        choices = c("csv", "tsv"),
        selected = "csv"
      ),

      checkboxGroupInput(
        inputId = "selected_var",
        label = "Select variables:",
        choices = names(movies),
        selected = c("title")
      )
    ),

    mainPanel(
      dataTableOutput(outputId = "moviestable"),
      downloadButton("download_data", "Download data")
    )
  )
)

# Define server ----------------------------------------------------------------

server <- function(input, output, session) {

  # Create reactive data frame
  movies_selected <- reactive({
    movies %>% select(input$selected_var)
  })

  # Create data table
  output$moviestable <- DT::renderDataTable({
    req(input$selected_var)
    datatable(
      data = movies_selected(),
      options = list(pageLength = 10),
      rownames = FALSE
    )
  })

  # Download file
  output$download_data <- downloadHandler(
    filename = function() {
      paste0("movies.", input$filetype)
    },
    content = function(file) {
      if (input$filetype == "csv") {
        write_csv(movies_selected(), file)
      }
      if (input$filetype == "tsv") {
        write_tsv(movies_selected(), file)
      }
    }
  )
}

# Create the Shiny app object --------------------------------------------------

shinyApp(ui = ui, server = server)
