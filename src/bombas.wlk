import wollok.game.*
import elementos.*
import individuos.*

class Bomba{
	var property position
	var property image = 'bomba.png'

		

	method explotar() {
		game.removeVisual(self)
	}
	
	method chocarConIndividuo(quien){
		quien.chocarPared()
	}

	method explosionCruz() {
		var exp1 = new Explosion()
		var exp2 = new Explosion()
		var exp3 = new Explosion()
		var exp4 = new Explosion()
		var exp5 = new Explosion()
		var x = self.position().x()
		var y = self.position().y()
		const todasLasExp = #{ exp1, exp2, exp3, exp4, exp5 }
		
		game.addVisualIn(exp1, game.at(x, y))
		game.addVisualIn(exp2, game.at(x + 1, y))
		game.addVisualIn(exp3, game.at(x - 1, y))
		game.addVisualIn(exp4, game.at(x, y + 1))
		game.addVisualIn(exp5, game.at(x, y - 1))
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
		self.explosionCruz()
	}

}

class Explosion{
	var property position
	var property image = "explosion.png"
	
	method chocarConIndividuo(quien){
		quien.explotar()
	}
}





