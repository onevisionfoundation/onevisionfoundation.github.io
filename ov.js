document.getElementById('log').style.display='block';

function verif(){
  if (document.getElementById('username').value=="Onevision2019gn" && document.getElementById('pass').value=="vision2019") {
    document.getElementById('log').style.display='none';
    alert('Welcome to your TEAM');
  }else {
    alert('Address ou mot de pass incorrect');
  }

}
