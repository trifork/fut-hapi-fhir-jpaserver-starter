FROM maven:3.6.1 as maven
WORKDIR /app
COPY pom.xml .
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn -e -B package -DskipTests

FROM tomcat:9-jre11

RUN mkdir -p /data/hapi/lucenefiles && chmod 775 /data/hapi/lucenefiles
COPY --from=maven /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080

CMD ["catalina.sh", "run"]
