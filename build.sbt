site.settings

ghpages.settings

git.remoteRepo := "git@github.com:ThoughtWorksInc/Binding.scala-workshop.git"

val js = project

scalaVersion in ThisBuild := "2.11.7"

import com.typesafe.sbt.SbtSite.SiteKeys
import org.scalajs.core.tools.io.FileVirtualJSFile
SiteKeys.siteMappings ++= {
  val linked = (scalaJSLinkedFile in js in Compile).value.asInstanceOf[FileVirtualJSFile]
  Seq(
    linked.file -> "Binding.scala-workshop.js",
    linked.sourceMapFile -> "Binding.scala-workshop.js.map"
  )
}
