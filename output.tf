output "docker_public_ip" {
  value = aws_instance.docker-server.public_ip
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins-server.public_ip
}

output "nexus_public_ip" {
  value = aws_instance.nexus-server.public_ip
}

output "sonarqube_public_ip" {
  value = aws_instance.sonarqube-server.public_ip
}