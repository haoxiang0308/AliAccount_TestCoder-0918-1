import toml
import datetime
import secrets
import string
import os

# Criar um dicionário com dados de configuração contendo um datetime
config_data = {
    "configuracao": {
        "tempo_registro": datetime.datetime.now().isoformat()
    }
}

# Gerar um nome de arquivo aleatório
random_filename = ''.join(secrets.choice(string.ascii_letters + string.digits) for _ in range(10)) + ".toml"
full_path = os.path.join("/workspace", random_filename)

# Salvar os dados em formato TOML no arquivo com nome aleatório
with open(full_path, 'w', encoding='utf-8') as f:
    toml.dump(config_data, f)

print(f"Arquivo TOML criado com sucesso: {full_path}")
print(f"Conteúdo do arquivo:")
with open(full_path, 'r', encoding='utf-8') as f:
    print(f.read())