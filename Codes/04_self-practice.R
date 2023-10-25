## Configuring your local and global identity in Git
# In terminal
git config --global user.name "Jane Doe"
git config --global user.email "jane@example.com"
git config --global --list

# or in R console
install.packages("usethis")
library(usethis)
use_git_config(user.name = "Jane Doe", 
               user.email = "jane@example.org")

library(gitcreds)
gitcreds_set()
