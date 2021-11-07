#Author: Yaniv Bronshtein
#Problem: Monty Hall Problem extra credit
set.seed(1)
run_trial <- function(switch_doors, ndoors=3){
  doors <- 1:3 #List of all doors. We know the car is always behind door 1
  chosen_door = sample(doors,1)
  if(switch_doors){
    #reveal a goat
    revealed_door <- ifelse(chosen_door==2, 3, 2)
    print(revealed_door)
    #Make switch by choosing another door
    available_doors <- doors[(doors!=chosen_door) & (doors!=revealed_door)]
    cat("Available doors")
    cat(available_doors)
    chosen_door <- sample(available_doors, 1)
    
  }
  #win if pick door 1
  return(chosen_door==1)
}

run_trials <- function(ntrials, switch_doors, ndoors=3){
  nwins <- 0
  for (i in 1:ntrials){
    if (run_trial(switch_doors, ndoors)){
      nwins <- nwins + 1
    }
  }
    return(nwins)
}
ndoors <- 3
ntrials <- 10000
nwins_no_switch <- run_trials(ntrials,FALSE, ndoors)
nwins_yes_switch <- run_trials(ntrials,TRUE, ndoors)
cat("Monty Hall Problem with:", ndoors, " doors")
cat('Win ratio with no switching:', nwins_no_switch/ntrials)
cat('Win ratio with switching:', nwins_yes_switch/ntrials)

