package projet
import groovy.sql.Sql

class Magasin {
    def dataSource
    int id
    String nom
    String adresse
    int placeTotale
    int idVille
    int idCategorie
    Ville ville
    Categorie categorie

    static mapping = {
        table 'magasin'
        version false
        id column: 'id', generator: 'increment'
        nom column: 'nom'
        adresse column: 'adresse'
        idVille column: 'identifiantVille'
        placeTotale column: 'placeTotale'
        idCategorie column: 'iddelacategorie'


    }

    static constraints = {
        id(nullable: true)
        nom(nullable: false)
        adresse(nullable: false)
        idVille(nullable: false)
        idCategorie(nullable:false)
        placeTotale(nullable: false)
        ville(nullable:true)
        categorie(nullable:true)
    }

    String toString() {
        return "$nom"
    }
}