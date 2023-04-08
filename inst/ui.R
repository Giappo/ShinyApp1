header <- shinydashboard::dashboardHeader(
  title = "ShinyApp1"
)

sidebar <- shinydashboard::dashboardSidebar(
  shinydashboard::sidebarMenu(
    ShinyApp1::MenuItem(
      text = "Tab 1",
      tabName = "tab1",
      icon = shiny::icon("table"),
      mod_tab1_ui_sidebar("tab1")
    ),
    ShinyApp1::MenuItem(
      text = "Tab 2",
      tabName = "tab2",
      icon = shiny::icon("table"),
      mod_tab2_ui_sidebar("tab2")
    )
  )
)

body <- shinydashboard::dashboardBody(
  shinydashboard::tabItems(
    shinydashboard::tabItem(
      tabName = "tab1",
      mod_tab1_ui_body("tab1")
    ),
    shinydashboard::tabItem(
      tabName = "tab2",
      mod_tab2_ui_body("tab2")
    )
  )
)

ui <- shinydashboard::dashboardPage(
  header = header,
  sidebar = sidebar,
  body = body
)
