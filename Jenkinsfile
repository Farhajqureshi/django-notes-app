
pipeline{
    agent {label "vinod"}
    environment {
        SONAR_HOME= tools "Sonar"
    }
    stages{
        stage("Clone The Code in Github"){
            steps {
                echo "Code is Cloned Successfully"
            }
        }
        
        stage("Code Build In The Pipeline"){
            steps{
                echo "Code Build Succefully"
            }
        }
        
        stage("Code Test In The Pipeline"){
            steps{
                echo "Code Test is Successfully"
            }
        }
        
        stage("Code Deploy Succefully"){
            steps{
                echo "Code Deployed Successfully"
            }
        }
    }
}
