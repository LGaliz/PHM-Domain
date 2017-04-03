package ar.edu.testRepositorio

import ar.edu.POIs.Banco
import ar.edu.POIs.Cgp
import ar.edu.POIs.Colectivo
import ar.edu.POIs.Comuna
import ar.edu.POIs.Direccion
import ar.edu.POIs.HorarioDeAtencion
import ar.edu.singleton.RepositorioSingleton
import ar.org.excepciones.BussinessException
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point
import org.uqbar.geodds.Polygon

@Accessors
class TestRepositorio {

	RepositorioSingleton repositorio
	Colectivo colectivo78
	Colectivo colectivo169
	Cgp cgp
	Banco bancoSantander


	@Before
	def void init() {



		repositorio = RepositorioSingleton.instance

		colectivo78 = new Colectivo("linea 78")
		colectivo169 = new Colectivo("linea 169")
		cgp = new Cgp(
			new Comuna(
				new Polygon(
					#[new Point(-34.569901, -58.399222), new Point(-34.579503, -58.376716),
						new Point(-34.599284, -58.386868), new Point(-34.597805, -58.415952)]), "2"),
			new Direccion(new Point(-34.596594, -58.398985), "Pelagio Luna", "Perez Galdos", "Industria", 600, 1650,
				"Boedo", "Boedo", "Buenos Aires", "Argentina"))
		
		bancoSantander = new Banco(
			new Direccion(new Point(-34.578793, -58.528590), "Rondeau", "Av Primavera", "6 de Julio", 2324, 1650,
				"San Martin", "San Martin", "Buenos Aires", "Argentina"), new HorarioDeAtencion(), "Santander")


	}


/////////////////////////////////////////Repositorio///////////////////////////////////////////
	@Test
	def void poi() {
		repositorio.createOrUpdate(colectivo78)
		Assert.assertEquals(colectivo78.tipo, "colectivo")
	}
		@Test
	def void creamosUnPoiEnElRepositorio() {
		repositorio.createOrUpdate(colectivo78)
		Assert.assertEquals(#[colectivo78], repositorio.allInstances)
	}
/*
	@Test
	def void eliminamosUnPoiDelRepositorio() {
		repositorio.create(colectivo78)
		repositorio.create(bancoSantander)
		repositorio.delete(colectivo78)
		Assert.assertEquals(#[bancoSantander], repositorio.getObjects)
	}

	@Test
	def void buscamosUnPoiEnElRepositorioPorId() {
		repositorio.create(cgp)
		Assert.assertEquals(cgp, repositorio.searchById(1))
	}

	@Test
	def void actualizamosUnPoiDelRepositorio() {
		repositorio.create(colectivo169)
		colectivo78.setId(colectivo169.getId)
		repositorio.update(colectivo78)
		Assert.assertEquals(colectivo78, repositorio.searchById(1))
	}

	@Test(expected=typeof(BussinessException))
	def void noPodemosActualizarUnPoiDelRepositorioSiNoExisteEnElMismo() {
		repositorio.update(bancoSantander)
	}

	@Test
	def void searchRepositorio(){
		repositorio.create(cgp)
		repositorio.create(bancoSantander)
		repositorio.create(bancoSantander)
		repositorio.create(colectivo169)
		
		Assert.assertEquals(2, repositorio.search("Santander").size)
	}
*/	
}
