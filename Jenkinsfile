pipeline {
    agent any
    
    stages {
        stage ('Welcome') {
            input {
                message "Enter your Name.."
                ok "Proceed"
                submitter "alice,bob"
                parameters {
                    string(name: 'NAME', defaultValue: '', description: 'Please enter your name')
                }
            }
            steps {
                echo "Welcome ${NAME}.. Hope you provided the Required Information"
            }
            
        }
        stage('Create') {
            steps {
                script {
                    CREATE = sh (
                        script: 'echo "curl -v -u $apikey:X -H \\"Content-Type: application/json\\" -d \' { \\"description\\": \\" $Description\\", \\"subject\\": \\" $Title\\", \\"email\\": \\" $Email\\", \\"priority\\": $Priority, \\"status\\": $Status}\' -X POST \'https://$domain_name/api/v2/tickets\' | python -m json.tool"',
                        returnStdout: true
                    )
                    sh "$CREATE"
                }
            }
        }
        stage('View Ticket') {
            steps {
                script {
                    TICKET = sh (
                        script: 'echo "curl -v -u $apikey:X -X GET \'https://$domain_name/api/v2/tickets?per_page=1&include=description\' | python -m json.tool"',
                        returnStdout: true
                    )
                    sh "$TICKET"
                }
            }
        }
    }
    post { 
        success { 
            echo 'Thank You. We have received your Ticket.Our Agent will contact you in a while.'
        }
    }
}
