package com.pcrh

import com.pcrh.enums.EnumComisaria

/**
 * Comisaria
 * A domain class describes the data object and it's mapping to the database
 */
class Comisaria {

    /* Default (injected) attributes of GORM */
	Long	id
	Long	version

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

    EnumComisaria comisaria;
    String otherDescription;

	static	belongsTo	= [hecho: Hecho]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    static constraints = {
        comisaria(blank: false,nullable: false)
    }

    @Override
    String toString() {
        if (comisaria.getNombre().equals(EnumComisaria.OTRA.getNombre())){
            return otherDescription;
        }
        return comisaria.getNombre();
    }
}
