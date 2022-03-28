#' plot_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_plot_module_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' plot_module Server Functions
#'
#' @noRd 
mod_plot_module_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_plot_module_ui("plot_module_1")
    
## To be copied in the server
# mod_plot_module_server("plot_module_1")
