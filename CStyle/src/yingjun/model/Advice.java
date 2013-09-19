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
@Table(name="t_advice")
@DynamicUpdate
@DynamicInsert
public class Advice  implements java.io.Serializable {


  
	private static final long serialVersionUID = 1L;
	private String id;
     private String title;
     private User user;
     private String content;
     private Date createtime;


   
    public Advice() {
    }

    @GenericGenerator(name="generator", strategy="uuid")
    @Id 
    @GeneratedValue(generator="generator")
    @Column(name="id",  length=36)

    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    @Column(name="title",nullable = false,length=50)
    public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
    
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="userid")
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    @Column(name="content",  length=65535)
    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="createtime", length=0)
    public Date getCreatetime() {
        return this.createtime;
    }
    
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

	
   








}