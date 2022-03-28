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
    sidebarLayout(
      sidebarPanel(
        textAreaInput(inputId = ns("seq"),
                  label = "Peptide sequence",
                  placeholder = "Insert peptide sequence")
      ),
      mainPanel(
        plotOutput(outputId = ns("hist"))
      )
    )

  )
}

#' plot_module Server Functions
#'
#' @noRd
mod_plot_module_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$hist <-
      renderPlot(
        if(input$seq == "")
        {NULL}
        else{
          input$seq %>%
        centralDogma::get_freq_plot()
          }
      )

  })
}

## To be copied in the UI
# mod_plot_module_ui("plot_module_1")

## To be copied in the server
# mod_plot_module_server("plot_module_1")
