package pcrh

import com.pcrh.Hecho
import com.pcrh.enums.EnumCaratula
import com.pcrh.enums.EnumComisaria

/**
 * Created by JuanMarchese on 07/07/2014.
 */
class HechoService {
    def searchHechoByFilters(def params) {
        def idHecho = params.filter.idHecho
        def fechaStr = params.filter.fechaHecho
        def fechaHecho = null
        if (fechaStr != null && fechaStr.length() > 0) fechaHecho = new Date(fechaStr)
        def caratulaEnum = params.filter.caratula.caratula
        def caratulaOther = params.filter.caratula.otherDescription
        def comisariaEnum = params.filter.comisariaInterviniente.comisaria
        def comisariaOther = params.filter.comisariaInterviniente.otherDescription
        def lugar = params.filter.lugar
        def magistrado = params.filter.magistrado
        def hechoCriteria = Hecho.createCriteria()
        def searchResults = hechoCriteria.list(max: params.max, offset: params.offset, sort: params.sort, order: params.order){
            if (idHecho) ilike("idHecho", "%${idHecho}%")
            if (fechaHecho) eq("fechaHecho", fechaHecho)
            caratula{
                if (caratulaEnum) eq("caratula",caratulaEnum as EnumCaratula)
                if (caratulaOther) ilike("otherDescription","%${caratulaOther}%")
            }
            comisariaInterviniente{
                if (comisariaEnum) eq("comisaria", comisariaEnum as EnumComisaria)
                if (comisariaOther) ilike("otherDescription", "%${comisariaOther}%")
            }
            lugarHecho {
                if (lugar) ilike("direccion", "%${lugar}%")
                if (lugar) ilike("localidad", "%${lugar}%")
            }
            if (magistrado) ilike("magistradoInterviniente", "%${magistrado}%")

        }
        [searchResults: searchResults, searchResultSize: searchResults.getTotalCount()]
    }
}
