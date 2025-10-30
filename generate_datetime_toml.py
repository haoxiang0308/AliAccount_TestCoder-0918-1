import toml
import datetime
import random
import string

# Gerar um datetime atual para marcar o tempo de configuração
config_time = datetime.datetime.now(datetime.timezone.utc)

# Criar dados para o arquivo TOML
data = {
    "config": {
        "timestamp": config_time,
        "description": "Arquivo de configuração com timestamp"
    }
}

# Gerar um nome de arquivo aleatório
random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.toml'

# Salvar o arquivo TOML
with open(random_filename, 'w', encoding='utf-8') as f:
    toml.dump(data, f)

print(f"Arquivo TOML criado: {random_filename}")
print(f"Timestamp: {config_time}")