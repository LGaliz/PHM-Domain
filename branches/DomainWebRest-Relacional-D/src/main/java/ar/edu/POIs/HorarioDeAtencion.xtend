package ar.edu.POIs

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.joda.time.LocalTime

@Entity
@Accessors
class HorarioDeAtencion {
	@Id
	@GeneratedValue
	private Long id
	@Column
	String inicio
	@Column
	String fin
	
	new (String inicio_, String fin_){
		inicio = inicio_
		fin = fin_
	}
	
	new () {}

	def estaDisponible(DateTime unHorario){ //new DateTime o DateTime.now (fecha y hora actual)
		var timeInicio = new LocalTime(inicio)
		var timeFin = new LocalTime(fin)
		var horario = unHorario.toLocalTime
		
		timeInicio<horario && horario<timeFin
	}
	
//	def estaDisponible(LocalTime unHorario){
//		var timeInicio = new LocalTime(inicio)
//		var timeFin = new LocalTime(fin)
//		
//		timeInicio<unHorario && unHorario<timeFin
//	}
	
//	def estaDisponible(){   //compara con la hora actual - sin parametros
//		var timeInicio = new LocalTime(inicio)
//		var timeFin = new LocalTime(fin)
//		var horario = new LocalTime()  //podria hacerse con un DateTime, pero no necesitamos fecha
//		
//		timeInicio<horario && horario<timeFin
//	}
	
	override toString(){
		/*"De " +*/ inicio + " a " + fin /*+ " hs."*/
	}
}

/*class HorarioDeAtencion {

	List<String> diasHabiles = newArrayList("Lunes", "Martes", "Miércoles", "Jueves", "Viernes")

	Map<String, List<RangoHorario>> horarioAtencion = new LinkedHashMap<String, List<RangoHorario>>()

	def String getDia(DateTime momento) {
		momento.dayOfWeek().getAsText()
	}

	def List<RangoHorario> getHorarioDelDia(String dia) {
		horarioAtencion.get(dia)
	}

	def boolean noEsNulo(String dia) {
		horarioAtencion.containsKey(dia) && getHorarioDelDia(dia) != null
	}

	def boolean estaDisponible(DateTime momento) {
		val dia = getDia(momento)
		val hora = momento.toLocalTime
		noEsNulo(dia) && getHorarioDelDia(dia).exists[h|h.estaDisponible(hora)]
	}

	def void setLunesAViernes(List<RangoHorario> rangos) {
		diasHabiles.forEach[dia|horarioAtencion.put(dia, rangos)]
	}
	
	override toString(){
		horarioAtencion.keySet.map[dia|dia+rangosToString(horarioAtencion.get(dia))+"\n"].join
	}
	
	def String rangosToString(List<RangoHorario> rangos) {
		" de " + rangos.drop(1).fold(rangos.get(0).toString,[acum, rango | acum + " y de " + rango.toString])
	}

} */
