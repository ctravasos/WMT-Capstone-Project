```{r}
# Get unique campaign names
unique_campaign_names <- unique(stanford_insights$CampaignName)

# Display the unique campaign names
print(unique_campaign_names)
```

```{r}
# Load the dataset (replace 'path_to_your_file.csv' with the path to your actual CSV file)
# stanford_insights <- read.csv('path_to_your_file.csv')

# Create separate datasets for each sport
basketball <- subset(stanford_insights, grepl("MBB|WBB|Men's Basketball|Women's Basketball", CampaignName))
baseball <- subset(stanford_insights, grepl("BSB", CampaignName))
softball <- subset(stanford_insights, grepl("SB", CampaignName))
football <- subset(stanford_insights, grepl("F", CampaignName))
volleyball <- subset(stanford_insights, grepl("V", CampaignName))
soccer <- subset(stanford_insights, grepl("MS|WS|Men's Soccer|Women's Soccer", CampaignName))
gymnastics <- subset(stanford_insights, grepl("WG|Stanford Women's Gymnastics", CampaignName))
water_polo <- subset(stanford_insights, grepl("MWP", CampaignName))

# Create a dataset for miscellaneous campaigns, "B24|W24|D25"
miscellaneous <- subset(stanford_insights, 
                        !grepl("MBB|WBB|BSB|SB|F|V|MS|WS|WG|MWP|Men's Basketball|Women's Basketball|Men's Soccer|Women's Soccer|Stanford Women's Gymnastics", CampaignName))



# Print the number of rows in each dataset
cat("Basketball: ", nrow(basketball), "rows\n")
cat("Baseball: ", nrow(baseball), "rows\n")
cat("Softball: ", nrow(softball), "rows\n")
cat("Football: ", nrow(football), "rows\n")
cat("Volleyball: ", nrow(volleyball), "rows\n")
cat("Soccer: ", nrow(soccer), "rows\n")
cat("Gymnastics: ", nrow(gymnastics), "rows\n")
cat("Water Polo: ", nrow(water_polo), "rows\n")
cat("Miscellaneous: ", nrow(miscellaneous), "rows\n")

# # Save separate datasets to CSV files
# write.csv(basketball, "basketball.csv", row.names = FALSE)
# write.csv(baseball, "baseball.csv", row.names = FALSE)
# write.csv(softball, "softball.csv", row.names = FALSE)
# write.csv(football, "football.csv", row.names = FALSE)
# write.csv(volleyball, "volleyball.csv", row.names = FALSE)
# write.csv(soccer, "soccer.csv", row.names = FALSE)
# write.csv(gymnastics, "gymnastics.csv", row.names = FALSE)
# write.csv(water_polo, "water_polo.csv", row.names = FALSE)
# write.csv(miscellaneous, "miscellaneous.csv", row.names = FALSE)

```


```{r}

# Load the dataset (replace 'path_to_your_file.csv' with the path to your actual CSV file)
# stanford_insights <- read.csv('path_to_your_file.csv')

# Define the sport category for each campaign based on the CampaignName
stanford_insights$sport <- "Miscellaneous" # Default category

# Update the sport column based on CampaignName
stanford_insights$sport[grepl("MBB|Men's Basketball", stanford_insights$CampaignName)] <- "Men's Basketball"
stanford_insights$sport[grepl("WBB|Women's Basketball", stanford_insights$CampaignName)] <- "Women's Basketball"
stanford_insights$sport[grepl("BSB", stanford_insights$CampaignName)] <- "Baseball"
stanford_insights$sport[grepl("SB", stanford_insights$CampaignName)] <- "Softball"
stanford_insights$sport[grepl("F", stanford_insights$CampaignName)] <- "Football"
stanford_insights$sport[grepl("V", stanford_insights$CampaignName)] <- "Volleyball"
stanford_insights$sport[grepl("MS|Men's Soccer", stanford_insights$CampaignName)] <- "Men's Soccer"
stanford_insights$sport[grepl("WS|Women's Soccer", stanford_insights$CampaignName)] <- "Women's Soccer"
stanford_insights$sport[grepl("WG|Stanford Women's Gymnastics", stanford_insights$CampaignName)] <- "Gymnastics"
stanford_insights$sport[grepl("MWP", stanford_insights$CampaignName)] <- "Water Polo"

# Move the sport column to the first position
stanford_insights <- stanford_insights[, c("sport", setdiff(names(stanford_insights), "sport"))]

# Display the updated dataset
print(head(stanford_insights))







```
