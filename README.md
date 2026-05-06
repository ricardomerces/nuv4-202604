# AWS Provisioning com Terraform - Aula 8

Este projeto utiliza o Terraform para provisionar uma infraestrutura básica na AWS (região `us-east-2`), composta por uma instância EC2 rodando Ubuntu 26.04 LTS e um bucket S3.

## 🚀 Recursos Criados

* **Instância EC2:** Tipo `t3.micro` com disco de 8GB (gp3) executando o Ubuntu 26.04 LTS de forma dinâmica (sempre a AMI mais recente).
* **Security Group:** Nomeado `ssh`, liberando o tráfego de entrada na porta 22 (SSH).
* **Bucket S3:** Nomeado `nuv4-aula8` para armazenamento de objetos.

## 📁 Estrutura do Projeto

* `main.tf`: Declaração dos recursos (EC2, S3, Security Group e Data Source da AMI).
* `variables.tf`: Definição das variáveis do projeto (região, tipo de instância, etc).


## 🛠️ Pré-requisitos

1.  Ter o [Terraform](https://developer.hashicorp.com/terraform/downloads) instalado.
2.  Ter o [AWS CLI](https://aws.amazon.com/cli/) configurado com suas credenciais.
3.  Possuir uma Key Pair (chave privada) com o nome **`aula8`** previamente criada na região `us-east-2`.

## ⚙️ Como Executar

1. Inicialize o diretório do Terraform para baixar o provedor AWS:
   ```bash
   terraform init