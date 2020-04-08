package com.poobo.demo.action;

import javax.annotation.Resource;

import com.poobo.core.action.BaseAction;
import com.poobo.core.entity.Demo;
import com.poobo.core.util.ResultData;
import com.poobo.demo.service.IDemoService;

public class DemoAction extends BaseAction {
	@Resource
	private IDemoService demoService;
	private Demo demo;
	private ResultData resultData;



	// 保存编辑
	public String edit() {
		resultData = new ResultData();
		if (demo != null && demo.getId() == null) {
			demoService.save(demo);
		}else if(demo != null && demo.getId() != null){
			demoService.update(demo);
		}
		resultData.setResultFlag(true);

		return SUCCESS;
	}

	// 新增
	public String add() {
		resultData = new ResultData();
		if (demo != null) {  
			demoService.save(demo);
		}
		resultData.setResultFlag(true);

		return SUCCESS;
	}

	// 删除
	public String delete() {
		if (demo != null && demo.getId() != null) {
			demoService.delete(demo.getId());
		}
		return "list";
	}



	public String demoEdit() {
		//demo = demoService.findObjectById(demo.getId());
		return "demoEdit";
	}
	
	public String demoList() {
		pageList = demoService.getPageList(demo, pageNow, pageSize);
		return "demoList";
	}



	public Demo getDemo() {
		return demo;
	}

	public void setDemo(Demo demo) {
		this.demo = demo;
	}

	public ResultData getResultData() {
		return resultData;
	}

	public void setResultData(ResultData resultData) {
		this.resultData = resultData;
	}

}
