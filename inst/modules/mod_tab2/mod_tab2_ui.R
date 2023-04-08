mod_tab2_ui_sidebar <- function(id) {
  ns <- shiny::NS(id)

  shiny::uiOutput(ns("input1"))
}

mod_tab2_ui_body <- function(id) {
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
