package ar.edu.testWeb

import ar.edu.POIs.Banco
import ar.edu.POIs.Colectivo
import ar.edu.builder.BancoBuilder
import ar.edu.builder.ColectivoBuilder
import ar.edu.builder.DireccionBuilder
import ar.edu.builder.HorarioDeAtencionBuilder
import ar.edu.singleton.RepositorioSingleton
import ar.edu.usuario.Usuario
import org.junit.Before
import org.junit.Test
import java.text.DecimalFormat
import ar.edu.POIs.RedondeoDecimales

class TestWeb {
	
	Colectivo colectivo78
	Banco bancoSantander
	
	@Before
	def void init(){
	colectivo78 = new ColectivoBuilder()
					.agregarNombre("78")
					.agregarParada(-34.570861, -58.538289)
					.agregarParada(-34.578899, -58.528354)
					.agregarParada(-34.568033, -58.542023)
					.build

	bancoSantander = new BancoBuilder()
					.agregarDireccion(new DireccionBuilder().agregarPunto(-34.578793, -58.528590).agregarCalle("Rondeau").agregarEntreCalle1("Av Primavera").agregarEntreCalle2("6 de Julio").agregarNumero(250).agregarCodigoPostal(1650).agregarLocalidad("San Martin").agregarBarrio("San Martin").agregarProvincia("Buenos Aires").agregarPais("Argentina").build)
					.agregarHorarioBanco(new HorarioDeAtencionBuilder().agregarHoraInicio("10:00").agregarHoraFin("15:00").build)
					.agregarNombre("Santander")
					.agregarServicios(#["depósitos", "transferencias", "cobro de cheques"])
					.build
	
	}
	
	@Test
	def void seteo(){
		val usuario = new Usuario("admin","admin")
		RepositorioSingleton.instance=>[
			createOrUpdate(colectivo78)
			createOrUpdate(bancoSantander)
		]

		System.out.println("usuario ubicacion " + usuario.ubicacion)
		System.out.println("banco distancia " + bancoSantander.distancia)
		System.out.println("colectivo distancia " + colectivo78.distancia)
		System.out.println("colectivo estaCerca " + colectivo78.estaCerca(usuario.ubicacion))
		System.out.println("banco estaCerca " + bancoSantander.estaCerca(usuario.ubicacion))
		System.out.println("colectivo getDistancia " + colectivo78.getDistancia(usuario.ubicacion))
		System.out.println("banco getDistancia " + bancoSantander.getDistancia(usuario.ubicacion))
		
//		usuario.listaFavoritos.add(bancoSantander) //ahora guarda id
		//usuario.listaFavoritos.add(bancoSantander.id)
		
		RepositorioSingleton.instance.buscadorPoisPersonales(usuario)
		
		System.out.println("colectivo disponible " + colectivo78.disponibilidad) //siempre es true
		System.out.println("banco disponible " + bancoSantander.disponibilidad) //posiblemente false
		//System.out.println("banco favorito " + bancoSantander.estaEnFavoritos) //true
		System.out.println("banco cercania " + bancoSantander.cercania) 
		System.out.println("colectivo cercania " + colectivo78.cercania)
		System.out.println("colectivo distancia " + colectivo78.distancia)
		System.out.println("banco distancia " + bancoSantander.distancia)

//		System.out.println(RedondeoDecimales.redondearDecimales(colectivo78.getDistancia(usuario.ubicacion),2))
	}
	
	@Test
	def void favoritosPorId(){ //correrlos individualmente
		val usuario = new Usuario("admin","admin")
		RepositorioSingleton.instance=>[
			createOrUpdate(colectivo78)
			createOrUpdate(bancoSantander)
		]
		
//		usuario.listaFavoritos.add(bancoSantander.id)
		
		System.out.println(bancoSantander.id) //2
		
		//usuario.agregarFavorito(bancoSantander)
		
		System.out.println(usuario.listaFavoritos)//[2]
		
		//System.out.println(usuario.getPoiEstaEnFavoritos(bancoSantander))//true
		
		//System.out.println(usuario.searchPoiFavoritoById(usuario.listaFavoritos.get(0)).nombre)//Banco Santander
	}
	
}



//http://www.aprenderaprogramar.com/index.php?option=com_content&view=article&id=960:java-redondear-a-2-o-mas-decimales-errores-precision-bigdecimal-roundingmode-biginteger-cu00907c&catid=58:curso-lenguaje-programacion-java-nivel-avanzado-i&Itemid=180
