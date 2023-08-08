package com.varchar.biz.common;

public class AlertVO {
	private String title;
	private String text;
	private String nText;
	private String icon;
	private String path;

	public AlertVO(String title, String text, String nText, String icon, String path) {
		super();
		this.title = title;
		this.text = text;
		this.nText = nText;
		this.icon = icon;
		this.path = path;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getnText() {
		return nText;
	}

	public void setnText(String nText) {
		this.nText = nText;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "AlertVO [title=" + title + ", text=" + text + ", nText=" + nText + ", icon=" + icon + ", path=" + path
				+ "]";
	}

}
