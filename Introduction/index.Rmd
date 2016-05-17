---
title       : Introduction
subtitle    : Reproducible Science in R
author      : Niklaus J. Grünwald, Zhian N. Kmavar, and Zachary Foster
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained    # {selfcontained, standalone, draft}
knit        : slidify::knit2slides
--- .class #id 

## Overview: What is this workshop about?

1. What is reproducible science?
2. Why is it important? 
3. How do we practice it?

---

## A real-world example from pubpeer

![PubPeer1](figures/Pubpeer1.png)

---

## A real-world example from pubpeer

<div style='text-align: center;'>
    <img height='400' src='figures/Pubpeer2.png' />
</div>

---

## A real-world example from pubpeer

![PubPeer3](figures/Pubpeer3.png)

---

## A real-world example from pubpeer

![PubPeer4](figures/Pubpeer4.png)

---

## Why is it important? 

<div style='text-align: center;'>
    <img height='500' src='figures/WashPost.png' />
</div>

--- .quote .nobackground .segue  

<q> ... reproducible research refers to idea that the ultimate product of academic research is the paper along with the full computational environment such as code, data, etc. that allow reproduction of results</q> 

Modified from [Wikipedia](https://en.wikipedia.org/wiki/Reproducibility#Reproducible_research)

--- .class #id 

## What is reproducible science?

10 rules for computational science from Sandve et al. (2013):

1. For every result, keep track of how it was produced
2. Avoid manual data manipulation steps
3. Archive the exact versions of all external programs used
4. Version control all custom scripts
5. Record all intermediate results, when possible in standardized formats
6. For analyses that include randomness, note underlying random seeds
7. Always store raw data behind plots
8. Generate hierarchical analysis output, allowing layers of increasing detail to be inspected
9. Connect textual statements to underlying results
10. Provide public access to scripts, runs, and results

---

## Why should I practice it?

- Reproducibility is a core scientific principle
- Mandate from funding agencies towards open access, open data, etc.
- You don't want to end up in headline
- Ability to respond to queries (e.g., PubPeer, colleagues, etc.)
- Ability to quickly find and correct errors
- Ability to build on past research
- Ability to find what you need anytime, anywhere, fast

---

## Steps in making documents

- Author in `R markdown`
- Include what you would write in your lab notebook
- But, also incldues text, data, code, figures, and other features
- To achive, print to html, pdf, slides, etc.
- If revision needed, just add and rerun reports

---

## R markdown

[R Markdown](http://rmarkdown.rstudio.com/) is an authoring format that enables easy creation of dynamic documents, presentations, and reports from R. It combines the core syntax of markdown (an easy to write plain text format) with embedded R code chunks that are run so their output can be included in the final document.

![Rstudio-figure](figures/RMarkdownOutputFormats.png)

---

## Acknowledgements

- Yihui Xie: [knitr](http://yihui.name/knitr/) to translate documents from R markdown into html and other formats
- [R markdown](http://rmarkdown.rstudio.com/)
- [Git/github](http://kbroman.org/github_tutorial/)
- []()
- Ramnath Vaidyanathan: [Slidify](http://slidify.org/) for making slides in R markdown


---

## References & Resources

- Sandve GK, Nekrutenko A, Taylor J, Hovig E (2013) Ten Simple Rules for Reproducible Computational Research. PLoS Comput Biol 9(10): e1003285. doi:[10.1371/journal.pcbi.1003285](10.1371/journal.pcbi.1003285)
- Reproducible research. 2016. [Wikipedia](https://en.wikipedia.org/wiki/Reproducibility#Reproducible_research)
- []()
- []()
- []()
- []()

--- 

## Contact and Feedback

- Nik Grünwald; grunwaln@oregonstate.edu; [@PhytophthoraLab](https://twitter.com/PhytophthoraLab)
- Zhian Kamvar; kamvarz@oregonstate.edu; 
- Zach Foster; fosterz@oregosntate.edu; 

<p>Please provide us feedback on how to improve the workshop and what other topics you would like to see covered.</p>
