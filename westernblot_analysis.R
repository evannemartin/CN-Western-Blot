setwd("~/Charite Thesis/CBX3 project/westernblot")

# Import

table <- read.table(
  "CN_western_ratio.csv",
  fileEncoding = 'latin1',
  sep = ";",
  header = TRUE
)

# Plot

table_long <- table %>% pivot_longer(cols = 2:last_col(),
                                     names_to = "Variable",
                                     values_to = "Value")
ggplot(table_long, aes(x = Condition, y = Value, color = Condition)) +
  geom_boxplot() +
  geom_jitter() +
  theme_minimal() +
  facet_wrap( ~ Variable, scales = 'free', ncol = 5)

# Kruskal-Wallis

res.kruskal.h3k9me3 <- table %>% kruskal_test(Ratio_H3K9me3_H3 ~ Condition)
res.kruskal.h3k9me3
res.kruskal.h4k20me3 <- table %>% kruskal_test(Ratio_H3K9me3_H3 ~ Condition)
res.kruskal.h4k20me3

