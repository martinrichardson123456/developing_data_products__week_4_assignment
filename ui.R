library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  tags$head(
    tags$style(paste0(
      "body:before { ",
      "  content: ''; ",
      "  height: 100%; width: 100%; ",
      "  position: fixed; ",
      "  z-index: -1; ",
      "  background: url(http://www.geneva.mclaren.com/en/image/5721e01488a74/750/555/fill/5721e01488a74.jpg) no-repeat center center fixed; ",
      "  background-size: cover; "#,
     # "  filter: grayscale(100%); ",
     # "  -webkit-filter: grayscale(100%); }"
     ))),
  
  # Application title
  titlePanel("The 'mtcars' data set"),

  inputPanel(
    titlePanel("Plot axes quantities:"),
    
    selectInput(inputId = "x_var", label = "Choose x-axis variable", 
                choices = c("mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb"),
                selected = "wt"),
    
    selectInput(inputId = "y_var", label = "Choose y-axis variable", 
                choices = c("mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb"), 
                selected = "mpg"),
    
    selectInput(inputId = "colour_var", label = "Choose colour variable", 
                choices = c("mpg", "cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb"), 
                selected = "cyl")
  ),
  
   
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      titlePanel("Predictors:"),
      
      checkboxInput(inputId = "cyl",  label = "cyl",  value = FALSE, width = NULL),
      checkboxInput(inputId = "disp", label = "disp", value = FALSE, width = NULL),
      checkboxInput(inputId = "hp",   label = "hp",   value = FALSE, width = NULL),
      checkboxInput(inputId = "drat", label = "drat", value = FALSE, width = NULL),
      checkboxInput(inputId = "wt",   label = "wt",   value = TRUE, width = NULL),
      checkboxInput(inputId = "qsec", label = "qsec", value = FALSE, width = NULL),
      checkboxInput(inputId = "vs",   label = "vs",   value = FALSE, width = NULL),
      checkboxInput(inputId = "am",   label = "am",   value = FALSE, width = NULL),
      checkboxInput(inputId = "gear", label = "gear", value = FALSE, width = NULL),
      checkboxInput(inputId = "carb", label = "carb", value = FALSE, width = NULL),
      width = 2
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("myPlot")
    )
  ),

  mainPanel(
    textOutput("R_squared_text"),
    
    tags$head(tags$style("#text1{color: red;
                                 font-size: 20px;
                                 font-style: italic;
                                }"
                         )
    )
    
  )
))
