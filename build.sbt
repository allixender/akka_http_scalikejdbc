lazy val akkaVersion    = "2.5.8"
lazy val akkaHttpVersion = "10.1.0-RC1"

lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization    := "ee.ut",
      scalaVersion    := "2.11.12"
    )),
    name := "Akka Http Fluxnet",
    libraryDependencies ++= Seq(
      "com.typesafe.akka" %% "akka-http"            % akkaHttpVersion,
      "com.typesafe.akka" %% "akka-stream"          % akkaVersion,

      "de.heikoseeberger" %% "akka-http-play-json"      % "1.20.0-RC1",
      "com.typesafe.play" %% "play-json"            % "2.6.8",

      "org.scalikejdbc"   %% "scalikejdbc"          % "3.2.1",
      "org.scalikejdbc"   %% "scalikejdbc-config"   % "3.2.1",
      "ch.qos.logback"    %  "logback-classic"      % "1.2.3",

      "org.scalikejdbc"   %% "scalikejdbc-test"     % "3.2.1"   % "test",

      "com.typesafe.akka" %% "akka-http-testkit"    % akkaHttpVersion % Test,
      "com.typesafe.akka" %% "akka-stream-testkit"  % akkaVersion     % Test,
      "com.typesafe.akka" %% "akka-testkit"         % akkaVersion     % Test,
      "org.scalatest"     %% "scalatest"            % "3.0.1"         % Test
    ),
    scalacOptions ++= Seq(
      "-encoding", "UTF-8",
      "-deprecation", // warning and location for usages of deprecated APIs
      "-feature", // warning and location for usages of features that should be imported explicitly
      "-unchecked", // additional warnings where generated code depends on assumptions
      "-Xlint:_", // recommended additional warnings
      "-Ywarn-adapted-args", // Warn if an argument list is modified to match the receiver
      "-Ywarn-value-discard", // Warn when non-Unit expression results are unused
      "-Ywarn-unused-import", // Warn when imports are unused
      "-Ywarn-unused", // Warn when local and private vals, vars, defs, and types are unused
      "-Ywarn-numeric-widen", // Warn when numerics are widened, Int and Double, for instance
      "-Ywarn-inaccessible", // Warn about inaccessible types in method signatures.
      "-Ywarn-dead-code", // Warn when dead code is identified
      "-Ywarn-infer-any", // Warn when a type argument is inferred to be `Any`
      "-Ywarn-nullary-override", //  Warn when non-nullary `def f()' overrides nullary `def f'.
      "-Ywarn-nullary-unit", // Warn when nullary methods return Unit
      "-language:reflectiveCalls",
      "-language:postfixOps" // too lazy?
    ),
    resolvers += Resolver.bintrayRepo("hseeberger", "maven")
  ).
  settings(inThisBuild(
    assemblyJarName in assembly := "akka-fluxdata.jar"
  )).
  enablePlugins(JavaAppPackaging)
