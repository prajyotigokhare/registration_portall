node
{
    def server = Artifactory.server 'jfrog'
    def rtMaven = Artifactory.newMavenBuild()
    def buildInfo
     
    stage('Poll') {
      checkout([$class: 'GitSCM', branches: [[name: '*/jfrog']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://madhav_mahamuni@bitbucket.org/fs-bitbucket/registration_portal.git']]])
    }
    stage('Build'){
      rtMaven.tool = 'mvn' // Tool name from Jenkins configuration
      rtMaven.deployer releaseRepo: 'releases', server: server
      buildInfo = Artifactory.newBuildInfo()
      //bat 'mvn clean verify -DskipITs=true';
      rtMaven.run pom: 'pom.xml', goals: 'clean install -DskipITs=true', buildInfo: buildInfo
      server.publishBuildInfo buildInfo  
    }
     
    stage ('Download') {
      // Create the download spec.
      def downloadSpec = """{
          "files": [
          {
              "pattern": "releases/it/blog/studentapp-2.2-snapshot.war",
              "target": "target/studentapp-2.2-snapshot.war"
          }]
      }"""
      // Download from Artifactory.
      buildInfo2 = server.download spec: downloadSpec
    }
}
        