pipeline 
{
    agent any 
     
      stages {
        stage('pull code') {
           steps {
           git credentialsId: '123', url: 'https://prajyotii@bitbucket.org/fs-bitbucket/registration_portal.git'
               }
             }
        stage('build') 
        {
           steps 
           {
              sh "mvn clean package"
            }
          }

        stage('Test') {
        steps {
             snykSecurity( snykInstallation: 'snyk', snykTokenId: 'snykid' )
           }  
         }
       }
  }