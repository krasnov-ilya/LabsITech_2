<?php 
include("dbConnect.php");

$string1 = $_GET['yearStart'];
$string2 = $_GET['yearEnd'];

$stmt = $db->prepare("SELECT * FROM `literature` WHERE `year` >= ? AND `year` <= ?;");
$stmt->execute(array($string1, $string2));

print "<table border='1'><tr><caption>Книги от $string1 до $string2<br></caption><th>Книги</th></tr>";
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    print "<tr><td>$row[name]</td></tr>";
}
?>
