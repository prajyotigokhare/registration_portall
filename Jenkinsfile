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
            snykSecurity organisation: 'Fineshift End to End Implementation', snykInstallation: 'snyk', snykTokenId: 'snykid'
            //snykSecurity ( failOnError: false, snykInstallation: 'snyk', snykTokenId: 'snykid' )
            
           }  
         }
         //stage ('Deploy') {
         //steps  {
         //deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://localhost:8081/')], contextPath: null, war: '**/*.war'
          //}
       //}
       }
  }