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
make_markdown_example_function <- function(content) {
  counter <- 0
  previous_content <- ""
  
  function(content, cumulative  = TRUE) {
    # increment counter so that file names can be unique
    counter <<- counter + 1
    
    # implement content saving
    currrent_content <- content
    if (cumulative) {
      content <- paste0(previous_content, content)
      previous_content <<- content
    }
    
    
    # get input document information
    current_file_name <- knitr:::knit_concord$get("infile")
    current_folder <- normalizePath(knitr:::.knitEnv$input.dir)
    
    # Make output folder
    output_folder_name <- paste0(file_path_sans_ext(current_file_name), "--", "computer_generated_files")
    if (!file.exists(output_folder_name)) {
      dir.create(output_folder_name)
    }
    
    # Create source Rmd file
    source_name <- paste0("example_file_", counter, ".Rmd")
    source_path <- file.path(current_folder, output_folder_name, source_name)
    cat(content, file = source_path)
    
    # Render source file to html
    output_name <- paste0("example_file_", counter, ".html")
    rel_output_path <- file.path(output_folder_name, output_name)
    output_path <- file.path(current_folder, rel_output_path)
    rmarkdown::render(input = source_path, output_file = output_path, quiet = TRUE)
    
    
    # Generate html to display source
    cat(paste0("<pre>", currrent_content, "</pre>"))
    
    # Generate html to display knit image
    img_path <- "./markdown_images/pressing_knit_down_arrow.png"
    css <- "display: block; margin-left: auto; margin-right: auto"
    cat(paste0("<img src = '", img_path, "' style = '", css, "'>"))
    
    # Generate html iframe to display rendered file
    cat(paste0("<iframe src='", rel_output_path,  "' width=100% height=300px class='frame'></iframe>"))
  }
}
