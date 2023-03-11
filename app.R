library(shiny)
library(ShinyApp1)

ShinyApp1::LoadModules()

source("inst/ui.R")
source("inst/server.R")

shiny::shinyApp(ui = ui, server = server)
