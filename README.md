# desafio-devops
Desafio DevOps: Hello World com Docker, Terraform, CI/CD e monitoramento

# DESAFIO DEVOPS

Projeto de infraestrutura completo para deploy de uma aplicação simples com monitoramento, CI/CD e IaC.

---------------------------------------------------------------------------------------------------------

# STACK UTILIZADA

#
 - Aplicação
 -> HTML + Nginx

# 
 - Containerização
 -> Docker + Docker Compose

#
 - IaC
 -> Terraform

#
 - CI/CD
 -> GitHub Actions + Self-hosted Runner

#
 - Monitoramento
 -> Prometheus + cAdvisor

#
 - Visualização
 -> Grafana

#
 - Sistema Operacional
 -> Ubuntu Linux

---------------------------------------------------------------------------------------------------------

 # ARQUITETURA

 -> GitHub Push
        ↓
        ↓
 -> GitHub Actions
        ↓
        ↓
 -> Docker Compose
        ↓
        ↓
 -> Usuário acessa em: Hello-world (Nginx:8080)
 -> Monitoramento em: Prometheus (9090) | cAdvisor (8081) | Grafana (3000)

---------------------------------------------------------------------------------------------------------

# ESTRUTURA DO PROJETO

desafio-devops/
|-app/
|    l   index.html     # Site de acesso do usuário
|-prometheus/
|    l   prometheus.yml     # Configuração do Prometheus
|-terraform/
|    l   main.tf    # Infraestrutura como Código
|-.github/
|    l   workflows/
|        l  deploy.yml  # Pipeline do CI/CD
|-dockerfile    # Imagem da Aplicação
|-docker-compose.yml    # Orquestração dos containers
|README.md      # Documentação

---------------------------------------------------------------------------------------------------------

# COMO EXECUTAR

## NECESSÁRIO

 - Ubuntu Linux;
 - Docker e Docker Compose instalados;
 - Git instalado.

### 1. Clone o repositório no GitHub

git clone https://github.com/DaviG222/desafio-devops.git
cd desafio-devops

### 2. Containers UP

docker compose up -d --build

### 3. Acesse os serviços

Site - http://localhost:8080
Prometheus - http://localhost:9090
cAdvisor - http://localhost:8081
Grafana - http://localhost:3000

Usuário grafana: 'admin' | Senha: 'admin123'

---------------------------------------------------------------------------------------------------------

# CI/CD

O pipeline é disparado automaticamente a cada git push na branch main

 - Checkout do código
 - Build da imagem Docker
 - Restart dos containers
 - Verificação do status

---------------------------------------------------------------------------------------------------------

# TERRAFORM

Para provisionar a infraestrutura via Terraform

cd terraform
terraform init
terraform plan
terraform apply

Para destruir

terraform destroy

# MONITORAMENTO

O Grafana exibe métricas em tempo real de todos os containers

 - Uso de CPU
 - Uso de memória
 - Tráfego de rede

Dashboard utilizado: [cAdvisor Exporter (ID: 14282)]
(https://grafana.com/grafana/dashboards/14282)

---------------------------------------------------------------------------------------------------------

# AUTOR

**DaviG222** - Desafio Devops 