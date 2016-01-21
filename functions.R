#' Print step number
#' 
#' Generates a closure (i.e. function with data) that prints a step header and increments the step number each time it is called. 
#' 
make_step_counter_function <- function() {
  step <- 0
  function() {
    step <<- step + 1
    paste0("Step ", step, ")")
  }
}



#' Generate example HTML 
#' 
#' Generates a closure (i.e. function with data) that prints a peice of RMarkdown markup and the results of rendering it to HTML.
#' The function generated can remember the information from previous calls and append content.
#' 
#' @param content (\code{character} of lenght one) RMarkdown text to display and render.
#' 
make_markdown_example_function <- function(content, horizontal = FALSE) {
  counter <- 0
  previous_content <- ""
  
  function(content, cumulative  = FALSE, height = NULL, prefix = FALSE, show_knit_button = FALSE) {
    # Set default figure height 
    if (is.null(height)) {
      height <- (length(gregexpr("\\n", content)[[1]]) + 1) * 20
    }
    
    # increment counter so that file names can be unique
    counter <<- counter + 1
    
    # implement content saving
    currrent_content <- content
    if (cumulative) {
      if (prefix) {
        content <- paste0(content, previous_content)
        
      } else {
        content <- paste0(previous_content, content)
      }
      previous_content <<- content
    }
    
    
    # get input document information
    current_file_name <- knitr:::knit_concord$get("infile")
    current_folder <- normalizePath(knitr:::.knitEnv$input.dir)

    # Create source Rmd file
    source_path <- tempfile(pattern = "rmarkdown_example", fileext = ".Rmd", tmpdir = current_folder)
    cat(content, file = source_path)
    
    # Render source file to html
    output_path <- tempfile(pattern = "rmarkdown_example", fileext = ".html", tmpdir = current_folder)
    current_knit_opts <- opts_chunk$get() # Save external knit parameters to restore later
    opts_chunk$restore() # Set knitr to use default chunk options
    rmarkdown::render(input = source_path, output_file = output_path, quiet = TRUE, output_format = "html_fragment")
   
    
    # Generate html to display source
    source_html <- paste0("<pre class = 'rmd_example_code'>", currrent_content, "</pre>")
    
    # Generate html to display knit image
    img_path <- "./images/pressing_knit_down_arrow.png"
    image_html <- paste0("<img src='", img_path, "' class='knit_image'>")
    
    # Rendered HTML
    result_html <- readChar(output_path, file.info(output_path)$size)
    
    on.exit({
      do.call(opts_chunk$set, current_knit_opts) # Restore external knit parameters
      file.remove(source_path)
      file.remove(output_path)
    })
    
    # Display result
    if (horizontal) {
      cat(paste0('<div class = "rmd_example_container">',
                 '<div class = "rmd_example_inner rmd_example_source">', source_html, '</div>',
                 '<div class = "rmd_example_inner rmd_example_result">', result_html, '</div>',
                 '</div><div style="clear: left;"></div>'))
    } else {
      cat(paste0('<div class = "rmd_example_container">',
                 '<div class = "rmd_example_source">', source_html, '</div>',
                 ifelse(show_knit_button, image_html, ""),
                 '<div class = "rmd_example_result">', result_html, '</div>',
                 '</div><div style="clear: left;"></div>'))
      
    }
  }
}



#' Scrolls iframes
#' 
#' Prints Javascript to make iframes scrolled down when page loads
pre_scroll_iframe <- function() {
  cat('
<script type="text/javascript">
$(window).load(function ()
{
    var $contents = $(".example_frame").contents();
    $contents.scrollTop(10000);
});
</script>
  ')
}


#' Glossary
#'
#' Handles the defining and printing of glossary terms. 
make_glossary_function <- function() {
  glossary  <- list()
  function(term = NULL, description = NULL, display_glossary = FALSE) {
    if (display_glossary) {
      for (index in seq_along(glossary)) {
        glossary <<- glossary[order(names(glossary))]
        cat(paste0("<strong><ins>", names(glossary)[index], "</ins></strong>: ", glossary[[index]], "\n\n"))
      }
    } else {
      if (is.null(term) | is.null(description)) {
        stop("Glossary term and/or description required")
      }
      # Save term in glossary
      glossary[term] <<- description
      
      # Print formatted term
      rendered_term <- paste0("<strong><ins>", term, "</ins></strong>")
      return(rendered_term)
    }
  }
}




