<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Books</title>
  <script>
const ajax = new XMLHttpRequest();

function get(){
    let name = document.getElementById("name").value;
    ajax.onreadystatechange = update;
    ajax.open("GET", "../php/getBooksByAuthor.php?name="+ name);
    
    ajax.send(null);
}

  function update(){
    if(ajax.readyState === 4){
      if(ajax.status === 200){
        var text = document.getElementById('text');
        var res = "";
        let books = ajax.responseXML.firstChild.children;
        for(var i = 0; i < books.length; i++){
          res += "<tr>";
          res += "<td>" + books[i].children[0].firstChild.nodeValue + "</td>";
          res += "<tr>";
        }
        text.innerHTML = res;
      }
    }
  }
</script>
</head>
<body>
<?php
include("../php/dbConnect.php");

$authorSql = 'SELECT `name` FROM `authors`';

echo '<form method="get">';

echo "<select id='name'><option> Выбрать фильмы по автору </option>";

foreach($db->query($authorSql) as $row) {
    echo "<option value='" . $row['name'] . "'>" . $row['name'] . "</option>";
}

echo "</select>";
echo '<input type="button" onclick= "get()" value="ОК"><br>';
echo "</form>";
?>
<table style="border: 1px solid"><tr><th> Book </th></tr>
<tbody id = "text"></tbody>
</body>
</html>



