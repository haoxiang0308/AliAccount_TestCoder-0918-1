#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "PlayerInputHandler.generated.h"

UCLASS()
class APlayerInputHandler : public ACharacter
{
    GENERATED_BODY()

public:
    // Sets default values for this character's properties
    APlayerInputHandler();

protected:
    // Called when the game starts or when spawned
    virtual void BeginPlay() override;

public:
    // Called every frame
    virtual void Tick(float DeltaTime) override;

    // Called to bind functionality to input
    virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

    // Movement functions
    void MoveForward(float Value);
    void MoveRight(float Value);

    // Look functions
    void LookUp(float Value);
    void Turn(float Value);

private:
    // Camera boom and follow camera
    class USpringArmComponent* CameraBoom;
    class UCameraComponent* FollowCamera;

    // Variables for movement
    FVector2D CurrentVelocity;
};