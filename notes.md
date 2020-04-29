# Steps taken to re-run the horizontal project.

Imported `hor_bdmin.R` -- one of the key pieces of code, and the
`SJENOTES_FIGS` files.  THe latter is the closest I had to a README,
which was at least better than nothing.


## R installations

Realised that I'd need old packages, e.g. sjedmin on github.  So
converted them from RCS to git using:

    git init && ~/langs/ruby/rcs-fast-export/rcs-fast-export.rb . | git fast-import && git reset
	git remote add origin git@github.com:sje30/sjedmin.git
	git push -u origin master
	
and put an install.R script to read in the package from github

TODO: at some point, will need to delete the old RCS directories, as I
think that might confuse me.

Same for sjevor package:

    git init && ~/langs/ruby/rcs-fast-export/rcs-fast-export.rb . | git fast-import && git reset
	git remote add origin git@github.com:sje30/sjevor.git
	git push -u origin master
	
TODO: note there are a couple of edits in sjevor that will need
committing.

Same for sjedist package:

    git init && ~/langs/ruby/rcs-fast-export/rcs-fast-export.rb . | git fast-import && git reset
	git remote add origin git@github.com:sje30/sjedist.git
	git push -u origin master
	
TODO: edits in sjedist to commit.

TODO: with Voronoi package, need to comment on Steve FOrtune's code.

sjedrp was already on github, so no need to upload that.

CRAN packages added into install.R

## Experimental data

The experimental data sets are stored locally on my hard disk in .Rda
format; these were uploaded here as bivariate_mosaics.Rda  -- there is
a version history problem though as these were also previously
available on my website.  TODO: need to think about where these data
should be stored/curated.

## extra.R

extra.R contains a function inch() that I used in my .Rprofile, and so
is not usually shared.


# Running simulations

Relevant parts of hor_bdmin.R could be run, but not in BATCH as old
results would get overwritten.  The closest I had to a README (no
makefiles here...) was SJENOTES_FIGS

# FIgure 1

Figure 1 was regenerated okay, using `maps2.R` script.  Other relevant
plot (not shown in original paper for space reasons) was for showing all three fields.

## Table 1

Table 1 was a list of parameters used in the model and match the
parameters found in the file hor_bdmin.R

## Figure 2 (eglen_fig2_col.pdf)

Figure 2 came from `plot_allgof.R` and was regenerated okay.
Stochastic simulations mean exact p values varied to before.  Switched
from postscript to pdf.

## Figure 3 (eglen_fig3_col.pdf)

Figure 3 came from `plot_nod12.R` and regenerated the postscript plot
fine, so changed it to make the PDF.

## Table 2 (

My notes stated:

    Counts for heterotypic rejects are stored in fa_rej.Rda, fb_rej.Rda, fc_rej.Rda



these were stored in `table2-rejects.txt` by adding a sink() call to
the simulation script.



 
# Summary

R Code was remarkably robust, no changes needed to code.  Simply
updates from postscript() to pdf() drivers.

But several side effects:

- needed to upload my own R packages to github (a good thing)
- code from .Rprofile needed sharing
- lack of a Makefile made life harder...

