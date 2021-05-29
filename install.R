## Installations

require(devtools)
install_github("sje30/sjedrp")
install_github("sje30/sjedmin")
install_github("sje30/sjevor")
install_github("sje30/sjedist")

## regular CRAN packages for project
install.packages("spatstat")

## for rendering the paper
install_github('rstudio/rmarkdown')
## note bug with https://github.com/rstudio/rmarkdown/issues/1649
## hence why rmarkdown package is required.

## tinytex takes a few minutes to setup, but needed for rendering pdf
install.packages('tinytex')
tinytex::install_tinytex()

install.packages('rmarkdown')
