<?php 
include("dbConnect.php");

$name = $_GET['name'];

$stmt = $db->prepare("SELECT * FROM literature WHERE ID_Book IN (SELECT FID_Book FROM BOOK_AUTHORS WHERE FID_AUTHORS = (SELECT ID_Authors FROM authors Where name = ?));");
$stmt->execute(array($name));

print "<table border='1'><tr><caption> Книги автора $name <br></caption><th> Книги </th></tr>";
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    print "<tr><td>$row[name]</td></tr>";
}
?>