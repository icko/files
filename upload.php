<?php
ini_set("display_errors","On");
require_once('./class.upload.php');

$upload_dir = isset($_GET['dir']) ? $_GET['dir'] : "./upload";
$file = $_FILES['file'];

$up = new Upload($file);
if(!$up->upload($upload_dir)){
    $file['error'] = $up->getErrors();
}

echo json_encode($file);
//echo '{"name":"'.$file['name'].'","type":"'.$file['type'].'","size":"'.$file['size'].'"}';
?>