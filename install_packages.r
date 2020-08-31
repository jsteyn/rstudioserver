load_install_packages <- function(list.of.packages) {
	new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
	if(length(new.packages)) install.packages(new.packages,repos="https://cran.ma.imperial.ac.uk")
	for (i in list.of.packages) {
		print(sprintf("loading %s",i))
		library(i,character.only=T)
	}
}

package_lst <- c(
	"ggplot2",
	"knitr",
	"data.table",
	"plyr",
	"markdown",
	"shape",
	"tidyverse"
)

load_install_packages(package_lst)
