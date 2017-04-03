package ar.edu.builder

import ar.edu.observer.BusquedaObserver
import ar.edu.usuario.Usuario

class UsuarioBuilder {

	Usuario usuario

	new() {
		usuario = new Usuario()
	}

	def Usuario build() {
		usuario
	}

	def UsuarioBuilder agregarMail(String mail) {
		usuario.mail = mail
		this
	}

//	def UsuarioBuilder agregarObserver(BusquedaObserver observer) {
//		usuario.observers.add(observer)
//		this
//	}
//
//	def UsuarioBuilder quitarObserver(BusquedaObserver observer) {
//		usuario.observers.remove(observer)
//		this
//	}

}
