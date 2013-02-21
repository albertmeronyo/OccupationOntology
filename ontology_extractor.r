file <- read.csv(file="repos/DataDump/csv/BRT_1889_02_T1.csv", head=FALSE, sep=",")
df <- data.frame(file)

# Rows removal
df <- df[-1:-3,]

# Cols removal
df$V1 = NULL
df <- df[,-7:-nrow(df)]

# Replace "Id." by the item just above
for (i in 1:nrow(df)) {
if (df$V5[i] == 'id.' | df$V5[i] == 'Id.' | df$V5[i] == 'id') {df$V5[i] = df$V5[i-1]}
}

# Remove all rows with totals
df <- df[-grep("Totaal*", df$V5),]
df <- df[-grep("totaal*", df$V5),]

# Remove tailing rows
df <- df[-(nrow(df)-10):-nrow(df),]

# Write output to file
write.table(df,file="repos/OccupationOntology/output/BRT_1889_02_T1.csv",sep=",",row.names=F)