#!/usr/bin/env python3
import sys
import os

# Добавляем путь к сгенерированному коду в PYTHONPATH
sys.path.append(os.path.join(os.path.dirname(__file__), 'generated'))

# Импортируем сгенерированные классы
import profile_service_pb2

def create_sample_profile():
    """Создает и возвращает пример профиля."""
    profile = profile_service_pb2.Profile()
    profile.user_id = 12345
    profile.username = "johndoe"
    profile.email = "john.doe@example.com"
    profile.first_name = "John"
    profile.last_name = "Doe"
    profile.created_at = 1672531199  # Пример Unix timestamp
    
    return profile

def main():
    print("Демонстрация работы с ProfileService protobuf")
    
    # Создаем профиль
    profile = create_sample_profile()
    print(f"\nСоздан профиль:\n{profile}")
    
    # Сериализуем профиль в бинарный формат
    serialized_profile = profile.SerializeToString()
    print(f"\nСериализованный профиль (байты): {serialized_profile}")
    
    # Десериализуем профиль обратно
    deserialized_profile = profile_service_pb2.Profile()
    deserialized_profile.ParseFromString(serialized_profile)
    print(f"\nДесериализованный профиль:\n{deserialized_profile}")
    
    # Создаем запрос на получение профиля
    request = profile_service_pb2.GetProfileRequest()
    request.user_id = 12345
    print(f"\nЗапрос на получение профиля:\n{request}")
    
    # Создаем ответ
    response = profile_service_pb2.GetProfileResponse()
    response.profile.CopyFrom(profile)
    response.found = True
    print(f"\nОтвет с профилем:\n{response}")

if __name__ == "__main__":
    main()