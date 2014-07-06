package com.pcrh.enums

/**
 * Created by Juan-Asus on 22/06/2014.
 */
public enum EnumCaratula {
        HALLASGO_AUTOMOTOR("Hallazgo Automotor"),DANIO("Daño"),HURTO("Hurto"),ROBO("Robo"),ROBO_CALIFICADO("Robo Calificado"),
        PRIV_ILEGAL_LIBERTAD("Priv. Ilegal de la Libertad"), SECUESTRO_EXTORSIVO("Secuestro Extorsivo"),
        ATEN_RESIST_AUTORIDAD("Atent. Resist. A La Autoridad"),ABUSO_ARMA("Abuso de Arma"),LESIONES("Lesiones"),
        TENTATIVA_HOMICIDIO("Tentativa de Homicidio"), HOMICIDIO("Homicidio"),HOMOCIDIO_CULPOSO("Homicidio Culposo"),
        TENTATIVA_SUICIDIO("Tentativa de Suicidio"),AVE_CAUSAL_MUERTE("Averig. Causal de Muerte"),
        MUERTE_ACCIDENTE("Muerte por Accidente"), HALLAZGO_RESTOS_OSEOS("Hallazgo de Restos Oseos"),HALLAZGO_FETO("Hallazgo de Feto"),
        LESIONES_CULPOSAS("Lesiones Culposas"),ABUSO_SEXUAL("Abuso Sexual"),TENENCIA_ARMAS_GUERRA("Tenencia Ileg. de Arma de Guerra"),
        EVASION("Evasion"),AMENAZAS("Amenazas"),OTRO("Otra")
    private final String valor;

    EnumCaratula(String valor){
        this.valor = valor;
    }

    String getValor() {
        return valor
    }
}