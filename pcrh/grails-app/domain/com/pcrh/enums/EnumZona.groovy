package com.pcrh.enums

/**
 * Created by Juan-Asus on 22/06/2014.
 */
public enum EnumZona {
    RUTA("Zona de Ruta"),URBANA("Zona Urbana")
    private final String valor;

    EnumZona(String valor){
        this.valor = valor;
    }

    String getValor() {
        return valor
    }
}