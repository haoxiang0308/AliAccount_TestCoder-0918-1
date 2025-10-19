#include "PlayerInputHandler.h"

APlayerInputHandler::APlayerInputHandler()
{
    // Set this pawn to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
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
    MoveForwardValue = Value;
    // Add movement logic here
    // Example: AddMovementInput(GetActorForwardVector(), Value);
}

void APlayerInputHandler::MoveRight(float Value)
{
    MoveRightValue = Value;
    // Add movement logic here
    // Example: AddMovementInput(GetActorRightVector(), Value);
}

void APlayerInputHandler::LookUp(float Value)
{
    // Add look up/down logic here
    AddControllerPitchInput(Value);
}

void APlayerInputHandler::Turn(float Value)
{
    // Add turn logic here
    AddControllerYawInput(Value);
}

void APlayerInputHandler::Jump()
{
    // Add jump logic here
    // Example: GetCharacter()->Jump();
}

void APlayerInputHandler::Fire()
{
    // Add fire logic here
    // Example: Shoot a projectile or weapon
}