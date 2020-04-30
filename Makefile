## Re-running the simulations
FIGURES := hor_fieldA_col.pdf  hor_maps3.pdf eglen_fig2_col.pdf eglen_fig3_col.pdf
SIMULATIONS:= fa_1.Rda  fa_csn.Rda  fa_nod12.Rda  fb_1.Rda  fc_1.Rda  w78h_t2.sd_16.Rda table2-rejects.txt

all: rescience-hor.pdf


$(SIMULATIONS): hor_bdmin.R
	Rscript $^

simulations: $(SIMULATIONS)

## Figure 1
hor_fieldA_col.pdf hor_maps3.pdf: maps2.R fa_1.Rda fb_1.Rda fc_1.Rda
	Rscript $^

## Figure 2
eglen_fig2_col.pdf: plot_allgof.R fa_1.Rda fb_1.Rda fc_1.Rda
	Rscript $^

## Figure 3
eglen_fig3_col.pdf: plot_nod12.R fa_nod12.Rda
	Rscript $^



.PHONY: clean simulations

clean:
	rm -f $(FIGURES) $(SIMULATIONS)


rescience-hor.pdf: rescience-hor.Rmd $(FIGURES)
	Rscript -e "rmarkdown::render('rescience-hor.Rmd')"

