<?
ini_set("safe_mode","Off");
//ini_set("open_basedir","Off");

/**
 * Classe padrão
 */
abstract class F
{
    private $file = null;
	private $dir;
	private $errors = array();
    
    function setDir($dir="./")
    {
        $this->dir = $dir;
    }
    
    function getDir()
    {
        return $this->dir;
    }
    
    function error($msg)
    {
		$this->errors[] = $msg;
	}
	
	function getErrors($imp="<br/>")
    {
		return implode($imp,$this->errors);
	}
}

/**
 * Classe Upload
 */
class Upload extends F
{
	function __construct($file=null)
    {
		if($file){
			$this->file = $file;
		}
	}
    
	function upload($dir="./")
    {
		$this->dir = $dir;
		if($this->file){
			$name = $this->renameIfExists();
			if(move_uploaded_file($this->file['tmp_name'],$this->dir."/".$name)){
				return true;
			} else {
				$this->error("Não foi possível fazer o upload do arquivo: \"".$this->file['name'].
                             "\" para o diretório: \"".$this->dir."\" ($this->dir."/".$name)");
				return false;
			}
		} else {
			$this->error("Não existe arquivo para upload");
			return false;
		}
	}
	
	function renameIfExists()
    {
		$name = $this->getFileName($this->file['name']);
		$ext = $this->getExtension($this->file['name']);
		$counter = 1;
		$filename = $this->file['name'];
		
		while(file_exists($this->dir."/".$filename)){
			$filename = $name."(".$counter.").".$ext;
			$counter++;
		}
		
		return $filename;
	}
	
	function getFileName($name)
    {
		$ext = $this->getExtension($name);
		return str_replace(".".$ext,"",$name);
	}
	
	function getExtension($name)
    {
		$arr = explode(".",$name);
		return end($arr);
	}
}

/**
 * Classe arquivos
 */
class Files extends F
{
    public $dir_label = "Diretório";
    
    function __construct($dir="./")
    {
		$this->setDir($dir);
	}
    
    function formatBytes($size)
    {
        $units = array(' B', ' KB', ' MB', ' GB', ' TB');
        for ($i = 0; $size >= 1024 && $i < 4; $i++) $size /= 1024;
        return round($size, 2).$units[$i];
    }
    
	function getUsedSpace()
	{
		return self::formatBytes(disk_free_space("./upload/"));
	}
    
	function getTotalSpace()
	{
		return self::formatBytes(disk_total_space("./upload/"));
	}
	
	function getPercentUsedSpace()
	{
		$total = disk_total_space("./upload/");
		$used = disk_free_space("./upload/");
		$pct = ($used / $total) * 100;
		return round($pct,2)."%";
	}
	
    function getAll()
    {
        if($dir=@opendir($this->getDir())){
            $hide = array(".", "..", ".htaccess", ".htuh", ".htpasswd");
            $dirs = $files = $dirs_files = array();
            
            //var_dump(scandir($this->getDir()));exit();
            while($ord = readdir($dir)) {
            //foreach(scandir($this->getDir()) as $ord){
                //var_dump($ord);echo "<br/>";
                if(!in_array($ord, $hide)){
                    if(is_dir($this->getDir().DS.$ord)){
                        $dirs[] = $this->addDir($ord);
                    } else {
                        $files[] = $this->addFile($ord);
                    }
                }
            }
            closedir($dir);
            asort($dirs);
            asort($files);
            
            if(isset($_GET['dir'])){
                $f = new stdClass();
                $f->name = "..";
                $f->path = $this->getBackDir();
                $f->size = $this->dir_label;
                array_unshift($dirs,$f);
                
                //$f = new stdClass();
                //$f->name = "/";
                //$f->path = "./";
                //$f->size = $this->dir_label;
                //array_unshift($dirs,$f);
            }
            
            foreach($dirs as $d){
                $dirs_files[] = $d;
            }
            foreach($files as $f){
                $dirs_files[] = $f;
            }
            
            return $dirs_files;
        }
        $this->error("Não foi possível abrir a pasta destino ({$this->getDir()})");
        return false;
    }
    
	function getBackDir()
	{
		$path = isset($_GET['dir']) ? explode("/",$_GET['dir']) : array();
		
		if(count($path) > 1){
			array_pop($path);
			return "?dir=".implode("/",$path);
		}
		
		return "?";
	}
	
    function addFile($ord)
    {
        $f = new stdClass();
        $f->name = $ord;
        $f->path = $this->getDir()."/".$ord;
        $f->size = $this->formatBytes(filesize($f->path));
        return $f;
    }
    
    function addDir($ord)
    {
        $f = new stdClass();
        $f->name = $ord;
        $f->path = "?dir=";
		$f->path.= isset($_GET['dir']) ? $_GET['dir']."/" : "";
        $f->path.= $ord;
        $f->size = $this->dir_label;
        return $f;
    }
    
    function delete($file)
    {
        if(is_file($file) && file_exists($file)){
            if(@unlink($file)){
                return true;
            }
        }
        return false;
    }
    
    function createDir($dir)
    {
        umask(0777);
        if(mkdir($dir,0755,true)){
            if(chmod($dir,0777)){
                return true;
            }
        }
        return false;
    }
    
    function removedir($dir) { 
        if (is_dir($dir)) { 
            $objects = scandir($dir); 
            foreach ($objects as $object) { 
                if ($object != "." && $object != "..") { 
                    if (filetype($dir."/".$object) == "dir") self::removedir($dir."/".$object); else unlink($dir."/".$object); 
                } 
            } 
            reset($objects); 
            rmdir($dir);
            return true;
        }
        return false;
    } 
}
?>