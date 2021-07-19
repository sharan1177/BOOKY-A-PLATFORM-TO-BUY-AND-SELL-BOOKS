function autocomplete(inp,parent_element) {
  var currentFocus;
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      
      getResult(this.value);
      
  });
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById("autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        currentFocus++;
        addActive(x);
      } else if (e.keyCode == 38) { 
        currentFocus--;
        addActive(x);
      } else if (e.keyCode == 13) {
        e.preventDefault();
        if (currentFocus > -1) {
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    if (!x) return false;
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
      x[i].parentNode.removeChild(x[i]);
    }
  }
}
    
    function getResult(str) {
      if (str.length==0) { 
        document.getElementById("livesearch").innerHTML="";
        document.getElementById("livesearch").style.border="0px";
        return;
      }
      if (window.XMLHttpRequest) {
        xmlhttp=new XMLHttpRequest();
      } else { 
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
      xmlhttp.onreadystatechange=function() {
        if (this.readyState==4 && this.status==200) {
            var data = JSON.parse(this.responseText);
            showResultList(data,str);

        }
      }
      xmlhttp.open("GET","templates/livesearch.php?search_key="+str,true);
      xmlhttp.send();
    }
    
    function showResultList(arr,val){
      a = document.createElement("DIV");
      a.setAttribute("id", "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      parent_element.appendChild(a);
      for (i = 0; i < arr.length; i++) {
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          b = document.createElement("DIV");
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
              b.addEventListener("click", function(e) {
              inp.value = this.getElementsByTagName("input")[0].value;
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
    }
document.addEventListener("click", function (e) {
    closeAllLists(e.target);
});
}


function searchFunction(){
    alert("found");
}

function showQuickView(title,author,price,subject,image,book_id){
    
    var image_element = document.getElementById("modal_image");
    image_element.setAttribute("src","includes/images/"+image);
    
    var name_element = document.getElementById("modal_name");
    name_element.innerHTML = title;
    
    var author_element = document.getElementById("modal_author");
    author_element.innerHTML = author;
    
    var subject_element = document.getElementById("modal_subject");
    subject_element.innerHTML = subject;
    
    var price_element = document.getElementById("modal_price");
    price_element.innerHTML = price;
    
    var view_more_element = document.getElementById("modal_view_more");
    view_more_element.setAttribute("href","book_details.php?book_id="+book_id);
    
    
    $('#quick_view').modal('show');
    
    
    
}