package projet

class Ville {
    def dataSource
    int id
    String codePostal
    String nomVille

    static mapping = {
        table 'ville'
        version false
        id column: 'id', generator: 'increment'
        codePostal column: 'codePostal'
        nomVille column: 'nomVille'
    }

    static constraints = {
        id(nullable: true)
        codePostal(nullable: false)
        nomVille(nullable: false)
    }

    String toString() {
        return "$codePostal - $nomVille"
    }
}
