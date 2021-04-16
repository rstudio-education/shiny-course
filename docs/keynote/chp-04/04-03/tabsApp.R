library(shiny)
library(ggplot2)
library(dplyr)
library(readr)
library(shinythemes)
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_4850/datasets/movies.Rdata"))
movies_codebook <- read_csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_4850/datasets/movies_codebook.csv")

# Define UI with tabs
ui <- fluidPage(
  
  themeSelector(),
   
   # Application title
   titlePanel("Movie browser, 1970 to 2014", windowTitle = "Movies"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         checkboxGroupInput(inputId = "type",
                            label = "Title type:",
                            choices = levels(movies$title_type),
                            selected = "Feature Film")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Plot", plotOutput("plot")),
                    tabPanel("Summary", tableOutput("summary")),
                    tabPanel("Data", DT::dataTableOutput("data")),
                    tabPanel("Reference", tags$p("There data were obtained from",
                                                 tags$a("IMDB", href = "http://www.imdb.com/"), "and",
                                                 tags$a("Rotten Tomatoes", href = "https://www.rottentomatoes.com/"), "."),
                                          tags$p("The data represent ", nrow(movies), "randomly sampled movies 
                                                 released between 1972 to 2014 in the Unites States."))#,
                    #tabPanel("Codebook", DT::dataTableOutput("codebook")
        )
      )
   )
)

# Define server logic
server <- function(input, output, session) {
  
  movies_subset <- reactive({
    movies %>%
      filter(title_type %in% input$type)
  })
  
  output$plot <- renderPlot({
    ggplot(movies_subset(), aes(x = critics_score, y = audience_score, color = mpaa_rating)) +
      geom_point()
   })
  
  output$summary <- renderTable({
    movies_subset() %>%
      group_by(mpaa_rating) %>%
      summarise(mean_as = mean(audience_score), sd_as = sd(audience_score),
                mean_cs = mean(critics_score), sd_cs = sd(critics_score),
                n = n(), cor = cor(audience_score, critics_score))
  }, digits = 3)
  
  output$data <- DT::renderDataTable({
    movies_subset() %>%
      DT::datatable(options = list(pageLength = 10), rownames = FALSE)
  })
  
  output$codebook <- DT::renderDataTable({
    movies_codebook %>%
      DT::datatable(options = list(pageLength = 10, lengthMenu = c(10, 25, 40)), rownames = FALSE)
  })
  
}

# Create the app object
shinyApp(ui = ui, server = server)
