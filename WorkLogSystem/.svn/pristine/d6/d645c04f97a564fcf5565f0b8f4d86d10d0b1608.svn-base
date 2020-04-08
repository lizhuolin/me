package com.poobo.core.util;

import java.util.List;

public final class PageController<E> {
	private int totalPage;
	private int pageNow;
	private int pageInt;
	private int pageSize;

	private List<E> dataList;

	public PageController(int toltalSize, int pageSize, int pageInt) {
		if (pageSize < 1)// 10
			pageSize = 1;
		this.pageSize = pageSize;// 10

		totalPage = toltalSize / pageSize;// 12/10=1
		if (toltalSize % pageSize > 0) {// 12%10=2
			totalPage++;// 2
		}

		if (pageInt < 1) {// 1
			pageInt = 1;// 1
		} else {
			if (pageInt > totalPage) {
				pageInt = totalPage;
			}

		}

		this.pageInt = pageInt;
		this.pageNow = pageInt;
	}

	public final int getTotalPage() {
		return totalPage;
	}

	public final void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public final int getPageInt() {
		return pageInt;
	}

	public final int prePage() {
		if (pageInt > 1) {
			return --pageInt;
		} else {
			return 1;
		}
	}

	public final int nextPage() {
		if (pageInt < totalPage) {
			return ++pageInt;
		} else {
			return totalPage;
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<E> getDataList() {
		return dataList;
	}

	public void setDataList(List<E> dataList) {
		this.dataList = dataList;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageNow() {
		return pageNow;
	}

}
