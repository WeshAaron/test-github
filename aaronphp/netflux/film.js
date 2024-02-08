let mesImages=document.getElementsByClassName("imagesfilms");

for(i=0;i<mesImages.length;i++){
    mesImages[i].addEventListener("click",afficheDetail)
    mesImages[i].myParam=mesImages[i].id;
}

function afficheDetail(evt){

    let id = evt.currentTarget.myParam;
    let element=document.getElementById(id);
    let nextSibling = element.nextSibling;
    if(nextSibling.style.display !== "block"){
        nextSibling.style.display = "block";
    }
    else{
        nextSibling.style.display="none";
    }
}


