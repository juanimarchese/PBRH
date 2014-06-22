package com.pcrh

/**
 * Salida
 * A domain class describes the data object and it's mapping to the database
 */
class Salida {

    /* Default (injected) attributes of GORM */
	Long	id
	Long	version

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

	Date fechaSalida
    Documento archivoConstancia
    String destino
    Evidencia evidencia

    Hecho getHecho() {
        return evidencia.getResultado().getHecho()
    }

}
