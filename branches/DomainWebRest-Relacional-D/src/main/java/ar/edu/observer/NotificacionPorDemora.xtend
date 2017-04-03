package ar.edu.observer

import ar.edu.mail.Mail
import ar.edu.mail.StubMailSender
import ar.edu.usuario.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class NotificacionPorDemora implements BusquedaObserver {

	double demoraMaxima

	new(double _demoraMaxima) {
		demoraMaxima = _demoraMaxima
	}

	override observarBusqueda(Usuario usuario, String valorBuscado, int cantidadDeResultados, double tiempoEjecucion) {
		if (tiempoEjecucion > demoraMaxima) {

			var Mail mail = new Mail => [
				from = usuario.mail
				to = "administrador@mail.com"
				message = "La busqueda realizada demoró más de " + demoraMaxima + " segundos"
				titulo = "Aviso de tiempo máximo de búsqueda superado"
			]

			StubMailSender.instance.send(mail)
		}
	}

}
