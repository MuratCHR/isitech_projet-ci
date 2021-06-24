package projet

class CategorieController {

    static scaffolding = Categorie
    def index() {
        def categorieList = Categorie.list()
        [categorieList: categorieList]
    }
}