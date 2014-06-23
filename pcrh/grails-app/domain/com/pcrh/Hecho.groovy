package com.pcrh

/**
 * Hecho
 * A domain class describes the data object and it's mapping to the database
 */
class Hecho implements Serializable{

	/* Default (injected) attributes of GORM */
	Long    id
    Long	version
	
	/* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

    String idHecho
    Date fechaHecho
    String horaSolicitud
    String horaArribo
    String horaFinal
    Comisaria comisariaInterviniente
    Caratula caratula
    FormaRecepcion formaRecepcion
    String movil
    String observaciones
    String victima
    String imputado
    LugarHecho lugarHecho
    String magistradoInterviniente
    Persona perito
    Documento pu
    Especialidad especialidad
    Documento lef
    ResultadoHecho resultado

	
	static	hasMany		= [hechosRelacionados: Hecho]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
    static mappedBy = [hechosRelacionados:"hechosRelacionados" ]
    static mapping = {
        id generator: 'assigned', name: "idHecho", type: 'string'
        hechosRelacionados updateable: false
        hechosRelacionados insertable: false
    }
	static	constraints = {

    }

    String getIdHechoNumero() {
        def find = idHecho.split('/')
        return find[0]
    }

    String getIdHechoAnio() {
        def find = idHecho.split('/')
        return find[1]
    }
/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
