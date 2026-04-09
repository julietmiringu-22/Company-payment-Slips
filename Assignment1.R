set.seed(123)

id <- 1:501
name <- paste("Worker", id, sep="_")
gender <- sample(c("Male", "Female"), 501, replace=TRUE)
salary <- sample(5000:35000, 501, replace=TRUE)

workers <- data.frame(id, name, gender, salary)

for (i in 1:nrow(workers)) {
  tryCatch({
    
    sal <- workers$salary[i]
    gen <- workers$gender[i]
    
    if (sal > 10000 && sal < 20000) {
      level <- "A1"
    } else if (sal > 7500 && sal < 30000 && gen == "Female") {
      level <- "A5-F"
    } else {
      level <- "A2"
    }
    
    cat("------ PAYMENT SLIP ------\n")
    cat("ID:", workers$id[i], "\n")
    cat("Name:", workers$name[i], "\n")
    cat("Gender:", gen, "\n")
    cat("Salary: $", sal, "\n")
    cat("Employee Level:", level, "\n")
    cat("--------------------------\n\n")
    
  }, error = function(e) {
    cat("Error:", conditionMessage(e), "\n")
  })
}
