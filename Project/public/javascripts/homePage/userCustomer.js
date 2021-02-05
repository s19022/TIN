const ITEMS_PER_PAGE = 5;
let pageNumber = 1;
let deliveryOptions =  document.getElementById('deliveryOptions');
let orders;
const table = document.getElementById('ordersTable');

let request = new XMLHttpRequest();
request.open('GET', '/orders', true)
request.setRequestHeader(
    'Content-Type',
    'application/json'
);

request.send();
request.onload = function (){
    if (request.status === 200){
        let response = JSON.parse(request.response);
        orders = response.orders;
        console.log('Loaded : ');
        console.log(orders);
        addButtons();
    }
};

function addButtons(){
    if (orders.length <= ITEMS_PER_PAGE) return;
    const buttonTable = document.getElementById('buttonsTable');
    const row = buttonTable.insertRow();

    const previousPageButton = document.createElement('input');
    previousPageButton.type = 'button';
    previousPageButton.value = '<-';
    let cell = row.insertCell();
    cell.appendChild(previousPageButton);

    const nextPageButton = document.createElement('input');
    nextPageButton.type = 'button';
    nextPageButton.value = '->';
    cell = row.insertCell();
    cell.appendChild(nextPageButton);

    nextPageButton.addEventListener('click', function (e) {
        e.preventDefault();
        pageNumber++;
        deliveryOptions.select(0);
    });

    previousPageButton.addEventListener('click', function (e) {
        e.preventDefault();
        pageNumber--;
    });
}

deliveryOptions.addEventListener('change', function (e) {
    e.preventDefault();
    table.innerHTML = '';

    let showDeliveryDate = (deliveryOptions.options.selectedIndex !== 2);
    /// create headers
    let thead = table.createTHead();
    let row = thead.insertRow();
    let data = ['Order number', 'Quantity', 'Item name', 'Item price', 'Order date'];
    for (let key of data) {
        let th = document.createElement("th");
        let text = document.createTextNode(key);
        th.appendChild(text);
        row.appendChild(th);
    }
    if (showDeliveryDate){
        let th = document.createElement("th");
        let text = document.createTextNode('Delivery date');
        th.appendChild(text);
        row.appendChild(th);
    }

    for (let rowNumber = ITEMS_PER_PAGE * (pageNumber - 1);
         rowNumber < Math.min(orders.length, (ITEMS_PER_PAGE * pageNumber)); rowNumber++){
        let data = orders[rowNumber];
        addRow(data);
    }
});

function addRow(data){
    if (deliveryOptions.value === 'Not delivered'){
        if (data.deliveryDate !== null)
            return
    }
    if (deliveryOptions.value === 'Delivered'){
        if (data.deliveryDate === null)
            return;
    }
    let row = table.insertRow();

    addCell(row, data.orderNumber);
    addCell(row, data.quantity);
    addCell(row, data.itemName);
    addCell(row, data.price.toFixed(2));
    addCell(row, (new Date(data.orderDate)).toLocaleString("en-GB"));
    if(deliveryOptions.value !== 'Not delivered'){
        let deliveryDate = 'not delivered';
        if (data.deliveryDate !== null){
            deliveryDate =  (new Date(data.deliveryDate)).toLocaleString("en-GB");
        }
        addCell(row, deliveryDate);
    }
}

function addCell(row, message){
    let cell = row.insertCell();
    let text = document.createTextNode(message);
    cell.appendChild(text);
}