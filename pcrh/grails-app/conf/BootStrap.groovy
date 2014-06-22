import com.pcrh.security.Role
import com.pcrh.security.User
import com.pcrh.security.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
        def jefeRole = new Role(authority: 'ROLE_JEFE').save(flush: true)

        def testUser = new User(username: 'user',enabled: true, password: 'user')
        testUser.save(flush: true)

        def adminUser = new User(username: 'admin',enabled: true, password: 'admin')
        adminUser.save(flush: true)

        UserRole.create adminUser, adminRole, true
        UserRole.create testUser, userRole, true


    }
    def destroy = {
    }
}
