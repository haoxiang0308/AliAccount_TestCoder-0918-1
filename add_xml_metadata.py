import xml.etree.ElementTree as ET
import random
import string
from datetime import datetime

def add_metadata_attributes(xml_content):
    """
    Adiciona atributos de metadados a elementos XML
    """
    # Parse do XML
    root = ET.fromstring(xml_content)
    
    # Adiciona metadados gerais ao elemento raiz
    root.set('created_at', datetime.now().isoformat())
    root.set('generator', 'XML_Metadata_Adder')
    
    # Função para adicionar metadados recursivamente
    def add_metadata_to_element(element, level=0):
        # Adiciona ID único ao elemento
        element.set('id', f'elem_{level}_{random_string(6)}')
        
        # Adiciona timestamp de modificação
        element.set('modified_at', datetime.now().isoformat())
        
        # Adiciona nível hierárquico
        element.set('hierarchy_level', str(level))
        
        # Processa os filhos recursivamente
        for child in element:
            add_metadata_to_element(child, level + 1)
    
    # Aplica a função ao elemento raiz
    add_metadata_to_element(root)
    
    return root

def random_string(length):
    """Gera uma string aleatória de comprimento especificado"""
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

def save_xml_with_random_name(root_element, prefix='metadata_xml_'):
    """Salva o elemento XML em um arquivo com nome aleatório"""
    random_name = prefix + random_string(10) + '.xml'
    tree = ET.ElementTree(root_element)
    tree.write(random_name, encoding='utf-8', xml_declaration=True)
    return random_name

# Exemplo de uso
if __name__ == "__main__":
    # XML de exemplo
    sample_xml = """
    <books>
        <book category="fiction">
            <title>Great Gatsby</title>
            <author>F. Scott Fitzgerald</author>
            <year>1925</year>
        </book>
        <book category="science">
            <title>A Brief History of Time</title>
            <author>Stephen Hawking</author>
            <year>1988</year>
        </book>
    </books>
    """
    
    # Adiciona metadados
    root_with_metadata = add_metadata_attributes(sample_xml)
    
    # Salva em arquivo com nome aleatório
    filename = save_xml_with_random_name(root_with_metadata)
    
    print(f"XML com metadados salvos em: {filename}")
    
    # Exibe o XML resultante
    ET.indent(root_with_metadata, space="  ", level=0)  # Para melhor visualização
    print("\nXML resultante:")
    print(ET.tostring(root_with_metadata, encoding='unicode'))