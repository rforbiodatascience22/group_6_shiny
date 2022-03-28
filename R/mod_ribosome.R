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
      column(4,
             numericInput(inputId = ns("seq_length"),
                          label = "Desired length of randomly generated DNA-sequence",
                          value = 3),
             actionButton(inputId = ns("do"),
                          label = "Get DNA-sequence")
             )
    ),
    verbatimTextOutput(outputId = ns("pep_seq")),
    verbatimTextOutput(outputId = ns("DNA_seq")))
}

#' ribosome Server Functions
#'
#' @noRd
mod_ribosome_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$pep_seq <- renderPrint(
      if(input$q_seq == "")
        {""}
        else{
        input$q_seq %>%
        centralDogma::convert_dna_to_rna() %>%
        centralDogma::codon_iden() %>%
        centralDogma::translate_codon()
        }
        )
    observeEvent(input$do, {output$DNA_seq <- renderPrint(input$seq_length %>%
          centralDogma::create_random_dna_seq())})
  })
}

## To be copied in the UI
# mod_ribosome_ui("ribosome_1")

## To be copied in the server
# mod_ribosome_server("ribosome_1")
