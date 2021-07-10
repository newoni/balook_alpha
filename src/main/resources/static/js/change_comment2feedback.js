//<21.06.23> made by KH
//reference: https://hi098123.tistory.com/256

function change_comment2feedback(){
    document.getElementsByClassName("footer_comments")[0].style.display = "none";
    document.getElementsByClassName("footer_feedbacks")[0].style.display = "flex";
}

function change_feedback2comment(){
    document.getElementsByClassName("footer_feedbacks")[0].style.display = "none";
    document.getElementsByClassName("footer_comments")[0].style.display = "flex";
}