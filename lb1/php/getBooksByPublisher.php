<?php 
include("dbConnect.php");

$publisher = $_GET['publisher'];

$stmt = $db->prepare("SELECT `name` FROM `literature` WHERE `publisher`= ?");
$stmt->execute(array($publisher));

print "<table border='1'><tr><caption> Литература издательства $publisher <br></caption><th> Литература </th></tr>";
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    print "<tr><td>$row[name]</td></tr>";
}
?>