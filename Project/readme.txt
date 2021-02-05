How to set up:
	1)build db by executing sqlDump
	2)provide your credentials in config.json
	3)start app.js

App has 3 user roles
	admin (login : admin1, password : password_admin1)
	customer(login : user1, password : password_user1)
	guest (not logged in or with expired token)

Register:
	enter login
	enter password
	by default role is Customer

Login:
	before sending the request to server checks that login and password fields are not empty
	if the login/password combination exists, db assigns token valid for 15 minutes. Then server adds token to cookies and redirects to home page.

Home page
	for admin:
		suppotrs add, update, delete for item 
	
	for customer
		list of orders, filtered by delivered/not delivered with pagination
		list of products with possibility to order
			sends request to '/order' to add new order with selected items
			after success reloads page with new information
			in case of failure (the only reason is expired token or not working db) redirects to login page

	for guest and expiredToken:
		list of items

order.js 
	handles operations invoked by customer to show orders or to add new

item.js
	handles operations invoked by admin to update, delete or add an item

	the name of the item is unique


after any comunication of a logged user with the db validity of token is prolonged fro 15 minutes