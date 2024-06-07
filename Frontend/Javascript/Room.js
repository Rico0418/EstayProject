document.addEventListener("DOMContentLoaded",function(){
    const selectedHotel = JSON.parse(localStorage.getItem('selectedHotel'));
    console.log(localStorage);
    
    var req = new XMLHttpRequest();
    req.open('GET','https://localhost:7173/api/Room',true)
    req.onload = function(){
        if(req.status === 200){
            const response = JSON.parse (req.responseText);
            console.log(response);
            const rooms = response.data;
            const matchingRooms = rooms.filter(room => room.hotels.hotelId === selectedHotel.hotelId); //mirip foreach
            console.log(matchingRooms);
            displayRooms(matchingRooms);
            
        }
        else{
            console.error('Error fetching room: ',req.statusText);
        }
        
    };
    req.onerror = function(){
        console.error('Request failed');
    };
    req.send();

    document.getElementById('btnContinue').addEventListener('click',function(){
        
        if(!this.disabled){
            window.location.href = 'PaymentPage.html';
        }

    })

    document.getElementById('btnCancel').addEventListener('click',function(){
        localStorage.removeItem('selectedRooms');
        localStorage.removeItem('Day');
        localStorage.removeItem('Sub-Total');
        localStorage.removeItem('TotalRoom')
        window.location.href = 'HotelPage.html';
    });
    document.getElementById('startDate').addEventListener('change', updateDateRange);
    document.getElementById('endDate').addEventListener('change', updateDateRange);
    const countDays = localStorage.getItem('Day');
    if (countDays) {
        document.getElementById('countDays').innerText = countDays;
    }
});

function displayRooms(rooms){
    const rowA = document.getElementById('rowA');
    const rowB = document.getElementById('rowB');
    const selectedRooms = JSON.parse(localStorage.getItem('selectedRooms')) || [];
    rooms.forEach(room => {
        const roomDiv = document.createElement('div');
        roomDiv.className = 'blok-kamar';
        roomDiv.textContent = room.roomNumber;
        if(room.roomName === 'A'){
            rowA.appendChild(roomDiv);
        }
        if(room.roomName === 'B'){
            rowB.appendChild(roomDiv);
        }
        if(room.roomStatus === 'Occupied'){
            roomDiv.style.backgroundColor = 'red';
            roomDiv.style.pointerEvents = 'none';
        }
        if(selectedRooms.some(selectedRoom => selectedRoom.roomId === room.roomId)){
            roomDiv.style.backgroundColor = 'red';
        }
        roomDiv.addEventListener('click', () => {
            handleRoomClick(roomDiv, room);
        });
    });
    updateRoomSelection();
}
function handleRoomClick(roomDiv, room) {
    let selectedRooms = JSON.parse(localStorage.getItem('selectedRooms')) || [];
    console.log(selectedRooms);
    const roomIndex = selectedRooms.findIndex(selectedRoom => selectedRoom.roomId === room.roomId);

    if (roomIndex > -1) {
        selectedRooms.splice(roomIndex, 1);
        roomDiv.style.backgroundColor = '';
    } else {
        selectedRooms.push(room);
        roomDiv.style.backgroundColor = 'red';
    }

    localStorage.setItem('selectedRooms', JSON.stringify(selectedRooms));
    updateRoomSelection();
}
function updateRoomSelection() {
    const selectedRooms = JSON.parse(localStorage.getItem('selectedRooms')) || [];
    const selectedHotel = JSON.parse(localStorage.getItem('selectedHotel'));
    const day = JSON.parse(localStorage.getItem('Day'));
    console.log(day);
    const count = selectedRooms.length;
    localStorage.setItem('TotalRoom',count);
    document.getElementById('count').innerText = count;

    if(day === null){
        const total = count * selectedHotel.hotelPrice;
        document.getElementById('total').innerText = total;
    }else{
        const total = count * selectedHotel.hotelPrice * day;
        localStorage.setItem('Sub-Total',total)
        document.getElementById('total').innerText = total;
    }
   
    updateContinueButton();
    
}
function updateDateRange() {
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;

    if (startDate && endDate) {
        const start = new Date(startDate);
        const end = new Date(endDate);
        const timeDiff = end - start;
        const dayDiff = timeDiff / (1000 * 3600 * 24) + 1; // Calculate days

        document.getElementById('countDays').innerText = dayDiff;
        localStorage.setItem('Day',dayDiff);

        // Update total price with the new date range
        updateRoomSelection();
    }
}
function updateContinueButton() {
    const selectedRooms = JSON.parse(localStorage.getItem('selectedRooms')) || [];
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;

    const btnContinue = document.getElementById('btnContinue');
    if (selectedRooms.length > 0 && startDate !=null && endDate!=null) {
        btnContinue.disabled = false;
    } else {
        btnContinue.disabled = true;
    }
}