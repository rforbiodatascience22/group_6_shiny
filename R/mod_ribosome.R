#' ribosome UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_ribosome_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(8,
             textAreaInput(inputId = ns("q_seq"),
                              label = "DNA sequence",
                              placeholder = "Insert DNA sequence")),
      column(4, "random_dna_length", "generate_dna_button")
    ),
    verbatimTextOutput(outputId = ns("pep_seq"))
  )
}

#' ribosome Server Functions
#'
#' @noRd
mod_ribosome_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$pep_seq <-
      renderPrint(
        if(input$q_seq == "")
        {NULL}
        else{
        input$q_seq %>%
        centralDogma::convert_dna_to_rna() %>%
        centralDogma::codon_iden() %>%
        centralDogma::translate_codon()
        }
        )
  })
}

## To be copied in the UI
# mod_ribosome_ui("ribosome_1")

## To be copied in the server
# mod_ribosome_server("ribosome_1")
