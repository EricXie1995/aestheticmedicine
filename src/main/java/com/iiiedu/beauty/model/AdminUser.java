package com.iiiedu.beauty.model;


import javax.persistence.*;



@Entity
public class AdminUser  {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String username;
    private String password;

    public AdminUser(Integer id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public AdminUser() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username ;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password ;
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
        AdminUser other = (AdminUser) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getUsername() == null ? other.getUsername() == null : this.getUsername().equals(other.getUsername()))
                && (this.getPassword() == null ? other.getPassword() == null : this.getPassword().equals(other.getPassword()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getUsername() == null) ? 0 : getUsername().hashCode());
        result = prime * result + ((getPassword() == null) ? 0 : getPassword().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        
//        builder.append(getClass().getSimpleName());
//        builder.append(" [");
//        builder.append("Hash = ").append(hashCode());
//        builder.append(", id=").append(id);
//        builder.append(", username=").append(username);
//        builder.append(", password=").append(password);
//        builder.append(", serialVersionUID=").append(serialVersionUID);
//        builder.append("]");
        
        builder.append("AdminUser [id=");
        builder.append(id);
        builder.append(", usernaem=");
        builder.append(username);
        builder.append(", password=");
        builder.append(password);
        builder.append("]");
        
        return builder.toString();
    }
}
