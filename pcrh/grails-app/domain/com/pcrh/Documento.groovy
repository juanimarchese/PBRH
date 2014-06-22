package com.pcrh

/**
 * Documento
 * A domain class describes the data object and it's mapping to the database
 */
class Documento {

    String filename
    byte[] filedata
    Date uploadDate = new Date()
    static constraints = {
        filename(blank:false,nullable:false)
        filedata(blank: true, nullable:true, maxSize:1073741824)
    }
}
