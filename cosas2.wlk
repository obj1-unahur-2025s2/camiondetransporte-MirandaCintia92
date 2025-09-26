object nightRider{
    method peso = 500
    method peligrosidad = 10
    method esPesoPar() = self.peso().even()
    method bultos() = 1
    method unaCosa.consecuenciasDeLaCarga(){}
}




object bumblee {
    var esAuto = true
    method peso() = 800
    method transformateEnAuto(){
        esAuto = true
    }
    method bultos() = 2
    method unaCosa.consecuenciasDeLaCarga(){
        self.transformateEnRobot()
    }
}




object ladrillos {
    var cantidad = 10
    method cantidad(nuevacantidad){
    cantidad = nuevacantidad.max(0)
    }
  method peso() = 2 * cantidad
    method peligrosidad() = 2
    method esPesoPar() = self.peso().even()//poner esto en todos los objetos
    
    method bultos() {
        return
        if(cantidad <= 100){1}
        else if(cantidad.between(101, 300)){2}
        else{3}
    }
    method consecuenciasDeLaCarga(){
        cantidad += 12 //cantidad = cantidad +12
    }
    }
    


object arena {
    var peso = 0 
    method peso(nuevoPeso){
        peso = nuevoPeso // es igual a {return peso()}
    }
    method peso() = peso

    // puedo simplificar estos dos methodos (getter setter)
    //usando var property peso = 0 y eliminando los methods
    // 
    method peligrosidad() = 1
    method esPesoPar() = self.peso().even()
    method bultos() = 1
    method consecuenciasDeLaCarga(){
        peso = (peso - 10).max(0)
    }
}



object bateriaAntiaerea{
    var estaConMisiles = false
    method cargarMisiles(){
        estaConMisiles = true
    }
    method descargarMisiles(){
        estaConMisiles = false
    }
    method peso() = if(estaConMisiles) 300 else 200
    method peligrosidad() = if(estaConMisiles) 100 else 0
    method esPesoPar() = self.peso().even()
    method bultos() = if(estaConMisiles){2}
    else 1

    method consecuenciaDeLacarga(){
        self.cargarMisiles()
    }
}

object contenedor {
    const cosasAdentro = []

method agregar(unaCosa){
    cosasAdentro.add(unaCosa)
}
method agregarVarias(variasCosas){
    cosasAdentro.addAll(variasCosas)
}
method quitarCosa(unaCosa){
    cosasAdentro.remove(unaCosa)
}

    method peso() = 100 + cosasAdentro.sum({cosa => cosa.peso()})  // sum va a ir recorriendo toda la coleccion, y a cada cosa le va a pedir su peso y lo va a sumar.        // para conocer el peso necesito pasarle una lista
    method peligrosidad(){
        return 
        if (cosasAdentro.isEmpty())0    
        else 
        cosasAdentro.max({c => c.peligrosidad()}).peligrosidad()  //max no devuelve el valor maximo, devuelve el objeto que cumple con la condicion de ser el maximo que me pide en el enunciado
    //busco al objeto mas "peligroso" y le pido su peligrosidad.
    }
    method esPesoPar() = self.peso().even()
    method bultos() =   1 + cosasAdentro.sum({c => c.bultos()}) //la suma de las cosas de los bultos +1

        method consecuenciaDeLacarga(){
        cosasAdentro.forEach({c => c.consecuenciaDeLacarga()})
    }
}

//ctrl + click para ver ejemplos de por ej "sum" - sobre sum


object residuos {
    var property peso = 0 //puedo usar property por que el peso puede alternarse
    method peligrosidad() = 200
}

object embalaje {
    var cosaEnvuelta = arena

    method envolver(unaCosa){
        cosaEnvuelta = unaCosa
    }
    method peso() = cosaEnvuelta.peso() // o puedo hacerlo con return  method peso() {return cosaEnvuelta.peso()}

    method peligrosidad() = cosaEnvuelta.peligrosidad() / 2

    method esPesoPar() = self.peso().even()

    method bultos() = 2
    method consecuenciaDeLaCarga(){

    }
}
/*
object nada{
    method peso()=  0
    method peligrosidad() = 0
    method esPesoPar() = self.peso().even()
} para object embalaje puedo inicializarlo con var cosaEnvuelta = nada pero tengo que crear este objeto
*/
