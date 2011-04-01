<?
ini_set("display_errors","On");
require_once("./class.upload.php");

define('DS',DIRECTORY_SEPARATOR);

$upload_dir = ".".DS."upload";
$upload_dir.= isset($_GET['dir']) ? DS.$_GET['dir'] : "";
$files = new Files($upload_dir);
?>

<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Filés</title>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/themes/base/jquery-ui.css" id="theme" />
<link rel="stylesheet" href="css/jquery.fileupload-ui.css" />
<link rel="stylesheet" href="css/style.css" />
<script>
var DIR = "<?=$upload_dir?>",
	DIR_LABEL = "<?=$files->dir_label?>",
	DIR_CURRENT = "<?=@$_GET['dir']?>";
</script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.fileupload.js"></script>
<script src="js/jquery.fileupload-ui.js"></script>
<script src="js/upload.js"></script>
</head>
<body>

<form id="file_upload" action="upload.php?dir=<?=$upload_dir?>" method="POST" enctype="multipart/form-data">
	<input type="file" name="file" multiple>
	<button>Enviar arquivos</button>
	<div>Enviar arquivos</div>
</form>
<div class="top">
	<h1>
		<a href="./">Fil&eacute;s</a>
		<span>
			Espaço utilizado: <?=Files::getPercentUsedSpace()?>
			<br/>
			Espaço restante: <?=Files::getUsedSpace()?> de <?=Files::getTotalSpace()?>
		</span>
	</h1>
</div>

<div class="create-dir-container">
	<a href="javascript:void();" class="create-dir-link">+ Criar diretório</a> 
	<form action="dir.php" class="create-dir" method="post">
		<input type="text" name="dir-name" class="txt" /> 
		<input type="hidden" name="dir-path" value="<?=$upload_dir?>" /> 
		<input type="submit" class="ui-state-default ui-corner-all create-dir-bt" value="Enviar" />
		<span class="create-dir-status"></span>
	</form>
</div>

<table id="files" width="100%" cellspacing="0">
	<?
	if($fs = $files->getAll()){
		foreach($fs as $f) { ?>
			<tr>
				<td class="filename">
					<a href='<?=$f->path?>'><?=$f->name?></a>
				</td>
				<td class="file_upload_progress">&nbsp;</td>
                <td class="file_upload_cancel">&nbsp;</td>
				<td class="filesize">
					<?=$f->size?>
				</td>
				<td class="file_delete">
					<? if(strlen(trim($f->size)) > 0){ ?>
					<button title="Delete" class="ui-state-default ui-corner-all file-delete">
						<span class="ui-icon ui-icon-trash"></span>
					</button>
					<? } else { ?>
					&nbsp;
					<? } ?>
				</td>
			</tr>
		<? }
	} else { ?>
		<tr><td><?=$files->getErrors()?></td></tr>
	<? } ?>
	</ul>
</table>

</body> 
</html>
