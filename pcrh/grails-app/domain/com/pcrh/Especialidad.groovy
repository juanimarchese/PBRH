package com.pcrh

import com.pcrh.enums.EnumEspecialidad

/**
 * Especialidad
 * A domain class describes the data object and it's mapping to the database
 */
class Especialidad {

    /* Default (injected) attributes of GORM */
    Long id
    Long version

    /* Automatic timestamping of GORM */
    Date dateCreated
    Date lastUpdated

    List<EnumEspecialidad> especialidades;
    String otherDescription;

    static hasMany = [especialidades: EnumEspecialidad]
    static belongsTo = [hecho: Hecho]
    // tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    static constraints = {
        especialidades(blank: false, nullable: false)
    }

    @Override
    String toString() {

        String especialidadStr
        for (int i = 0; i < especialidades.size(); i++) {
            if (i == especialidades.size() - 1) {
                especialidadStr =+ especialidades.get(i).getValor()
            } else {
                especialidadStr =+ especialidades.get(i).getValor() + ", "
            }
        }
        if (especialidades.contains(EnumEspecialidad.OTRO)) {
            especialidadStr =+ ',' + otherDescription;
        }
        return especialidadStr;

    }
}
