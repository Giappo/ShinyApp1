#' Run App
#'
#' @inheritParams Documentation
#'
#' @export
RunApp <- function(...) {
  source(system.file("global.R", package = "ShinyApp1"), local = TRUE)
  ui <- source(system.file("ui.R", package = "ShinyApp1"), local = TRUE)$value
  server <- source(system.file("server.R", package = "ShinyApp1"), local = TRUE)$value
  shiny::shinyApp(ui = ui, server = server)
}
