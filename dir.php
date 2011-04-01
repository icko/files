<?php
ini_set("display_errors","On");
require_once('./class.upload.php');
$file = array();

if(isset($_GET['create'])){
    $dir = $_GET['create'];
    $file = Files::createDir($dir) ? array() : array("error"=>"Erro ao criar diretório.");
} else if(isset($_GET['del'])){
    $dir = $_GET['del'];
    $file = Files::removeDir($dir) ? array() : array("error"=>"Erro ao excluir diretório.");
} else {
    $file = array("error"=>"Nenhuma ação para executar.");
}

echo json_encode($file);
?>