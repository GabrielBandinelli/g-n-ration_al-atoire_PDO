<?php
    require('php_connect.php');
?>  
 // création d'une fonction pour répartir de manière aléatoire le nombre de sport pour chaque élève, ainsi que le sport pratiquer
<?php

    if(array_key_exists('button', $_POST)) {
        rand_sp();
    }

    function rand_sp() {

        $db = new PDO('mysql:host=localhost;dbname=bd_php_avance','root','',[PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION],);

        $erase_sp = $db ->prepare( "DELETE FROM eleve_sport");
        $erase_sp->execute();

        $sql = $db->prepare("SELECT * FROM eleve");
        $sql->execute();
        $res_eleve = $sql -> fetchAll ();
    
        $sql2 = $db->prepare("SELECT * FROM sport");
        $sql2->execute();
        $res_sport = $sql2 -> fetchAll ();
    
        foreach ($res_eleve as $eleve) {
        
            $nbrSport = rand(0, 3); 

            if ($nbrSport != 0) {
                shuffle($res_sport);
                $rand_sp = array_slice($res_sport, 0, $nbrSport);
                $eleve_id = $eleve['eleve_id'];
                foreach ($rand_sp as $sport) {

                    $req = $db -> prepare("INSERT INTO eleve_sport SET eleve_id = :eleve_id, sport_id = :sport_id");  
                    $sport_id = $sport['sport_id'];
                    $req->execute(array(':eleve_id' => $eleve_id , ':sport_id' => $sport_id ));
                }
            }    
        
        }
    }
    
?>

<!DOCTYPE html>
<html>
    <head>
        <title>
            eleve_sport
        </title>
    </head>
    <body>

        
        <?php 

            echo '<a href = "../index.php"> Accueil </a><br>';
            echo '<a href = "eleve.php"> Nos élèves </a><br>'; 
        ?>

        <form method = "post">
            <input type="submit" name="button" class="button" value="Button" />
        </form>

        <?php
            $nbes = $db ->query("SELECT COUNT(DISTINCT eleve_sport.eleve_id) as eleve_id FROM eleve_sport JOIN eleve ON eleve_sport.eleve_id = eleve.eleve_id WHERE ecole_id = 1 ");
            $donnees = $nbes->fetch();
            $nbes-> closeCursor();
            echo "Il y a dans l'école 1".' '.$donnees['eleve_id'].' '."élèves pratiquant au moins un sport". "<br>";
    
            $nbes = $db ->query("SELECT COUNT(DISTINCT eleve_sport.eleve_id) as eleve_id FROM eleve_sport JOIN eleve ON eleve_sport.eleve_id = eleve.eleve_id WHERE ecole_id = 2 ");
            $donnees = $nbes->fetch();
            $nbes-> closeCursor();
            echo "Il y a dans l'école 2".' '.$donnees['eleve_id'].' '."élèves pratiquant au moins un sport". "<br>";
    
            $nbes = $db ->query("SELECT COUNT(DISTINCT eleve_sport.eleve_id) as eleve_id FROM eleve_sport JOIN eleve ON eleve_sport.eleve_id = eleve.eleve_id WHERE ecole_id = 3 ");
            $donnees = $nbes->fetch();
            $nbes-> closeCursor();
            echo "Il y a dans l'école 3".' '.$donnees['eleve_id'].' '."élèves pratiquant au moins un sport". "<br>";
            
        ?>

        <?php

            $nbs = $db ->query("SELECT COUNT(DISTINCT eleve_sport.sport_id) as sport_id FROM eleve_sport JOIN eleve ON eleve_sport.eleve_id = eleve.eleve_id
            JOIN sport ON eleve_sport.sport_id = sport.sport_id WHERE ecole_id = 1 ");
            $res = $nbs->fetch();
            $nbs-> closeCursor();
            echo  "Il y a dans l'école 1".' '.$res['sport_id'].' '."sports pratiqués". "<br>";

            $nbs = $db ->query("SELECT COUNT(DISTINCT eleve_sport.sport_id) as sport_id FROM eleve_sport JOIN eleve ON eleve_sport.eleve_id = eleve.eleve_id
            JOIN sport ON eleve_sport.sport_id = sport.sport_id WHERE ecole_id = 2 ");
            $res = $nbs->fetch();
            $nbs-> closeCursor();
            echo "Il y a dans l'école 2".' '.$res['sport_id'].' '."sports pratiqués". "<br>";

            $nbs = $db ->query("SELECT COUNT(DISTINCT eleve_sport.sport_id) as sport_id FROM eleve_sport JOIN eleve ON eleve_sport.eleve_id = eleve.eleve_id
            JOIN sport ON eleve_sport.sport_id = sport.sport_id WHERE ecole_id = 3 ");
            $res = $nbs->fetch();
            $nbs-> closeCursor();
            echo "Il y a dans l'école 3".' '.$res['sport_id'].' '."sports pratiqués". "<br>";

        ?>

        <?php

            $nmsp = $db -> prepare("SELECT S.ecole_id, S.eleve_id, ecole_nom, sport_nom AS liste_sports, COUNT(DISTINCT S.eleve_id) AS nb_eleves FROM eleve AS S INNER JOIN eleve_sport AS SS
            ON S.eleve_id = SS.eleve_id INNER JOIN sport AS SP ON SS.sport_id = SP.sport_id INNER JOIN ecole ON S.ecole_id = ecole.ecole_id
            GROUP BY S.ecole_id, sport_nom ORDER BY S.ecole_id, nb_eleves ASC");
            $nmsp->execute();
            while($result =  $nmsp->fetch(PDO::FETCH_ASSOC)) {
        
                echo "Il y a dans ".' '.$result['ecole_nom'].' '.$result['nb_eleves'].' '."pratiquants de ".' '.$result['liste_sports'].' '."<br>";   
            
            }
        ?>
    
    </body>
</html>  
