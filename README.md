# Variáveis de ambiente

1. Utilize o arquivo .env.example e crie o .env
2. Preencha as variáveis presentes no arquivo

# Configuração do Colima (Mac Os)

1. Paara que o Colima realize a leitura das pastas corretamente é necessário que sua montagem seja utiliza no padrão '9p'
2. Utilize o prompt abaixo para realizar a montagem do Colima no padrão necessário para seu funcionamento correto:
```bash
colima stop (caso iniciado)
colima delete
colima start --mount-type 9p --memory 5 --cpu 3
```