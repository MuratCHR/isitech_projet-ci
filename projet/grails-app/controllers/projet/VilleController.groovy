package projet

class VilleController {

    static scaffolding = Ville
    def index() {
        def villeList = Ville.list()
        [villeList: villeList]
    }
}
