const form = document.getElementById("form-register")
const register = document.getElementById("register-button")
const regisName = document.getElementById("name")
const regisEmail = document.getElementById("email")
const regisPassword = document.getElementById("password")
const confirmPassword = document.getElementById("confirmpassword")
const regisPhone = document.getElementById("phone");
const regisAge = document.getElementById("age")

form.addEventListener("submit",(e)=>{
    e.preventDefault();
    let wrongcounter = 0

    if(regisName.value.length <5 || regisName.value.length > 15){
        alert("Username diantara 5 - 15 karakter");
        wrongcounter++
    }
    if(!regisEmail.value.includes("@")){
        alert("email harus contain @ dan tidak boleh kosong")
        wrongcounter++
    }
    if(regisPassword.value == ""){
        alert("password tidak boleh kosong")
        wrongcounter++
    }
    if(confirmPassword.value == ""){
        alert("confirm password tidak boleh kosong")
        wrongcounter++
    }else if(confirmPassword.value != regisPassword.value){
        alert("confirm password doesn't match")
        wrongcounter++
    }
    if(regisPhone.value == ""){
        alert("phone harus diisi")
        wrongcounter++
    }
    if(parseInt(regisAge.value) < 17){
        alert("umur harus diatas 17")
        wrongcounter++
    }
    if(wrongcounter == 0){
        var req = new XMLHttpRequest();
        req.open('POST','https://localhost:7173/api/User/api/User/register');
        req.setRequestHeader("Content-type","application/json");

        let data = {
            "userName":regisName.value,
            "userEmail":regisEmail.value,
            "userPassword":regisPassword.value,
            "userPhoneNumber":regisPhone.value,
            "userAge": parseInt(regisAge.value)
        };

        req.onload = function(){
            if(req.status === 200){
                alert("Registration success");
                window.location.href = 'LoginPage.html';
            }else{
                alert("Registration failed")
            }
        };
        req.send(JSON.stringify(data));
    }
})