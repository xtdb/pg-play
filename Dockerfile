FROM eclipse-temurin:21

LABEL org.opencontainers.image.source=https://github.com/xtdb/pg-play
LABEL org.opencontainers.image.description="XTDB PG Play"
LABEL org.opencontainers.image.licenses="MPL-2.0"

WORKDIR /usr/local/lib/pg-play

ENTRYPOINT ["java", \
    "-Dclojure.main.report=stderr", \
    "-Dlogback.configurationFile=logback.xml", \
    "--add-opens=java.base/java.nio=ALL-UNNAMED", \
    "-Dio.netty.tryReflectionSetAccessible=true", \
    "-cp","pg-play.jar", \
    "clojure.main", "-m", "pg-play.main"]

EXPOSE 5432

ADD build/libs/pg-play.jar pg-play.jar
