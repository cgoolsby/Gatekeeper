name := "spark"

version := "0.1"

scalaVersion := "2.11.8"

val sparkVersion = "2.2.2"

resolvers ++= Seq(
  "apache-snapshots" at "http://repository.apache.org/snapshots/"
)

//val sparkDependencies = Seq(
libraryDependencies ++= Seq(
  "org.apache.spark" %% "spark-core" % sparkVersion,
  "org.apache.spark" %% "spark-sql" % sparkVersion,
//  "datastax" % "spark-cassandra-connector" % "2.11-2.0.8"
  "com.datastax.spark" %% "spark-cassandra-connector" % "2.11-2.0.8" from "file:///spark-cassandra-connector_2.11-2.0.8.jar" withSources() withJavadoc()
//  "com.datastax.spark" %% "spark-cassandra-connector-embedded" % "2.11-2.0.8"
)
//libraryDependencies += "com.datastax.spark" %% "spark-cassandra-connector-java" % "2.11-2.0.8" withSources() withJavadoc()

//assemblyMergeStrategy in assembly := {
//  case PathList("META-INF", xs @ _*) => MergeStrategy.discard
//  case x => MergeStrategy.first
//}


//lazy val sparkDebugger = (project in file("spark-debugger"))
//  .settings(
//    libraryDependencies ++= sparkDependencies.map(_ % "compile")
//  )

//libraryDependencies ++= sparkDependencies.map(_ % "provided")
