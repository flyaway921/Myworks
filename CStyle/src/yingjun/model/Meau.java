package yingjun.model;


import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;



@Entity
@Table(name="t_meau")
@DynamicUpdate
@DynamicInsert
public class Meau {

	private String id;
	private String text;
	private String url;
	private Meau pmenu;
	private int seq;
	private Set<Meau> cmenus = new HashSet<Meau>();


	
	public Meau() {
	}

	@GenericGenerator(name="generator", strategy="uuid")
	@Id 
	@GeneratedValue(generator="generator")  
	@Column(name="id", unique=true, nullable=false, length=36)
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}
	
	
	@Column(  nullable = false, length = 50)
	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}



	@Column(length = 100)
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pid")
	public Meau getPmenu() {
		return pmenu;
	}


	public void setPmenu(Meau pmenu) {
		this.pmenu = pmenu;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "pmenu")
	public Set<Meau> getCmenus() {
		return cmenus;
	}

	
	public void setCmenus(Set<Meau> cmenus) {
		this.cmenus = cmenus;
	}


	@Column(nullable = false)
	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}







	

	
	

}