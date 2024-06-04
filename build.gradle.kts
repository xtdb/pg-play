import xtdb.DataReaderTransformer

plugins {
    // Apply the application plugin to add support for building a CLI application in Java.
    application
    id("dev.clojurephant.clojure") version "0.8.0-beta.7"
    id("com.github.johnrengelman.shadow")
}

repositories {
    // Use Maven Central for resolving dependencies.
    mavenCentral()
    maven(uri("https://repo.clojars.org"))
    maven(uri("https://s01.oss.sonatype.org/content/repositories/snapshots"))
}

dependencies {
    implementation(libs.xtdbApi)
    implementation(libs.xtdbCore)
    implementation("integrant", "integrant", "0.10.0")
    implementation("com.xtdb.labs", "xtdb-pgwire-server" , "2.0.0-SNAPSHOT")
    implementation("ch.qos.logback", "logback-classic", "1.4.5")
}

// Apply a specific Java toolchain to ease working on different environments.
java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(21)
    }
}

application {
    mainClass.set("clojure.main")
}

tasks.shadowJar {
    archiveBaseName.set("pg-play")
    archiveVersion.set("")
    archiveClassifier.set("")
    mergeServiceFiles()
    transform(DataReaderTransformer())
}
