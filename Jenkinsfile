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
    
        stage ('Artifactory Configuration') {
            steps {
                rtServer (
                id: 'soham123',
                url: 'http://soham123.jfrog.io/artifactory/demo-generic-local/',
        // If you're using username and password:
               username: 'soham123',
               password: 'Qazmlp@123',
        // If you're using Credentials ID:
               credentialsId: 'jfrog',
        // If Jenkins is configured to use an http proxy, you can bypass the proxy when using this Artifactory server:
               bypassProxy: true,
        // Configure the connection timeout (in seconds).
        // The default value (if not configured) is 300 seconds: 
               timeout: 300
                )
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
        