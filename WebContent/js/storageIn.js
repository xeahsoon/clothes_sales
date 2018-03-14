$(document).ready(function(){

    $('#good_select').multiselect({
    	maxHeight: 200,
    	enableFiltering: true,
    	includeFilterClearBtn: false,
    	templates: {
    		filter: '<li class="multiselect-item filter"><input class="form-control multiselect-search" style="height: 26px; padding: 0px 20px 0px 20px;" type="text"></li>'
    	}
	});
    
    $('.select').multiselect({
    	maxHeight: 200,
    	buttonWidth: 75
	});
    
    $("#inStorageTable").DataTable({
		"language": {
			url: "assets/dataTables/plug-in/Chinese.json"
		},
		"dom": "<'row'<'col-sm-12'>tr><'row'<'col-sm-4'i><'col-sm-8'p>>",
        "order": [[ 0, "desc" ]],
        //设置操作栏 排序为 false
        "columnDefs": [
            { "orderable": false, "targets": 6 }
          ]
	});
    
    var config = null;
	$.ajax({
		type: "GET",
		url: "assets/dataTables/plug-in/Chinese.json",
		async: false,
		dataType: "json",
		success: function(data) {
			data.sInfo = "_START_ 到 _END_ / 共 _TOTAL_ 项"
			config = data;
		},
		error: function(jqXHR) {
			toastr.error("获取Chinese.json文件失败: " + jqXHR.status);
		}
	});
    
    $(".test-panel-table").DataTable({
		"language": config,
		"lengthMenu": [[8, 18, 28, -1], [8, 18, 28, "全部"]],
		"dom": "<'row'<'col-sm-6'i><'col-sm-6'f>><'row'<'col-sm-12'>tr><'row'<'col-sm-12'p>>",
        "order": [[ 0, "desc" ]]
	});
    
    // 创建panel快速搜索，搜索内容为panel-heading
	$('input#panel-search').quicksearch('.panel-item',{
		selector: ".panel-heading"
	});
    
    $(".panel-list").on("click", ".panel-heading", function() {
    	$(this).next().slideToggle();
    });
});