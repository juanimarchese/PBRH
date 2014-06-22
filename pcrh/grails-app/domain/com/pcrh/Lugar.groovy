package com.pcrh

import com.pcrh.enums.EnumZona

/**
 * Lugar
 * A domain class describes the data object and it's mapping to the database
 */
class Lugar {

    /* Default (injected) attributes of GORM */
	Long	id
	Long	version

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

    String direccion
    String localidad

	static constraints = {
        direccion(blank: false,nullable: false)
        localidad(blank: false,nullable: false)
    }

}
