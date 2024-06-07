document.addEventListener("DOMContentLoaded",function(){
    console.log(localStorage)
    const SubTotal = localStorage.getItem("Sub-Total");
    console.log(SubTotal);
    document.getElementById('Sub').innerText = SubTotal;
    const total = parseInt(SubTotal) + 0.1 * parseInt(SubTotal);
    localStorage.setItem('Total',total);
    document.getElementById('Sab').innerText = total;

    var req = new XMLHttpRequest();
    req.open('GET','https://localhost:7173/api/PaymentMethod',true)
    req.onload = function (){
        if(req.status === 200){
            const response = JSON.parse(req.responseText);
            console.log(response);
            const payment = response.data;
            const bcaPayment = payment.find(payment => payment.paymentMethodName === "BCA");
            if(bcaPayment){
                document.getElementById('lblBCA').innerText = bcaPayment.paymentMethodName;
            }
            const gopayPayment = payment.find(payment => payment.paymentMethodName === "Gopay");
            if(gopayPayment){
                document.getElementById('lblGOPAY').innerText = gopayPayment.paymentMethodName;
            }
            const ovoPayment = payment.find(payment => payment.paymentMethodName === "OVO");
            if(ovoPayment){
                document.getElementById('lblOVO').innerText = ovoPayment.paymentMethodName;
            }
            const bcacreditPayment = payment.find(payment => payment.paymentMethodName === "Kredit BCA");
            if(bcacreditPayment){
                document.getElementById('lblBCACREDIT').innerText = bcacreditPayment.paymentMethodName;
            }
            const bniPayment = payment.find(payment => payment.paymentMethodName === "Kredit BNI");
            if(bniPayment){
                document.getElementById('lblBNICREDIT').innerText = bniPayment.paymentMethodName;
            }

        }
        else{
            console.error('Error fetching payment: ',req.statusText);
        }
    };
    req.onerror = function(){
        console.error('Request failed');
    };
    req.send();
    document.getElementById('btnPay').addEventListener('click',function(event){
        event.preventDefault();
        const selectedRooms = JSON.parse(localStorage.getItem('selectedRooms'));
        selectedRooms.forEach((room,index) => {
            const roomId = room.roomId;

            const updateRoomRequest = {
                roomID: roomId,
                roomStatus: 'Occupied'
            };
            var putReq = new XMLHttpRequest();
            putReq.open('PUT', `https://localhost:7173/api/Room`);
            putReq.setRequestHeader('Content-type', 'application/json');
            putReq.onload = function(){
                if(putReq.status === 200){
                    console.log("Success");
                    console.log(selectedRooms);
                    if(index === selectedRooms.length -1){
                         window.location.href = 'PaymentSuccess.html';
                     }
                }else{
                    console.error("error update");
                }
            };
            putReq.onerror = function(){
              console.error('Request failed');  
            };
            putReq.send(JSON.stringify(updateRoomRequest));
        });

    });
    document.getElementById('btnCancel').addEventListener('click',function(event){
        event.preventDefault();
        localStorage.removeItem('Total');
        localStorage.removeItem('SelectedPaymentMethod');
        console.log("tets");
        window.location.href = 'BookingRoomPage.html';
    });
    const paymentMethodInputs = document.querySelectorAll('input[name="payment-method"]');
    paymentMethodInputs.forEach(input => {
        input.addEventListener('change', function () {
            const selectedPaymentMethod = {
                paymentMethodId: this.id,
                paymentMethodName: this.value,
                paymentMethodType: this.getAttribute('data-method-type')
            };
            localStorage.setItem('SelectedPaymentMethod', JSON.stringify(selectedPaymentMethod));
            console.log(localStorage.getItem("SelectedPaymentMethod"));
            document.getElementById('btnPay').disabled = false;
        });
    });
});