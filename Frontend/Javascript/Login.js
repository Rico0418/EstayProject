const form = document.getElementById("form-login")
const login = document.getElementById("loginBtn")
const loginEmail = document.getElementById("email")
const password = document.getElementById("password")

form.addEventListener("submit", (e) =>{
    e.preventDefault();
    let wrongCounter=0
    
    if(loginEmail.value == ""){
        alert('Tolong masukkan email')
        wrongCounter++
    }else if(!loginEmail.value.includes("@")){
        alert("email harus contains @")
        wrongCounter++
    }
    if(password.value == ""){
        alert('Tolong masukkan password')
        wrongCounter++
    }

    if(wrongCounter === 0){
        var req = new XMLHttpRequest();
        req.open('POST','https://localhost:7173/api/User/api/User/login');
        req.setRequestHeader("Content-type","application/json");

        let data = {
            "userEmail": loginEmail.value,
            "userPassword": password.value
        };
        req.onload = function (){
            if(req.status === 200){
                const response = JSON.parse(req.responseText);
                localStorage.setItem('userInfo', JSON.stringify(response));
                alert("Login success");
                window.location.href = 'HomePage.html';
            }else if(req.status === 400){
                alert("login failed:  incorrect email or password");
            }else{
                alert("Login failed: server error");
            }
        };
        req.send(JSON.stringify(data))
    }
})
