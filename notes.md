# Steps taken to re-run the horizontal project.

created a new repo.

Imported hor_bdmin.R -- one of the key pieces of code


## R installations

Realised that I'd need old packages, e.g. sjedmin ongithub.  So
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






