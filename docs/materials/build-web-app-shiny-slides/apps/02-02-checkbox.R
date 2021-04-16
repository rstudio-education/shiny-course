# Load packages
library(shiny)
library(tidyverse)

# Load data
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_4850/datasets/movies.Rdata"))

# Define UI for application that plots features of movies
ui <- fluidPage(

  br(),
    
  # Sidebar layout with a input and output definitions
  sidebarLayout(
    # Inputs: Select variables to plot
    sidebarPanel(
      # Select variable for y-axis
      selectInput(inputId = "y", label = "Y-axis:",
                  choices = c("imdb_rating", "imdb_num_votes", "critics_score", "audience_score", "runtime"),
                  selected = "audience_score"),
      # Select variable for x-axis
      selectInput(inputId = "x", label = "X-axis:",
                  choices = c("imdb_rating", "imdb_num_votes", "critics_score", "audience_score", "runtime"),
                  selected = "critics_score"),
      # Show data table
      checkboxInput(inputId = "show_data",
                    label = "Show data table",
                    value = TRUE),
      # Display number of observations
      HTML(paste0("The dataset has ", nrow(movies), "observations."))
    ),

    # Output:
    mainPanel(
      # Show scatterplot
      plotOutput(outputId = "scatterplot"),
      # Show data table
      DT::dataTableOutput(outputId = "moviestable")
    )
  )
)

# Define server function required to create the scatterplot
server <- function(input, output, session) {

  # Create scatterplot object the plotOutput function is expecting
  output$scatterplot <- renderPlot({
    ggplot(data = movies, aes_string(x = input$x, y = input$y)) +
      geom_point()
  })
  
  # Print data table if checked -------------------------------------
  output$moviestable <- DT::renderDataTable(
    if(input$show_data){
      DT::datatable(data = movies %>% select(1:7), 
                    options = list(pageLength = 10), 
                    rownames = FALSE)
    }
  )
  
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)
