package com.iiiedu.beauty.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Classification {

	@Id
    @GeneratedValue
    private Integer id;
	/**
     * 分類ID
     */
    private Integer parentId;
    /**
     * 分類名稱
     */
    private String cname;
    /**
     * 類型 First Second
     */
    private Integer type;
    
    public Classification(Integer id, Integer parentId, String cname, Integer type) {
        this.id = id;
        this.parentId = parentId;
        this.cname = cname;
        this.type = type;
    }

    public Classification() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
    
    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Classification other = (Classification) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getParentId() == null ? other.getParentId() == null : this.getParentId().equals(other.getParentId()))
            && (this.getCname() == null ? other.getCname() == null : this.getCname().equals(other.getCname()))
            && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getParentId() == null) ? 0 : getParentId().hashCode());
        result = prime * result + ((getCname() == null) ? 0 : getCname().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        return result;
    }
    
    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        
//        builder.append(getClass().getSimpleName());
//        builder.append(" [");
//        builder.append("Hash = ").append(hashCode());
//        builder.append(", id=").append(id);
//        builder.append(", parentId=").append(parentId);
//        builder.append(", cname=").append(cname);
//        builder.append(", type=").append(type);
//        builder.append(", serialVersionUID=").append(serialVersionUID);
//        builder.append("]");
        
        builder.append("Classification [id=");
        builder.append(id);
        builder.append(", parentId=");
        builder.append(parentId);
        builder.append(", cname=");
        builder.append(cname);
        builder.append(", type=");
        builder.append(type);
        builder.append("]");
        
        return builder.toString();
    }
	
}
