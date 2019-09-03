
FROM maven:3.6.1 as war
WORKDIR /app
COPY pom.xml .
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn -e -B package

FROM jetty:9-jre11
USER jetty:jetty
COPY --from=war /app/target/hapi-fhir-jpaserver.war /var/lib/jetty/webapps/hapi-fhir-jpaserver.war
EXPOSE 8080
