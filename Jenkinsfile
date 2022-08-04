pipeline {
    agent any
    stages {
        stage('Build') {
           
            steps {
                echo "Creating the ticket..."
                sh 'curl -v -u Jbdi00QTpDnrEJ37IUy9:X -H "Content-Type: application/json" -d \'{ "description": "Ticket Created from Jenkins", "subject": "Raised from Jenkins", "email": "clboone@freshdesk.com", "priority": 1, "status": 2, "source": 3 }\' -X POST \'https://srikartest1.freshpo.com/api/v2/tickets\''
              
            }
        }
    }
    post { 
        success { 
            echo 'Ticket Has been Created Successfully'
        }
    }
}
