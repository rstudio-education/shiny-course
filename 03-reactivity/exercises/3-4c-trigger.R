# Load packages ----------------------------------------------------------------

library(shiny)

# Load data --------------------------------------------------------------------

load("movies.RData")

# Define UI --------------------------------------------------------------------

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      numericInput(
        inputId = "n_rows",
        label = "How many rows do you want to see?",
        value = 10
      ),

      actionButton(
        inputId = "button",
        label = "Show"
      )
    ),

    mainPanel(
      tableOutput(outputId = "datatable")
    )
  )
)

# Define server ----------------------------------------------------------------

server <- function(input, output, session) {

  # Print a message to the console every time button is pressed;
  ___(input$___, {
    cat("Showing", input$n_rows, "rows\n")
  })
  
  # Take a reactive dependency on input$button, but not on any other inputs
  df <- ___(input$___, {
    head(movies, input$n_rows)
  })
  output$___ <- ___({
    df()
  })
  
}

# Create the Shiny app object --------------------------------------------------

shinyApp(ui = ui, server = server)
