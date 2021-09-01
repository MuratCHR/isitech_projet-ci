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
    byte[] imageMagasin
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
        imageMagasin column:'imageMagasin'
    }

    static constraints = {
        id(nullable: true)
        nom(nullable: false)
        adresse(nullable: false)
        idVille(nullable: false)
        idCategorie(nullable:false)
        placeTotale(nullable: false)
        horaireOuverture(nullable: false)
        horaireFermeture(nullable: false)
        ouvertLeMidi(nullable: false)
        ville(nullable:true)
        categorie(nullable:true)
        imageMagasin(nullable: false)
    }

    String toString() {
        return "$nom"
    }

}