package com.pcrh

/**
 * Persona
 * A domain class describes the data object and it's mapping to the database
 */
class Persona {

    /* Default (injected) attributes of GORM */
	Long	id
	Long	version

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

    String nombre
    String apellido
    String jerarquia
}
