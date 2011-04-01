/*global $ */
$(document).ready(function () {
    $('#file_upload').fileUploadUI({
        uploadTable: $('#files'),
        downloadTable: $('#files'),
        buildUploadRow: function (files, index) {
            return $('<tr><td class="filename">' + files[index].name + '<\/td>' +
					'<td class="file_upload_progress"><div><\/div><\/td>' +
                    '<td class="file_upload_cancel">' +
                    '<button class="ui-state-default ui-corner-all" title="Cancel">' +
                    '<span class="ui-icon ui-icon-cancel">Cancel<\/span>' +
                    '<\/button>' +
					'<\/td>' +
                    '<td class="filesize">'+Files.formatBytes(files[index].size)+'</td>' +
					'<td class="file_delete">' +
					'<button title="Delete" class="ui-state-default ui-corner-all file-delete">' +
					'<span class="ui-icon ui-icon-trash"><\/span>' +
					'<\/button>' +
					'<\/td>' +
					'<\/tr>');
        },
        buildDownloadRow: function (file) {
            //return $('<tr><td>' + file.name + '<\/td><\/tr>');
            if(file.error){
				return $('<tr><td><span>' + file.error + '<\/span><\/td><\/tr>');
			} else {
				return $('<tr><td class="filename"><a href=\'' + DIR+"/"+file.name + '\'>' + file.name + '<\/a><\/td>'+
						 '<td class="file_upload_progress">&nbsp;<\/td>' +
                         '<td class="file_upload_cancel">&nbsp;<\/td>' +
                         '<td class="filesize">' + Files.formatBytes(file.size) + '<\/span><\/td>'+
						 '<td class="file_delete">' +
						 '<button title="Delete" class="ui-state-default ui-corner-all file-delete">' +
						 '<span class="ui-icon ui-icon-trash"><\/span>' +
						 '<\/button>' +
						 '<\/td>' +	
						 '<\/tr>');
			}
        }
    });
    
    $("button.file-delete").live('click',function(){
        var row = $(this).parents("tr"),
            sz  = $.trim(row.find(".filesize").html());
        if(sz == DIR_LABEL){
            Files.del(row,true);
        } else {
            Files.del(row);
        }
    });
    
    $("#files tr").mouseover(function(){
        $(this).addClass("hover");
    }).mouseout(function(){
        $(this).removeClass("hover");
    });
    
    $(".create-dir-link").click(function(){
        //$(".create-dir").fadeToggle();
		if($(".create-dir").is(':hidden')){
			$(".create-dir").fadeIn("slow");
			$("input[name='dir-name']").focus();
		} else {
			$(".create-dir").fadeOut("slow");		}
    });
    
	$(".create-dir").submit(function(){ return false; });
    $(".create-dir-bt").click(function(e){
        e.preventDefault();
		
		var name     = $("input[name='dir-name']"),
            path     = $("input[name='dir-path']"),
            form     = $(this).parents("form"),
            status   = form.find(".create-dir-status"),
            url      = form.attr("action")+"?create="+path.val()+"/"+name.val()
            dir_name = name.val();
        
        if($.trim(name.val()) == ""){
            alert("Digite um nome para o diretório.");
            name.focus();
            return false;
        }
        
        status.html("Aguarde...");
        
        $.post(url,function(data){
            if(data.error){
                alert(data.error);
                return;
            }
            
            $('<tr><td class="filename"><a href=\'?dir='+DIR_CURRENT+'/'+dir_name+'\'>'+dir_name+'<\/a><\/td>'+
                '<td class="file_upload_progress">&nbsp;<\/td>' +
                '<td class="file_upload_cancel">&nbsp;<\/td>' +
                '<td class="filesize">' + DIR_LABEL + '<\/span><\/td>'+
                '<td class="file_delete">' +
                '<button title="Delete" class="ui-state-default ui-corner-all file-delete">' +
                '<span class="ui-icon ui-icon-trash"><\/span>' +
                '<\/button>' +
                '<\/td>' +	
                '<\/tr>').appendTo("#files");
        });
        
        status.html("");
        name.val("");
        return false;
    });
	
	if(document.body.clientWidth < 500){
		$(".top h1 span").hide();
	}
});

Files = {
    formatBytes: function(size){
        var units = new Array(' B', ' KB', ' MB', ' GB', ' TB');
        for (var i = 0; size >= 1024 && i < 4; i++) size /= 1024;
        return Math.round(size)+units[i];
    },
    
    del: function(row,dir){
        dir = dir || false;
        var url = dir ?
                 "dir.php?del="+$("input[name='dir-path']").val()+"/"+row.find(".filename a").html() :
                 "delete.php?file="+row.find(".filename a").attr("href"),
            type = dir ? "diretório" : "arquivo",
            after = dir ? "e todo o seu conteúdo" : "";
        
        if(confirm("Deseja deletar o "+type+": \""+row.find(".filename a").html()+"\" "+after+"?")){
            $.getJSON(url,function(data){
                if(data.error){
                    alert(data.error);
                } else {
                    row.fadeOut("slow");
                }
            });
        }
    }
}
