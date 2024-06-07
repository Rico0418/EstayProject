document.addEventListener("DOMContentLoaded",function(){
    console.log(localStorage);
    let selectedRooms = JSON.parse(localStorage.getItem('selectedRooms')) || [];
    selectedRooms = selectedRooms.map(room => {
        room.roomStatus = 'Occupied';
        return room;
    });
    localStorage.setItem('selectedRooms', JSON.stringify(selectedRooms));
    console.log(selectedRooms);
    console.log(JSON.parse(localStorage.getItem('selectedHotel')));
    console.log(localStorage);
    const currentDate = new Date().toISOString();

    const transactionData = {
        TransactionDate: currentDate,
        TransactionStatus: 'Pending',
        TotalPrice: parseFloat(localStorage.getItem('Total')),
        TotalRoom: parseInt(localStorage.getItem('TotalRoom')),
        TotalStay: parseInt(localStorage.getItem('Day')),
        UserId: JSON.parse(localStorage.getItem('userInfo')).userId,
        HotelId: JSON.parse(localStorage.getItem('selectedHotel')).hotelId,
        PaymentMethodId: JSON.parse(localStorage.getItem('SelectedPaymentMethod')).paymentMethodId
    };
    var req = new XMLHttpRequest();
    req.open('POST','https://localhost:7173/api/Transaction/api/CreateTransaction',true);
    req.setRequestHeader('Content-type','application/json');
    req.onload = function(){
        if(req.status === 200){
            console.log('Transaction success');
        }else{
            console.error('failed post data');
        }
    };
    req.onerror = function(){
        console.error('Error post data');
    };
    req.send(JSON.stringify(transactionData));
    document.getElementById('btnHome').addEventListener('click',function(){
        window.location.href = 'HomePage.html';
        localStorage.removeItem('selectedRooms');
        localStorage.removeItem('selectedHotel');
        localStorage.removeItem('Sub-Total');
        localStorage.removeItem('Total');
        localStorage.removeItem('TotalRoom');
        localStorage.removeItem('SelectedPaymentMethod');
        localStorage.removeItem('Day');
    });
});