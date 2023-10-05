pipeline {
    agent any 
    tools {
    jfrog 'jfrog-cli'
     }
    stages {
        stage('pull code') {
           steps {
           git credentialsId: 'BitJen', url: 'https://madhav_mahamuni@bitbucket.org/fs-bitbucket/registration_portal.git'
               }
             }
             
        stage('build') {
           steps {
           sh "mvn clean package"
               }
             }
             
        stage('Test') {
             steps('SonarQube Analysis') {
                withSonarQubeEnv('sonarserver') {
                    sh "mvn sonar:sonar"
               }
            }
        }
    
       // stage ('Artifactory Configuration') {
        //    steps {
        //        rtServer (
         //           id: "jfrog",
         //           url: "https://madhav29.jfrog.io/artifactory/generic-local/"
          //          )
          //    }
      //  }
           stage ('Artifactory Configuration') {
               steps {
                 def server = Artifactory.server 'jfrog'
                   def uploadSpec = """{
                       "files": [{
                       "pattern": "${env.WORKSPACE}/target/studentapp-2.2-snapshot.war",
                       "target": "default-docker-virtual/"
                     }]
                  }"""

                  def buildInfo = server.upload(uploadSpec) 
                  server.publishBuildInfo buildInfo
                  }
               }
        
       // stage('artifacts'){
       //      steps('jfrog-artifactory-storage') {
         //       jf 'rt build-publish'
         //       }
         //   }
        
        //stage('Deploy') {
         //   steps {
          //      deploy adapters: [tomcat9(credentialsId: 'TomJen', path: '', url: 'http://localhost:8081//opt/tomcat/webapps/')], contextPath: null, war: '**/*.war'
        //    }
          //}
        }
    }
        