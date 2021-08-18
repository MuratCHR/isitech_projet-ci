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
        } else {

            /* On success, place User instance in session scope,
             * and redirect to home page.
             */
            flash.reservationInstance = reservation
            session.reservation = reservation
            redirect uri: ''
        }
    }

    @Transactional
    def create2() {
        def reservation = new Reservation(params.list("idMagasin")[0] as String, params.list("dateReservation")[0] as String, params.list("heureDebut")[0] as String, params.list("heureFin")[0] as String, params.list("nbPlace")[0] as String, params.list("idPersonne")[0] as String).save()
        def reservation2 = new Reservation(params.list("idMagasin")[1] as String, params.list("dateReservation")[1] as String, params.list("heureDebut")[1] as String, params.list("heureFin")[1] as String, params.list("nbPlace")[1] as String, params.list("idPersonne")[1] as String).save()
        if(reservation.hasErrors()) {
            /*
             * On failure, redirect back to registration form,
             * and pass the User instance to the GSP page in the
             * flash scope so that validation errors can be rendered.
             */
            flash.reservationInstance = reservation
        } else {

            /* On success, place User instance in session scope,
             * and redirect to home page.
             */
            flash.reservationInstance = reservation2
            session.reservation = reservation2
            redirect uri: ''
        }
    }

}
