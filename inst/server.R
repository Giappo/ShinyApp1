server <- function(input, output, session) {

  mod_tab1_server(
    id = "tab1",
    DataSetName = shiny::reactive(input$tab1_input1)
  )
  mod_tab2_server(
    id = "tab2",
    DataSetName = shiny::reactive(input$tab2_input1)
  )

}
