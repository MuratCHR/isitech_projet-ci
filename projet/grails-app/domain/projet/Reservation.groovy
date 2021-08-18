package projet
import groovy.sql.Sql
import java.sql.Time

class Reservation {
    int id
    int idMagasin
    String dateReservation
    String heureDebut
    String heureFin
    int nbPlace
    int idPersonne
    Magasin magasin


    Reservation() {
        //Execute post creation code
    }

    Reservation(String un, String deux, String trois, String quatre, String cinq, String six) {
        this.idMagasin = un.toInteger()
        this.dateReservation = deux
        this.heureDebut = trois
        this.heureFin = quatre
        this.nbPlace = cinq.toInteger()
        this.idPersonne = six.toInteger()
    }
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