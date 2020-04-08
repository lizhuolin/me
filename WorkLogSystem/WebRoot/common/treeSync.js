var url =  $("#treeUrl").attr("value");

var setting = {
		view: {
			selectedMulti: false
		},
		async: {
			enable: true,
			url: url,
			autoParam: ["id=areaId", "name=localName"],
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
		$("#areaId").attr("value", treeNode.id);
		$("#treeCurser").attr("value", treeNode.name);
		/*var fullName = getFullName(treeNode.getPath());*/
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
		$.fn.zTree.init($("#treeDiv"), setting);
	});
	/*$(function($){
		$("#treeCurser").click(function(){
			$.fn.zTree.init($("#treeDiv"), setting);
//			$("#treeDiv").show();
		});
	});*/
