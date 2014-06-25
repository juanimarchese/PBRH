package com.pcrh

import org.apache.commons.collections.FactoryUtils
import org.apache.commons.collections.ListUtils
import org.apache.commons.collections.list.LazyList

/**
 * ResultadoHecho
 * A domain class describes the data object and it's mapping to the database
 */
class ResultadoHecho {

    /* Default (injected) attributes of GORM */
	Long	id
	Long	version

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated
    Boolean noPreservado
    Boolean noMoradores
    Boolean sinEvidencia
    List evidencias
	static	belongsTo	= [hecho: Hecho]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	static	hasMany		= [evidencias: Evidencia]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
	static	mappedBy	= [evidencias: "resultado"]	// specifies which property should be used in a mapping
    static mapping = {
        evidencias cascade:"all-delete-orphan"
    }
}
