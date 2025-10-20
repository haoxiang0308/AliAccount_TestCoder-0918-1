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

    // Bind axis mappings
    InputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
    InputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);
    InputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
    InputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

    // Bind action mappings
    InputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::Jump);
}

void APlayerInputHandler::MoveForward(float Value)
{
    MoveForwardValue = Value;
    // Add movement logic here
    AddMovementInput(GetActorForwardVector(), Value);
}

void APlayerInputHandler::MoveRight(float Value)
{
    MoveRightValue = Value;
    // Add movement logic here
    AddMovementInput(GetActorRightVector(), Value);
}

void APlayerInputHandler::LookUp(float Value)
{
    AddControllerPitchInput(Value);
}

void APlayerInputHandler::Turn(float Value)
{
    AddControllerYawInput(Value);
}

void APlayerInputHandler::Jump()
{
    // Add jump logic here
}