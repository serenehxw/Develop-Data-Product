library(shiny)


shinyServer(function(input, output) {
  
  data <- reactive({
    n <- input$n
    bins <- input$bins
    
    randomDist <- sample(1:100, 10)
    randomDistVals <- 1:10
    randomDist <- randomDist / sum(randomDist)
    
    means <- c()
    for (i in 1:n) {
      randomSample <- sample(
        x=randomDistVals, size=n, replace=TRUE, prob=randomDist)
      means <- c(means, mean(randomSample))    
    }
    
    list(n=n, bins=bins, dist=randomDist, vals=randomDistVals, means=means)
  })
  
  output$sampleDistPlot <- renderPlot({
    data <- data()
    meansDist <- data$means
    bins <- data$bins
    
    hist(meansDist, prob=TRUE, main="Distribution of Sample Means", breaks=bins)
    # add a density estimate with defaults
    lines(density(meansDist))             
  })
  
  output$distPlot <- renderPlot({
    data <- data()
    randomDist <- data$dist
    
    barplot(randomDist, main="Random Discrete Distribution")
  })  
  
  output$population_mean <- renderUI({
    data <- data()
    randomDist <- data$dist
    randomVals <- data$vals
    
    withMathJax(helpText(paste("$$\\mu = ", sum(randomDist * randomVals), "$$")))
  })
  
  output$sample_means_mean <- renderUI({
    data <- data()
    meansDist <- data$means
    
    withMathJax(helpText(paste("$$\\bar{x} = ", mean(meansDist), "$$" )))
  })
  
  output$population_sd <- renderUI({
    data <- data()
    randomDist <- data$dist
    randomVals <- data$vals
    n <- data$n
    
    x_bar = sum(randomDist * randomVals)
    populationSd <- sqrt(sum(randomDist * ((randomVals - x_bar) ^ 2)))
    populationSd <- populationSd / sqrt(n)
    withMathJax(helpText(paste("$$\\frac{\\sigma}{\\sqrt{n}} = ", populationSd, "$$")))
  })
  
  output$sample_means_mean_sd <- renderUI({
    data <- data()
    meansDist <- data$means
    n <- data$n
    sampleMeansSd <- sd(meansDist)
    withMathJax(helpText(paste("$$s = ", sampleMeansSd, "$$" )))
  })
  
})