package projet

class Categorie  {

    def dataSource
    int id
    String typeCategorie

    static mapping = {
        table 'categorie'
        version false
        id column: 'id', generator: 'increment'
        typeCategorie column: 'typeCategorie'

    }

    static constraints = {
        id(nullable: true)
        typeCategorie(nullable: false)
    }

    String toString() {
        return "$typeCategorie"
    }
}
