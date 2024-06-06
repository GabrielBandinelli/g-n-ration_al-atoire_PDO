// connection à la base de données via la récupération des données de php_connect.php
<?php
    require('php_connect.php');
?>  

<?php 
    echo '<a href = "../index.php"> Accueil </a><br>';
    echo '<a href = "ecole_sport.php"> Quels sports quelles écoles ? </a><br>';
    echo '<a href = "eleve_sport.php">Elèves sports</a><br>';
?>


<?php 
    $req = $db ->prepare("SELECT ecole_eleve.ecole_id as eeei, eleve.eleve_prenom as eep, eleve.eleve_nom as een 
    FROM ecole_eleve 
    LEFT OUTER JOIN eleve ON ecole_eleve.eleve_id = eleve.eleve_id ORDER BY ecole_eleve.ecole_id ");
   
    $req->execute();


    while($donnees = $req->fetch()) {
        echo $donnees['eeei'].' '.$donnees['eep'].' '.$donnees['een'] . '<br>';
    }

    $req -> closeCursor();

    echo "<br>";

    $req2 = $db ->query("SELECT COUNT(*) as eleve_id FROM ecole_eleve WHERE ecole_id = 1");
    $donnees2 = $req2->fetch();
    $req2-> closeCursor();
    echo  "Ecole 1".' '.$donnees2['eleve_id']. "<br>";

    
    $req3 = $db ->query("SELECT COUNT(*) as eleve_id FROM ecole_eleve WHERE ecole_id = 2");
    $donnees3 = $req3->fetch();
    $req3-> closeCursor();
    echo "Ecole 2".' '.$donnees3['eleve_id']. "<br>";

    
    $req4 = $db ->query("SELECT COUNT(*) as eleve_id FROM ecole_eleve WHERE ecole_id = 3");
    $donnees4 = $req4->fetch();
    $req4-> closeCursor();
    echo "Ecole 3".' '.$donnees4['eleve_id']. "<br>";



?>    


