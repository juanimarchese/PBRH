dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}



// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost/pcrh?useUnicode=yes&characterEncoding=UTF-8"
            username = "root"
            password = "root"
        }
        hibernate {
            show_sql = true
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost/pcrh?useUnicode=yes&characterEncoding=UTF-8"
            username = "root"
            password = "root"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost/pcrh?autoReconnect=true&useUnicode=yes&characterEncoding=UTF-8"
            username = "pcrh"
            password = "Poli46649994"
            driverClassName = "com.mysql.jdbc.Driver"
            properties {
                maxActive = 100
                maxIdle = 25
                minIdle = 5
                initialSize = 10
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                maxWait = 10000
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false

                validationQuery = "select 1 from dual"
            }
        }
    }
}
