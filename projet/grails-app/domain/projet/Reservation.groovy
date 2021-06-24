package projet
import groovy.sql.Sql
import java.sql.Time

class Reservation {
    def dataSource
    int id
    int idMagasin
    String dateReservation
    String heureDebut
    String heureFin
    int nbPlace
    int idPersonne
    Magasin magasin



    static mapping = {
        table 'reservation'
        version false
        id column: 'id', generator: 'increment'
        idMagasin column: 'iddumagasin'
        dateReservation column: 'dateReservation'
        heureDebut column: 'heureDebut'
        heureFin column: 'heureFin'
        nbPlace column: 'nbPlace'
        idPersonne column: 'idPersonne'
    }

    static constraints = {
        id(nullable: true)
        idMagasin(nullable: false)
        dateReservation(nullable: false)
        heureDebut(nullable: false)
        heureFin(nullable: false)
        nbPlace(nullable: false)
        idPersonne(nullable: false)
        magasin(nullable: true)
    }
}