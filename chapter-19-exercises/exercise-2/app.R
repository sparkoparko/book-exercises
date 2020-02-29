# Exercise 2: a basic Shiny app

# Load the `shiny` package
library("shiny")

# Define a new `ui` variable. This variable should be assigned a `fluidPage()` layout
# The `fluidPage()` layout should be passed the following:
my_ui <- fluidPage(
  
  # A `titlePanel()` layout with the text "Cost Calculator"
  titlePanel("Cost Calculator"),
  
  # A `numericInput()` widget with the label "Price (in dollars)"
  # It should have a default value of 0 and a minimum value of 0
  # Hint: look up the function's arguments in the documentation!
  numericInput(value = 0, min = 0, label = "Price (in dollors)",
               inputId = "price"),
  
  # A second `numericInput()` widget with the label "Quantity"
  # It should have a default value of 1 and a minimum value of 1  
  numericInput(value = 1, min = 1, label = "Quantity",
               inputId = "quantity"),
  
  # The word "Cost", strongly bolded
  strong("Cost"),
  # A `textOutput()` output of a calculated value labeled `cost`
  textOutput(outputId = "cost")
)

# Define a `server` function (with appropriate arguments)
# This function should perform the following:
server <- function(input, output) {

  # Assign a reactive `renderText()` function to the output's `cost` value
  output$cost <- renderText({
    # The reactive expression should return the input `price` times the `quantity`
    # So it looks nice, paste a "$" in front of it!
    total_cost <- (paste0("$", input$price * input$quantity))
  })
}

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = my_ui, server = server)
