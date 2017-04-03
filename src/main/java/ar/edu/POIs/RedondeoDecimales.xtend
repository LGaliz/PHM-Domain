package ar.edu.POIs

class RedondeoDecimales {
	static def redondearDecimales(double valorInicial, int numeroDecimales) {
        var Double parteEntera 
        var Double resultado
        resultado = valorInicial
        parteEntera = Math.floor(resultado)
        resultado=(resultado-parteEntera)*Math.pow(10, numeroDecimales)
        resultado=Math.round(resultado) as double
        resultado=(resultado/Math.pow(10, numeroDecimales))+parteEntera
        return resultado
    }
}