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
make_markdown_example_function <- function(content, horizontal = TRUE) {
  counter <- 0
  previous_content <- ""
  
  function(content, cumulative  = FALSE, height = NULL, prefix = FALSE) {
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
    current_knit_opts <- opts_chunk$get() # Save external knit parameters to restore later
    opts_chunk$restore() # Set knitr to use default chunk options
    rmarkdown::render(input = source_path, output_file = output_path, quiet = TRUE)
    do.call(opts_chunk$set, current_knit_opts) # Restore external knit parameters
    
    # Generate html to display source
    source_html <- paste0("<pre class = 'rmd_example_code'>", currrent_content, "</pre>")
    
    # Generate html to display knit image
    img_path <- "./markdown_images/pressing_knit_down_arrow.png"
    image_html <- paste0("<img src='", img_path, "' class='knit_image'>")
    
    
    
    # Display result
    if (horizontal) {
      result_html <- paste0("<iframe src='", rel_output_path,  "' class='example_frame'></iframe>")
      cat(paste0('<div class = "rmd_example_container" style="height: ', height, 'px">',
                 '<div class = "rmd_example_inner">', source_html, '</div>',
                 '<div class = "rmd_example_inner">', result_html, '</div>',
                 '</div><div style="clear: left;"></div>'))
    } else {
      result_html <- paste0("<iframe src='", rel_output_path,  "' class='example_frame' style='height: ", height, "px'></iframe>")
      cat(source_html)
      cat(image_html)
      cat(result_html)
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
