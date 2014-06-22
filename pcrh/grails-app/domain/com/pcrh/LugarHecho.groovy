package com.pcrh

import com.pcrh.enums.EnumZona

/**
 * LugarHecho
 * A domain class describes the data object and it's mapping to the database
 */
class LugarHecho extends Lugar{


    EnumZona zona;

    static	belongsTo	= [hecho: Hecho]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.

    static constraints = {
        zona(blank: false, nullable: false)
    }
}
