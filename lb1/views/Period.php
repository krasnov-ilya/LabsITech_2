<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Books</title>
</head>
<body>
<?php

// устанавливаем первый и последний год диапазона
$yearArray = range(1800, 2021);
echo '<form method="get" action= "../php/getBooksByYears.php">';

echo "<select name= 'yearStart'><option> Выберите год начала выборки</option>";

  foreach ($yearArray as $year) {
    echo '<option '.$year.' value="'.$year.'">'.$year.'</option>';
  }
    echo "</select>";

echo "<select name='yearEnd'><option> Выберите год конца выборки</option>";

    foreach ($yearArray as $year) {
        echo '<option '.$year.' value="'.$year.'">'.$year.'</option>';
    }
    echo "</select>";
echo '<input type="submit" value="ОК"><br>'
?>
</body>
</html>



