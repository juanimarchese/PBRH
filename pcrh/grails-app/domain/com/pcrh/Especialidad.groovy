package com.pcrh

import com.pcrh.enums.EnumEspecialidad

/**
 * Especialidad
 * A domain class describes the data object and it's mapping to the database
 */
class Especialidad {

    /* Default (injected) attributes of GORM */
    Long	id
    Long	version

    /* Automatic timestamping of GORM */
    Date	dateCreated
    Date	lastUpdated

    EnumEspecialidad especialidad;
    String otherDescription;

    static	belongsTo	= [hecho: Hecho]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    static constraints = {
        especialidad(blank: false,nullable: false)
    }
}
