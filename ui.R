library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Classical Central Limit Theorem"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("n", 
                "Number of samples:", 
                min = 1,
                max = 2500, 
                value = 100),
    sliderInput("bins", 
                "Number of bins:", 
                min = 1,
                max = 100, 
                value = 20),
    withMathJax(),
    uiOutput('population_mean'),
    uiOutput('sample_means_mean'),
    uiOutput('population_sd'),
    uiOutput('sample_means_mean_sd'),
    
    h4("Documentation"),
    helpText("The app allows you to experiment with the one of the theorem of statistics."),
    helpText("Experiment around with the Number of samples and the Number of bins."),
    withMathJax(helpText("Hope this app helps."))
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot", height = "300px", width="80%"),
    plotOutput("sampleDistPlot", height = "300px", width="80%")
  )
))