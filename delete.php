<?php
ini_set("display_errors","On");

if(!isset($_GET['file'])){
    echo json_encode(array("error"=>"Indique um arquivo para excluir!"));
    exit();
}

require_once('./class.upload.php');

$f = $_GET['file'];

$file = Files::delete($f) ? array() : array("error"=>"Erro ao excluir arquivo.");

echo json_encode($file);
?>