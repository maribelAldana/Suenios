import persona.*

class Suenio {
	
	var felicidonios= 0
	var cumplio=false
	 
	constructor(f){
		felicidonios = f
	}
	
	method seCumplio() = cumplio
	
	method cumplio(estado) {
		cumplio= estado
	}
	
	method felicidonios() = felicidonios
	
	method suenioAmbisioso(){
		return felicidonios > 100
	}

}


class RecibirseDeUnaCarrera inherits Suenio{
	
	var carrera=""
	
	constructor(f,_carrera)= super(f) {
		carrera = _carrera
	
	}
	
	method carrera(c){
	 	carrera=c
	}
	
 	method carrera()= carrera
 	
 	method puedeCumplirElSuenio(soniador){
		if(soniador.tieneEstaCarrera(self.carrera()).negate() || self.seCumplio()){
			error.throwWithMessage("No puede cumplir este suenio")
		}
		self.modificarAlSoniador(soniador)
	}
	
	method modificarAlSoniador(soniador){
		soniador.nivelDeFelicidad()
		self.cumplio(true)
	}
	
}

class TenerUnHijo inherits Suenio{
	
	method condicion(soniador){
		return soniador.tieneHijo()
	}
	
	method puedeCumplirElSuenio(soniador){
		if(self.condicion(soniador)){
			error.throwWithMessage("No puede tener otro hijo porque ya lo tiene")
		}
		self.modificarAlSoniador(soniador)
	}
		
	method modificarAlSoniador(soniador){
		soniador.tenerHijo(1)
		soniador.incrementarNivelDeFelicidad(felicidonios)
		self.cumplio(true)
	}
	
}

class Adoptar inherits TenerUnHijo{
	var cantAdoptar = 0
	constructor (cant){
		cantAdoptar = cant
	}
	
	method cantidadAAdoptar() = cantAdoptar
	
	override method modificarAlSoniador(soniador){
		soniador.tenerHijo(self.cantidadAAdoptar())
		soniador.incrementarNivelDeFelicidad(felicidonios)
		self.cumplio(true)
	}
	
}

class Viajar inherits Suenio{
	var destino = ""
	
	constructor(f,ciudad) = super(f) {
		destino= ciudad
	}
	
	method condicion(soniador){
		return self.seCumplio()
	}
	
	method puedeCumplirElSuenio(soniador){
		if(self.condicion(soniador)){
			error.throwWithMessage("Este suenio ya se cumplio")
		}
		self.modificarAlSoniador(soniador)
	}
	
	method modificarAlSoniador(soniador){
		soniador.incrementarNivelDeFelicidad(felicidonios)
		self.cumplio(true)
	}
	
}

class TenerUnLaburo inherits Suenio{
	var sueldo = 0
	
	constructor(f,valor)=super(f) {
		sueldo = valor
	}
	
	method condicion(soniador){
		return soniador.plataAganar() > sueldo
	}
	
	method puedeCumplirElSuenio(soniador){
		if(self.condicion(soniador)){
			error.throwWithMessage("El sueldo establecido es menor al soniado")
		}
		self.modificarAlSoniador(soniador)
	}
	
	method modificarAlSoniador(soniador){
		soniador.incrementarNivelDeFelicidad(felicidonios)
		self.cumplio(true)
	}
	
}

class SuenioMultiple {
	
	var suenioMult = []
	
	method sumarFelicidonios(){
		return suenioMult.sum({s=>s.felicidonios()})
	}
	
	method sePuedeCumplirSuenio(){
		return suenioMult.any({s=>s.condiciones()})
	}
	method cumplirSuenio(soniador){
		if(self.sePuedeCumplirSuenio()){
			suenioMult.forEach({s=>s.modificarAlSoniador(soniador)})
		}
		
		error.throwWithMessage("No todos los suenios se pueden cumplir conjuntamente")
	}
	
	
	
}


