import suenios.*
class Persona {
	
	var edad=0
	var carreras=[]
	var plataAganar=0
	var lugares=[]
	var suenios= []
	var hijos= 0
	var nivel= 0

	constructor(_edad,_carrera,_plata,_lugar,_suenio,hijo){
		edad = _edad
		carreras.add(_carrera)
		plataAganar= _plata
		lugares.add(_lugar)
		suenios.add(_suenio)
		hijos = hijo
	}
	
	method agregarSuenio(suenio){
		suenios.add(suenio)
	}
	
	method suenios() = suenios
	
	method incrementarNivelDeFelicidad(felicidonios){
		nivel+=felicidonios
	}
	
	method nivelDeFelicidad() = nivel
	
	// Metodos para tener hijos
	
	method tenerHijo(cant){ hijos+= cant }
	
	method hijos() = hijos
	
	method tieneHijo(){
		return hijos>0
	}
	// metodos para las carreras
	
	method tieneEstaCarrera(carrera){
		return carreras.contains(carrera)
	}
	// plata
	
	method plataAganar() =  plataAganar
	 
	// suenio
	method cumplirSuenio(suenio){
		suenio.puedeCumplirElSuenio(self)
	}
	// filtrar  suenios
	
	method sueniosCumplidos(){
		return suenios.filter({s=>s.seCumplio()})
	}
	
	method sueniosPonderados(){
		return suenios.filter({s=>s.seCumplio().negate()})
	}
	// tipo de persona 
	
	method cumplirSuenioSegunLaPersona(tipoDePersona){
		self.cumplirSuenio(tipoDePersona.suenioImportante(self))
	}
	
	// punto4
	method sumaDeFelicidoniosDeSp(){
		return self.sueniosPonderados().sum({s=>s.felicidonios()})
	}
	
	method esFeliz(){
		return nivel> self.sumaDeFelicidoniosDeSp()
	}
	// punto 5
	
	method obtenerLosSueniosAmbisiosos(){
		return suenios.filter({s=>s.suenioAmbisioso()})
	}
	
	method esAmbisiosa(){
		return  self.obtenerLosSueniosAmbisiosos().size() > 3
	}

}

//Punto3

object realistas{
	
	method suenioImportante(persona){
	return persona.suenios().max({s=>s.felicidonios()})
	}
	
}

object obsesivos{
	
	method suenioImportante(persona){
		return persona.suenios().head()
	}
	
}

object alocados{
	method suenioImportante(persona){
		return persona.suenios().onyOne()
	}
}

