

# ui.R

library(shiny)
library(shinythemes)


fig.width <- 600
fig.height <- 450


shinyUI(fluidPage(theme =  shinytheme("cerulean"),
 titlePanel("Linear Regression Model"),
 #list(tags$head(tags$style("body {background-color: gray; }"))),
 sidebarLayout(
   sidebarPanel(
    
     # sidepbar panel has the Input
     h4("Note that"),
     h4("the input data set shuold contain",
        "predictor in fisrt column and outcome in second column",style = "font-family: 'times'; font-si16pt"),
     helpText("the type of file you upload should be .asv or .txt",style = "font-family: 'times'; font-si16pt"),
     
     br(),
    # Check box for selection of header and type of file option
    checkboxInput('header','Header', value = F),
    checkboxInput('default','Default Data Set', value = T),
    br(),
    radioButtons('sep', 'separator', c(comma = ',', semicolon = ';', tab = '\t'), selected = NULL, inline = FALSE),
    br(),

   # take the file from user
   fileInput('data', 'Choose file to upload', multiple = FALSE, accept = c('.text/ comma-separated-values',
                                                                           '.csv',
                                                                           '.xlsx',
                                                                           '.txt',
                                                                           '.text/ tab-separated-values')),
  
   helpText("Deselect default data set when you upload your data set"),
   
   numericInput("obs", "Observations:", 20,
                min = 1, max = 100),
   
   
   
   
#    sliderInput("intercept",
#                strong("Intercept"),
#                min=-2, max=6, step=.5,
#                value=sample(seq(-2, 6, .5), 1), ticks=FALSE),
#    sliderInput("slope", 
#                strong("Slope"),
#                min=-1, max=3, step=.25, 
#                value=sample(seq(-1, 3, .25), 1), ticks=FALSE),
   br(),
wellPanel(
  h5("Contact Info:"),
  h5("Kunal Jagtap"),
  helpText(   a("View My LinkedIn Profile",href="https://www.linkedin.com/in/kunaljagtap")),
  helpText("srkunaljagtap@gmail.com")
),
   br(),br(),br(),br()
   ),
  
   
   mainPanel(
     tabsetPanel(
       
       tabPanel("Table", tableOutput("table")),
       tabPanel("Plot", plotOutput("plot")),
       tabPanel("Linear Regression", plotOutput("LinearPlot")),
       tabPanel("Summary", verbatimTextOutput("summary")),
       tabPanel("Linear Regression Summary", verbatimTextOutput("Linearsummary"))
     )
   )
   
   )  
)
)