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
               snykSecurity ( failOnError: false, snykInstallation: 'snyk', snykTokenId: 'snykid' )
             //snykSecurity( snykInstallation: 'snyk', snykTokenId: 'snykid' )
             
             //snykSecurity ( snykInstallation: 'snyk', snykTokenId: 'snykmainorg' )
             //snykSecurity snykInstallation: 'snyk', snykTokenId: 'snykmainorgs2'
           }  
         }
         //stage ('Deploy') {
         //steps  {
         //deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://localhost:8081/')], contextPath: null, war: '**/*.war'
          //}
       //}
       }
  }