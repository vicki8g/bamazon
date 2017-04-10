var prompt = require('prompt');
var mysql = require('mysql');
var inquirer = require('inquirer');

var connection = mysql.createConnection({
	host: "localhost",
	port: 3306,
	user: "root",
	password: "",
	database: "bamazon_db"
});

connection.connect(function(err) {
	if (err) throw err;
	// console.log("connected as id" + connection.threadID);
});


// displays items sold intitially
function displayInventory() {
	connection.query('SELECT * FROM Products', function(err, inventory){
		if (err) throw err;
		console.log("Inventory");
		for(var i = 0; i < inventory.length; i++){
			console.log("Item ID: " + inventory[i].id + " | Product: " + inventory[i].ProductName + " | Department: " + inventory[i].DepartmentName + " | Price: " + inventory[i].Price + " | Quantity: " + inventory[i].StockQuantity);
		}

		inquirer.prompt([

		{
			type: "input",
			message: "What is the ID of the item you would like to buy?",
			name: "id"
		},
		{
			type: "input",
			message: "How many would you like to buy?",
			name: "quantity"
		}
			]).then(function(order) {
				var quantity = order.quantity;
				var itemId = order.id;
				connection.query('SELECT * FROM Products WHERE id= ' + itemId, function(err, selectedItem){
					if (err) throw err;
					if (selectedItem[0].StockQuantity - quantity >= 0) {
						console.log("Our inventory has enough of that item " + (selectedItem[0].ProductName) + "!");
						console.log("Quantity in stock: " + selectedItem[0].StockQuantity + " Order Quantity: " + quantity);
						console.log("Your total equals " + (order.quantity * selectedItem[0].Price) + " dollars. Thank you for shopping on Bamazon!");
						
						// update the inventory and remove purchased item 
						connection.query('UPDATE Products SET StockQuantity=? WHERE id=?', (selectedItem[0].StockQuantity - quantity, itemId),
						function(err, inventory) {
							if (err) throw err;

							displayInventory();
					});
				
				}
					else {
						console.log("Insufficient quantity. Bamazon only has " + selectedItem[0].StockQuantity + " " + selectedItem[0].ProductName + " currently in stock.");
							displayInventory();
					}

			});
		});
	});
}

displayInventory();