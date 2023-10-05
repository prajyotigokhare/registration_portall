pipeline {
    agent any
    tools {
        jfrog 'jfrog-cli'
    }
    stages {
        stage('Clone') {
            steps {
                git branch: 'jenkins', url: "https://madhav_mahamuni@bitbucket.org/fs-bitbucket/registration_portal.git"
            }
        }

        stage('Exec Maven commands') {
            steps {
                dir('maven-examples/maven-example') {
                    // Configure Maven project's repositories
                    jf 'mvn-config --repo-resolve-releases libs-release --repo-resolve-snapshots libs-snapshots --repo-deploy-releases libs-release-local --repo-deploy-snapshots libs-snapshot-local'

                    // Install and publish project
                    jf 'mvn clean install'
                }
            }
        }

        stage('Publish build info') {
            steps {
                jf 'rt build-publish'
            }
        }
    }
}
        