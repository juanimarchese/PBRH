package com.pcrh.enums

/**
 * Created by Juan-Asus on 22/06/2014.
 */
public enum EnumTipoEvidencia {
    RASTROS("Rastros"),EFECTOS_BALISTICOS("Efectos Balisticos"),MUESTRAS("Muestras")
    private final String valor;

    EnumTipoEvidencia(String valor){
        this.valor = valor;
    }

    String getValor() {
        return valor
    }
}