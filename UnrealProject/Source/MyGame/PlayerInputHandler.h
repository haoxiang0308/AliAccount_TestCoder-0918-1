// PlayerInputHandler.h
// A class to handle player input in Unreal Engine

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

    // Rotation functions
    void Turn(float Rate);
    void LookUp(float Rate);

    // Action functions
    void StartRunning();
    void StopRunning();

private:
    // Base turn rate, in deg/sec. Other scaling may affect final turn rate.
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = Camera, meta = (AllowPrivateAccess = "true"))
    float BaseTurnRate = 45.0f;

    // Base look up/down rate, in deg/sec. Other scaling may affect final rate.
    UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category = Camera, meta = (AllowPrivateAccess = "true"))
    float BaseLookUpRate = 45.0f;

    // Walking speed
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = Movement, meta = (AllowPrivateAccess = "true"))
    float WalkSpeed = 600.0f;

    // Running speed
    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = Movement, meta = (AllowPrivateAccess = "true"))
    float RunSpeed = 900.0f;
};