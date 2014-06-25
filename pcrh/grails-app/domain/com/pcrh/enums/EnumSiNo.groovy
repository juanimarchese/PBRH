package com.pcrh.enums

/**
 * Created by Juan-Asus on 22/06/2014.
 */
public enum EnumSiNo {
        SI("Si"),NO("No")
    private final String valor;

    EnumSiNo(String valor){
        this.valor = valor;
    }

    String getValor() {
        return valor
    }
}