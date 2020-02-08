# Exercise 1: reading and querying a web API

# Load the httr and jsonlite libraries for accessing data
# You can also load `dplyr` if you wish to use it
install.packages("httr")
install.packages("jsonlite")
library("httr") 
library("jsonlite")
library("dplyr")

# Create a variable base_uri that stores the base URI (as a string) for the 
# Github API (https://api.github.com)
base_uri <- "https://api.github.com"

# Under the "Repositories" category of the API documentation, find the endpoint 
# that will list _repos in an organization_. Then create a variable named
# `org_resource` that stores the endpoint for the `programming-for-data-science`
# organization repos (this is the _path_ to the resource of interest).
base_uri <- "https://api.github.com"
org_resource <- "/orgs/programming-for-data-science"
endpoint <- "/repos"
url <- paste0(base_uri, org_resource, endpoint)


# Send a GET request to this endpoint (the `base_uri` followed by the 
# `org_resource` path). Print the response to show that your request worked. 
# (The listed URI will also allow you to inspect the JSON in the browser easily).
request <- GET(url)
print(request)

# Extract the content of the response using the `content()` function, saving it
# in a variable.
response_text <- content(request, type = "text")

# Convert the content variable from a JSON string into a data frame.
response_data <- fromJSON(response_text)

# How many (public) repositories does the organization have?
response_data %>% filter(private == "FALSE") %>% nrow()

# Now a second query:
# Create a variable `search_endpoint` that stores the endpoint used to search 
# for repositories. (Hint: look for a "Search" endpoint in the documentation).
search_endpoint <- "/search/repositories"
boba_url <- paste0(base_uri, search_endpoint)

# Search queries require a query parameter (for what to search for). Create a 
# `query_params` list variable that specifies an appropriate key and value for 
# the search term (you can search for anything you want!)
query_params <- list(q = "boba")

# Send a GET request to the `search_endpoint`--including your params list as the
# `query`. Print the response to show that your request worked.
boba_request <- GET(boba_url, query = query_params)

# Extract the content of the response and convert it from a JSON string into a
# data frame. 
boba_text <- content(boba_request, type = "text")
boba_data <- fromJSON(boba_text)
items <- boba_data$items

# How many search repos did your search find? (Hint: check the list names to 
# find an appropriate value).
nrow(items)

# What are the full names of the top 5 repos in the search results?
items %>% select(name) %>% head(5)
