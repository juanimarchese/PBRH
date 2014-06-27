package com.pcrh

/**
 * Peritos
 * A domain class describes the data object and it's mapping to the database
 */
class Peritos {

    /* Default (injected) attributes of GORM */
	Long	id
	Long	version

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

    List<Persona> peritos
    String otros

	static	belongsTo	= [hecho: Hecho]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
	static	hasMany		= [peritos: Persona]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static	mappedBy	= []	// specifies which property should be used in a mapping 
    static mapping = {
        peritos cascade:'save-update'
    }
   /* static mapping = {
    }

    static constraints = {
    }*/

    public String peritosIDs(){
        String ids = "[";
        for (int i= 0; i< peritos.size();i++){
            if(i == peritos.size()-1){
                ids += peritos.get(i).getId()
            } else {
                ids += peritos.get(i).getId() + ", "
            }
        }
        ids += "]";
        return ids;
    }
    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI
//	public String toString() {
//		return "${name}";
//	}
}
