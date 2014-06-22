package com.pcrh

/**
 * IdHecho
 * A domain class describes the data object and it's mapping to the database
 */
class IdHecho implements Serializable{

    Long numero
    Long anio

    static mapping = {
        id composite: ['numero', 'anio']
    }

}
