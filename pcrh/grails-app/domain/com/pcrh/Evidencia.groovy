package com.pcrh

import com.pcrh.enums.EnumTipoEvidencia

/**
 * Evidencia
 * A domain class describes the data object and it's mapping to the database
 */
class Evidencia {

    /* Default (injected) attributes of GORM */
	Long	id
	Long	version

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

    Boolean deleted
    Boolean newInstance
    /*static transients = [ 'deleted' ,'newInstance']*/

    String sector
    Long numero
    Long cantidad
    String observaciones
    EnumTipoEvidencia tipo

    static	belongsTo	= [resultado: ResultadoHecho]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.

    static constraints = {
        resultado unique: ['sector','numero']
    }

}
