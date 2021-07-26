## Recreate hor_bdmin fits
## 2007-08-21
## [2020-04-29 Wed] -- copied from ~/papers/2007_bihor/figs/hor_bdmin.R

library(sjedmin)
library(sjedist)
library(spatstat)



make.bivsim <- function(field, allpar) {
  attach(allpar)
  n1 <- nrow(pts.1); n2 <- nrow(pts.2)
  dist.real <- sjespatdists.biv(pts.1, pts.2, w, "note", param=bpar)
  dist.arr <- new.dist.arr(dist.real, nreps)
  
  rej <- matrix(NA, nrow=nreps, ncol=2)
  
  for (i in 1:nreps) {
    sim <- bdmin.bd(w, n1=n1, n2=n2,
                  d1=t1.dmin, d1.sd=t1.sd,
                    d2=t2.dmin, d2.sd=t2.sd,                          
                    d12=t12.dmin, d12.sd=t12.sd,
                    lower=lower)
    rej[i,] <- sim$nrejects
    simpts <- cbind(sim$x, sim$y)
    t1.sim <- simpts[1:n1,]
    t2.sim <- simpts[-(1:n1),]
    dist.sim <- sjespatdists.biv(t1.sim, t2.sim, w, "note", param=bpar)
    dist.arr$set.row(dist.sim, i+1)
  }

  psfile <- paste("eg_", field, '.ps', sep='')
  postscript(file=psfile)
                  
  par(mfrow=c(2,3), oma=c(1,0,0,0))
  dist.arr$plot()
  
  label <- sprintf("%s %s   d1 %.1f %.1f   d2 %.1f %.1f   d12 %.1f %.1f lower %.1f",
                   date(), field,
                   t1.dmin, t1.sd, t2.dmin, t2.sd, 
                   t12.dmin, t12.sd, lower)
  mtext(label, side=1, outer=T)
  dev.off()
  
  ##image.name <- sprintf("last_%s.Rda", field)
  ##save.image(image.name)

  res <- list(dist.arr=dist.arr, t1.sim=t1.sim, t2.sim=t2.sim, allpar=allpar,
              rej=rej)

  detach(allpar)

  res
}


par(las=1, bty='n')

load("./bivariate_mosaics.Rda") #TODO -- assume in working directory.


######################################################################
## Field A (w00h5)
######################################################################
fa <- list()
fa$w <- w00h5.w
fa$pts.1 <- w00h5.1; fa$pts.2 <- w00h5.2
fa$bpar <- list(steps=seq(from=0, to=40, by=2),
                steps0=seq(from=0, to=40, by=2),
                steps1=seq(from=0, to=40, by=2),
                steps2=seq(from=0, to=60, by=2),
                steps12=seq(from=0, to=40, by=2),
                distribs=list(ri3=1, l1=1, l2=1, l0=1, l12=1))
  
fa$lower <- 5
  
fa$t1.dmin <- 22;  fa$t1.sd <- 4
fa$t2.dmin <- 40;  fa$t2.sd <- 10
fa$t12.dmin <- 11; fa$t12.sd <- 3.0
##fa$t12.dmin <- 0; fa$t12.sd <- 0

fa$nreps <- 99                             #number of simulations



######################################################################
## Field B (w00h7)
######################################################################

fb <- list()
fb$w <- w00h7.w
fb$pts.1 <- w00h7.1; fb$pts.2 <- w00h7.2
fb$bpar <- list(steps=seq(from=0, to=40, by=2),
                steps0=seq(from=0, to=40, by=2),
                steps1=seq(from=0, to=40, by=2),
                steps2=seq(from=0, to=60, by=2),
                steps12=seq(from=0, to=40, by=2),
                distribs=list(ri3=1, l1=1, l2=1, l0=1, l12=1))
  
fb$lower <- 5
  
fb$t1.dmin <- 21;  fb$t1.sd <- 4
fb$t2.dmin <- 32;  fb$t2.sd <- 8
fb$t12.dmin <- 12; fb$t12.sd <- 2.5

fb$nreps <- 99                             #number of simulations





######################################################################
## Field C (w78h)
######################################################################
fc <- list()
fc$w <- w78h.w;  fc$pts.1 <- w78h.1; fc$pts.2 <- w78h.2
fc$bpar <- list(steps=seq(from=0, to=100, by=2),
                steps0=seq(from=0, to=60, by=2),
                steps1=seq(from=0, to=100, by=2),
                steps2=seq(from=0, to=120, by=2),
                steps12=seq(from=0, to=60, by=2),
                distribs=list(ri3=1, l1=1, l2=1, l0=1, l12=1))

fc$lower <- 5
  
fc$t1.dmin <- 65;  fc$t1.sd <- 12
fc$t2.dmin <- 72;  fc$t2.sd <- 8
fc$t12.dmin <- 14; fc$t12.sd <- 3.0


fc$nreps <- 99                             #number of simulations

######################################################################
## Do the runs.

fa.fit <- make.bivsim(field="w00h5",  allpar=fa)
save(fa.fit, file="fa_1.Rda")

fb.fit <- make.bivsim(field="w00h7",  allpar=fb)
save(fb.fit, file="fb_1.Rda")

fc.fit <- make.bivsim(field="w78h",  allpar=fc)
save(fc.fit, file="fc_1.Rda")
######################################################################

## Try second simulation, testing effect of setting d12=0.
## for field A, remove any effect of d12.
fa$t12.dmin <- 0; fa$t12.sd <- 0
fa.nod12.fit <- make.bivsim(field="w00h5",  allpar=fa)
##par(mfrow=c(3,2)); fa.nod12.fit$dist.arr$plot()
save(fa.nod12.fit, file="fa_nod12.Rda")


## Count rejects per sweep; useful for Table 2.  Data came from
## simulations stored in  fa_rej.Rda.
nsweeps <- 10
rej.a <- fa.fit$rej / nsweeps
rej.a.het.m <- mean(rej.a[,2])
rej.a.het.sd <- sd(rej.a[,2])

rej.b <- fb.fit$rej / nsweeps
rej.b.het.m <- mean(rej.b[,2])
rej.b.het.sd <- sd(rej.b[,2])

rej.c <- fc.fit$rej / nsweeps
rej.c.het.m <- mean(rej.c[,2])
rej.c.het.sd <- sd(rej.c[,2])

na.int <- 187 * 82
nb.int <- 206 * 86
nc.int <- 300 * 85

rej.a.m.norm <- rej.a.het.m / na.int
rej.b.m.norm <- rej.b.het.m / nb.int
rej.c.m.norm <- rej.c.het.m / nc.int

sink("table2-rejects.txt")
cat(sprintf("$%.0f \\pm %.0f$ & %d & %.2f\n",
            rej.a.het.m, rej.a.het.sd, na.int, rej.a.m.norm))

cat(sprintf("$%.0f \\pm %.0f$ & %d & %.2f\n",
            rej.b.het.m, rej.b.het.sd, nb.int, rej.b.m.norm))

cat(sprintf("$%.0f \\pm %.0f$ & %d & %.2f\n",
            rej.c.het.m, rej.c.het.sd, nc.int, rej.c.m.norm))
sink()

######################################################################
## test fc to see what happens if d2.sd is doubled.  (RI1 can be
## increased likewise by reducing variance of d1.sd -- this seems
## counterintuitive, until you realise we are at the packing limit.)

fc <- list()
fc$w <- w78h.w;  fc$pts.1 <- w78h.1; fc$pts.2 <- w78h.2
fc$bpar <- list(steps=seq(from=0, to=100, by=2),
                steps0=seq(from=0, to=60, by=2),
                steps1=seq(from=0, to=100, by=2),
                steps2=seq(from=0, to=120, by=2),
                steps12=seq(from=0, to=60, by=2),
                distribs=list(ri3=1, l1=1, l2=1, l0=1, l12=1))

fc$lower <- 5
  
fc$t1.dmin <- 65;  fc$t1.sd <- 12
fc$t2.dmin <- 72;  fc$t2.sd <- 16
fc$t12.dmin <- 14; fc$t12.sd <- 3.0

fc$nreps <- 99                             #number of simulations

fc.fit <- make.bivsim(field="w78h_t2.sd_16",  allpar=fc)
save(fc.fit, file="w78h_t2.sd_16.Rda")

######################################################################
## 2007-12-28
## Check that order effects are not accounting for differences.
## here I've swapped type 1 and type 2 neurons, everything else is the
## same as the normal fc.
######################################################################

fc <- list()
fc$w <- w78h.w;  fc$pts.1 <- w78h.2; fc$pts.2 <- w78h.1
fc$bpar <- list(steps=seq(from=0, to=100, by=2),
                steps0=seq(from=0, to=60, by=2),
                steps2=seq(from=0, to=100, by=2),
                steps1=seq(from=0, to=120, by=2),
                steps12=seq(from=0, to=60, by=2),
                distribs=list(ri3=1, l1=1, l2=1, l0=1, l12=1))

fc$lower <- 5
  
fc$t2.dmin <- 65;  fc$t2.sd <- 12
fc$t1.dmin <- 72;  fc$t1.sd <- 8
fc$t12.dmin <- 14; fc$t12.sd <- 3.0

fc$nreps <- 99                             #number of simulations

fc.fit <- make.bivsim(field="w78h",  allpar=fc)


######################################################################
### 2007-12-28
### Do the stats to test if RI(1) > RI(2)

load("fa_1.Rda")
load("fb_1.Rda")
load("fc_1.Rda")

fa.ri3 <- fa.fit$dist.arr$get()$ri3
fa.ri3 <- fb.fit$dist.arr$get()$ri3
fa.ri3 <- fc.fit$dist.arr$get()$ri3

ri1 <- fa.ri3[,1]; ri2 <- fa.ri3[,2];

stripchart(list(ri1, ri2), vert=T, method="jitter", pch=20)
wilcox.test(ri1, ri2)

## field a: W = 8938, p-value < 2.2e-16
## field b: W = 8166, p-value = 1.044e-14
## field c: W =  672, p-value < 2.2e-16


