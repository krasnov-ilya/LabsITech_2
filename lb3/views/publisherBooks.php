<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Books</title>
  <script>
const ajax = new XMLHttpRequest();

function get(){
    let publisher = document.getElementById("publisher").value;
    ajax.onreadystatechange = update;
    ajax.open("GET", "../php/getBooksByPublisher.php?publisher="+ publisher);
    
    ajax.send(null);
}

  function update(){
    if(ajax.readyState === 4){
      if(ajax.status === 200){
        var text = document.getElementById('text');
        var res = ajax.responseText;
        var resHtml ="";
        res = JSON.parse(res);

        res.forEach(el =>{
         resHtml += "<tr><td style = 'border: 1px solid'>" + el +"</td></tr>"
        });
        
      text.innerHTML = resHtml;
      }
    }
  }
</script>
</head>
<body>
<?php
include("../php/dbConnect.php");

$publisherSql = 'SELECT DISTINCT `publisher` FROM `literature`';

echo '<form method="get" action= "../php/getBooksByPublisher.php">';

echo "<select id ='publisher'><option> Выбрать литературу по издательству </option>";

foreach($db->query($publisherSql) as $row) {
    echo "<option value='" . $row['publisher'] . "'>" . $row['publisher'] . "</option>";
}

echo "</select>";
echo '<input type="button" onclick = "get()" value="ОК"><br>';
echo "</form>";
?>
<table style="border: 1px solid"><tr><th>Book</th></tr>
<tbody id = "text"></tbody>
</body>
</html>



