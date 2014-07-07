package pcrh

import com.pcrh.Hecho

/**
 * Created by JuanMarchese on 07/07/2014.
 */
class HechoService {
    def searchHechoByFilters(def params) {
        def searchFor = params.searchable
        def hechoCriteria = Hecho.createCriteria()
        def searchResults = hechoCriteria.list(max: params.max, offset: params.offset, sort: params.sort, order: params.order){
            ilike("idHecho", "${searchFor}%")
        }
        [searchResults: searchResults, searchResultSize: searchResults.getTotalCount()]
    }
}
