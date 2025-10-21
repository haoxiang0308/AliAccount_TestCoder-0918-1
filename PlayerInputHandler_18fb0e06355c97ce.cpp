#include "PlayerInputHandler.h"
#include "Engine/World.h"

APlayerInputHandler::APlayerInputHandler()
{
    // Set this pawn to call Tick() every frame
    PrimaryActorTick.bCanEverTick = true;
}

void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();
    
    // Initialization code here
}

void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);

    // Add any per-frame logic here
}

void APlayerInputHandler::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Binding axis mappings
    if (InputComponent)
    {
        InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
        InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
        InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
        InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

        // Binding action mappings
        InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
        InputComponent->BindAction("Fire", IE_Pressed, this, &APlayerInputHandler::Fire);
    }
}

void APlayerInputHandler::MoveForward(float Value)
{
    if (Value != 0.0f)
    {
        MoveForwardValue = Value;
        // Add movement logic here
        AddMovementInput(GetActorForwardVector(), Value);
    }
}

void APlayerInputHandler::MoveRight(float Value)
{
    if (Value != 0.0f)
    {
        MoveRightValue = Value;
        // Add movement logic here
        AddMovementInput(GetActorRightVector(), Value);
    }
}

void APlayerInputHandler::LookUp(float Value)
{
    if (Value != 0.0f)
    {
        // Add look up/down logic here
        AddControllerPitchInput(Value);
    }
}

void APlayerInputHandler::Turn(float Value)
{
    if (Value != 0.0f)
    {
        // Add turn logic here
        AddControllerYawInput(Value);
    }
}

void APlayerInputHandler::Jump()
{
    // Add jump logic here
    ACharacter* Character = Cast<ACharacter>(GetPawn());
    if (Character)
    {
        Character->Jump();
    }
}

void APlayerInputHandler::Fire()
{
    // Add firing logic here
    // Example: Spawn a projectile or trigger an animation
}