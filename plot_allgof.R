## This needs a new version of sjedist on notch.
## R CMD BATCH plot_allgof.R
## 2007-11-22

## Inspired from~/mosaics/beta_rgc/dmin/dmin2.R
## ~/mosaics/beta_rgc/dmin/dmin2a_fig_common.R
## [2020-04-29 Wed] - copied from ~/papers/2007_bihor/figs/plot_allgof.R

source('bihor_common.R')
source('extra.R')

make.allgof <- function(file) {
  pdf(file=file, width=inch(17), height=10, onefile=F)
  ##postscript(file='allgof.ps', width=inch(17), height=6)
  on.exit(dev.off())
  ##mat <- matrix( 1:18, nrow=6, ncol=3)
  ##nf <- layout(mat, heights=c(1,1,1,1,0.2,1))
  par(mfcol=c(5,3))
  par(bty='n', las=1, oma=c(2,1,1,0))
  par(mar=c(1.5, 2.5, .5, .2), mgp=c(2, 0.6, 0))
  all.a <- fa.fit$dist.arr$get()
  par(xpd=NA)
    

  t40 <- ticks(c(0,20,40), i=1)
  t60 <- ticks(c(0,20,40,60),i=1)
  ##t100 <- ticks(c(0,25, 50, 75, 100),i=0)
  t100 <- ticks(c(0, 50, 100),i=1)
  ##t120 <- ticks( seq(from=0, to=120, by=40),i=1)
  t120 <- ticks( seq(from=0, to=120, by=60),i=1)
  xlab <- expression(paste("distance (", mu, "m)"))

  
  plot(all.a$ri3, cex=0.25,
       yticks=ticks(c(2,4,6), i=1) )
  plot(all.a$l1, xlab='', ylab=expression(L[1]),
       xticks=t40, yticks=t40)
  text(c(-4, 55, 113), 98, c('A', 'B', 'C'), cex=1.5)
  plot(all.a$l2, xlab='', ylab=expression(L[2]),
       xticks=t60, yticks=t60)
  plot(all.a$l0, xlab='', ylab=expression(L[1+2]),
       xticks=t40, yticks=t40)
  plot(all.a$l12, xlab=xlab, ylab=expression(L[12]),
       xticks=t40, yticks=t40)

  
  all.b <- fb.fit$dist.arr$get()
  plot(all.b$ri3, cex=0.25, ylab='',
       yticks=ticks(c(2,4,6), i=1) )
    plot(all.b$l1, xlab='', ylab='',
       xticks=t40, yticks=t40)
  plot(all.b$l2, xlab='', ylab='',
       xticks=t60, yticks=t60)
  plot(all.b$l0, xlab='', ylab='',
       xticks=t40, yticks=t40)
  plot(all.b$l12, xlab=xlab, ylab='',
       xticks=t40, yticks=t40)
  
  all.c <- fc.fit$dist.arr$get()
  plot(all.c$ri3, cex=0.25, ylab='',
       yticks=ticks(seq(from=2, by=3, to=11), i=0) )
  plot(all.c$l1, xlab='', ylab='',
       , xticks=t100, yticks=t100)
  plot(all.c$l2, xlab='', ylab='',
       , xticks=t120, yticks=t120)
  plot(all.c$l0, xlab='', ylab='', xticks=t60, yticks=t60)
  plot(all.c$l12, xlab=xlab, ylab='',xticks=t60, yticks=t60)

}


######################################################################
## End of functions
######################################################################

load("fa_1.Rda")
load("fb_1.Rda")
load("fc_1.Rda")

#expt.col <- "magenta"
expt.col <- "green"
make.allgof('eglen_fig2_col.pdf')
##expt.col <- "grey"
##make.allgof('eglen_fig2_grey.ps')



make.smallgof <- function(file) {
  expt.col <- "green"
  pdf(file="small_gof_horA.pdf", width=8, height=5)
  on.exit(dev.off())
  ##mat <- matrix( 1:18, nrow=6, ncol=3)
  ##nf <- layout(mat, heights=c(1,1,1,1,0.2,1))
  par(mfcol=c(1,2))
  par(bty='n', las=1, oma=c(2,1,1,0))
  par(mar=c(1.5, 2.5, .5, .5), mgp=c(2, 0.6, 0))
  all.a <- fa.fit$dist.arr$get()
  par(xpd=NA)
    

  t40 <- ticks(c(0,20,40), i=1)
  t60 <- ticks(c(0,20,40,60),i=1)
  ##t100 <- ticks(c(0,25, 50, 75, 100),i=0)
  t100 <- ticks(c(0, 50, 100),i=1)
  ##t120 <- ticks( seq(from=0, to=120, by=40),i=1)
  t120 <- ticks( seq(from=0, to=120, by=60),i=1)
  xlab <- expression(paste("distance (", mu, "m)"))

  
  plot(all.a$ri3, cex=0.25,
       yticks=ticks(c(2,4,6), i=1) )
  title(xlab="Cell type")
  plot(all.a$l12, xlab=xlab, ylab=expression(L[12]),
       xticks=t40, yticks=t40)

  
}


expt.col <- "green"
##make.smallgof()
