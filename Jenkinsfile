pipeline{
    agent any
    tools {
        maven 'maven3'
    }
    environment {
        TAG = getRevision()
    }
    stages{
        stage('SCM checkout'){
            steps{
                git credentialsId: 'githubcred', 
                url: 'https://github.com/venky2575/hello-world.git'
            }
        }
         stage('Maven Build'){
            steps{
                sh "mvn clean package"
            }
        }
         stage('Docker Build'){
            steps{
                sh "docker build . -t venky2575/newpipeline:${TAG}"
            }
        }
        stage('Docker Push'){
            steps{
                withCredentials([string(credentialsId: 'venky2575', variable: 'dockercred')]) {
                sh "docker login -u venky2575 -p ${dockercred}"    
                }
                sh "docker push venky2575/newpipeline:${TAG}"
            }
        }
        stage('Deploy'){
            steps{
                sh "docker build . -t venky2575/newpipeline:${TAG}"
            }
        }
    }
}
def getRevision(){
    def Commit= sh label: '', returnStdout: true, script: 'git rev-parse --short HEAD'
    return Commit
}
