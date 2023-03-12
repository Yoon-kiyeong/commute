var modal = document.getElementById("Modal");
var modal1 = document.getElementById("Modal1");
var btn = document.getElementById("commuteModal");
var btn1 = document.getElementById("leaveModal");
var span = document.getElementsByClassName("close")[0];
var span1 = document.getElementsByClassName("close")[1];
var disagree = document.getElementById("disagree");
var disagree1 = document.getElementById("disagree1");
var agree = document.getElementById("agree");
var agree1 = document.getElementById("agree1");
btn.onclick = function() {
	modal.style.display = "block";
}

btn1.onclick = function() {
	modal1.style.display = "block";
}

span.onclick = function() {
	modal.style.display = "none";
}

span1.onclick = function() {
	modal1.style.display = "none";
}

disagree.onclick = function() {
	modal.style.display = "none";
}

disagree1.onclick = function() {
	modal1.style.display = "none";
}

agree.onclick = function() {
	modal.style.display = "none";
	location.href = "./commuteRecord.jsp";
}

agree1.onclick = function() {
	modal1.style.display = "none";
	location.href = "./leaveRecord.jsp";
}

window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}

window.onclick = function(event) {
	if (event.target == modal1) {
		modal.style.display = "none";
	}
}