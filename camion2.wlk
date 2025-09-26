import wollok.vm.*
object camion {
    const carga = []
    method cargar(unaCosa){
        carga.add(unaCosa)
        unaCosa.consecuenciasDeLaCarga()// todos los objetos tienen que saber entender este mensaje, es polimorfico.
    }
    method descargar(unaCosa){
        carga.remove(unaCosa)
    }
    method pesoTotal() = 1000 + carga.sum({carga => carga.peso()}) //a cada cosa le pregunto su peso
    method todoPesoPar() = carga.all({c => c.espesoPar()}) //c.peso().even()})// devuelve booleano para saber si todos los pesos son par/  all sobre carga evalua el clossure. con el even me da un resultado v o f
    method algunaCosaPesa(unValor) { // .any devuelve true or false
        return 
        carga.any({c => c.peso() == unValor})
    
    }

    method primerCosaConPeligrosidad(unValor){
        carga.find({c => c.peligrosidad() == unValor})//find me permite recuperar un obj que comple con la condicion dentro de la coleccion
    }

// como se cuando usar any o find? ver "clossures"
    method todasLasCosasConMasPeligrosidad(unValor){
        return 
        carga.filter({c => c.peligrosidad() > unValor})
    }

    method cosasSuperanPeligrosidadDe(unaCosa){
        carga.filter({c => c.peligrosidad() > unaCosa}).peligrosidad()
    }
    method excedePesoMaximo(){
        return self.pesoTotal() > 2500
    }
    method puedeCircular(nivelMaximo){
        return 
        not self.excedePesoMaximo()
        &&
        self.todasLasCosasConMasPeligrosidad(nivelMaximo).isEmpty() //esto devuelve una lista, y si esa lista esta vacia.)

    }

method algunaCosaPesaEntre(valorMinimo, valorMaximo){
    return 
    carga.any({c => c.peso().between(valorMinimo, valorMaximo)})
}

method laCosaMasPesada(){
    return 
    carga.max({c => c.peso()}) //transforma la coleccion carga en una lista de otra cosa (de peso) el metodo max me va a devolver el objeto que tiene el valor max transformado
}





}

