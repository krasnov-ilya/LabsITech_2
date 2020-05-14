<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Films</title>
</head>
<body>
<?php
include("../php/dbConnect.php");

$authorSql = 'SELECT `name` FROM `authors`';

echo '<form method="get" action= "../php/getBooksByAuthor.php">';

echo "<select name='name'><option> Выбрать фильмы по автору </option>";

foreach($db->query($authorSql) as $row) {
    echo "<option value='" . $row['name'] . "'>" . $row['name'] . "</option>";
}

echo "</select>";
echo '<input type="submit" value="ОК"><br>'
?>
</body>
</html>



