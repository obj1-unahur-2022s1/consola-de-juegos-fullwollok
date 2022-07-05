import wollok.game.*
import juego.*
import individuos.*
import direcciones.*
import musica.* 
import elementos.*
import nivel.*
import consola.*

class Bomba{
	var property position
	var property image = 'bomba.png'
	var numRandom=[1,2].anyOne()
		

	method explotar() {
		game.removeVisual(self)
	}
	
	method chocarConIndividuo(quien){
		quien.chocarPared()
	}

	method explosionCruz() {
		var x = self.position().x()
		var y = self.position().y()
		var exp1 = new Explosion(position = game.at(x, y))
		var exp2 = new Explosion(position =game.at(x + 1, y) )
		var exp3 = new Explosion(position = game.at(x - 1, y))
		var exp4 = new Explosion(position = game.at(x, y + 1))
		var exp5 = new Explosion(position =  game.at(x, y - 1))
		var exp6 = new Explosion(position =game.at(x + 2, y) )
		var exp7 = new Explosion(position = game.at(x - 2, y))
		var exp8 = new Explosion(position = game.at(x, y + 2))
		var exp9 = new Explosion(position =  game.at(x, y - 2))		
		
		var todasLasExp = #{ exp1, exp2, exp3, exp4, exp5 }

		game.addVisualIn(exp1, game.at(x, y))
		game.addVisualIn(exp2, game.at(x + 1, y))
		game.addVisualIn(exp3, game.at(x - 1, y))
		game.addVisualIn(exp4, game.at(x, y + 1))
		game.addVisualIn(exp5, game.at(x, y - 1))

		if(numRandom==2){
		game.addVisualIn(exp6, game.at(x + 2, y))
		game.addVisualIn(exp7, game.at(x - 2, y))
		game.addVisualIn(exp8, game.at(x, y + 2))
		game.addVisualIn(exp9, game.at(x, y - 2))
		var todasLasExp = #{ exp1, exp2, exp3, exp4, exp5, exp6, exp7, exp8, exp9 }
		}
		game.schedule(500,{todasLasExp.forEach({exp=>game.removeVisual(exp)})})
	}

	method spawn() {
		game.onTick(3000, "la bomba explota", {=> self.explosion()})
	}

	method explosion() {
		game.removeTickEvent("la bomba explota")
		game.getObjectsIn(self.position()).forEach({e => e.explotar()})
		game.getObjectsIn(self.position().up(1)).forEach({e => e.explotar()})
		game.getObjectsIn(self.position().down(1)).forEach({e => e.explotar()})
		game.getObjectsIn(self.position().left(1)).forEach({e => e.explotar()})
		game.getObjectsIn(self.position().right(1)).forEach({e => e.explotar()})
		if(numRandom==2){
		game.getObjectsIn(self.position().up(2)).forEach({e => e.explotar()})
		game.getObjectsIn(self.position().down(2)).forEach({e => e.explotar()})
		game.getObjectsIn(self.position().left(2)).forEach({e => e.explotar()})
		game.getObjectsIn(self.position().right(2)).forEach({e => e.explotar()})}
		self.explosionCruz()
	}

}

class Explosion{
	var property position
	var property image = "explosion.png"
	
	method chocarConIndividuo(quien){
		quien.explotar()
	}
	method explotar(){}
}





