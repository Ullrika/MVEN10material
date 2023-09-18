install.packages('ssdtools')
library(ssdtools)
library(ggplot2)
library(dplyr)

# read dataset
data <- ssddata::ccme_boron
# fix unacceptable column names
colnames(data) <- make.names(colnames(data))

# fit distributions
dist <- ssd_fit_dists(data, left = 'Conc', dists = c('gamma', 'lgumbel', 'llogis', 'lnorm', 'lnorm_lnorm', 'weibull'), silent = TRUE, reweight = FALSE, min_pmix = 0, nrow = 6L, computable = TRUE, at_boundary_ok = FALSE, rescale = TRUE)
# plot distributions
ssd_plot_cdf(dist, delta = Inf)
# goodness of fit table
ssd_gof(dist)

# save plot
# width and height are in inches, dpi (dots per inch) sets resolution
ggsave('fit_dist_plot.png', width = 8 , height = 6 , dpi = 300)

# plot model average
# to add confidence intervals set ci = TRUE in predict and ssd_plot
# we recommend using nboot = 10000 in predict, although this may take several minutes to run
pred <- predict(dist, nboot = 10L, ci = TRUE)
#pred <- predict(dist, nboot = 10L, ci = FALSE)
ssd_plot(data, pred, left = 'Conc', label = 'Species', color = NULL, shape = NULL, hc = 5L, ci = TRUE,
         shift_x = 1.3, xlab = 'Concentration', ylab = 'Percent of Species Affected') +
  ggtitle('') +
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = NA, colour='black'),
        axis.text = element_text(color = 'black'),
        legend.key = element_rect(fill = NA, colour = NA)) +
  expand_limits(x = 70.7) +
  scale_color_brewer(palette = 'Dark2', name = '-none-') +
  scale_shape(name = NULL)

# save plot
# width and height are in inches, dpi (dots per inch) sets resolution
ggsave('model_average_plot.png', width = 8 , height = 6 , dpi = 600)

# get confidence limits
# use the nboot argument in ssd_hc to set the number of bootstrap samples
dplyr::bind_rows(ssd_hc(dist, percent = 5L, ci = TRUE, nboot = 1000L), 
                 ssd_hc(dist, percent = 5L, ci = TRUE, average = FALSE, nboot = 1000L))

devtools::install_github("bcgov/shinyssdtools")
library(shinyssdtools)
shinyssdtools::run_app()


data <- ssddata::anzg_metolachlor_fresh

data <- data[sample.int(nrow(data),6),]

write_csv(data,file="data/metolachlor_ssd.csv")

colnames(data) <- make.names(colnames(data))

# fit distributions
dist <- ssd_fit_dists(data, left = 'Conc', dists = c('gamma', 'lgumbel', 'llogis', 'lnorm', 'lnorm_lnorm', 'weibull'), silent = TRUE, reweight = FALSE, min_pmix = 0, nrow = 6L, computable = TRUE, at_boundary_ok = FALSE, rescale = TRUE)
# plot distributions
ssd_plot_cdf(dist, delta = Inf)
