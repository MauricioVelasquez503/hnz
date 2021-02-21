
<?php
session_start();


require_once "../../config/database.php";

if (empty($_SESSION['username']) && empty($_SESSION['password'])){
    echo "<meta http-equiv='refresh' content='0; url=index.php?alert=1'>";
}

else {
    if ($_GET['act']=='insert') {
        if (isset($_POST['Guardar'])) {
     
            $codigo  = mysqli_real_escape_string($mysqli, trim($_POST['codigo']));
            $nombre  = mysqli_real_escape_string($mysqli, trim($_POST['nombre']));
            $unidad     = mysqli_real_escape_string($mysqli, trim($_POST['unidad']));
            $estado     = mysqli_real_escape_string($mysqli, trim($_POST['estado']));
            $created_user = $_SESSION['id_user'];

  
            $query = mysqli_query($mysqli, "INSERT INTO medicamentos(codigo,nombre,unidad,created_user,updated_user,id_est) 
                                            VALUES('$codigo','$nombre','$unidad','$created_user','$created_user','$estado')")
                                            or die('error '.mysqli_error($mysqli));    



            if ($query) {
         
                header("location: ../../main.php?module=medicinas&alert=1");
            }   
        }   
    }
    
    elseif ($_GET['act']=='update') {
        if (isset($_POST['Guardar'])) {
            if (isset($_POST['codigo'])) {
        
                $codigo  = mysqli_real_escape_string($mysqli, trim($_POST['codigo']));
                $nombre  = mysqli_real_escape_string($mysqli, trim($_POST['nombre']));
                $unidad     = mysqli_real_escape_string($mysqli, trim($_POST['unidad']));
                 $estado     = mysqli_real_escape_string($mysqli, trim($_POST['estado']));

                $updated_user = $_SESSION['id_user'];

             $query = mysqli_query($mysqli, "UPDATE medicamentos SET  nombre       = '$nombre',
                                                                    unidad          = '$unidad',
                                                                    updated_user    = '$updated_user',
                                                                    id_est   = '$estado'
                                                              WHERE codigo       = '$codigo'")
                                                or die('error: '.mysqli_error($mysqli));
    
                if ($query) {
                  
                    header("location: ../../main.php?module=medicinas&alert=2");
                }         
            }
        }
    }

    elseif ($_GET['act']=='delete') {
        if (isset($_GET['id'])) {
            $codigo = $_GET['id'];
      
            $query = mysqli_query($mysqli, "DELETE FROM medicamentos WHERE codigo='$codigo'")
                                            or die('error '.mysqli_error($mysqli));


            if ($query) {
     
                header("location: ../../main.php?module=medicinas&alert=3");
            }
        }
    }       
}       
?>