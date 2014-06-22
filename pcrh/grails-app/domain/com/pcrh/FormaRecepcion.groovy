package com.pcrh

import com.pcrh.enums.EnumFormaRecepcion

/**
 * FormaRecepcion
 * A domain class describes the data object and it's mapping to the database
 */
class FormaRecepcion {

    /* Default (injected) attributes of GORM */
    Long	id
    Long	version

    /* Automatic timestamping of GORM */
    Date	dateCreated
    Date	lastUpdated

    EnumFormaRecepcion formaRecepcion;
    String otherDescription;

    static	belongsTo	= [hecho: Hecho]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    static constraints = {
        formaRecepcion(blank: false,nullable: false)
    }
}
