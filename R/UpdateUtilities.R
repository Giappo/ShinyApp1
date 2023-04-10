#' Update the function evaluation when something triggers
#'
#' @inheritParams Documentation
#'
#' @export
Update <- function(
    inputFunction,
    when,
    session = NULL,
    refreshTime = 1
) {
  shiny::reactivePoll(
    valueFunc = inputFunction,
    checkFunc = when,
    session = session,
    intervalMillis = refreshTime * 1000
  )
}

#' Update the function evaluation when something triggers
#'
#' @inheritParams Documentation
#'
#' @export
DetectChange <- function(method, ...) {
  funName <- paste0("DetectChange_", method)
  rlang::exec(get(funName), !!!list(...))
}

#' Update the function evaluation when something triggers
#'
#' @inheritParams Documentation
#'
#' @export
DetectChange_Minute <- function(...) {
  f <- function() {
    format(Sys.time(), "%M")
  }
  f
}

#' Update the function evaluation when something triggers
#'
#' @inheritParams Documentation
#'
#' @export
DetectChange_Second <- function(...) {
  f <- function() {
    format(Sys.time(), "%S")
  }
  f
}

#' Update the function evaluation when something triggers
#'
#' @inheritParams Documentation
#'
#' @export
DetectChange_Time <- function(
    triggerTime = "09:30:14"
) {

  triggerTime2 <- as.POSIXct(paste0("2023-04-09 ", triggerTime))

  ConvertTimeToNumeric <- function(triggerTime) {
    seconds <- as.numeric(format(triggerTime, "%S", tz = "CET"))
    minutes <- as.numeric(format(triggerTime, "%M", tz = "CET"))
    hours <- as.numeric(format(triggerTime, "%H", tz = "CET"))
    return(seconds + minutes * 60 + hours * 3600)
  }
  numericTriggerTime <- ConvertTimeToNumeric(triggerTime2)
  numericCurrentTime <- ConvertTimeToNumeric(Sys.time())

  f <- function() {
    (numericTriggerTime - numericCurrentTime) %>% abs() < 5
  }
  f
}
