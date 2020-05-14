<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Films</title>
</head>
<body>
<?php
include("../php/dbConnect.php");

$publisherSql = 'SELECT DISTINCT `publisher` FROM `literature`';

echo '<form method="get" action= "../php/getBooksByPublisher.php">';

echo "<select name='publisher'><option> Выбрать литературу по издательству </option>";

foreach($db->query($publisherSql) as $row) {
    echo "<option value='" . $row['publisher'] . "'>" . $row['publisher'] . "</option>";
}

echo "</select>";
echo '<input type="submit" value="ОК"><br>'
?>
</body>
</html>



