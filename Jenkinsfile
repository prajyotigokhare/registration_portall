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
       stage('jfrog-artifactorty')  {
          step('jfrog'){
           unclassified:
             jFrogPlatformBuilder:
               jfrogInstances:
                 - serverId: "soham123"
                   url: "https://soham123.jfrog.io"
                   artifactoryUrl: "https://soham123.jfrog.io/artifactory"
                   distributionUrl: "https://soham123.jfrog.io/distribution"
                   xrayUrl: "https://soham123.jfrog.io/xray"
                   credentialsConfig:
                     credentialsId: "jfrog"
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
        