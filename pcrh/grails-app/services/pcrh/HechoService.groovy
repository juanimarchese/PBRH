package pcrh

import com.pcrh.Hecho

/**
 * Created by JuanMarchese on 07/07/2014.
 */
class HechoService {
    def searchHechoByFilters(def params) {
        def idHecho = params.filter.idHecho
        def fechaStr = params.filter.fechaHecho
        def fechaHecho = null
        if (fechaStr != null && fechaStr.length() > 0) fechaHecho = new Date(fechaStr)
        def hechoCriteria = Hecho.createCriteria()
        def searchResults = hechoCriteria.list(max: params.max, offset: params.offset, sort: params.sort, order: params.order){
            if (idHecho) ilike("idHecho", "%${idHecho}%")
            if (fechaHecho) eq("fechaHecho", fechaHecho)
        }
        [searchResults: searchResults, searchResultSize: searchResults.getTotalCount()]
    }
}
