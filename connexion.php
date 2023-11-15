<?php
$servername = "localhost";  // Remplacez par votre nom de serveur MySQL
$username = "root";  // Remplacez par votre nom d'utilisateur MySQL
$password = "";  // Remplacez par votre mot de passe MySQL
$dbname = "proj";  // Remplacez par le nom de votre base de données

// Créer la connexion
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("La connexion a échoué : " . $conn->connect_error);
}
?>
