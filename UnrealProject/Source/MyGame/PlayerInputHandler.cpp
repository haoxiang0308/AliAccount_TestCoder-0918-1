// PlayerInputHandler.cpp
// A class to handle player input in Unreal Engine

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"
#include "GameFramework/CharacterMovementComponent.h"
#include "Components/InputComponent.h"
#include "PlayerInputHandler.h"

// Constructor
APlayerInputHandler::APlayerInputHandler()
{
    // Set this character to call Tick() every frame. You can turn this off to improve performance if you don't need it.
    PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

// Called to bind functionality to input
void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
    Super::SetupPlayerInputComponent(PlayerInputComponent);

    // Binding movement inputs
    PlayerInputComponent->BindAxis(TEXT("MoveForward"), this, &APlayerInputHandler::MoveForward);
    PlayerInputComponent->BindAxis(TEXT("MoveRight"), this, &APlayerInputHandler::MoveRight);
    
    // Binding rotation inputs
    PlayerInputComponent->BindAxis(TEXT("Turn"), this, &APlayerInputHandler::Turn);
    PlayerInputComponent->BindAxis(TEXT("LookUp"), this, &APlayerInputHandler::LookUp);
    
    // Binding action inputs
    PlayerInputComponent->BindAction(TEXT("Jump"), IE_Pressed, this, &APlayerInputHandler::Jump);
    PlayerInputComponent->BindAction(TEXT("Jump"), IE_Released, this, &APlayerInputHandler::StopJumping);
    PlayerInputComponent->BindAction(TEXT("Run"), IE_Pressed, this, &APlayerInputHandler::StartRunning);
    PlayerInputComponent->BindAction(TEXT("Run"), IE_Released, this, &APlayerInputHandler::StopRunning);
}

// Movement functions
void APlayerInputHandler::MoveForward(float Value)
{
    if (Controller && Value != 0.0f)
    {
        // Find out which way is forward
        FRotator Rotation = Controller->GetControlRotation();
        FRotator YawRotation(0.0f, Rotation.Yaw, 0.0f);

        // Get forward vector
        FVector ForwardDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
        
        // Add movement in that direction
        AddMovementInput(ForwardDirection, Value);
    }
}

void APlayerInputHandler::MoveRight(float Value)
{
    if (Controller && Value != 0.0f)
    {
        // Find out which way is right
        FRotator Rotation = Controller->GetControlRotation();
        FRotator YawRotation(0.0f, Rotation.Yaw, 0.0f);

        // Get right vector
        FVector RightDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);

        // Add movement in that direction
        AddMovementInput(RightDirection, Value);
    }
}

// Rotation functions
void APlayerInputHandler::Turn(float Rate)
{
    // Calculate delta for this frame from the rate information
    AddControllerYawInput(Rate * BaseTurnRate * GetWorld()->GetDeltaSeconds());
}

void APlayerInputHandler::LookUp(float Rate)
{
    // Calculate delta for this frame from the rate information
    AddControllerPitchInput(Rate * BaseLookUpRate * GetWorld()->GetDeltaSeconds());
}

// Action functions
void APlayerInputHandler::StartRunning()
{
    // Increase movement speed when running
    if (GetCharacterMovement())
    {
        GetCharacterMovement()->MaxWalkSpeed = RunSpeed;
    }
}

void APlayerInputHandler::StopRunning()
{
    // Reset movement speed when not running
    if (GetCharacterMovement())
    {
        GetCharacterMovement()->MaxWalkSpeed = WalkSpeed;
    }
}