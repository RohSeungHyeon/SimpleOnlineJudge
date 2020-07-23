package com.spring.board;

import org.json.simple.JSONAware;

public class QuestionCommentDto implements JSONAware {

	private String q_id;
	private String qc_id;
	private int prob_num;
	private String qst_date;
	private String qc_date;
	private String qc_body;

	public QuestionCommentDto() {
	}

	public QuestionCommentDto(String q_id, String qc_id, int prob_num, String qst_date, String qc_date,
			String qc_body) {
		super();
		this.q_id = q_id;
		this.qc_id = qc_id;
		this.prob_num = prob_num;
		this.qst_date = qst_date;
		this.qc_date = qc_date;
		this.qc_body = qc_body;
	}

	public String getQ_id() {
		return q_id;
	}

	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}

	public String getQc_id() {
		return qc_id;
	}

	public void setQc_id(String qc_id) {
		this.qc_id = qc_id;
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

	public String getQc_date() {
		return qc_date;
	}

	public void setQc_date(String qc_date) {
		this.qc_date = qc_date;
	}

	public String getQc_body() {
		return qc_body;
	}

	public void setQc_body(String qc_body) {
		this.qc_body = qc_body;
	}

	@Override
	public String toJSONString() {
		return "{'q_id' : '" + q_id + "', 'qc_id':'" + qc_id + "', 'prob_num':'" + prob_num + "', 'qst_date':'"
				+ qst_date + "', 'qc_date':'" + qc_date + "', 'qc_body':'" + qc_body + "'}";
	}

}
