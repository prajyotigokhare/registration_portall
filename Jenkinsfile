pipeline {
    agent any 
       environment{
       CI = true
       ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory_access_token')
       JFROG_PASSWORD = credentials('jfrog-password')
       }
       
      stages {
      
        stage('pull code') {
           steps {
           git branch: 'master', credentials: 'BitJen', url: 'https://madhav_mahamuni@bitbucket.org/fs-bitbucket/registration_portal.git'
               }
             }
             
        stage('build') {
           steps {
           sh "./mvnw install"
              }
           }
        

        stage('Publish build info') {
            steps {
                sh 'jf rt upload --url https://madhav29.jfrog.io/ui/repos/tree/General/generic-local --access-token ${ARTIFACTORY_ACCESS_TOKEN} target/sudentapp-2.2_snapshot.war java-web-app/'
                
            }
        }
    }
}
        
        