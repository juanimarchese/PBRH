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

    Long creationUserId;

	Date fechaSalida
    Date fechaEntrada
    Documento archivoConstancia
    String destino
    String observaciones
    Hecho hecho
    Evidencia evidencia

    static mapping = {
        archivoConstancia cascade: 'all'
    }



}
