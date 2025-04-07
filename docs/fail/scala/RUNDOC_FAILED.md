## Build the application image with the pack CLI

Now build an image named `my-image-name` by executing the heroku builder against the application by running the
`pack build` command:

```
$ pack build my-image-name --path .
===> ANALYZING
Image with name "my-image-name" not found
===> DETECTING
3 of 4 buildpacks participating
heroku/jvm      6.1.2
heroku/sbt      6.1.2
heroku/procfile 4.2.1
===> RESTORING
Skipping buildpack layer analysis
===> BUILDING

[Installing OpenJDK 17.0.13]

[Building Scala project]
Running: sbt compile stage
Downloading sbt launcher for 1.7.2:
  From  https://repo1.maven.org/maven2/org/scala-sbt/sbt-launch/1.7.2/sbt-launch-1.7.2.jar
    To  /layers/heroku_sbt/sbt-extras/launchers/1.7.2/sbt-launch.jar
Downloading sbt launcher 1.7.2 md5 hash:
  From  https://repo1.maven.org/maven2/org/scala-sbt/sbt-launch/1.7.2/sbt-launch-1.7.2.jar.md5
    To  /layers/heroku_sbt/sbt-extras/launchers/1.7.2/sbt-launch.jar.md5
/layers/heroku_sbt/sbt-extras/launchers/1.7.2/sbt-launch.jar: OK
Picked up JAVA_TOOL_OPTIONS: -Dfile.encoding=UTF-8
[info] [launcher] getting org.scala-sbt sbt 1.7.2  (this may take some time)...
[info] [launcher] getting Scala 2.12.16 (for sbt)...
[info] welcome to sbt 1.7.2 (Azul Systems, Inc. Java 17.0.13)
[info] loading global plugins from /layers/heroku_sbt/sbt-global/plugins
[info] compiling 1 Scala source to /layers/heroku_sbt/sbt-global/plugins/target/scala-2.12/sbt-1.0/classes ...
[info] Non-compiled module 'compiler-bridge_2.12' for Scala 2.12.16. Compiling...
[info]   Compilation completed in 8.185s.
[info] done compiling
[info] loading settings for project workspace-build from plugins.sbt ...
[info] loading project definition from /workspace/project
[warn] 
[warn] 	Note: Some unresolved dependencies have extra attributes.  Check that these dependencies exist with the requested attributes.
[warn] 		com.typesafe.sbt:sbt-js-engine:1.2.3 (scalaVersion=2.12, sbtVersion=1.0)
[warn] 		com.typesafe.sbt:sbt-native-packager:1.5.2 (scalaVersion=2.12, sbtVersion=1.0)
[warn] 		org.foundweekends.giter8:sbt-giter8-scaffold:0.13.1 (sbtVersion=1.0, scalaVersion=2.12)
[warn] 		com.lightbend.sbt:sbt-javaagent:0.1.5 (scalaVersion=2.12, sbtVersion=1.0)
[warn] 		com.typesafe.sbt:sbt-twirl:1.5.1 (scalaVersion=2.12, sbtVersion=1.0)
[warn] 		com.typesafe.sbt:sbt-web:1.4.4 (scalaVersion=2.12, sbtVersion=1.0)
[warn] 
[warn] 	Note: Unresolved dependencies path:
[error] sbt.librarymanagement.ResolveException: Error downloading com.typesafe.sbt:sbt-js-engine;sbtVersion=1.0;scalaVersion=2.12:1.2.3
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-js-engine_2.12_1.0/1.2.3/sbt-js-engine-1.2.3.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-js-engine/scala_2.12/sbt_1.0/1.2.3/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-js-engine/scala_2.12/sbt_1.0/1.2.3/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.typesafe.sbt/sbt-js-engine/scala_2.12/sbt_1.0/1.2.3/ivys/ivy.xml
[error] Error downloading com.typesafe.sbt:sbt-native-packager;sbtVersion=1.0;scalaVersion=2.12:1.5.2
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-native-packager_2.12_1.0/1.5.2/sbt-native-packager-1.5.2.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-native-packager/scala_2.12/sbt_1.0/1.5.2/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-native-packager/scala_2.12/sbt_1.0/1.5.2/ivys/ivy.xml
[error]   org.xml.sax.SAXParseException; lineNumber: 1; columnNumber: 326; The reference to entity "display" must end with the ';' delimiter. (The reference to entity "display" must end with the ';' delimiter.)
[error] Error downloading org.foundweekends.giter8:sbt-giter8-scaffold;sbtVersion=1.0;scalaVersion=2.12:0.13.1
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/org/foundweekends/giter8/sbt-giter8-scaffold_2.12_1.0/0.13.1/sbt-giter8-scaffold-0.13.1.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localorg.foundweekends.giter8/sbt-giter8-scaffold/scala_2.12/sbt_1.0/0.13.1/ivys/ivy.xml
[error]   checksum format error: /layers/heroku_sbt/coursier-home/cache/https/repo.scala-sbt.org/scalasbt/sbt-plugin-releases/org.foundweekends.giter8/sbt-giter8-scaffold/scala_2.12/sbt_1.0/0.13.1/ivys/ivy.xml.sha1
[error]   checksum format error: /layers/heroku_sbt/coursier-home/cache/https/repo.typesafe.com/typesafe/ivy-releases/org.foundweekends.giter8/sbt-giter8-scaffold/scala_2.12/sbt_1.0/0.13.1/ivys/ivy.xml.sha1
[error] Error downloading com.lightbend.sbt:sbt-javaagent;sbtVersion=1.0;scalaVersion=2.12:0.1.5
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/lightbend/sbt/sbt-javaagent_2.12_1.0/0.1.5/sbt-javaagent-0.1.5.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.lightbend.sbt/sbt-javaagent/scala_2.12/sbt_1.0/0.1.5/ivys/ivy.xml
[error]   org.xml.sax.SAXParseException; lineNumber: 1; columnNumber: 326; The reference to entity "display" must end with the ';' delimiter. (The reference to entity "display" must end with the ';' delimiter.)
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.lightbend.sbt/sbt-javaagent/scala_2.12/sbt_1.0/0.1.5/ivys/ivy.xml
[error] Error downloading com.typesafe.sbt:sbt-twirl;sbtVersion=1.0;scalaVersion=2.12:1.5.1
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-twirl_2.12_1.0/1.5.1/sbt-twirl-1.5.1.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-twirl/scala_2.12/sbt_1.0/1.5.1/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-twirl/scala_2.12/sbt_1.0/1.5.1/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.typesafe.sbt/sbt-twirl/scala_2.12/sbt_1.0/1.5.1/ivys/ivy.xml
[error] Error downloading com.typesafe.sbt:sbt-web;sbtVersion=1.0;scalaVersion=2.12:1.4.4
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-web_2.12_1.0/1.4.4/sbt-web-1.4.4.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-web/scala_2.12/sbt_1.0/1.4.4/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-web/scala_2.12/sbt_1.0/1.4.4/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.typesafe.sbt/sbt-web/scala_2.12/sbt_1.0/1.4.4/ivys/ivy.xml
[error] 	at lmcoursier.CoursierDependencyResolution.unresolvedWarningOrThrow(CoursierDependencyResolution.scala:345)
[error] 	at lmcoursier.CoursierDependencyResolution.$anonfun$update$38(CoursierDependencyResolution.scala:314)
[error] 	at scala.util.Either$LeftProjection.map(Either.scala:573)
[error] 	at lmcoursier.CoursierDependencyResolution.update(CoursierDependencyResolution.scala:314)
[error] 	at sbt.librarymanagement.DependencyResolution.update(DependencyResolution.scala:60)
[error] 	at sbt.internal.LibraryManagement$.resolve$1(LibraryManagement.scala:59)
[error] 	at sbt.internal.LibraryManagement$.$anonfun$cachedUpdate$12(LibraryManagement.scala:133)
[error] 	at sbt.util.Tracked$.$anonfun$lastOutput$1(Tracked.scala:73)
[error] 	at sbt.internal.LibraryManagement$.$anonfun$cachedUpdate$20(LibraryManagement.scala:146)
[error] 	at scala.util.control.Exception$Catch.apply(Exception.scala:228)
[error] 	at sbt.internal.LibraryManagement$.$anonfun$cachedUpdate$11(LibraryManagement.scala:146)
[error] 	at sbt.internal.LibraryManagement$.$anonfun$cachedUpdate$11$adapted(LibraryManagement.scala:127)
[error] 	at sbt.util.Tracked$.$anonfun$inputChangedW$1(Tracked.scala:219)
[error] 	at sbt.internal.LibraryManagement$.cachedUpdate(LibraryManagement.scala:160)
[error] 	at sbt.Classpaths$.$anonfun$updateTask0$1(Defaults.scala:3687)
[error] 	at scala.Function1.$anonfun$compose$1(Function1.scala:49)
[error] 	at sbt.internal.util.$tilde$greater.$anonfun$$u2219$1(TypeFunctions.scala:62)
[error] 	at sbt.std.Transform$$anon$4.work(Transform.scala:68)
[error] 	at sbt.Execute.$anonfun$submit$2(Execute.scala:282)
[error] 	at sbt.internal.util.ErrorHandling$.wideConvert(ErrorHandling.scala:23)
[error] 	at sbt.Execute.work(Execute.scala:291)
[error] 	at sbt.Execute.$anonfun$submit$1(Execute.scala:282)
[error] 	at sbt.ConcurrentRestrictions$$anon$4.$anonfun$submitValid$1(ConcurrentRestrictions.scala:265)
[error] 	at sbt.CompletionService$$anon$2.call(CompletionService.scala:64)
[error] 	at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:264)
[error] 	at java.base/java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:539)
[error] 	at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:264)
[error] 	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1136)
[error] 	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:635)
[error] 	at java.base/java.lang.Thread.run(Thread.java:840)
[error] (update) sbt.librarymanagement.ResolveException: Error downloading com.typesafe.sbt:sbt-js-engine;sbtVersion=1.0;scalaVersion=2.12:1.2.3
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-js-engine_2.12_1.0/1.2.3/sbt-js-engine-1.2.3.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-js-engine/scala_2.12/sbt_1.0/1.2.3/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-js-engine/scala_2.12/sbt_1.0/1.2.3/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.typesafe.sbt/sbt-js-engine/scala_2.12/sbt_1.0/1.2.3/ivys/ivy.xml
[error] Error downloading com.typesafe.sbt:sbt-native-packager;sbtVersion=1.0;scalaVersion=2.12:1.5.2
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-native-packager_2.12_1.0/1.5.2/sbt-native-packager-1.5.2.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-native-packager/scala_2.12/sbt_1.0/1.5.2/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-native-packager/scala_2.12/sbt_1.0/1.5.2/ivys/ivy.xml
[error]   org.xml.sax.SAXParseException; lineNumber: 1; columnNumber: 326; The reference to entity "display" must end with the ';' delimiter. (The reference to entity "display" must end with the ';' delimiter.)
[error] Error downloading org.foundweekends.giter8:sbt-giter8-scaffold;sbtVersion=1.0;scalaVersion=2.12:0.13.1
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/org/foundweekends/giter8/sbt-giter8-scaffold_2.12_1.0/0.13.1/sbt-giter8-scaffold-0.13.1.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localorg.foundweekends.giter8/sbt-giter8-scaffold/scala_2.12/sbt_1.0/0.13.1/ivys/ivy.xml
[error]   checksum format error: /layers/heroku_sbt/coursier-home/cache/https/repo.scala-sbt.org/scalasbt/sbt-plugin-releases/org.foundweekends.giter8/sbt-giter8-scaffold/scala_2.12/sbt_1.0/0.13.1/ivys/ivy.xml.sha1
[error]   checksum format error: /layers/heroku_sbt/coursier-home/cache/https/repo.typesafe.com/typesafe/ivy-releases/org.foundweekends.giter8/sbt-giter8-scaffold/scala_2.12/sbt_1.0/0.13.1/ivys/ivy.xml.sha1
[error] Error downloading com.lightbend.sbt:sbt-javaagent;sbtVersion=1.0;scalaVersion=2.12:0.1.5
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/lightbend/sbt/sbt-javaagent_2.12_1.0/0.1.5/sbt-javaagent-0.1.5.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.lightbend.sbt/sbt-javaagent/scala_2.12/sbt_1.0/0.1.5/ivys/ivy.xml
[error]   org.xml.sax.SAXParseException; lineNumber: 1; columnNumber: 326; The reference to entity "display" must end with the ';' delimiter. (The reference to entity "display" must end with the ';' delimiter.)
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.lightbend.sbt/sbt-javaagent/scala_2.12/sbt_1.0/0.1.5/ivys/ivy.xml
[error] Error downloading com.typesafe.sbt:sbt-twirl;sbtVersion=1.0;scalaVersion=2.12:1.5.1
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-twirl_2.12_1.0/1.5.1/sbt-twirl-1.5.1.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-twirl/scala_2.12/sbt_1.0/1.5.1/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-twirl/scala_2.12/sbt_1.0/1.5.1/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.typesafe.sbt/sbt-twirl/scala_2.12/sbt_1.0/1.5.1/ivys/ivy.xml
[error] Error downloading com.typesafe.sbt:sbt-web;sbtVersion=1.0;scalaVersion=2.12:1.4.4
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-web_2.12_1.0/1.4.4/sbt-web-1.4.4.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-web/scala_2.12/sbt_1.0/1.4.4/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-web/scala_2.12/sbt_1.0/1.4.4/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.typesafe.sbt/sbt-web/scala_2.12/sbt_1.0/1.4.4/ivys/ivy.xml
[warn] Project loading failed: (r)etry, (q)uit, (l)ast, or (i)gnore? (default: r)

[Error: Unexpected sbt exit code]
sbt unexpectedly exited with code '1'. The most common reason for this are
problems with your application code and/or build configuration.

Please refer to the sbt output above for details. If you believe this error is not
caused by your application, please open an issue on GitHub:
https://github.com/heroku/buildpacks-jvm/issues/new

ERROR: failed to build: exit status 1
ERROR: failed to build: executing lifecycle: failed with status code: 51
```
<!-- STOP. This document is autogenerated. Do not manually modify. See the top of the doc for more details. -->

> [!NOTE]
> Your output may differ.

Verify that you see “Successfully built image my-image-name” at the end of the output. And verify that the image is present locally:

```
$ pack build my-image-name --path .
===> ANALYZING
Image with name "my-image-name" not found
===> DETECTING
3 of 4 buildpacks participating
heroku/jvm      6.1.2
heroku/sbt      6.1.2
heroku/procfile 4.2.1
===> RESTORING
Skipping buildpack layer analysis
===> BUILDING

[Installing OpenJDK 17.0.13]

[Building Scala project]
Running: sbt compile stage
Downloading sbt launcher for 1.7.2:
  From  https://repo1.maven.org/maven2/org/scala-sbt/sbt-launch/1.7.2/sbt-launch-1.7.2.jar
    To  /layers/heroku_sbt/sbt-extras/launchers/1.7.2/sbt-launch.jar
Downloading sbt launcher 1.7.2 md5 hash:
  From  https://repo1.maven.org/maven2/org/scala-sbt/sbt-launch/1.7.2/sbt-launch-1.7.2.jar.md5
    To  /layers/heroku_sbt/sbt-extras/launchers/1.7.2/sbt-launch.jar.md5
/layers/heroku_sbt/sbt-extras/launchers/1.7.2/sbt-launch.jar: OK
Picked up JAVA_TOOL_OPTIONS: -Dfile.encoding=UTF-8
[info] [launcher] getting org.scala-sbt sbt 1.7.2  (this may take some time)...
[info] [launcher] getting Scala 2.12.16 (for sbt)...
[info] welcome to sbt 1.7.2 (Azul Systems, Inc. Java 17.0.13)
[info] loading global plugins from /layers/heroku_sbt/sbt-global/plugins
[info] compiling 1 Scala source to /layers/heroku_sbt/sbt-global/plugins/target/scala-2.12/sbt-1.0/classes ...
[info] Non-compiled module 'compiler-bridge_2.12' for Scala 2.12.16. Compiling...
[info]   Compilation completed in 8.185s.
[info] done compiling
[info] loading settings for project workspace-build from plugins.sbt ...
[info] loading project definition from /workspace/project
[warn] 
[warn] 	Note: Some unresolved dependencies have extra attributes.  Check that these dependencies exist with the requested attributes.
[warn] 		com.typesafe.sbt:sbt-js-engine:1.2.3 (scalaVersion=2.12, sbtVersion=1.0)
[warn] 		com.typesafe.sbt:sbt-native-packager:1.5.2 (scalaVersion=2.12, sbtVersion=1.0)
[warn] 		org.foundweekends.giter8:sbt-giter8-scaffold:0.13.1 (sbtVersion=1.0, scalaVersion=2.12)
[warn] 		com.lightbend.sbt:sbt-javaagent:0.1.5 (scalaVersion=2.12, sbtVersion=1.0)
[warn] 		com.typesafe.sbt:sbt-twirl:1.5.1 (scalaVersion=2.12, sbtVersion=1.0)
[warn] 		com.typesafe.sbt:sbt-web:1.4.4 (scalaVersion=2.12, sbtVersion=1.0)
[warn] 
[warn] 	Note: Unresolved dependencies path:
[error] sbt.librarymanagement.ResolveException: Error downloading com.typesafe.sbt:sbt-js-engine;sbtVersion=1.0;scalaVersion=2.12:1.2.3
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-js-engine_2.12_1.0/1.2.3/sbt-js-engine-1.2.3.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-js-engine/scala_2.12/sbt_1.0/1.2.3/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-js-engine/scala_2.12/sbt_1.0/1.2.3/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.typesafe.sbt/sbt-js-engine/scala_2.12/sbt_1.0/1.2.3/ivys/ivy.xml
[error] Error downloading com.typesafe.sbt:sbt-native-packager;sbtVersion=1.0;scalaVersion=2.12:1.5.2
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-native-packager_2.12_1.0/1.5.2/sbt-native-packager-1.5.2.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-native-packager/scala_2.12/sbt_1.0/1.5.2/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-native-packager/scala_2.12/sbt_1.0/1.5.2/ivys/ivy.xml
[error]   org.xml.sax.SAXParseException; lineNumber: 1; columnNumber: 326; The reference to entity "display" must end with the ';' delimiter. (The reference to entity "display" must end with the ';' delimiter.)
[error] Error downloading org.foundweekends.giter8:sbt-giter8-scaffold;sbtVersion=1.0;scalaVersion=2.12:0.13.1
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/org/foundweekends/giter8/sbt-giter8-scaffold_2.12_1.0/0.13.1/sbt-giter8-scaffold-0.13.1.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localorg.foundweekends.giter8/sbt-giter8-scaffold/scala_2.12/sbt_1.0/0.13.1/ivys/ivy.xml
[error]   checksum format error: /layers/heroku_sbt/coursier-home/cache/https/repo.scala-sbt.org/scalasbt/sbt-plugin-releases/org.foundweekends.giter8/sbt-giter8-scaffold/scala_2.12/sbt_1.0/0.13.1/ivys/ivy.xml.sha1
[error]   checksum format error: /layers/heroku_sbt/coursier-home/cache/https/repo.typesafe.com/typesafe/ivy-releases/org.foundweekends.giter8/sbt-giter8-scaffold/scala_2.12/sbt_1.0/0.13.1/ivys/ivy.xml.sha1
[error] Error downloading com.lightbend.sbt:sbt-javaagent;sbtVersion=1.0;scalaVersion=2.12:0.1.5
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/lightbend/sbt/sbt-javaagent_2.12_1.0/0.1.5/sbt-javaagent-0.1.5.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.lightbend.sbt/sbt-javaagent/scala_2.12/sbt_1.0/0.1.5/ivys/ivy.xml
[error]   org.xml.sax.SAXParseException; lineNumber: 1; columnNumber: 326; The reference to entity "display" must end with the ';' delimiter. (The reference to entity "display" must end with the ';' delimiter.)
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.lightbend.sbt/sbt-javaagent/scala_2.12/sbt_1.0/0.1.5/ivys/ivy.xml
[error] Error downloading com.typesafe.sbt:sbt-twirl;sbtVersion=1.0;scalaVersion=2.12:1.5.1
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-twirl_2.12_1.0/1.5.1/sbt-twirl-1.5.1.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-twirl/scala_2.12/sbt_1.0/1.5.1/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-twirl/scala_2.12/sbt_1.0/1.5.1/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.typesafe.sbt/sbt-twirl/scala_2.12/sbt_1.0/1.5.1/ivys/ivy.xml
[error] Error downloading com.typesafe.sbt:sbt-web;sbtVersion=1.0;scalaVersion=2.12:1.4.4
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-web_2.12_1.0/1.4.4/sbt-web-1.4.4.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-web/scala_2.12/sbt_1.0/1.4.4/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-web/scala_2.12/sbt_1.0/1.4.4/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.typesafe.sbt/sbt-web/scala_2.12/sbt_1.0/1.4.4/ivys/ivy.xml
[error] 	at lmcoursier.CoursierDependencyResolution.unresolvedWarningOrThrow(CoursierDependencyResolution.scala:345)
[error] 	at lmcoursier.CoursierDependencyResolution.$anonfun$update$38(CoursierDependencyResolution.scala:314)
[error] 	at scala.util.Either$LeftProjection.map(Either.scala:573)
[error] 	at lmcoursier.CoursierDependencyResolution.update(CoursierDependencyResolution.scala:314)
[error] 	at sbt.librarymanagement.DependencyResolution.update(DependencyResolution.scala:60)
[error] 	at sbt.internal.LibraryManagement$.resolve$1(LibraryManagement.scala:59)
[error] 	at sbt.internal.LibraryManagement$.$anonfun$cachedUpdate$12(LibraryManagement.scala:133)
[error] 	at sbt.util.Tracked$.$anonfun$lastOutput$1(Tracked.scala:73)
[error] 	at sbt.internal.LibraryManagement$.$anonfun$cachedUpdate$20(LibraryManagement.scala:146)
[error] 	at scala.util.control.Exception$Catch.apply(Exception.scala:228)
[error] 	at sbt.internal.LibraryManagement$.$anonfun$cachedUpdate$11(LibraryManagement.scala:146)
[error] 	at sbt.internal.LibraryManagement$.$anonfun$cachedUpdate$11$adapted(LibraryManagement.scala:127)
[error] 	at sbt.util.Tracked$.$anonfun$inputChangedW$1(Tracked.scala:219)
[error] 	at sbt.internal.LibraryManagement$.cachedUpdate(LibraryManagement.scala:160)
[error] 	at sbt.Classpaths$.$anonfun$updateTask0$1(Defaults.scala:3687)
[error] 	at scala.Function1.$anonfun$compose$1(Function1.scala:49)
[error] 	at sbt.internal.util.$tilde$greater.$anonfun$$u2219$1(TypeFunctions.scala:62)
[error] 	at sbt.std.Transform$$anon$4.work(Transform.scala:68)
[error] 	at sbt.Execute.$anonfun$submit$2(Execute.scala:282)
[error] 	at sbt.internal.util.ErrorHandling$.wideConvert(ErrorHandling.scala:23)
[error] 	at sbt.Execute.work(Execute.scala:291)
[error] 	at sbt.Execute.$anonfun$submit$1(Execute.scala:282)
[error] 	at sbt.ConcurrentRestrictions$$anon$4.$anonfun$submitValid$1(ConcurrentRestrictions.scala:265)
[error] 	at sbt.CompletionService$$anon$2.call(CompletionService.scala:64)
[error] 	at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:264)
[error] 	at java.base/java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:539)
[error] 	at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:264)
[error] 	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1136)
[error] 	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:635)
[error] 	at java.base/java.lang.Thread.run(Thread.java:840)
[error] (update) sbt.librarymanagement.ResolveException: Error downloading com.typesafe.sbt:sbt-js-engine;sbtVersion=1.0;scalaVersion=2.12:1.2.3
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-js-engine_2.12_1.0/1.2.3/sbt-js-engine-1.2.3.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-js-engine/scala_2.12/sbt_1.0/1.2.3/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-js-engine/scala_2.12/sbt_1.0/1.2.3/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.typesafe.sbt/sbt-js-engine/scala_2.12/sbt_1.0/1.2.3/ivys/ivy.xml
[error] Error downloading com.typesafe.sbt:sbt-native-packager;sbtVersion=1.0;scalaVersion=2.12:1.5.2
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-native-packager_2.12_1.0/1.5.2/sbt-native-packager-1.5.2.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-native-packager/scala_2.12/sbt_1.0/1.5.2/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-native-packager/scala_2.12/sbt_1.0/1.5.2/ivys/ivy.xml
[error]   org.xml.sax.SAXParseException; lineNumber: 1; columnNumber: 326; The reference to entity "display" must end with the ';' delimiter. (The reference to entity "display" must end with the ';' delimiter.)
[error] Error downloading org.foundweekends.giter8:sbt-giter8-scaffold;sbtVersion=1.0;scalaVersion=2.12:0.13.1
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/org/foundweekends/giter8/sbt-giter8-scaffold_2.12_1.0/0.13.1/sbt-giter8-scaffold-0.13.1.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localorg.foundweekends.giter8/sbt-giter8-scaffold/scala_2.12/sbt_1.0/0.13.1/ivys/ivy.xml
[error]   checksum format error: /layers/heroku_sbt/coursier-home/cache/https/repo.scala-sbt.org/scalasbt/sbt-plugin-releases/org.foundweekends.giter8/sbt-giter8-scaffold/scala_2.12/sbt_1.0/0.13.1/ivys/ivy.xml.sha1
[error]   checksum format error: /layers/heroku_sbt/coursier-home/cache/https/repo.typesafe.com/typesafe/ivy-releases/org.foundweekends.giter8/sbt-giter8-scaffold/scala_2.12/sbt_1.0/0.13.1/ivys/ivy.xml.sha1
[error] Error downloading com.lightbend.sbt:sbt-javaagent;sbtVersion=1.0;scalaVersion=2.12:0.1.5
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/lightbend/sbt/sbt-javaagent_2.12_1.0/0.1.5/sbt-javaagent-0.1.5.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.lightbend.sbt/sbt-javaagent/scala_2.12/sbt_1.0/0.1.5/ivys/ivy.xml
[error]   org.xml.sax.SAXParseException; lineNumber: 1; columnNumber: 326; The reference to entity "display" must end with the ';' delimiter. (The reference to entity "display" must end with the ';' delimiter.)
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.lightbend.sbt/sbt-javaagent/scala_2.12/sbt_1.0/0.1.5/ivys/ivy.xml
[error] Error downloading com.typesafe.sbt:sbt-twirl;sbtVersion=1.0;scalaVersion=2.12:1.5.1
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-twirl_2.12_1.0/1.5.1/sbt-twirl-1.5.1.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-twirl/scala_2.12/sbt_1.0/1.5.1/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-twirl/scala_2.12/sbt_1.0/1.5.1/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.typesafe.sbt/sbt-twirl/scala_2.12/sbt_1.0/1.5.1/ivys/ivy.xml
[error] Error downloading com.typesafe.sbt:sbt-web;sbtVersion=1.0;scalaVersion=2.12:1.4.4
[error]   Not found
[error]   Not found
[error]   not found: https://repo1.maven.org/maven2/com/typesafe/sbt/sbt-web_2.12_1.0/1.4.4/sbt-web-1.4.4.pom
[error]   not found: /layers/heroku_sbt/ivy-home/localcom.typesafe.sbt/sbt-web/scala_2.12/sbt_1.0/1.4.4/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases/com.typesafe.sbt/sbt-web/scala_2.12/sbt_1.0/1.4.4/ivys/ivy.xml
[error]   download error: Caught java.io.IOException (Server returned HTTP response code: 409 for URL: https://landing.jfrog.com/reactivate-server/scala) while downloading https://repo.typesafe.com/typesafe/ivy-releases/com.typesafe.sbt/sbt-web/scala_2.12/sbt_1.0/1.4.4/ivys/ivy.xml
[warn] Project loading failed: (r)etry, (q)uit, (l)ast, or (i)gnore? (default: r)

[Error: Unexpected sbt exit code]
sbt unexpectedly exited with code '1'. The most common reason for this are
problems with your application code and/or build configuration.

Please refer to the sbt output above for details. If you believe this error is not
caused by your application, please open an issue on GitHub:
https://github.com/heroku/buildpacks-jvm/issues/new

ERROR: failed to build: exit status 1
ERROR: failed to build: executing lifecycle: failed with status code: 51
```
<!-- STOP. This document is autogenerated. Do not manually modify. See the top of the doc for more details. -->
