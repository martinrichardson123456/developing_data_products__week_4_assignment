library(shiny)
library(datasets)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  r_sq_val <- 0
  
  output$myPlot <- renderPlot({
    
    # create formula for linear model
    predictors_vec <- c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")
    inputs_vec <- c(input$cyl, input$disp, input$hp, input$drat, input$wt, 
                    input$qsec, input$vs, input$am, input$gear, input$carb)
    which_vec <- which(inputs_vec)
    formula_vec <- predictors_vec[which_vec]
    print(paste("formula_vec =", formula_vec))
    formula_string <- ""
    formula_string <- paste(formula_vec, collapse = " + ")
    formula_string <- paste("mpg ~ ", formula_string, collapse = "")
    print(formula_string)
    
    # create linear model
    linmod <- lm(as.formula(formula_string), data = mtcars)
    print(linmod)
    print(summary(linmod)$r.squared)
    
    # make plot
    plot(x = mtcars[[input$x_var]], y = mtcars[[input$y_var]], type = "p", col = mtcars[[input$colour_var]],
         xlab = input$x_var, ylab = input$y_var)
    abline(linmod)
    
    r_sq_val <- summary(linmod)$r.squared
    r_sq_val <- round(r_sq_val, 4)
    output$R_squared_text <- renderText({
      paste("R-squared value of current model:", r_sq_val)
    })

  })

})
