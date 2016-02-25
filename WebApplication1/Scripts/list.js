var lists = new Array(50);
var lastList = 0;

function addList(){
	//alert(document.getElementById("listTitle").value);
	var title = document.getElementById("listTitle").value;
	document.getElementById("listTitle").value = "";
	var newList = document.createElement("DETAILS");
	var newsum = document.createElement("SUMMARY");
	newsum.appendChild(document.createTextNode(title));
	newList.appendChild(newsum);
	newList.appendChild(document.createElement("P").appendChild(document.createTextNode("Task 1 for this list")));
	lists[lastList] = newList;
	//alert("about to add new element");
	(document.getElementById("listSection")).appendChild(lists[lastList]);
	lastList++;
}