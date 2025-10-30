import xml.etree.ElementTree as ET
import random
import string
import os

def add_metadata_attributes(xml_content, metadata_dict):
    """
    Adiciona atributos de metadados a todos os elementos XML
    
    Args:
        xml_content (str): Conteúdo XML como string
        metadata_dict (dict): Dicionário com metadados a serem adicionados
    
    Returns:
        str: XML com atributos de metadados adicionados
    """
    # Parse do XML
    root = ET.fromstring(xml_content)
    
    # Função recursiva para adicionar atributos a todos os elementos
    def add_attributes_to_element(element):
        # Adiciona os atributos de metadados ao elemento atual
        for key, value in metadata_dict.items():
            element.set(key, str(value))
        
        # Aplica recursivamente a todos os filhos
        for child in element:
            add_attributes_to_element(child)
    
    # Aplica a função ao elemento raiz
    add_attributes_to_element(root)
    
    # Retorna o XML modificado como string
    return ET.tostring(root, encoding='unicode')

def generate_random_filename(extension='xml'):
    """
    Gera um nome de arquivo aleatório
    
    Args:
        extension (str): Extensão do arquivo
    
    Returns:
        str: Nome de arquivo aleatório
    """
    random_string = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    return f"{random_string}.{extension}"

def main():
    # Exemplo de conteúdo XML
    xml_sample = """<?xml version="1.0" encoding="UTF-8"?>
<root>
    <person id="1">
        <name>John Doe</name>
        <age>30</age>
        <email>john@example.com</email>
    </person>
    <person id="2">
        <name>Jane Smith</name>
        <age>25</age>
        <email>jane@example.com</email>
    </person>
</root>"""
    
    # Dicionário com metadados a serem adicionados
    metadata = {
        'created_by': 'xml_processor',
        'creation_date': '2023-10-30',
        'version': '1.0',
        'source': 'sample_data'
    }
    
    # Adiciona os atributos de metadados ao XML
    modified_xml = add_metadata_attributes(xml_sample, metadata)
    
    # Gera um nome de arquivo aleatório
    random_filename = generate_random_filename('xml')
    
    # Salva o XML modificado no arquivo com nome aleatório
    with open(random_filename, 'w', encoding='utf-8') as file:
        file.write(modified_xml)
    
    print(f"XML com metadados salvos em: {random_filename}")
    print("Conteúdo do arquivo:")
    print(modified_xml)

if __name__ == "__main__":
    main()