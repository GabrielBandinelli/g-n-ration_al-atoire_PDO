//création de la connection à la base de données
<?php
    $db = new PDO('mysql:host=localhost;dbname=db_php_avance',
        'root',
        '',
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION],
    );
?>  
