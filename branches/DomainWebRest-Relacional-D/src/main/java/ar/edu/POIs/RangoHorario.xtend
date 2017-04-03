package ar.edu.POIs

import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.LocalTime

@Accessors
class RangoHorario {

	LocalTime apertura
	LocalTime cierre

	new(LocalTime _apertura, LocalTime _cierre) {
		apertura = _apertura
		cierre = _cierre
	}
	
	new() {	}

	def boolean estaDisponible(LocalTime momento){
		apertura.compareTo(momento) < 0 && cierre.compareTo(momento) > 0
	}  
 
 	override toString(){
		localTimeToString(apertura) + " a " + localTimeToString(cierre)  
 	}
 	
 	def localTimeToString(LocalTime localTime){
 		if((localTime.getMinuteOfHour).equals(0)){
			localTime.getHourOfDay.toString
 		} else {
			localTime.getHourOfDay.toString + ":" + localTime.getMinuteOfHour.toString
 		}
 	}
 
}
