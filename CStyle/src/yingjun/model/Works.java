package yingjun.model;


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="t_works")
@DynamicUpdate
@DynamicInsert
public class Works  implements java.io.Serializable {

	 private static final long serialVersionUID = 1L;
	 private String id;
     private Type type;
     private User user;
     private String title;
     private String content;
     private Date ctime;
     private Date mtime;
     private long viewnums;
     
     
 

    public Works() {
    }




    @GenericGenerator(name="generator", strategy="uuid")
    @Id 
    @GeneratedValue(generator="generator")
    @Column(name="id",  nullable=false, length=36)
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="typeid", nullable=false)
    public Type getType() {
        return this.type;
    }
    
    public void setType(Type type) {
        this.type = type;
    }
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="userid", nullable=false)
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    @Column(name="title", nullable=false, length=100)
    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    @Column(name="content", nullable=false, length=65535)
    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="ctime", length=0)
    public Date getCtime() {
        return this.ctime;
    }
    
    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="mtime", length=0)
    public Date getMtime() {
        return this.mtime;
    }
    
    public void setMtime(Date mtime) {
        this.mtime = mtime;
    }
    
    @Column(name="viewnums")
    public long getViewnums() {
        return this.viewnums;
    }
    
    public void setViewnums(long viewnums) {
        this.viewnums = viewnums;
    }

   








}