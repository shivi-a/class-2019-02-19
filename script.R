# Some simple code for working with NYT polling data.

library(tidyverse)

# Often useful to save all the downloaded data in a perminent copy, which I
# generally call "orig" in order to avoid having to download it again and again.
# Note that you can pass urls directly to read_csv(). To find the appropriate
# GitHub location, you need to find the right poll and then click on the Raw
# button. Note that I just got the col_types information from the R message
# after I tried to download with just the file argument.

orig <- read_csv(file = "https://raw.githubusercontent.com/TheUpshot/2018-live-poll-results/master/data/elections-poll-me02-3.csv",
                 col_types =  cols(
                   .default = col_character(),
                   turnout_scale = col_double(),
                   turnout_score = col_double(),
                   w_LV = col_double(),
                   w_RV = col_double(),
                   final_weight = col_double(),
                   timestamp = col_datetime(format = "")))

# Now that we have the data, we can start to play with it. How might I calculate
# some of the key numbers from the target table? Hint: the only three variables we
# need are response, educ and final_weight.

# Calculate that 79 people in the poll had a post grad degree.

orig %>% count(educ)

orig %>% group_by(educ) %>% count(educ)

# Calcualte that those 79 were 11% of the sample.

# Do the same two calculations for H.S. Grad or Less row.

# How many individuals have post grad education and prefer the Dem?

# What percentage is this of the Post Grad row?

# Argg! Why don't we get 53% as the Times reports? Think about weighting . . .


