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
                  selected = "critics_score")
    ),

    # Output:
    mainPanel(
      # Show scatterplot with brushing capability
      plotOutput(outputId = "scatterplot", brush = "plot_brush"),
      # Show data table
      DT::dataTableOutput(outputId = "moviestable"),
      br()
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
  
  # Create data table
  output$moviestable <- DT::renderDataTable({
    brushedPoints(movies, brush = input$plot_brush) %>% 
      select(title, audience_score, critics_score)
  })
  
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)
