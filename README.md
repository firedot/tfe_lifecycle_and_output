# tfe_lifecycle_and_output
A script that manages the lifecycle of a run. 

# Prerequisites

- Oracle VirtualBox installed [Get it here](https://www.virtualbox.org/wiki/Downloads)
- Vagrant installed [Get it here](https://www.vagrantup.com/downloads.html)
- TFE Account [How to create a TFE account](https://www.terraform.io/docs/enterprise/users-teams-organizations/users.html#creating-an-account)
- TFE User API token [How to create TFE User API token](https://www.terraform.io/docs/enterprise/users-teams-organizations/users.html#api-tokens)

# Some resources
- [What is an API](https://medium.freecodecamp.org/what-is-an-api-in-english-please-b880a3214a82)

# TO-DO

- Create a script that: 
  - Presents a list with procedures to choose from including but not limited to:
    - Tries to read Outputs from a previous run
- README with instructions
    
# DONE
  
- Create a ```Vagrantfile```
- Create a provisioning script that installs ```curl``` and ```jq```
- Create a script that: 
  - Creates a variable from user input regarding:
    - Exports the API Token needed to manage TFE
    - Organization name
    - Workspace name
  - Presents a list with procedures to choose from including but not limited to:
    - Create a run
    - Apply 
    - Get the value of ```CONFIRM_DESTROY``` env var in the TFE Worskpace
    - Set Environmental variables in TFE ( such as ```CONFIRM_DESTROY=1``` )
    - Destroy

# How to use this repository

- Clone this repository

```
git clone 
```

- Go in the cloned repository directory

```
cd 
```

- Spin up the VM defined in the ```Vagrantfile``` by running

```
vagrant up
```

- Connect to the machine that you spun by running the following command

```
vagrant ssh
```

- You should see a screen as the one in the image below


- Run the following command to execute the script which will assist you in manipulating TFE trough its API

```
bash /vagrant/scripts/tfe_api_manage.sh
