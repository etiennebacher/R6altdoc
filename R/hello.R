#' Create a "conductor" tour
#'
#' In addition to this page, you can also directly access the documentation
#' of shepherd.js here: <https://shepherdjs.dev/docs/index.html>.
#' @importFrom R6 R6Class
#' @export
Conductor <- R6::R6Class(
  "Conductor",
  private = list(
    id = paste(sample(letters, length(letters)), collapse = ""),
    steps = list(),
    globals = list(),
    mathjax = FALSE
  ),


  #' @details
  #' Create a new `Conductor` object.
  #'
  #'
  #' @return A `Conductor` object.
  public = list(

    #' @param exitOnEsc Allow closing the tour by pressing "Escape". Default is

    initialize = function(exitOnEsc = TRUE) {

    },


    #' @param session A valid Shiny session. If `NULL` (default), the function
    #' attempts to get the session with `shiny::getDefaultReactiveDomain()`.
    #'
    #' @details
    #' Initialise `Conductor`.
    init = function(session = NULL) {
      if(is.null(session)) {
        session <- shiny::getDefaultReactiveDomain()
      }
      session$sendCustomMessage(
        "conductor-init",
        list(
          id = private$id,
          steps = private$steps,
          globals = private$globals,
          mathjax = private$mathjax
        )
      )
      invisible(self)
    },


    #' @param session A valid Shiny session. If `NULL` (default), the function
    #' attempts to get the session with `shiny::getDefaultReactiveDomain()`.
    #'
    #' @details
    #' Start `Conductor`.
    start = function(session = NULL) {
      if(is.null(session)) {
        session <- shiny::getDefaultReactiveDomain()
      }
      session$sendCustomMessage("conductor-start", list(id = private$id))
      invisible(self)
    },

    #' @param title Title of the popover.
    #' @param text Text of the popover.
    #' @param el The element to highlight. It can be an id (for example `#mynav`),
    #' a class (for instance `.navbar`), or a general tag (for example `button`).
    #' If `NULL` (default) or if the selector is not found, the popover will appear
    #' in the center of the page.
    #'
    #' @details
    #' Add a step in a `Conductor` tour.

    step = function(title = NULL, text = NULL, el = NULL) {


    }
  )
)
