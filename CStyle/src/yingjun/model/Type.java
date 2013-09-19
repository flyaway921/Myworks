package yingjun.model;


import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="t_type")
@DynamicUpdate
@DynamicInsert
public class Type  implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
     private String type;
     private Set<Works> workses = new HashSet<Works>(0);
    private int pref;

    public Type() {
    }


   
    @GenericGenerator(name="generator", strategy="uuid")
    @Id 
    @GeneratedValue(generator="generator")
    @Column(name="id",nullable=false, length=36)
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }

    @Column(name="type",nullable=false, length=50)
    public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

  
    @OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="type")
    public Set<Works> getWorkses() {
        return this.workses;
    }
    
    public void setWorkses(Set<Works> workses) {
        this.workses = workses;
    }


    @Column(name="pref",nullable=false, length=11)
	public int getPref() {
		return pref;
	}



	public void setPref(int pref) {
		this.pref = pref;
	}




}