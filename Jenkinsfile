pipeline {
    agent any 
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
        
        stage('artifacts'){
             steps('jfrog-artifactory-storage') {
                jf 'rt build-publish'
                }
            }
        
        //stage('Deploy') {
         //   steps {
          //      deploy adapters: [tomcat9(credentialsId: 'TomJen', path: '', url: 'http://localhost:8081//opt/tomcat/webapps/')], contextPath: null, war: '**/*.war'
        //    }
          //}
        }
    }
        