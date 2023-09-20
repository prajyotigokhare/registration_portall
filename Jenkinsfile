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
        
        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://localhost:8081//home/fs-shubhranshu/Tomcat/apache-tomcat-9.0.78/webapps/')], contextPath: null, war: '**/*.war'
            }
          }
        }
    }
        