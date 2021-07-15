function gestoreEvidenzia(name){  
    try {
        var x= document.getElementById(name);
        x.style.color="red";
        x.style.fontWeight="bold";
    } catch(e) {
        alert("gestoreEvidenzia()"+e);   
    }                                     
}

function gestoreDisEvidenzia(name){  
    try {
        var x= document.getElementById(name);
        x.style.color="black";
        x.style.fontWeight="normal";
    } catch(e) {
        alert("gestoreDisEvidenzia()"+e);   
    }                                     
}