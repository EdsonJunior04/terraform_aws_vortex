# Solução de Monitoramento e Relatório de Acessos a Sites

## **Problemática**

Criar uma solução capaz de:
- Coletar os dados de acesso a sites (rastreio).
- Identificar o tipo de site acessado e seu respectivo conteúdo.
- Comparar os dados novos com os existentes (caso haja).
- Gerar relatórios de acesso sob demanda (diário, semanal, mensal, anual).

---

## **Infraestrutura Utilizada**

| NTopNG | Grafana | Ubuntu | Debian | InfluxDB | AWS | Python | Terraform | Docker | Github | WinSrv  |
|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|---------|
| <img src="https://i0.wp.com/www.ntop.org/wp-content/uploads/2015/05/ntopng-logo.png?ssl=1" title="ntopng" alt="ntopng" width="55" height="55"> | <img src="https://github.com/devicons/devicon/blob/master/icons/grafana/grafana-original.svg" title="grafana" alt="Grafana" width="55" height="55"> | <img src="https://skillicons.dev/icons?i=ubuntu" title="ubuntu" alt="Ubuntu" width="55" height="55">| <img src="https://skillicons.dev/icons?i=debian" title="debian" alt="Debian" width="55" height="55"> | <img src="https://github.com/devicons/devicon/blob/master/icons/influxdb/influxdb-original-wordmark.svg" title="influxdb" alt="influxdb" width="55" height="55"> | <img src="https://github.com/tandpfun/skill-icons/blob/main/icons/AWS-Light.svg" title="aws" alt="AWS" width="55" height="55"> | <img src="https://github.com/devicons/devicon/blob/master/icons/python/python-original.svg" title="python" alt="Python" width="55" height="55"> | <img src="https://github.com/devicons/devicon/blob/master/icons/terraform/terraform-original.svg" title="terraform" alt="Terraform" width="55" height="55"> | <img src="https://github.com/devicons/devicon/blob/master/icons/docker/docker-original-wordmark.svg" title="docker" alt="Docker" width="55" height="55"> | <img src="https://skillicons.dev/icons?i=github" title="github" alt="GitHub" width="55" height="55"> | <img src="https://github.com/tandpfun/skill-icons/blob/main/icons/Windows-Light.svg" title="winsrv" alt="winsrv" width="55" height="55"> |


### **On-Premises**
- **Servidor Active Directory (AD):**
  - Utilizado para criar e gerenciar usuários que se autenticam na rede local.
- **Servidor Squid Proxy:**
  - Realiza a autenticação dos usuários no AD via LDAP.
  - Coleta os logs de acesso aos sites pelos clientes.
- **Servidor NTopNG:**
  - Captura e monitora o tráfego de rede utilizando NetFlow.
- **Rede Local:**
  - Computadores clientes executando Windows.

### **Nuvem AWS**
- **Servidor EC2:**
  - Configurado para hospedar:
    - **Grafana:** Cria dashboards personalizados e exibe relatórios gerados.
    - **InfluxDB 2:** Banco de dados para armazenar os logs de acesso e métricas coletadas.

#### **Serviços Utilizados na AWS:**
- **VPC:** Configurada para isolar a infraestrutura em uma rede privada.
- **EC2:** Instância para hospedar os serviços.
- **Security Groups:** Configurados para controlar o acesso aos serviços hospedados.

---

## **Serviços e Ferramentas Utilizadas**

- **Python:**
  - Script para enviar os logs do Squid Proxy para o InfluxDB.
- **Telegraf:**
  - Configurado para enviar os dados de tráfego NetFlow capturados pelo NTopNG para o InfluxDB.

---

## **Arquitetura da Solução**

1. **Captura de Dados:**
   - O Squid Proxy coleta os logs de acesso dos usuários autenticados no AD via LDAP.
   - O NTopNG captura o tráfego de rede utilizando NetFlow.
2. **Armazenamento e Processamento:**
   - Os logs do Squid Proxy são enviados para o InfluxDB via script Python.
   - O Telegraf encaminha os dados de tráfego do NTopNG para o InfluxDB.
3. **Visualização e Relatórios:**
   - O Grafana utiliza os dados armazenados no InfluxDB para criar dashboards personalizados.
   - Relatórios de acesso são gerados sob demanda com base nos dados do InfluxDB.

---

## **Configurações Realizadas**

### **No Squid Proxy:**
- Configurado para autenticar os usuários no AD via LDAP.
- Logs de acesso configurados para serem exportados.

### **No NTopNG:**
- Captura do tráfego NetFlow configurada.
- Exportação de dados para o Telegraf habilitada.

### **No InfluxDB:**
- Buckets criados para armazenar os dados enviados pelo Squid Proxy e NTopNG.
- Configuração de autenticação via tokens para segurança.

### **No Grafana:**
- Dashboards personalizados criados para exibir:
  - Sites acessados.
  - Conteúdo e categorias dos sites.
  - Relatórios comparativos e históricos.

### **Na AWS:**
- Security Groups configurados para permitir acesso apenas de IPs autorizados.
- EC2 configurada com acesso restrito à porta 8086 (InfluxDB) e 3000 (Grafana).

---

## **Gerenciamento de Relatórios**

- Relatórios podem ser solicitados diretamente via painel do Grafana.
- Períodos disponíveis:
  - Diário
  - Semanal
  - Mensal
  - Anual
- Os relatórios incluem:
  - Lista de sites acessados.
  - Classificação dos sites.
  - Comparativos com dados históricos.

---

## **Colaboradores**

| Nome | GitHub | Linkedin |
| ---| ---| ---|
| Edson Maciel | [<img src="https://skillicons.dev/icons?i=github" title="github" alt="GitHub" width="55" height="55">](https://github.com/EdsonJunior04) | [<img src="https://github.com/tandpfun/skill-icons/blob/main/icons/LinkedIn.svg" title="linkedin" alt="linkedin" width="55" height="55">](https://www.linkedin.com/in/edsonjunior04/) |
| Laura Alves | [<img src="https://skillicons.dev/icons?i=github" title="github" alt="GitHub" width="55" height="55">](https://github.com/Laura-alvez) | [<img src="https://github.com/tandpfun/skill-icons/blob/main/icons/LinkedIn.svg" title="linkedin" alt="linkedin" width="55" height="55">](https://www.linkedin.com/in/laura-alves-b4879022b/) |
| Levi Venancio | [<img src="https://skillicons.dev/icons?i=github" title="github" alt="GitHub" width="55" height="55">](https://github.com/levivenancio) | [<img src="https://github.com/tandpfun/skill-icons/blob/main/icons/LinkedIn.svg" title="linkedin" alt="linkedin" width="55" height="55">](https://www.linkedin.com/in/levivenancio/) |
| Lucca Gentilezza | [<img src="https://skillicons.dev/icons?i=github" title="github" alt="GitHub" width="55" height="55">](https://github.com/LuccaVG) | [<img src="https://github.com/tandpfun/skill-icons/blob/main/icons/LinkedIn.svg" title="linkedin" alt="linkedin" width="55" height="55">](https://www.linkedin.com/in/luccavieiragentilezza/) |
| Rebeca Jaine | [<img src="https://skillicons.dev/icons?i=github" title="github" alt="GitHub" width="55" height="55">](https://github.com/jainezd) | [<img src="https://github.com/tandpfun/skill-icons/blob/main/icons/LinkedIn.svg" title="linkedin" alt="linkedin" width="55" height="55">](https://www.linkedin.com/in/rebeca-jaine-da-silva-a72127270/) |
