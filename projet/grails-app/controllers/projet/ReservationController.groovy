package projet

import grails.converters.JSON
import grails.gorm.transactions.Transactional
import groovy.sql.Sql

import java.sql.Time
import java.text.SimpleDateFormat

class ReservationController {
    static scaffolding = Reservation

    def index() {
        def reservationList = Reservation.list()
        [reservationList: reservationList]
    }

    def listeResa() {
        def reservationList = Reservation.list()
        [reservationList: reservationList]
    }

    @Transactional
    def create() {
        def reservation = new Reservation(params).save()

        if(reservation.hasErrors()) {
            /*
             * On failure, redirect back to registration form,
             * and pass the User instance to the GSP page in the
             * flash scope so that validation errors can be rendered.
             */
            flash.reservationInstance = reservation
            redirect uri: '/reservation'
        } else {

            /* On success, place User instance in session scope,
             * and redirect to home page.
             */
            flash.reservationInstance = reservation
            session.reservation = reservation
            redirect uri: '/reservation'
        }
    }

}
