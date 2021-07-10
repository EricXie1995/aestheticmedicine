package com.iiiedu.beauty.forum.enums;

public enum notificationEnum {
    NOTIFICATION_QUESTION(1,"回復了問題"),
    NOTIFICATION_COMMENT(2,"回復了評論");
    private int type;
    private String name;
    notificationEnum(int type, String name){
        this.type=type;
        this.name=name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
