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

  # Pring a message to the console every time button is pressed;
  observeEvent(input$button, {
    cat("Showing", input$n_rows, "rows\n")
  })

  # Take a reactive dependency on input$button,
  # but not on any of the stuff inside the function
  df <- eventReactive(input$button, {
    head(movies, input$n_rows)
  })
  output$datatable <- renderTable({
    df()
  })
}

# Create the Shiny app object --------------------------------------------------

shinyApp(ui = ui, server = server)
