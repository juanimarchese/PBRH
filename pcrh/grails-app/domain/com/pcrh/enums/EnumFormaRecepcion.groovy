package com.pcrh.enums

/**
 * Created by Juan-Asus on 22/06/2014.
 */
public enum EnumFormaRecepcion {
    FAX("Fax"),RADIO("Radio"),OFICIO("Oficio"),OTRO("Otra")
    private final String valor;

    EnumFormaRecepcion(String valor){
        this.valor = valor;
    }

    String getValor() {
        return valor
    }
}