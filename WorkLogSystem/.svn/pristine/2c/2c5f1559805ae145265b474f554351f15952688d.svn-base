var url =  $("#warehouse_treeUrl").attr("value");

var setting = {
		view: {
			selectedMulti: false
		},
		async: {
			enable: true,
			url: url,
			autoParam: ["id=warehouseId"],
			dataFilter: filter
		},
		callback: {
			onClick: onClick
		}
		
	}

	function filter(treeId, parentNode, childNodes){
		if(childNodes.length == 0 && parentNode != null){
			parentNode.isParent = false;
		}
		if(!childNodes) return null;
		for(var i = 0; i < childNodes.length; i++){
			childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
		}
		return childNodes;
	}
	
	function onClick(event,treeId, treeNode){
		$("#warehouseId").attr("value", treeNode.id);
		$("#warehouseName").attr("value", treeNode.name);
		$.ajax({
			type: "POST",
			dataType: "html",
			url: "do2_system_expressfee_ExpressFeeAction_getWarehouseArea",
			data: {"warehouse.id": treeNode.id},
			success: function(data) {
				$("#areaFilter").html(data);
				/*if($("#areaFilter").html() !== null){
					$("#areaFilter").append(data);
				}else{
					
				}*/
			}
		});
		/*$("#fullAreaPath").attr("value", getFullName(treeNode.getPath()));*/
	}
	
	function getFullName(obj){
		var fullNames = new Array();
		if(obj !== null){
			for(var i = 0; i < obj.length; i++){
				fullNames.push(obj[i].id);
			}
		}
		return fullNames;
	}
	
	$(document).ready(function(){
		$.fn.zTree.init($("#warehouse_tree"), setting);
		$("#warehouse_tree_div").show();
	});
	/*$(function($){
		$("#treeCurser").click(function(){
			$.fn.zTree.init($("#treeDiv"), setting);
//			$("#treeDiv").show();
		});
	});*/
