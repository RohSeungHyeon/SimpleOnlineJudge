package com.spring.board;

import org.json.simple.JSONAware;

public class QuestionDto implements JSONAware {

	private String m_id;
	private int prob_num;
	private String qst_date;
	private String qst_body;
	private String qst_title;

	public QuestionDto() {
	}

	public QuestionDto(String m_id, int prob_num, String qst_date, String qst_body, String qst_title) {
		this.m_id = m_id;
		this.prob_num = prob_num;
		this.qst_date = qst_date;
		this.qst_body = qst_body;
		this.qst_title = qst_title;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getProb_num() {
		return prob_num;
	}

	public void setProb_num(int prob_num) {
		this.prob_num = prob_num;
	}

	public String getQst_date() {
		return qst_date;
	}

	public void setQst_date(String qst_date) {
		this.qst_date = qst_date;
	}

	public String getQst_body() {
		return qst_body;
	}

	public void setQst_body(String qst_body) {
		this.qst_body = qst_body;
	}

	public String getQst_title() {
		return qst_title;
	}

	public void setQst_title(String qst_title) {
		this.qst_title = qst_title;
	}

	@Override
	public String toJSONString() {
		return "{'m_id':'" + m_id + "', 'prob_num':'" + prob_num + "', 'qst_date':'" + qst_date + "', 'qst_body':'"
				+ qst_body + "', 'qst_title':'" + qst_title + "'}";
	}

}
