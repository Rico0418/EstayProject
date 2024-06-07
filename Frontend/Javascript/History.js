document.addEventListener("DOMContentLoaded",function(){
    console.log(localStorage);
    const userInfo = JSON.parse(localStorage.getItem('userInfo'));
    console.log(userInfo);
    console.log(userInfo.userId);
    var req = new XMLHttpRequest();
    const tampunganDiv = document.querySelector(".tampungan");
    req.open('GET', `https://localhost:7173/api/Transaction?userId=${userInfo.userId}`);
    req.setRequestHeader('Content-Type', 'application/json');
    req.onload = function (){
        if(req.status === 200){
            var response = JSON.parse(req.responseText);
            console.log(response);
            var transactions = response.data;
            console.log(transactions);
            if(transactions.length === 0){
                const warning = document.createElement("h3");
                warning.textContent = "No transaction data yet";
                tampunganDiv.appendChild(warning);
            }else{
                transactions.forEach(transaction => {
                    const container = document.createElement("div");
                    container.className = "container";

                    const date = document.createElement("p");
                    date.textContent = "Transaction Date: " +transaction.transactionDate;

                    const room = document.createElement("p");
                    room.textContent = "Total Room: "+transaction.totalRoom;

                    const stay = document.createElement("p");
                    stay.textContent = "Total Stay: "+transaction.totalStay;

                    const price = document.createElement("p");
                    price.textContent = "Total Price: "+transaction.totalPrice;

                    const name = document.createElement("p");
                    name.textContent = "Hotel Name: "+transaction.hotels.hotelName;

                    const status = document.createElement("p");
                    status.textContent = "Transaction Status: "+transaction.transactionStatus;

                    container.append(date);
                    container.append(room);
                    container.append(stay);
                    container.append(price);
                    container.append(name);
                    container.append(status);
                    tampunganDiv.appendChild(container);
                });
            }
        }else{
            console.error('failed fetch data');
        }
    };
    req.onerror = function(){
        console.error('Error fetching data');
    };
    req.send();
    document.getElementById('btnHome').addEventListener('click', function(){
        window.location.href = 'HomePage.html';
    });
});