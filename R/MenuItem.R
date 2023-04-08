#' Cooler Menu Item
#'
#' @inheritParams Documentation
#'
#' @export
MenuItem <- function(
    text,
    tabName,
    icon,
    ...
) {
  convertMenuItem <- function(
    MenuItem,
    tabName
  ) {
    MenuItem$children[[1]]$attribs["data-toggle"] <- "tab"
    MenuItem$children[[1]]$attribs["data-value"] <- tabName
    MenuItem
  }

  convertMenuItem(
    MenuItem = shinydashboard::menuItem(
      text = text,
      tabName = tabName,
      icon = icon,
      startExpanded = TRUE,
      ...
    ),
    tabName = tabName
  )
}
