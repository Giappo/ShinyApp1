#' Add arguments to function evaluation
#'
#' @inheritParams Documentation
#'
#' @export
AddArguments <- function(
    inputFunction,
    ...
) {
  function() {
    rlang::exec(inputFunction, !!!list(...))
  }
}

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
