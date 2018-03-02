# README

This app allows users to search the City of Chicago database for graffiti removal information.

BEFORE STARTING: 
You must get your own City of Chicago API key. You can do this here: 

https://dev.socrata.com/foundry/data.cityofchicago.org/cdmx-wzbz

When you download the repo, you must create your own .ENV in the root app folder. In the .ENV folder create a variable COC_APP_TOKEN. Your .ENV should read: 

COC_APP_TOKEN="your_app_token_here" 

____________________________________________________
VIA COMMAND LINE

Go to the main graffiti_removal app folder. You will be able to search by the last name of the alderman, the month, and the year. 

From your terminal run the command: 

"ruby runner.rb" + variables you would like to search

Order of the syntax does matter. So, your input should like: 

"ruby runner.rb" + alderman_last_name + month + date

Example: 

"ruby runner.rb Moreno 02 2018"

The format of the month and year should be similar to the format above. Months should be two digits, and years should be four digits. The alderman's last name can be uppercase of lowercase.

This command will return: 
- the full name of the alderman
- the ward of the alderman
- the requested month/year
- total number of graffiti removal requests in that alderman's ward during that month


____________________________________________________
VIA RAILS SERVER IN BROWSER

Go to the main graffiti_removal app folder.

- bundle install
- rails db:create
- rails db:migrate
- rails s

In your browser, visit http://localhost:3000/. You will see a form that you can fill out to return the graffiti removal request information via jQuery / AJAX requests.








