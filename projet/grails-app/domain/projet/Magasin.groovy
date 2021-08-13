package projet

import groovy.sql.GroovyResultSet
import groovy.sql.Sql

import java.sql.Time

class Magasin {
    def dataSource
    int id
    String nom
    String adresse
    int placeTotale
    int idVille
    int idCategorie
    String horaireOuverture
    String horaireFermeture
    String ouvertLeMidi
    Ville ville
    Categorie categorie
    def scaffold = true

    static mapping = {
        table 'magasin'
        version false
        id column: 'id', generator: 'increment'
        nom column: 'nom'
        adresse column: 'adresse'
        idVille column: 'identifiantVille'
        placeTotale column: 'placeTotale'
        idCategorie column: 'iddelacategorie'
        horaireOuverture column: 'horaireOuverture'
        horaireFermeture column: 'horaireFermeture'
        ouvertLeMidi column: 'ouvertLeMidi'


    }

    static constraints = {
        id(nullable: true)
        nom(nullable: false)
        adresse(nullable: false)
        idVille(nullable: false)
        idCategorie(nullable:false)
        placeTotale(nullable: false)
        horaireOuverture(nullable: true)
        horaireFermeture(nullable: true)
        ouvertLeMidi(nullable: true)
        ville(nullable:true)
        categorie(nullable:true)
    }

    String toString() {
        return "$nom"
    }



}