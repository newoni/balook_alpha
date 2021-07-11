//<21.06.23> made by KH
//reference: https://hi098123.tistory.com/256

function change2responseTofeedback(){
    document.getElementsByClassName("feedback_card4response")[0].style.display = "flex";
    document.getElementsByClassName("feedback_card4request")[0].style.display = "none";
    document.getElementsByClassName("feedback_card4finished")[0].style.display = "none";
}

function change2requestTofeedback(){
    document.getElementsByClassName("feedback_card4response")[0].style.display = "none";
    document.getElementsByClassName("feedback_card4request")[0].style.display = "flex";
    document.getElementsByClassName("feedback_card4finished")[0].style.display = "none";

}

function change2finishedTofeedback(){
    document.getElementsByClassName("feedback_card4response")[0].style.display = "none";
    document.getElementsByClassName("feedback_card4request")[0].style.display = "none";
    document.getElementsByClassName("feedback_card4finished")[0].style.display = "flex";
}