import json
import random
import string
import os


def save_user_data(user_data, directory="./user_data"):
    """
    Manipula um dicionário com dados de usuário e salva em um arquivo com nome aleatório.
    
    Args:
        user_data (dict): Dicionário contendo os dados do usuário
        directory (str): Diretório onde o arquivo será salvo (padrão: "./user_data")
    
    Returns:
        str: Caminho completo do arquivo salvo
    """
    # Cria o diretório se ele não existir
    os.makedirs(directory, exist_ok=True)
    
    # Gera um nome de arquivo aleatório
    random_filename = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.json'
    filepath = os.path.join(directory, random_filename)
    
    # Salva os dados do usuário no arquivo
    with open(filepath, 'w', encoding='utf-8') as file:
        json.dump(user_data, file, ensure_ascii=False, indent=4)
    
    return filepath


def load_user_data(filepath):
    """
    Carrega dados de usuário de um arquivo JSON.
    
    Args:
        filepath (str): Caminho do arquivo a ser carregado
    
    Returns:
        dict: Dicionário com os dados do usuário
    """
    with open(filepath, 'r', encoding='utf-8') as file:
        return json.load(file)


def update_user_data(filepath, new_data):
    """
    Atualiza dados de usuário em um arquivo existente.
    
    Args:
        filepath (str): Caminho do arquivo a ser atualizado
        new_data (dict): Novos dados para atualizar o usuário
    
    Returns:
        str: Caminho do arquivo atualizado
    """
    # Carrega os dados existentes
    try:
        with open(filepath, 'r', encoding='utf-8') as file:
            existing_data = json.load(file)
    except FileNotFoundError:
        existing_data = {}
    
    # Atualiza os dados com os novos valores
    existing_data.update(new_data)
    
    # Salva os dados atualizados
    with open(filepath, 'w', encoding='utf-8') as file:
        json.dump(existing_data, file, ensure_ascii=False, indent=4)
    
    return filepath


# Exemplo de uso
if __name__ == "__main__":
    # Dados de exemplo do usuário
    user_info = {
        "nome": "João Silva",
        "idade": 30,
        "email": "joao.silva@example.com",
        "cidade": "São Paulo",
        "interesses": ["Python", "Data Science", "Web Development"]
    }
    
    # Salva os dados do usuário
    saved_file = save_user_data(user_info)
    print(f"Dados do usuário salvos em: {saved_file}")
    
    # Carrega e exibe os dados salvos
    loaded_data = load_user_data(saved_file)
    print(f"Dados carregados: {loaded_data}")
    
    # Atualiza os dados do usuário
    updated_info = {
        "idade": 31,
        "profissao": "Desenvolvedor Python"
    }
    update_user_data(saved_file, updated_info)
    
    # Carrega e exibe os dados atualizados
    updated_data = load_user_data(saved_file)
    print(f"Dados atualizados: {updated_data}")