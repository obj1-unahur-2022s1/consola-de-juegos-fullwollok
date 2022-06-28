import wollok.game.*
import juego.*
import individuos.*
import musica.*
import bombas.* 
import elementos.*
import nivel.*
import consola.*

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
/* */


