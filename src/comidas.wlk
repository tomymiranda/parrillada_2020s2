class Comida {

	method peso()

	method valoracion()

	method esAptoVegetariano()

	method esAbundante() {
		return self.peso() > 250
	}

}

class Provoleta inherits Comida {

	var peso
	var property tieneEspecias

	override method peso() {
		return peso
	}

	override method esAptoVegetariano() {
		return not self.tieneEspecias()
	}

	method esEspecial() {
		return self.esAbundante() or self.tieneEspecias()
	}

	override method valoracion() {
		if (self.esEspecial()) {
			return 120
		} else {
			return 80
		}
	}

}

class HamburguesaCarne inherits Comida {

	var property pan

	override method peso() {
		return 250
	}

	override method esAptoVegetariano() {
		return false
	}

	override method valoracion() {
		return 60 + pan.puntos()
	}

}

class HamburguesaVegetariana inherits HamburguesaCarne {

	const property legumbreHecha
	
	override method esAptoVegetariano() {
		return true
	}
	method cantidadDeLetrasDeLegumbre(){
		return self.legumbreHecha().size()
	}

	method plus(){
		return (2*self.cantidadDeLetrasDeLegumbre()).min(17)
	}
	
	override method valoracion(){
		return super() + self.plus()
	}
	
	
}

class Parrillada inherits Comida {

	var property cortesDeLaParrillada = []
	
	method agregarCorte(corte){
		cortesDeLaParrillada.add(corte)
	}
	
	override method peso(){
		return cortesDeLaParrillada.sum({i => i.peso()})
	}

	override method esAptoVegetariano(){
		return false
	}

	override method valoracion(){
		return (self.valoracionBase() - self.cantidadDeCortes()).abs()
	}

	method valorMaximoDeCalidadDeLosCortes(){
		return cortesDeLaParrillada.map({i=>i.calidad()}).max()
	}

	method cantidadDeCortes(){
		return cortesDeLaParrillada.size()
	}

	method valoracionBase(){
		return 15 * self.valorMaximoDeCalidadDeLosCortes()
	}
}

class Corte {
var property nombre
var property calidad
var property peso
}

object panIndustrial {

	method puntos() {
		return 0
	}

}

object panCasero {

	method puntos() {
		return 20
	}

}

object panMasaMadre {

	method puntos() {
		return 45
	}

}

