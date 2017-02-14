package com.bd.pojo;

public class ResultMsg {
	public static final String MSG_FAIL = "操作失败";
	public static final String MSG_SUCC = "操作成功";
	private int msgCode ;//msgCode值为0，代表操作失败；非0代表操作成功
	private String msg;
	
	public ResultMsg(){}

	public ResultMsg(int msgCode, String msg) {
		super();
		this.msgCode = msgCode;
		this.msg = msg;
	}

	public int getMsgCode() {
		return msgCode;
	}

	public void setMsgCode(int msgCode) {
		this.msgCode = msgCode;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}