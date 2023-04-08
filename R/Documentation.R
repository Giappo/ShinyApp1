#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#'
#' @import magrittr
#'
#' @param table Some data.
#' @param fileName The name of file to download.
#' @param title The title of the table.
#' @param menuOutputOptions Choices for the menu output.
#' @param method Specify the method for the function.
#' @param inputFunction A function.
#' @param when When should the update occur?
#' @param session A shiny session.
#' @param refreshTime Refresh time of the app in seconds.
#' @param triggerTime Time at which the DetectChange_Time function should trigger.
#'
#' @param text Text to show for the menu item.
#' @param icon An icon tag, created by icon. If NULL, don't display an icon.
#' @param tabName The name of a tab that this menu item will activate. Not compatible with href.
#'
#' @param ... Additional arguments to be passed to inherited methods
#'
Documentation <- function(
    table,
    title = "Table",
    fileName,
    menuOutputOptions,
    method,
    inputFunction,
    when,
    session = NULL,
    refreshTime = 1,
    text,
    tabName,
    icon,
    triggerTime = "15:32:30",
    ...
) {
  # Nothing
}
