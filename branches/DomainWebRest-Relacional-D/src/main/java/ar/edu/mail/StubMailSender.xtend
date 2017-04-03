package ar.edu.mail

import java.util.HashMap
import java.util.HashSet
import java.util.Map
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class StubMailSender {
	static StubMailSender instance
	Map<String, Set<String>> mailsEnviados

	private new() {
		mailsEnviados = new HashMap<String, Set<String>>
	}

	static def getInstance() {
		if (instance == null) {
			instance = new StubMailSender
		}
		instance
	}

	def void send(Mail mail) {
		simularEnvioMail(mail.from, mail.message)
	}

	def simularEnvioMail(String from, String message) {
		val mensajes = mailsDe(from)
		mensajes.add(message)
		mailsEnviados.put(from, mensajes)
	}

	def Set<String> mailsDe(String from) {
		mailsEnviados.get(from) ?: new HashSet<String>
	}

}
