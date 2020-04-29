## [2020-04-29 Wed] - copied from ~/papers/2007_bihor/figs/maps2.R
library(sjedist)
## This file draws the maps; see hor_bdmin.R for the code that
## runs the simulations.

source('extra.R')

##load("fa.Rda")  ## version for paper.
load('fa_1.Rda')

load("fb_1.Rda")
load("fc_1.Rda")



real.sim.plot <- function(fit, name, soma.rad=2, bar,
                          bg.h1="white", bg.h2="black") {
  ## Plot real data (left) and simulation (right)

  ## H1 = open; H2 = filled.
  ##bg.h1 = "white"
  ##bg.h2 = "black"

  plot.biv <- function(t1, t2, w, soma.rad) {
    ## Plot one group of neurons.
    symbols(x=t1[,1], y=t1[,2],
            circles=rep(soma.rad, nrow(t1)), bg=bg.h1,
            inch=F, asp=1, lwd=0.1,
            xlim=w[1:2], ylim=w[3:4],
            xaxt="n", yaxt="n", xlab="", ylab="")
    symbols(x=t2[,1], y=t2[,2],
            circles=rep(soma.rad, nrow(t2)),
            bg=bg.h2, lwd=0.1, inch=F, add=T)
    rect(w[1], w[3], w[2], w[4])
  }

  with(fit$allpar, plot.biv(pts.1, pts.2, w, soma.rad)   )
  segments(bar[1], bar[2], bar[1]+bar[3], bar[2], lwd=2)
  
  with(fit, plot.biv(t1.sim, t2.sim, allpar$w, soma.rad))

  if (!is.null(name))
    title(name)

}


## [2020-04-29 Wed] -- no need for old postcript now.
## postscript("hor_fieldA.ps", width=inch(17), height=inch(8.3),
##            horiz=F, onefile=F)
## par(mar=c(0.1,.1,.1,.1), bty='n', mfrow=c(1,2))
## real.sim.plot(fa.fit, name='', soma.rad=5, bar=c(50, 30, 100))
## dev.off()

## postscript("|psfbb > hor_fieldA_csn.ps", width=inch(17), height=inch(8),
##            horiz=F, onefile=F)
## par(mar=c(0.1,.1,1.1,.1), bty='n', mfrow=c(1,2))
## real.sim.plot(fa.fit, name='', soma.rad=5, bar=c(50, 30, 100))
## legend(x=-80, y=325, c('H1', 'H2'), pch=c(1,19), cex=0.7,
##        horiz=FALSE, xpd=NA)
## text(grconvertX(c(0.07, 0.57), from='ndc'), grconvertY(rep(0.93,2), from='ndc'),
##      c('A', 'B'), xpd=NA)
## dev.off()

## make colour version for a talk.

pdf("hor_fieldA_col.pdf", width=inch(17), height=inch(8.3),
    onefile=F)
par(mar=c(0.1,.1,.1,.1), bty='n', mfrow=c(1,2))
real.sim.plot(fa.fit, name='', soma.rad=5, bar=c(50, 30, 100),
              bg.h1="green", bg.h2="orangered")
dev.off()

## postscript("hor_fieldA_pair.ps", width=inch(17), height=inch(8.3),
##            horiz=F, onefile=F)
## par(mar=c(0.1,.1,.1,.1), bty='n', mfrow=c(1,2))
## real.sim.plot(fa.fit, name='', soma.rad=5, bar=c(50, 30, 100))
## ##text(228, 328, 'hello')
## text(242, 343, 'X', cex=0.7)
## dev.off()

######################################################################
## Draw maps across 2 columns?
## postscript("hor_maps2.ps", width=6.7, height=5, horiz=F, onefile=F)
## par(mfcol=c(2,3), mar=c(0.1,.1,1,.1),bty='o')

## real.sim.plot(fa.fit, name='A', bar=c(50, 20, 100))
## real.sim.plot(fb.fit, name='B', bar=c(30,-10, 100))
## real.sim.plot(fc.fit, name='C', bar=c(80, 40, 100))
## dev.off()



## Draw maps across 1 column.

## SJE - [2020-04-29 Wed] update for pdf, not postscript()
pdf("hor_maps3.pdf", title='hor maps', width=3.2, height=7, onefile=F)

## bty='n' usefl for showing bounding box of plot region.
par(mar=c(0.1,.1,1,.1),bty='n')
##par(mfrow=c(3,2))
nf <- layout(matrix(1:6, 3,2, byrow=T), heights=c(0.6, 0.6, .9))
##layout.show(nf)
real.sim.plot(fa.fit, name='A', bar=c(50, 20, 100))
real.sim.plot(fb.fit, name='B', bar=c(30,-10, 100))
real.sim.plot(fc.fit, name='C', bar=c(80, 40, 100))
dev.off()



## postscript("hor_maps4.ps", title='hor maps', width=6.7, height=3.5, horiz=F, onefile=F)
## ## bty='n' usefl for showing bounding box of plot region.
## par(mar=c(0.1,.1,1,.1),bty='n')
## ##par(mfrow=c(3,2))
## nf <- layout(matrix( c(1,2, 5, 6,   3, 4, 5,6), 2, 4, byrow=T),
##              widths=c(1, 1, 1.2, 1.2))
## ##layout.show(nf)
## real.sim.plot(fa.fit, name='A', bar=c(50, 20, 100))
## real.sim.plot(fb.fit, name='B', bar=c(30,-10, 100))
## real.sim.plot(fc.fit, name='C', bar=c(80, 40, 100))
## dev.off()

## ######################################################################
## ## Old code below.
## q()

## symbols(x=w00h5.fit$allpar$pts.1[,1], y=w00h5.fit$allpar$pts.1[,2],
##         circles=rep(5, nrow(w00h5.fit$allpar$pts.1)), inch=F)

## symbols(x=w00h5.fit$allpar$pts.2[,1], y=w00h5.fit$allpar$pts.2[,2],
##         circles=rep(5, nrow(w00h5.fit$allpar$pts.2)), inch=F, add=T, col='red')
