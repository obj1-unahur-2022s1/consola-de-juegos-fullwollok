 import wollok.game.*
import individuos.*

object direcciones {

	method movBomberman(prota) {
		keyboard.left().onPressDo{ self.move(izquierda, prota);protagonista.direccion(izquierda);protagonista.image("bombermanIzquierda.png")}
		keyboard.right().onPressDo{ self.move(derecha, prota);protagonista.direccion(derecha);protagonista.image("bombermanDerecha.png")}
		keyboard.up().onPressDo{ self.move(arriba, prota); protagonista.direccion(arriba)}
		keyboard.down().onPressDo{ self.move(abajo, prota);protagonista.direccion(abajo)}
	}

	method move(sentido, individuo) {
		individuo.position(sentido.direccion(individuo.position()))
	}

	method chocar(individuo, sentido) {
		self.move(sentido.alChocar(), individuo)
	}

} 

object izquierda {
	method direccion(position) = position.left(1)
	method alChocar() = derecha
}

object derecha {
	method direccion(position) = position.right(1)
	method alChocar() = izquierda
}

object abajo {
	method direccion(position) = position.down(1)
	method alChocar() = arriba
}

object arriba {
	method direccion(position) = position.up(1)
	method alChocar() = abajo
}











object menu {

    var property seleccionado = 0
 
    
    const opciones = [play, salir]

    const fondoEmpezar = "pasto.jpg")
	
	method seleccionar() = opciones.get(seleccionado)

    method iniciar(){
        self.configurarControles()
        game.addVisual(fondoEmpezar)
        opciones.forEach({option => game.addVisual(option)})
   
    }

    method configurarControles() {
        keyboard.up().onPressDo({ self.arriba() })
        keyboard.down().onPressDo({ self.abajo()})
        keyboard.enter().onPressDo({ self.select() })

 
    }

	method arriba(){
    	self.seleccionar().estaSeleccionado(false)
    	seleccionado = (((seleccionado - 1) % opciones.size()) + opciones.size()) % opciones.size()
    	self.seleccionar().estaSeleccionado(true)
    }

    method abajo(){
    	self.seleccionar().estaSeleccionado(false)
    	seleccionado = (((seleccionado + 1) % opciones.size()) + opciones.size()) % opciones.size()
    	self.seleccionar().estaSeleccionado(true)
    }
    method select(){
        	self.seleccionar().iniciar()
    }
}
















