# q1----
set.seed(123)

# Number of individuals
n <- 500

# Smoking status: 1 for smoker, 0 for non-smoker
Smoking <- rbinom(n, 1, 0.4)

# Coffee consumption: more likely if smoker
Coffee_Consumption <- rbinom(n, 1, prob = ifelse(Smoking == 1, 0.7, 0.3))

# Heart Disease: more likely if smoker
Heart_Disease <- rbinom(n, 1, prob = ifelse(Smoking == 1, 0.2, 0.1))

# Create the dataset
data_question1 <- data.frame(Smoking = factor(Smoking, labels = c("Non-smoker", "Smoker")),
                             Coffee_Consumption = factor(Coffee_Consumption, labels = c("Low", "High")),
                             Heart_Disease = factor(Heart_Disease, labels = c("No", "Yes")))

# Save the dataset for the exam
write.csv(data_question1, "data_question1.csv", row.names = FALSE)

# q2------
set.seed(123)

# Number of employees
n <- 400

# Group: 1 for treated, 0 for control
Group <- rbinom(n, 1, 0.5)

# Pre-training productivity scores
Pre_Productivity <- rnorm(n, mean = 70, sd = 10)

# Post-training productivity scores
Post_Productivity <- Pre_Productivity + ifelse(Group == 1, rnorm(n, mean = 5, sd = 5), rnorm(n, mean = 0, sd = 5))

# Create the dataset
data_question2 <- data.frame(Group = factor(Group, labels = c("Control", "Treated")),
                             Pre_Productivity,
                             Post_Productivity)

# Save the dataset for the exam
write.csv(data_question2, "data_question2.csv", row.names = FALSE)


# q3------
set.seed(123)

# Number of patients
n <- 300

# Group: 1 for treated, 0 for control
Group <- rbinom(n, 1, 0.5)

# Baseline blood pressure
Baseline_BP <- rnorm(n, mean = 140, sd = 15)

# Blood pressure after treatment
Post_BP <- Baseline_BP - ifelse(Group == 1, rnorm(n, mean = 10, sd = 5), rnorm(n, mean = 2, sd = 5))

# Create the dataset
data_question3 <- data.frame(Group = factor(Group, labels = c("Control", "Treated")),
                             Baseline_BP,
                             Post_BP)

# Save the dataset for the exam
write.csv(data_question3, "data_question3.csv", row.names = FALSE)

# q4------
set.seed(123)

# Number of participants
n <- 300

# Assigned Group: 1 for treatment, 0 for control
Assigned_Group <- rbinom(n, 1, 0.5)

# Compliance: 1 for compliant, 0 for non-compliant
Compliance <- rbinom(n, 1, ifelse(Assigned_Group == 1, 0.8, 0.2))

# Cholesterol reduction
Cholesterol_Reduction <- ifelse(Compliance == 1,
                                rnorm(n, mean = 15, sd = 5),
                                rnorm(n, mean = 5, sd = 5))

# Create the dataset
data_question4 <- data.frame(Assigned_Group = factor(Assigned_Group, labels = c("Control", "Treatment")),
                             Compliance = factor(Compliance, labels = c("Non-compliant","Compliant")))
                                                                        