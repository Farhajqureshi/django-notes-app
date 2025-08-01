pipeline {
  agent any

  environment {
    // Agar tumhe SONAR_HOME ka path chahiye:
    SONAR_HOME = tool "Sonar"
  }

  stages {
    stage('Checkout') {
      steps {
        echo 'Checking out source code from GitHub...'
        git url: "https://github.com/Farhajqureshi/django-notes-app", branch: "main"
      }
    }

    stage('Sonar Qube Analysis') {
      steps {
        withSonarQubeEnv("Sonar"){
            sh "$SONAR_HOME/bin/sonar-scanner -Dsonar.projectName=djnagoapp -Dsonar.projectKey=djangoapp"
        }
      }
    }

    stage('Owasp Dependency Check') {
      steps {
        echo 'Check Dependency Check tests...'
        dependencyCheck additionalArguments: '--scan ./', odcInstallation: 'dc'
        dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
      }
    }

    stage('Sonar QualityGate Check') {
      steps {
        echo 'Starting SonarQube Quality Gate analysis...'
        timeout(time:2, unit:"MINUTES"){
            waitForQualityGate abortPipeline: false
        }
      }
    }

    stage('Check Trivy Scan') {
      steps {
        echo 'Check Trivy Scan To Generate Report...'
        script {
      sh '''
        # install trivy into user directory if missing
        mkdir -p "$HOME/.local/bin"
        export PATH="$HOME/.local/bin:$PATH"

        if ! command -v trivy >/dev/null 2>&1; then
          echo "Installing trivy into $HOME/.local/bin"
          curl -fsSL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b "$HOME/.local/bin"
        fi

        # verify and run scan
        trivy fs --format table -o trivy-fs-report.json .
      '''
    }
      }
      }
  }

  post {
    success {
      echo 'Pipeline completed successfully.'
    }
    always {
          archiveArtifacts artifacts: 'trivy-fs-report.json', fingerprint: true
        }
    failure {
      echo 'Pipeline failed. Check logs for details.'
    }
  }
}
