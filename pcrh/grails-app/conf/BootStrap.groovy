import com.pcrh.Caratula
import com.pcrh.Comisaria
import com.pcrh.Especialidad
import com.pcrh.Evidencia
import com.pcrh.FormaRecepcion
import com.pcrh.Hecho
import com.pcrh.LugarHecho
import com.pcrh.Persona
import com.pcrh.ResultadoHecho
import com.pcrh.enums.EnumCaratula
import com.pcrh.enums.EnumComisaria
import com.pcrh.enums.EnumEspecialidad
import com.pcrh.enums.EnumFormaRecepcion
import com.pcrh.enums.EnumTipoEvidencia
import com.pcrh.enums.EnumZona
import com.pcrh.security.Role
import com.pcrh.security.User
import com.pcrh.security.UserRole

class BootStrap {

    def init = { servletContext ->
      /* def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
        def jefeRole = new Role(authority: 'ROLE_JEFE').save(flush: true)

        def testUser = new User(username: 'user',enabled: true, password: 'user')
        testUser.save(flush: true)

        def adminUser = new User(username: 'admin',enabled: true, password: 'admin')
        adminUser.save(flush: true)

        def jefeUser = new User(username: 'jefe',enabled: true, password: 'jefe')
        jefeUser.save(flush: true)

        UserRole.create adminUser, adminRole, true
        UserRole.create adminUser, userRole, true
        UserRole.create adminUser, jefeRole, true
        UserRole.create testUser, userRole, true
        UserRole.create jefeUser, jefeRole, true
        UserRole.create jefeUser, userRole, true

        def caratula = new Caratula(caratula: EnumCaratula.ABUSO_ARMA)
        def caratulaOther = new Caratula(caratula: EnumCaratula.OTRO,otherDescription: "hola")
        def comisaria = new Comisaria(comisaria: EnumComisaria.JCP_S)
        def comisariaOther = new Comisaria(comisaria: EnumComisaria.OTRA,otherDescription: "hola")
        def especialidad = new Especialidad(especialidad: EnumEspecialidad.FOTOGRAFIA)
        def especialidadOther = new Especialidad(especialidad: EnumEspecialidad.OTRO,otherDescription: "Hola")
        def formaRecepcion = new FormaRecepcion(formaRecepcion: EnumFormaRecepcion.OFICIO)
        def formaRecepcionOther = new FormaRecepcion(formaRecepcion: EnumFormaRecepcion.OTRO,otherDescription: "Hola")
        def lugarHecho = new LugarHecho(direccion: "Tribu",localidad: "San Miguel",zona: EnumZona.RUTA)
        def lugarHecho2 = new LugarHecho(direccion: "Tribu",localidad: "San Miguel",zona: EnumZona.RUTA)
        def persona = new Persona(nombre: "Pedro",apellido: "Suarez",jerarquia: "Oficial").save(flush: true)
        def evidencia = new Evidencia(sector: 'A',numero: 1,tipo: EnumTipoEvidencia.EFECTOS_BALISTICOS,cantidad: 4,observaciones: "HOLASD")
        def evidencia2 = new Evidencia(sector: 'A',numero: 1,tipo: EnumTipoEvidencia.EFECTOS_BALISTICOS,cantidad: 4,observaciones: "HOLASD")
        def resultado = new ResultadoHecho(noPreservado: false,noMoradores: true,sinEvidencia: false);
        resultado.addToEvidencias(evidencia);
        def resultado2 = new ResultadoHecho(noPreservado: false,noMoradores: true,sinEvidencia: false);
        resultado2.addToEvidencias(evidencia2);
        def hecho = new Hecho(idHecho:"1/2014", fechaHecho: new Date(),horaSolicitud: "12:12:12", horaArribo: "12:12:12",horaFinal: "12:12:12",
                comisariaInterviniente: comisaria, caratula:caratula, formaRecepcion:formaRecepcion, movil:"12", observaciones:"Hola",
                victima: "Luis Perez", imputado:"Jose Suarez", lugarHecho: lugarHecho, magistradoInterviniente:"Pedro Suarez",
                perito: persona, pu: null, especialidad: especialidad, lef: null,resultado: resultado).save(flush: true)
        def hecho1 = new Hecho(idHecho:"2/2014", fechaHecho: new Date(),horaSolicitud: "12:12:12", horaArribo: "12:12:12",horaFinal: "12:12:12",
                comisariaInterviniente: comisariaOther, caratula:caratulaOther, formaRecepcion:formaRecepcionOther, movil:"12", observaciones:"Hola",
                victima: "Luis Perez", imputado:"Jose Suarez", lugarHecho: lugarHecho2, magistradoInterviniente:"Pedro Suarez",
                perito: persona, pu: null, especialidad: especialidadOther, lef: null,resultado: resultado2)
        hecho1.addToHechosRelacionados(hecho)
        hecho1.save(flush: true)*/
    }
    def destroy = {
    }
}
