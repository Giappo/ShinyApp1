mod_tab1_ui_sidebar <- function(id) {
  ns <- shiny::NS(id)

  shiny::tagList(
    shiny::uiOutput(ns("DatasetName")),
    shiny::uiOutput(ns("X")),
    shiny::uiOutput(ns("Y"))
  )
}

mod_tab1_ui_body <- function(id) {
  ns <- shiny::NS(id)

  shiny::fluidPage(
    shiny::fluidRow(
      shiny::column(
        width = 12,
        plotly::plotlyOutput(ns("plot1"))
      ),
    ),
    shiny::fluidRow(
      shiny::column(
        width = 12,
        DT::DTOutput(ns("table1"))
      ),
    )
  )
}
