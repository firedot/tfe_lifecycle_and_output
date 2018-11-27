# tfe_lifecycle_and_output
A script that manages the lifecycle of a run. 


# TO-DO

- Create a script that: 
  - Creates a variable from user input regarding:
    - Exports the API Token needed to manage TFE
    - Organization name
    - Workspace name
  - Presents a list with procedures to choose from including but not limited to:
    - Create a run
    - Apply 
    - Set Environmental variables in TFE ( such as ```CONFIRM_DESTROY=1``` )
    - Destroy
    - Tries to read Outputs from a previous run
    
# DONE
  
- Create a ```Vagrantfile```
- Create a provisioning script that installs ```curl``` and ```jq```
