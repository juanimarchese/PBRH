package com.pcrh.enums

/**
 * Created by Juan-Asus on 22/06/2014.
 */
public enum EnumComisaria {
    SM_P("San Miguel","Primera"),SM_S("San Miguel","Segunda Bella Vista"),SM_T("San Miguel","Tercera SM Oeste"),
    JCP_P("Jose C. Paz","Primera"),JCP_S("Jose C. Paz","Segunda Frino"),JCP_T("Jose C. Paz","Tercera"),
    MA_P("Malvinas Argentinas","Primera Grand Bourg"),MA_S("Malvinas Argentinas","Segunda Los Polvorines"),MA_T("Malvinas Argentinas","Tercera Pablo Noguez"),MA_C("Malvinas Argentinas","Cuarta Tortuguitas"),
    OTRA("Otra","")
    private final String descripcion;
    private final String localidad;
    EnumComisaria(String localidad,String descripcion){
        this.descripcion = descripcion
        this.localidad = localidad
    }

    String getNombre() {
        return localidad + " " + descripcion
    }
}