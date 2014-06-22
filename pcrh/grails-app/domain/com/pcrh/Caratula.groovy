package com.pcrh

import com.pcrh.enums.EnumCaratula

/**
 * Caratula
 * A domain class describes the data object and it's mapping to the database
 */
class Caratula implements Serializable{

    /* Default (injected) attributes of GORM */
	Long	id
	Long	version

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

    EnumCaratula caratula;
    String otherDescription;

    static	belongsTo	= [hecho: Hecho]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    static constraints = {
        caratula(blank: false,nullable: false)
    }
}
