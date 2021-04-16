# Load packages
library(shiny)
library(tidyverse)

# Load data
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_4850/datasets/movies.Rdata"))

# Create new variable:
# ratio of critics and audience scores
movies <- movies %>%
  mutate(score_ratio = audience_score / critics_score)

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
      # Subset for title types
      checkboxGroupInput(inputId = "selected_title_type", 
                         label = "Select title type:",
                         choices = levels(movies$title_type),
                         selected = levels(movies$title_type))
    ),
    
    # Output:
    mainPanel(
      # Show scatterplot
      plotOutput(outputId = "scatterplot"),
      # Show data table
      tableOutput(outputId = "summarytable")
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
  
  # Create summary table
  output$summarytable <- renderTable(
    {movies %>% 
        filter(title_type %in% input$selected_title_type) %>%
        group_by(mpaa_rating) %>%
        summarise(Mean = mean(score_ratio), SD = sd(score_ratio), n = n())},
    striped = TRUE, spacing = "l", align = "lccr", digits = 4, width = "90%",
    caption = "Score ratio (audience / critics' scores) summary statistics by MPAA rating."
  )
  
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)
