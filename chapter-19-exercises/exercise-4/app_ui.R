# Load libraries so they are available
library("shiny")

# We'll begin by defining some of the UI elements as variables
# This helps keep the code organized and easier to debug

# Define a variable `intro_panel` for your first page. It should be a
# `tabPanel()` with a title "Introduction" to represent the first tab.
intro_panel <- tabPanel(
  "Introduction",
# This layout will contain the following elements:
  
  # A `titlePanel()` with the text "Income Inequality"
  titlePanel("Income Inequality"),

  # A paragraph `p()` describing with the text: "The below diagram was created
  # by the New York Times to illustrate the increasing level of inequality in
  # the US."
  p("The below diagram was created by the New York Times to illustrate the
  increasing level of inequality in the US."),

  # An image `img()` to display. This content should have a `src` attribute of
  # "inequality.png" (which will refer to the file in the `www/` folder).
  img(src = "www/inequality.png"),

  # A paragraph containing a hyperlink `a()` to the source of the article at
  # https://www.nytimes.com/interactive/2017/08/07/opinion/leonhardt-income-inequality.html
  p(a("The article.", src = "https://www.nytimes.com/interactive/2017/08/07/
      opinion/leonhardt-income-inequality.html")),

  # A paragraph containing a 1-2 sentence description of what the diagram
  # shows. Your paragraph should include both `strong()` and emphasized `em()`
  # text.
  p("The", strong(" diagram "), "shows how income inequality is rising in the 
    United States.", em("Click"), " on the link for more information.")
)

# Next, we'll define a few UI elements to render in our second panel

# Define a variable `sidebar_content` as a `sidebarPanel()` UI element
# containing the following information:
sidebar_content <- sidebarPanel(
  # A `sliderInput()` for the 'percentile' value, labeled "Income Percentile".
  # This slider should let the user pick a range between 0 and 100
  sliderInput(value = "percentile", label = "Income Percentile",
              min = 0, max = 0)
)

# Define a variable `main_content` as a `mainPanel()` UI element
# containing the following information:
main_content <- mainPanel(
  # A `plotOutput()` element showing the 'plot' output (defined in the server)
  plotOutput(outputId = output$plot),
  
  # A paragraph with a hyperlink to the data source
  # http://gabriel-zucman.eu/usdina/ 
  p("Click", a("here", "http://gabriel-zucman.eu/usdina/ "),
    "to go to the data source.")
)

# Define a variable `growth_panel` for your second page. It should be a
# `tabPanel()` with a title "Growth Chart" to represent the second tab.
# This layout will contain the following elements:
growth_panel(
  tabPanel(
    "Growth Chart",
    # A `titlePanel()` with the text "Income growth 1980-2014"
    titlePanel("Income growth 1980 - 2014"),
    # A `sidebarLayout()` to create two columns.
    # The sidebar layout will contain elements:
    sidebarLayout(
    # Your `sidebar_content`
      sidebar_content,
    # Your `main_content`
      main_content
    )
  )
)

# Finally, define a `ui` variable, assigning it a `navbarPage()` layout.
ui <- navbarPage(
# You will use `shinyUI()` to render this variable (in `app.R`)

# Give the layout a title of "Income Inequality".
  "Income Inequality",
# The layout should include the following elements:
  intro_panel,
# - Your `intro_panel`
  growth_panel
# - Your `growth_panel`
)
