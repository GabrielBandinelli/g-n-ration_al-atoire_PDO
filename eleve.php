<?php
    require('php_connect.php');
?>  

//répartition de manière aléatoire des élèves dans les écoles 1 à 3
<?php

    $sql = $db-> prepare ("SELECT * VALUES (:eleve_id, :ecole_id,) FROM eleve");
    $sql->bindParam(':eleve_id', $eleve_id);
    $sql->bindParam(':ecole_id', $ecole_id);
    

    $eleve_id = 0;
    if ($eleve_id != 0) {
        do {
            $req = $db -> prepare("INSERT INTO eleve (eleve_id, ecole_id)
            VALUES (:eleve_id, :eco)");
            $req->bindParam(':eleve_id', $eleve_id);
            $req->bindParam(':eco', $eco);
            $eleve_id++;
            $eco = rand(1, 3);
            $req->execute();
        }   
        while($eleve_id <= 30); 
    } 
            
?>


<!DOCTYPE html>
<html>
    <head>
        <title>
            eleve
        </title>
    </head>
    <body>

        <?php 

            echo '<a href = "../index.php"> Accueil </a><br>';
            echo '<a href = "eleve_sport.php">Elèves sports</a><br>';
        ?>

//Afficher le nombre d'élèves par école
        <?php 

            $req = $db ->query("SELECT COUNT(*) as eleve_id FROM eleve WHERE ecole_id = 1");
            $donnees = $req->fetch();
            $req-> closeCursor();
            echo  " Il y a dans l'école 1".' '.$donnees['eleve_id'].' '."élèves".  "<br>";
    
            $req = $db ->query("SELECT COUNT(*) as eleve_id FROM eleve WHERE ecole_id = 2");
            $donnees = $req->fetch();
            $req-> closeCursor();
            echo  " Il y a dans l'école 2".' '.$donnees['eleve_id'].' '."élèves".  "<br>";
    
            $req = $db ->query("SELECT COUNT(*) as eleve_id FROM eleve WHERE ecole_id = 3");
            $donnees = $req->fetch();
            $req-> closeCursor();
            echo  " Il y a dans l'école 3".' '.$donnees['eleve_id'].' '."élèves".  "<br>";

        ?>
    </body>
</html>            
