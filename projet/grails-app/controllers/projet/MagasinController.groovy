package projet

import grails.gorm.transactions.Transactional
import groovy.sql.GroovyResultSet
import groovy.sql.Sql

class MagasinController {
    static scaffolding = Magasin

    def index() {
        def magasinList = Magasin.list()
        [magasinList: magasinList]
    }

    @Transactional
    def create() {
        def magasin = new Magasin(params).save()

        if(magasin.hasErrors()) {
            /*
             * On failure, redirect back to registration form,
             * and pass the User instance to the GSP page in the
             * flash scope so that validation errors can be rendered.
             */
            flash.magasinInstance = magasin
            redirect uri: '/magasin'
        } else {
            /* On success, place User instance in session scope,
             * and redirect to home page.
             */
            flash.magasinInstance = magasin
            session.magasin = magasin
            redirect uri: '/magasin'
        }
    }

    private List<GroovyResultSet> getMagasinsInFrance(String nomDuMagasin) {
        def sql = new Sql(dataSource)
        def entries = sql.rows("""
SELECT DISTINCT * FROM magasin, ville WHERE nom LIKE :nomMagasin AND ville_id = ville.ID ORDER BY codePostal
""", [nomMagasin : nomDuMagasin])
        def data = currentSession.createSQLQuery(entries)
        final result = data.list()
        return result
    }
}
