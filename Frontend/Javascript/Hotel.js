document.addEventListener("DOMContentLoaded",function(){
    console.log(localStorage);
    const userInfo = JSON.parse(localStorage.getItem('userInfo'));
    const selectedHotel = JSON.parse(localStorage.getItem('selectedHotel'));
    if(selectedHotel && userInfo){
        console.log(selectedHotel);
        document.getElementById("BtnBook").disabled = false;
        document.getElementById("hotelImage").src = selectedHotel.hotelImage;
        document.getElementById("hotelName").innerText = selectedHotel.hotelName;
        document.getElementById("hotelDescription").innerText = selectedHotel.hotelDescription;
        document.getElementById("hotelPrice").innerText = `Price: Rp ${selectedHotel.hotelPrice} / nights`;
        document.getElementById("hotelLocation").innerText = `Location: ${selectedHotel.hotelLocation.hotelLocationName}`;
    }else{
        console.log("no hotel selected");
        document.getElementById("Warning").innerText = "No Hotel Selected";
        document.getElementById("BtnBook").disabled = true;
    }
    const historyBtn = document.getElementById("historyBtn");
    historyBtn.addEventListener("click",()=>{
        localStorage.removeItem('selectedHotel');
    });

    const bookButton = document.getElementById("BtnBook");
    bookButton.addEventListener("click", ()=>{
        window.location.href = "BookingRoomPage.html";
    });
    const homeButton = document.getElementById("BtnHome");
    homeButton.addEventListener("click", () => {
        localStorage.removeItem('selectedHotel');
        window.location.href = 'HomePage.html';  // Adjust the target URL as needed
    });
    const LogOut = document.getElementById("BtnLogOut");
    LogOut.addEventListener("click",() => {
        localStorage.clear();
        window.location.href = 'LoginPage.html';
    });
})