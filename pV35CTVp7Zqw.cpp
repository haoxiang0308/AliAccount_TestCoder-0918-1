#include "PlayerInputHandler.h"
#include "Engine/World.h"

APlayerInputHandler::APlayerInputHandler()
{
    // Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
    PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();
}

void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

void APlayerInputHandler::SetupInputComponent()
{
    Super::SetupInputComponent();

    if (InputComponent)
    {
        // Bind axis mappings
        InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
        InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
        InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
        InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

        // Bind action mappings
        InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
        InputComponent->BindAction("Fire", IE_Pressed, this, &APlayerInputHandler::Fire);
    }
}

void APlayerInputHandler::MoveForward(float Value)
{
    if (Value != 0.0f)
    {
        MoveForwardValue = Value;
        // Add movement in the forward direction
        AddMovementInput(GetActorForwardVector(), Value);
    }
}

void APlayerInputHandler::MoveRight(float Value)
{
    if (Value != 0.0f)
    {
        MoveRightValue = Value;
        // Add movement in the right direction
        AddMovementInput(GetActorRightVector(), Value);
    }
}

void APlayerInputHandler::LookUp(float Value)
{
    if (Value != 0.0f)
    {
        // Add look up/down input
        AddControllerPitchInput(Value);
    }
}

void APlayerInputHandler::Turn(float Value)
{
    if (Value != 0.0f)
    {
        // Add turn input
        AddControllerYawInput(Value);
    }
}

void APlayerInputHandler::Jump()
{
    // Trigger jump action
    APlayerController::Jump();
}

void APlayerInputHandler::Fire()
{
    // Trigger fire action
    // This would typically involve spawning a projectile or weapon firing logic
}