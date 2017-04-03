package ar.edu.POIs

import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToOne
import javax.persistence.Transient
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.geodds.Polygon

@Entity
@Observable
@Accessors
class Comuna {
	@Id
	@GeneratedValue
	private Long id
	
	@OneToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
//	@PrimaryKeyJoinColumn
	@Transient
	Polygon zonaComuna
	
	@Column
	String numeroComuna
	
	new(Polygon _comuna, String _numeroComuna) {
		zonaComuna = _comuna
		numeroComuna = _numeroComuna
	}
	
	new() {}
	
}