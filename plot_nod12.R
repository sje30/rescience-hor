## R CMD BATCH plot_nod12.R
## [2020-04-29 Wed] - origin ~/papers/2007_bihor/figs/plot_nod12.R

source('extra.R')
source('bihor_common.R')
load("fa_nod12.Rda")

make.nod12.plot <- function(file) {
  pdf(file=file, onefile=FALSE, 
             width=inch(17), height=inch(8.3))
  
  on.exit(dev.off())
  xlab <- expression(paste("distance (", mu, "m)"))
  t40 <- ticks(c(0,20,40), i=1)
  
  par(mar=c(3.5, 3.5, .5, 0.3), las=1, bty='n')
  par(mgp=c(2, 0.7, 0))
  par(mfrow=c(1,2))
  g <- fa.nod12.fit$dist.arr$get()
  plot(g$ri3, pch=19, cex=0.25,
       yticks=ticks(c(2,4,6), i=1) )
  plot(g$l12, xlab=xlab, ylab=expression(L[12]),
       xticks=t40, yticks=t40)


  text(c(-80, -15), 42, c("A", "B"), xpd=NA)
}

expt.col <- "green"
make.nod12.plot('eglen_fig3_col.pdf')
## expt.col <- "grey"
## make.nod12.plot('eglen_fig3_grey.ps')
