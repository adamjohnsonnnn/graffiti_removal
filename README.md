# README

This app allows users to search the City of Chicago database for graffiti removal information. 

____________________________________________________
VIA COMMAND LINE

Go to the main graffiti_removal app folder. You will be able to search by the last name of the alderman, the month, and the year. 

From your terminal run the command: 

"ruby runner.rb" + variables you would like to search

Order of the syntax does matter. So, your input should like: 

"ruby runner.rb" + alderman_last_name + month + date

Example: 

"ruby runner.rb Moreno 02 2018"

The format of the month and year should be similar to the format above. Months should be two digits, and years should be four digits. The aldreman's last name can be uppercase of lowercase.

This command will return: 
- the full name of the alderman
- the ward of the alderman
- the requested date
- total number of graffiti removal requests in that alderman's ward during that month


____________________________________________________
VIA RAILS SERVER IN BROWSER

Go to the main graffiti_removal app folder.

- bundle install
- rails db:create
- rails db:migrate
- rails s

In your browser, visit http://localhost:3000/. You will see a form that you can fill out to return the graffiti removal request information via jQuery / AJAX requests.








