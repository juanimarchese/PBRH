package com.pcrh.enums

/**
 * Created by Juan-Asus on 22/06/2014.
 */
public enum EnumEspecialidad {
    RASTROS("Rastros"),BALISTICA("Balistica"),PLANIMETRIA("Planimetria"),ACCIDENTOLOGIA("Accidentologia"),FOTOGRAFIA("Fotografia"),OTRO("Otra")
    private final String valor;

    EnumEspecialidad(String valor){
        this.valor = valor;
    }

    String getValor() {
        return valor
    }


}