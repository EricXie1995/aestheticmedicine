package com.iiiedu.beauty.model;

import javax.persistence.Entity;

//回覆問題後的通知，構思中
//@Entity
public class Notification {
	private int id;
	private int notifier;
	private int receiver;
	private int outerid;
	private int type;
	private long createtime;
	private int status;
}
