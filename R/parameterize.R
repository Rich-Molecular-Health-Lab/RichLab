
#' @keywords internal
## usethis namespace: start
#' @importFrom htmltools tags withTags
#' @importFrom purrr has_element
## usethis namespace: end
list_education <- function(params = params) {
  if (params$education_inprogress %in% c("BS", "BA")) {
    currently <- paste0(params$education_inprogress, " in ", params$undergrad_major, "(in progress) - University of Nebraska Omaha")
  } else if (params$education_inprogress %in% c("MS", "MA", "PhD")) {
    currently <- paste0(params$education_inprogress, " in ", params$grad_program, "(in progress) - University of Nebraska Omaha")
  }  else if (params$education_inprogress == "Other") {
    currently <- paste0(params$education_inprogress, "(in progress)")
  }   else if (params$education_inprogress == "None") {
    currently <- NULL
  }
  if (is.null(params$education_complete)) {
    doc        <- NULL
    masters    <- NULL
    bachelors  <- NULL
  } else if (!is.null(params$education_complete)) {
    if (has_element(params$education_complete, "PhD")) {
      doc <- paste(paste0("PhD in ", params$grad_program), params$institution_doc, sep = " - ")
    } else if (has_element(params$education_complete, "DVM")) {
      doc <- paste("DVM", params$institution_doc, sep = " - ")
    } else if (!has_element(params$education_complete, "PhD"|"DVM")) {
      doc <- NULL
    }
    if (has_element(params$education_complete, "MS")) {
      masters <- paste(paste0("MS in ", params$grad_program), params$institution_master, sep = " - ")
    } else if (has_element(params$education_complete, "MA")) {
      masters <- paste(paste0("MA in ", params$grad_program), params$institution_master, sep = " - ")
    } else if (!has_element(params$education_complete, "MS"|"MA")) {
      masters <- NULL
    }
    if (has_element(params$education_complete, "BS")) {
      bachelors <- paste(paste0("BS in ", params$undergrad_major), params$institution_undergrad, sep = " - ")
    } else if (has_element(params$education_complete, "BA")) {
      bachelors <- paste(paste0("BA in ", params$undergrad_major), params$institution_undergrad, sep = " - ")
    } else if (!has_element(params$education_complete, "BS"|"BA")) {
      bachelors <- NULL
    }
  }
  if (is.null(bachelors) & is.null(masters) & is.null(doc)) {
    education_complete <- NULL
  } else if (!is.null(bachelors) & is.null(masters) & is.null(doc)) {
    education_complete <- tags$dl(
      tags$dd(bachelors)
    )
  } else if (!is.null(bachelors) & !is.null(masters) & is.null(doc)) {
    education_complete <- tags$dl(
      tags$dd(masters),
      tags$dd(bachelors)
    )
  } else if (!is.null(bachelors) & !is.null(masters) & !is.null(doc)) {
    education_complete <- tags$dl(
      tags$dd(doc),
      tags$dd(masters),
      tags$dd(bachelors)
    )
  } else if (!is.null(bachelors) & is.null(masters) & !is.null(doc)) {
    education_complete <- tags$dl(
      tags$dd(doc),
      tags$dd(bachelors)
    )
  }

  education <- tags$dl(
    tags$dd(currently),
    tags$dd(education_complete)
  )
  return(education)
}

#' @keywords internal
## usethis namespace: start
#' @importFrom htmltools tags withTags
#' @importFrom bslib card card_header card_footer card_image card_body layout_columns
## usethis namespace: end
card_template <- function(params = params) {
  card(
    card_header(tags$h3(paste(params$name, params$role, sep = " "))),
    card_body(
      tags$div(layout_columns(col_widths = c(2, 10),
                              card_image(file = params$headshot, border_radius = "all", width = "100%"),
                              tags$div(list_education(params = params),
                                       tags$div(tags$span(
                                         tags$small(tags$b("Pronouns: "), tags$i(params$pronouns), tags$br(),
                                                    tags$b("Please Call Me: "), tags$i(params$callme))))))),
      tags$hr(),
      tags$dl(tags$dt("Research Interests"), tags$dd(params$research_interests),
              tags$dt("Current Project(s)"), tags$dd(tags$ul(params$projects)))
    ),
    card_footer(tags$dl(tags$dt("Personal Interests"), tags$dd(params$personal)))
  )
}
