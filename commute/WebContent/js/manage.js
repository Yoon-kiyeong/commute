var editRID = document.getElementById("editrid");
var deleteRID = document.getElementById("deleterid");
var editcommute = document.getElementById("editcommute");
var editleave = document.getElementById("editleave");
var deletecommute = document.getElementById("deletecommute");
var deleteleave = document.getElementById("deleteleave");

function setRID(rid, commute, leave) {
	console.log(rid, commute, leave);
	editRID.value = String(rid);
	deleteRID.value = String(rid);
	editcommute.value = commute
	editleave.value = leave
	deletecommute.value = commute
	deleteleave.value = leave
}

var modal = document.getElementById("Modal");
var modal1 = document.getElementById("Modal1");
var btn = document.getElementById("editButton");
var btn1 = document.getElementById("deleteButton");
var span = document.getElementsByClassName("close")[0];
var span1 = document.getElementsByClassName("close")[1];
var disagree = document.getElementById("disagree");
var disagree1 = document.getElementById("disagree1");
var editsubmit = document.getElementById("editsubmit");
var deletesubmit = document.getElementById("deletesubmit");

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

editsubmit.onclick = function() {
	modal.style.display = "none";
	location.href = "./commuteRecord.jsp";
}

deletesubmit.onclick = function() {
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