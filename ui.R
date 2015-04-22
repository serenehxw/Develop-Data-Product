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
    helpText("The app allows you to experiment with the one of the most important theorem of statistics."),
    helpText("Play around with NUMBER OF SAMPLES and NUMBER OF BINS."),
    helpText("You should notice, that no matter how crazy the random distribution is the distribution of its sample means approaches normal distribution."),
    helpText("But it's no any normal distribution but one that has the same mean as our initial crazy ever changing random distribution."),
    withMathJax(helpText("Additionally as proven by numbers above standard deviations are also showing incredibly nice relation."))
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot", height = "300px", width="80%"),
    plotOutput("sampleDistPlot", height = "300px", width="80%")
  )
))
